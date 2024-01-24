
import http.server
import json
import os
import pathlib
import pathlib
import shutil
import subprocess
import sys
import time
import webbrowser
import glob
import urllib.parse

minify = None
try:
    import jsmin
    minify = 'jsmin'
except ImportError as e:
    pass

dir = pathlib.Path(__file__).parent

suggested_jsmin = False

def minify_js(data):
    global suggested_jsmin
    if minify == 'jsmin':
        return jsmin.jsmin(data)
    else:
        if not suggested_jsmin:
            suggested_jsmin = True
            print('--- suggestion ---')
            print(f'run: {sys.executable} -m pip install jsmin')
            print('------------------')
        return data

def timed(func):
    name = func.__name__.replace('_', ' ')
    def inner(*args, **kwargs):
        start = time.time()
        ret = func(*args, **kwargs)
        end = time.time()
        print(f'{name}: {int((end-start)*1000+0.5)}ms')
        return ret
    return inner

def which(name):
    res = shutil.which(name)
    if res is None:
        raise Exception(f'this script requires {name} to be installed')
    return res

asyncs = [
    'WindowShouldClose',
]

alias = {
    'rAudioBuffer': 'void *',
    'rAudioProcessor': 'void *',
}
type_void = 'void'
type_bool = 'bool'
type_number = [
    'char',
    'short',
    'int',
    'long',
    'long long',
    'signed char',
    'signed short',
    'signed int',
    'signed long',
    'signed long long',
    'unsigned char',
    'unsigned short',
    'unsigned int',
    'unsigned long',
    'unsigned long long',
    'float',
    'double',
    'long double',
    'void *',
]
type_string = [
    'char *',
    'unsigned char *',
]
basic = [type_void, type_bool, *type_number, *type_string]

cache = {}
def func(name):
    if name not in cache:
        cache[name] = f'f{len(cache)}'
    return cache[name]

def bind_for(name):
    return func(f'Bind{name}')

def new_for(name):
    return func(f'StructNew{name}')

def get_for(name, prop):
    return func(f'StructGet{name}Prop{prop}')

def lookup(type_name, name = None):
    type_name = type_name.strip()
    if type_name.startswith('const'):
        type_name = type_name[5:].strip()
        const = True
    else:
        const = False
    arr = None
    for i in [2, 3, 4, 16, 32]:
        part = f'[{i}]'
        if type_name.endswith(part):
            type_name = type_name[:-len(part)]
            arr = i
    p = 0
    while type_name.endswith('*'):
        type_name = type_name[:-1].strip()
        p += 1
    if type_name in basic:
        ret = type_name
    else:
        ret = alias[type_name]
    for i in range(p):
        if type_name == 'char':
            const = True
        ret = f'{ret} *'
    if name is not None:
        ret = f'{ret} {name}'
    if arr is not None:
        ret = f'{ret}[{arr}]'
    if const:
        ret = f'const {ret}'
    return ret

bad_types = ['Sound', 'AudioCallback', 'SaveFileTextCallback', 'LoadFileTextCallback', 'TraceLogCallback', 'LoadFileDataCallback', 'SaveFileDataCallback']
def is_bad_func(func):
    if 'params' in func:
        for spec in func['params']:
            if spec['type'] in bad_types:
                return True
    if func['returnType'] in bad_types:
        return True
    return False

def filter_out_bad_funcs(funcs):
    return [func for func in funcs if not is_bad_func(func)]

raylib_json = None
def load_json():
    global raylib_json
    if raylib_json is not None:
        return raylib_json
    raylib_json = {}
    for name in ('raylib', 'raymath', 'rlgl'):
        with open(f'json/{name}_api.json', 'r') as raylib_json_file:
            name_json = json.load(raylib_json_file)
            for entry in name_json:
                if entry in raylib_json:
                    raylib_json[entry].extend(name_json[entry])
                else:
                    raylib_json[entry] = name_json[entry]
    raylib_json['functions'] = filter_out_bad_funcs(raylib_json['functions'])

@timed
def generate_c_from_raylib_json():
    load_json()
    with open(f'emcc/generated.c', 'w') as out_file:
        out_file.write('\n')
        out_file.write('#include <stdbool.h>\n')
        out_file.write('#include <emscripten.h>\n')
        out_file.write('\n')
        out_file.write('int glfwSetWindowContentScaleCallback(int _1, int _2) { return 0; }')
        out_file.write('void glfwSetWindowAttrib(int _1, int _2, int _3) {}')
        out_file.write('\n')
        for struct in raylib_json['structs']:
            name = struct['name']
            alias[name] = f'struct {name}'
            out_file.write('struct ' + name + ';\n')

        out_file.write('\n')

        for struct in raylib_json['aliases']:
            name = struct['name']
            ty = struct['type']
            alias[name] = alias[ty]

        out_file.write('\n')

        for struct in raylib_json['structs']:
            name = struct['name']
            props = struct['fields']
            out_file.write('struct ' + name + ' {\n')
            args = []
            params = []
            for prop in props:
                prop_name = prop['name']
                prop_type = prop['type']
                arr = None
                for i in [2, 3, 4, 16, 32]:
                    part = f'[{i}]'
                    if prop_type.endswith(part):
                        prop_type = prop_type[:-len(part)]
                        arr = i
                        break
                if arr is not None:
                    field = lookup(prop_type, prop_name)
                    out_file.write(f'  {field}[{arr}];\n')
                    for i in range(arr):
                        arg_name = f'{prop_name}{i}'
                        arg_entry = f'{prop_name}[{i}]'
                        params.append(lookup(prop_type, arg_name))
                        args.append([arg_entry, arg_name])
                else:
                    field = lookup(prop_type, prop_name)
                    out_file.write(f'  {field};\n')
                    params.append(field)
                    args.append([prop_name, prop_name])
            out_file.write('};\n\n')
            for prop in props:
                prop_name = prop['name']
                prop_type = lookup(prop['type'])
                arr = None
                for i in [2, 3, 4, 16, 32]:
                    part = f'[{i}]'
                    if prop_type.endswith(part):
                        prop_type = prop_type[:-len(part)]
                        arr = i
                        break
                if arr is None:
                    if prop_type.startswith('struct'):
                        out_file.write(f'EMSCRIPTEN_KEEPALIVE {prop_type} *{get_for(name, prop_name)}(struct {name} *arg) {"{"}\n')
                        out_file.write(f'  return &arg->{prop_name};\n')
                        out_file.write(f'{"}"}\n')
                    else:
                        out_file.write(f'EMSCRIPTEN_KEEPALIVE {prop_type} {get_for(name, prop_name)}(struct {name} *arg) {"{"}\n')
                        out_file.write(f'  return arg->{prop_name};\n')
                        out_file.write(f'{"}"}\n')
                else:
                    pass
            params = ', '.join(params)
            out_file.write(f'EMSCRIPTEN_KEEPALIVE struct {name} *{new_for(name)}({params}) {"{"}\n')
            out_file.write(f'  static struct {name} ArgBuffer{name}[128];\n')
            out_file.write(f'  static int ArgBufferHead{name} = 0;\n')
            # out_file.write(f'  struct {name} *ret = malloc(sizeof(struct {name}));\n')
            out_file.write(f'  struct {name} *ret = &ArgBuffer{name}[ArgBufferHead{name}++ % 128];\n')
            for arg_entry, arg_name in args:
                prop_name = prop['name']
                out_file.write(f'  ret->{arg_entry} = {arg_name};\n')
            out_file.write(f'  return ret;\n')
            out_file.write(f'{"}"}\n')
        
        for func in raylib_json['functions']:
            skip = False
            if 'params' in func:
                for param in func['params']:
                    if param['type'] == '...':
                        skip = True
                        break
            if skip:
                continue
            name = func['name']
            ret = lookup(func['returnType'])
            params = ', '.join(lookup(param['type']) for param in func['params']) if 'params' in func else 'void' 
            out_file.write(f'{ret} {name}({params});\n')
             
        for func in raylib_json['functions']:
            skip = False
            if 'params' in func:
                for param in func['params']:
                    if param['type'] == '...':
                        skip = True
                        break
            if skip:
                continue
            name = func['name']
            ret = lookup(func['returnType'])
            args = []
            params = []
            if 'params' in func:
                for param in func['params']:
                    param_type = lookup(param['type'])
                    param_name = param['name']
                    if param_type.startswith('struct'):
                        args.append(f'*{param_name}')
                        params.append(f'{param_type} *{param_name}')
                    else:
                        args.append(param_name)
                        params.append(f'{param_type} {param_name}')
            args = ', '.join(args)
            params = ', '.join(params)
            body = f'{name}({args})'
            if ret == 'void':
                body = f'{body};'
            elif ret.startswith('struct') and not ret.endswith('*'):
                body = f'  static {ret} ret;  ret = {body};\n  return &ret;\n'
                ret = f'{ret} *'
            else:
                body = f'return {body};'
            out_file.write(f'EMSCRIPTEN_KEEPALIVE {ret} {bind_for(name)}({params}) {"{"}\n  {body}\n{"}"}\n')

@timed
def generate_javascript_from_raylib_json():
    load_json()
    with open(f'emcc/bind.js', 'w') as out_file:
        out_file.write('\n')
        out_file.write('import Module from "/emcc/raylib.js";\n')
        out_file.write('\n')
        out_file.write('export const lib = Module;\n')
        out_file.write('export const bind = async() => {\n')
        out_file.write('  const lib = await Module();\n')
        out_file.write('  const rl = Object.create(null);\n')
        out_file.write('  rl.lib = lib;\n')
        for struct in raylib_json['structs']:
            name = struct['name']
            props = struct['fields']
            field_names = []
            types = []
            skip = False
            for prop in props:
                prop_type = lookup(prop['type'])
                field_names.append(prop['name'])
                if prop_type.startswith('const'):
                    prop_type = prop_type[5:].strip()
                if prop_type == 'char *' or prop_type == 'unsigned char *':
                    types.append('string')
                elif prop_type in type_number:
                    types.append('number')
                elif prop_type.startswith('struct') and not prop_type.endswith('*'):
                    types.append('number')
                else:
                    # raise Exception("struct not yet implemented: " + name)
                    skip = True
                    break
            if skip:
                continue
            js2c_args = []
            for prop in props:
                prop_name = prop['name']
                prop_type = lookup(prop['type'])
                if prop_type.startswith('const'):
                    prop_type = prop_type[5:].strip()
                arr = None
                for i in [2, 3, 4, 16, 32]:
                    part = f'[{i}]'
                    if prop_type.endswith(part):
                        prop_type = prop_type[:-len(part)]
                        arr = i
                        break
                if arr is None:
                    if prop_type.startswith('struct'):
                        js2c_args.append(f'js2c_{prop_type[6:].strip()}(obj.{prop_name})')
                    else:
                        js2c_args.append(f'obj.{prop_name}')
                    if prop_type == 'char *' or prop_type == 'unsigned char *':
                        out_file.write(f'  const from_{name}_get_{prop_name} = lib.cwrap("{get_for(name, prop_name)}", "string", ["number"]);\n')
                    else:
                        out_file.write(f'  const from_{name}_get_{prop_name} = lib.cwrap("{get_for(name, prop_name)}", "number", ["number"]);\n')
                else:
                    pass
            types = ', '.join(f'"{name}"' for name in types)
            out_file.write(f'  const cons_{name} = lib.cwrap("{new_for(name)}", "number", [{types}]);\n')
            js2c_args = ', '.join(js2c_args)
            out_file.write(f'  const js2c_{name} = (obj) => cons_{name}({js2c_args});\n')
            out_file.write(f'  const c2js_{name} = (ptr) => ({"{"}\n')
            for prop in props:
                prop_name = prop['name']
                prop_type = lookup(prop['type'])
                if prop_type.startswith('const'):
                    prop_type = prop_type[5:].strip()
                arr = None
                for i in [2, 3, 4, 16, 32]:
                    part = f'[{i}]'
                    if prop_type.endswith(part):
                        prop_type = prop_type[:-len(part)]
                        arr = i
                        break
                if arr is None:
                    prop_data = f'from_{name}_get_{prop_name}(ptr)'
                    if prop_type.startswith('struct'):
                        out_file.write(f'    {prop_name}: c2js_{prop_type[6:].strip()}({prop_data}),\n')
                    else:
                        out_file.write(f'    {prop_name}: {prop_data},\n')
                else:
                    pass

            out_file.write(f'  {"}"});\n')
    
        for func in raylib_json['functions']:
            skip = False
            if 'params' in func:
                for param in func['params']:
                    if param['type'] == '...':
                        skip = True
                        break
            if skip:
                continue
            name = func['name']
            ret = lookup(func['returnType'])
            param_js_types = []
            param_names = []
            arg_converts = []
            if 'params' in func:
                for param in func['params']:
                    param_type = lookup(param['type'])
                    param_name = param['name']
                    param_names.append(param_name)
                    if param_type.startswith('const'):
                        param_type = param_type[5:].strip()
                    if param_type.startswith('struct') and not param_type.endswith('*'):
                        arg_converts.append(f'js2c_{param_type[6:].strip()}({param_name})')
                        param_js_types.append('number')
                    elif param_type in type_number or param_type == 'bool':
                        arg_converts.append(param_name)
                        param_js_types.append('number')
                    elif param_type == 'char *' or param_type == 'unsigned char *':
                        arg_converts.append(param_name)
                        param_js_types.append('string')
                    else:
                        skip = f'{name} takes {param_name} of type {param_type}'
            param_js_types = ', '.join(f'"{name}"' for name in param_js_types)
            if ret.startswith('const'):
                ret = ret[5:].strip()
            if ret == 'void':
                ret = 'void'
            elif ret.startswith('struct'):
                ret = 'number'
            elif ret in type_number or ret == 'bool':
                ret = 'number'
            elif ret == 'char *' or ret == 'unsigned char *':
                ret = 'string'
            else:
                skip = f'{name} has ret: {ret}'
            if skip:
                continue
                # out_file.write(f'  rl.{name} = (...args) => {"{"}\n    throw new Error("{skip}");\n  {"}"};\n')
            else:
                if name in asyncs:
                    extra_args = '{async: true}'
                else:
                    extra_args = '{}'
                args1 = ', '.join(param_names)
                args2 = ', '.join(arg_converts)
                out_file.write(f'  const Bind{name} = lib.cwrap("{bind_for(name)}", "{ret}", [{param_js_types}], {extra_args});\n')
                lr = lookup(func['returnType'])
                ret_val = f'Bind{name}({args2})'
                if lr.startswith('struct'):
                    ret_val = f'c2js_{lr[6:].strip()}({ret_val})'
                if False:
                    ret_val = f'(console.log("{name}", {args1}), {ret_val})'
                out_file.write(f'  rl.{name} = ({args1}) => {ret_val};\n')
        out_file.write('  return rl;\n')
        out_file.write('}\n')

@timed
def emcc_generate_js_from_c():
    cli = [which('emcc')]

    def setting(*args):
        for arg in args:
            cli.append('-s')
            cli.append(arg)

    cli.extend(("emcc/generated.c", "lib/libraylib.a"))
    cli.extend(("-o", "emcc/raylib.js"))
    cli.append("--no-entry")
    cli.append("-O2")
    setting('TOTAL_MEMORY=16mb')
    setting("USE_GLFW=3")
    setting("FORCE_FILESYSTEM=1")
    setting("ALLOW_MEMORY_GROWTH=1")
    setting("WASM=1")
    setting("DISABLE_DEPRECATED_FIND_EVENT_TARGET_BEHAVIOR=1")
    setting("ASYNCIFY=1")
    setting("FORCE_FILESYSTEM=1")
    setting("SINGLE_FILE=1")
    setting("MODULARIZE=1")
    setting("EXPORT_ES6=1")
    setting("EXPORTED_RUNTIME_METHODS=cwrap,FS")

    subprocess.run(cli)

@timed
def open_browser():
    joined_args = urllib.parse.quote_plus('\0'.join(sys.argv[1:]))
    webbrowser.open(f'http://localhost:8000/index.html?args={joined_args}')

@timed
def serve_directory():
    s = http.server.HTTPServer(('', 8000), http.server.SimpleHTTPRequestHandler)
    s.serve_forever()

@timed
def copy_raylib_json():
    for file in ('raylib_api.json', 'raymath_api.json', 'rlgl_api.json'):
        shutil.copy(f'rl/json/{file}', dir / 'json' / file)

@timed
def generate_javascript_from_temper():
    subprocess.call([which('temper'), 'build', '-b', 'js'], env={'JAVA_OPTS': '-Xss4m'})

all_reps = {
    f'interface-types.js': '/temper/interface-types.js',
    f'regex.js': '/temper/regex.js',
    f'index.js': '/temper/core.js',
    f'rl/raylib.js': '/temper/raylib.js',
    f'../rl/raylib.js': '/temper/raylib.js',
}

def patch_data(data):
    data = data.replace('from "@temperlang/core"', 'from "/temper/core.js"')
    for key in all_reps:
        value = all_reps[key]
        data = data.replace(f'from "{key}"', f'from "{value}"')
    return minify_js(data)

@timed
def patch_generated_javascript():
    if not os.path.isdir(dir / 'temper'):
        os.mkdir(dir / 'temper')

    for core in ('index.js', 'interface-types.js', 'regex.js'):
        with open(f'temper.out/js/temper-core/{core}') as core_file:
            data = core_file.read()

        patched = patch_data(data)

        core_out = all_reps[core][1:]

        with open(dir / core_out, 'w') as core_file:
            core_file.write(patched)

    demos = glob.glob('temper.out/js/temper-raylib/demos/**.js')

    for ext in ('rl/raylib.js', *demos):
        ext = ext.removeprefix('temper.out/js/temper-raylib/')
        with open(f'temper.out/js/temper-raylib/{ext}') as ext_file:
            data = ext_file.read()
        
        patched = patch_data(data)

        if ext in all_reps:
            ext_out = all_reps[ext][1:]
        else:
            name = ext.removeprefix('demos/')
            ext_out = f'temper/{name}'

        print(ext, ext_out)
        
        with open(dir / ext_out, 'w') as ext_file:
            ext_file.write(patched)

    shutil.copy('demos/patterns.har', dir / 'temper' / 'patterns.har')

@timed
def all():
    which('temper')
    which('emcc')
    # generate_javascript_from_temper()
    patch_generated_javascript()
    copy_raylib_json()
    os.chdir(pathlib.Path(__file__).parent)
    generate_c_from_raylib_json()
    generate_javascript_from_raylib_json()
    emcc_generate_js_from_c()
    open_browser()
    serve_directory()

def main():
    all()

if __name__ == '__main__':
    main()
