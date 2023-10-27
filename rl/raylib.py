
import json
import re

tab = '    '

def conv(t: str) -> str:
    n = 0
    while t[-1] == '*':
        if t == 'char *':
            break
        if t == 'void *':
            break
        t = t[:-1]
        n += 1
    while 'const' in t:
        t = t.replace('const', '')
    t = t.strip()
    match t:
        case 'bool':
            ret = 'Boolean'
        case 'char' | 'unsigned char' | 'short' | 'unsigned short' | 'int' | 'unsigned int' | 'long' | 'unsigned long':
            ret = 'Int'
        case 'void *':
            ret = 'DenseBitVector'
        case 'char *' |  'char[32]':
            ret = 'String'
        case 'Matrix[2]':
            ret = 'Listed<Matrix>'
        case 'float[2]' | 'float[4]':
            ret = 'Listed<Float64>'
        case 'void':
            ret = 'Void'
        case 'double':
            ret = 'Float64'
        case 'float':
            ret = 'Float64'
        case 'rAudioBuffer' |  'rAudioProcessor':
            ret = 'AnyValue'
        case _:
            ret = t
    for i in range(n):
        ret = f'Listed<{ret}>'
    return ret

def main() -> None:
    with open('rl/raylib.json') as raylib_json_file:
        raylib_json = json.load(raylib_json_file)

    with open('rl/constants.temper', 'w') as out_file:
        out_file.write('let {...} = import("./types.temper");\n')
        for define in raylib_json['defines']:
            name = define['name']
            dtype = define['type']
            match dtype:
                case 'GUARD':
                    pass
                case 'FLOAT':
                    value = define['value']
                    out_file.write(f'export let {name}: Float64 = {value};\n')
                case 'INT':
                    value = define['value']
                    out_file.write(f'export let {name}: Int = {value};\n')
                case 'STRING':
                    value = define['value']
                    out_file.write(f'export let {name}: String = "{value}";\n')
                case 'MACRO':
                    # out_file.write(f'// macro {name}\n')
                    pass
                case 'COLOR':
                    raw_value = define['value']
                    color_strings = re.findall(r'\b\d+\b', raw_value)
                    color_args = ', '.join(color_strings)
                    out_file.write(f'export let {name}: Color = new Color({color_args});\n')
                case 'FLOAT_MATH':
                    pass
                case 'UNKNOWN':
                    pass
                case _:
                    print(dtype)

    with open('rl/types.temper', 'w') as out_file:
        for struct in raylib_json['structs']:
            name = struct['name']
            desc = struct['description']
            out_file.write(f'// {desc}\n')
            out_file.write(f'export class {name} ' + '{\n')
            for field in struct['fields']:
                field_type = field['type']
                field_desc = field['description']
                field_name = field['name']
                out_file.write(f'{tab}// {field_desc}\n')
                out_file.write(f'{tab}let {field_name}: {conv(field_type)};\n')
            out_file.write('}\n')

        for alias in raylib_json['aliases']:
            alias_name = alias['name']
            alias_type = alias['type']
            alias_desc = alias['description']
            out_file.write(f'// {alias_desc}\n')
            out_file.write(f'export let {alias_name} = {alias_type};\n')
    
        for cb in raylib_json['callbacks']:
            cb_name = cb['name']
            cb_ret = conv(cb['returnType'])
            cb_args = []
            bad = False
            for spec in cb['params']:
                if spec['type'] == 'va_list':
                    bad = True
                spec_type = conv(spec['type'])
                cb_args.append(f'{spec_type}')
            if bad:
                continue
            cb_args = ', '.join(cb_args)
            cb_desc = cb['description']
            out_file.write(f'// {cb_desc}\n')
            out_file.write(f'export let {cb_name} = fn({cb_args}): {cb_ret};\n')
    
    with open('rl/functions.temper', 'w') as out_file:
        out_file.write('let {...} = import("./types.temper");\n')
        out_file.write(f'export interface Raylib' + '{\n')
        for func in raylib_json['functions']:
            name = func['name']
            desc = func['description']
            ret = conv(func['returnType'])
            params = []
            if 'params' in func:
                bad = False
                for spec in func['params']:
                    if spec['type'] == '...' or spec['type'] == 'TraceLogCallback':
                        bad = True
                    spec_name = spec['name']
                    spec_type = conv(spec['type'])
                    params.append(f'{spec_name}: {spec_type}')
                if bad:
                    continue
            params = ', '.join(params)
            out_file.write(f'{tab}// {desc}\n')
            out_file.write(f'{tab}public {name}({params}): {ret};\n')
        out_file.write('}\n')

    print(raylib_json.keys())

if __name__ == '__main__':
    main()
