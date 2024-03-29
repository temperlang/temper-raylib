
import json


common_words = ['end', 'ret']
alias = {
    'rAudioBuffer': 'void *',
    'rAudioProcessor': 'void *',
}
basic = [
    'void',
    'bool',
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
    'char *',
    'unsigned char *',
    '...',
]

def lookup(type_name, name = None):
    type_name = type_name.strip()
    if type_name.startswith('const'):
        type_name = type_name[5:].strip()
        const = True
    else:
        const = False
    arr = None
    for i in [2, 3, 4, 8, 16, 32]:
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

def escape_keyword(name):
    if name in common_words:
        return f'name_'
    return name

def main() -> None:
    raylib_json = {}
    for name in ('config', 'raygui', 'raylib', 'raymath', 'rlgl'):
        with open(f'rl/json/{name}_api.json', 'r') as raylib_json_file:
            name_json = json.load(raylib_json_file)
            for entry in name_json:
                if entry in raylib_json:
                    raylib_json[entry].extend(name_json[entry])
                else:
                    raylib_json[entry] = name_json[entry]

    raylib_json['functions'] = filter_out_bad_funcs(raylib_json['functions'])

    with open(f'vendor/raylib-luajit/generated.h', 'w') as out_file:
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
            for prop in props:
                field = lookup(prop['type'], prop['name'])
                out_file.write(f'  {field};\n')
            out_file.write('};\n\n')
        
        for func in raylib_json['functions']:
            name = func['name']
            ret = lookup(func['returnType'])
            params = ', '.join(lookup(param['type']) for param in func['params']) if 'params' in func else 'void' 
            out_file.write(f'{ret} {name}({params});\n')
    
    with open(f'vendor/raylib-luajit/generated.lua', 'w') as out_file:
        out_file.write('local ffi = require("ffi")\n')
        out_file.write('return function(lib)\n')
        out_file.write('  local rl = {}\n')
        # structs = {}
        # for struct in raylib_json['structs']:
        #     structs[struct['name']] = {prop['name']: prop['type'] for prop in struct['fields']}

        # for struct in raylib_json['aliases']:
        #     name = struct['name']
        #     ty = struct['type']
        #     out_file.write(f'  rl.{name} = ffi.typeof("{alias[ty]}")\n')

        for struct in raylib_json['structs']:
            name = struct['name']
            out_file.write(f'  rl.{name} = ffi.typeof("struct {name}")\n')
            # out_file.write(f'function rl.{name}(...)\n')
            # out_file.write(f'  local obj = ffi.new("struct {name}", ...)\n')
            # out_file.write(f'  assert(obj ~= nil, "failed to create {name}")\n')
            # out_file.write(f'  return obj\n')
            # out_file.write(f'end\n')
        for func in raylib_json['functions']:
            name = func['name']
            if func['returnType'] == 'char *' or func['returnType'] == 'const char *':
                params = func['params'] if 'params' in func else []
                param_names = [escape_keyword(param['name']) for param in params]
                params_str = ', '.join(param_names)
                ret_val_str = f'lib.{name}({params_str})'
                out_file.write(f'  function rl.{name}({params_str})\n    return ffi.string({ret_val_str})\n  end\n')
            else:
                out_file.write(f'  rl.{name} = lib.{name}\n')
        out_file.write('  return rl\n')
        out_file.write('end\n')

if __name__ == '__main__':
    main()
