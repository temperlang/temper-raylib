import json
import re

tab = "    "

aliased = {}


def conv(t: str) -> str:
    while "const" in t:
        t = t.replace("const", "")
    n = 0
    t = t.strip()
    while t[-1] == "*":
        if t == "char *" or t == "unsigned char *":
            break
        if t == "void *":
            break
        t = t[:-1]
        n += 1
    t = t.strip()
    comment = ""
    while t in aliased:
        comment = f" /* from alias {t} */"
        t = aliased[t]
    if t == "bool":
        ret = "Boolean"
    elif t in (
        "char",
        "unsigned char",
        "short",
        "unsigned short",
        "int",
        "unsigned int",
        "long",
        "unsigned long",
    ):
        ret = "Int"
    elif t == "void *":
        ret = "DenseBitVector"
    elif t in ("char *", "unsigned char *", "char[32]"):
        ret = "String"
    elif t == "Matrix[2]":
        ret = "Listed<Matrix>"
    elif t in ("unsigned int[4]", "int[4]"):
        ret = "Listed<Int>"
    elif t in ("float[2]", "float[3]", "float[4]", "float[16]"):
        ret = "Listed<Float64>"
    elif t == "void":
        ret = "Void"
    elif t == "double":
        ret = "Float64"
    elif t == "float":
        ret = "Float64"
    elif t in ("rAudioBuffer", "rAudioProcessor"):
        ret = "AnyValue"
    else:
        ret = t
    for i in range(n):
        ret = f"Listed<{ret}>"
    return ret + comment


bad_types = [
    "Sound",
    "AudioCallback",
    "SaveFileTextCallback",
    "LoadFileTextCallback",
    "TraceLogCallback",
    "LoadFileDataCallback",
    "SaveFileDataCallback",
]


def is_bad_func(func):
    if "params" in func:
        for spec in func["params"]:
            if spec["type"] in bad_types:
                return True
    if func["returnType"] in bad_types:
        return True
    return False


def filter_out_bad_funcs(funcs):
    return [func for func in funcs if not is_bad_func(func)]


def main() -> None:
    raylib_json = {}
    for name in ("config", "raygui", "raylib", "raymath", "rlgl"):
        with open(f"rl/json/{name}_api.json", "r") as raylib_json_file:
            name_json = json.load(raylib_json_file)
            for entry in name_json:
                if entry in raylib_json:
                    raylib_json[entry].extend(name_json[entry])
                else:
                    raylib_json[entry] = name_json[entry]

    raylib_json["functions"] = filter_out_bad_funcs(raylib_json["functions"])

    for alias in raylib_json["aliases"]:
        alias_name = alias["name"]
        alias_type = alias["type"]
        aliased[alias_name] = alias_type

    with open(f"rl/raylib.temper", "w") as out_file:
        already_exported = set()

        out_file.write("\n")

        out_file.write("export interface Raylib {\n")
        for func in raylib_json["functions"]:
            name = func["name"]
            desc = func["description"]
            ret = conv(func["returnType"])
            params = []
            if "params" in func:
                bad = False
                for spec in func["params"]:
                    if spec["type"] == "..." or spec["type"] == "TraceLogCallback":
                        bad = True
                    spec_name = spec["name"]
                    spec_type = conv(spec["type"])
                    params.append(f"{spec_name}: {spec_type}")
                if bad:
                    continue
            params = ", ".join(params)
            out_file.write(f"{tab}// {desc}\n")
            out_file.write(f"{tab}public {name}({params}): {ret};\n")
        out_file.write("}\n")

        out_file.write("\n")

        out_file.write(f"let rl: Raylib;\n")
        out_file.write("export let use(impl: Raylib): Void { rl = impl; }\n")
        for func in raylib_json["functions"]:
            name = func["name"]
            desc = func["description"]
            ret = conv(func["returnType"])
            params = []
            args = []
            if "params" in func:
                bad = False
                for spec in func["params"]:
                    if spec["type"] == "..." or spec["type"] == "TraceLogCallback":
                        bad = True
                    spec_name = spec["name"]
                    spec_type = conv(spec["type"])
                    params.append(f"{spec_name}: {spec_type}")
                    args.append(f"{spec_name}")
                if bad:
                    continue
            params = ", ".join(params)
            args = ", ".join(args)
            out_file.write(f"// {desc}\n")
            out_file.write(f"export let {name}({params}): {ret} ")
            out_file.write("{\n")
            if ret == "Void":
                out_file.write(f"{tab}")
            else:
                out_file.write(f"{tab}return ")
            out_file.write(f"rl.{name}({args});\n")
            out_file.write("}\n")

        out_file.write("\n")

        for define in raylib_json["defines"]:
            name = define["name"]
            dtype = define["type"]
            if name in already_exported:
                continue
            already_exported.add(name)
            if dtype == "GUARD":
                pass
            elif dtype == "FLOAT":
                value = define["value"]
                out_file.write(f"export let {name}: Float64 = {value};\n")
            elif dtype == "INT":
                value = define["value"]
                out_file.write(f"export let {name}: Int = {value};\n")
            elif dtype == "STRING":
                value = define["value"]
                out_file.write(f'export let {name}: String = "{value}";\n')
            elif dtype == "MACRO":
                # out_file.write(f'// macro {name}\n')
                pass
            elif dtype == "COLOR":
                raw_value = define["value"]
                color_strings = re.findall(r"\b\d+\b", raw_value)
                color_args = ", ".join(color_strings)
                out_file.write(f"export let {name}: Color = new Color({color_args});\n")
            elif dtype == "DOUBLE":
                raw_value = define["value"]
                out_file.write(f"export let {name}: Float64 = {raw_value};\n")
            elif dtype == "FLOAT_MATH":
                pass
            elif dtype == "UNKNOWN":
                pass
            else:
                print(dtype)
        for enum in raylib_json["enums"]:
            name = enum["name"]
            desc = enum["description"]
            out_file.write(f"\n// {name}\n")
            for value in enum["values"]:
                value_name = value["name"]
                value_value = value["value"]
                value_desc = value["description"]
                out_file.write(
                    f"export let {value_name} = {value_value}; // {value_desc}\n"
                )

        out_file.write("\n")

        for enum in raylib_json["enums"]:
            name = enum["name"]
            out_file.write(f"export let {name} = Int;\n")

        for struct in raylib_json["structs"]:
            name = struct["name"]
            desc = struct["description"]
            out_file.write(f"// {desc}\n")
            out_file.write(f"export class {name} " + "{\n")
            for field in struct["fields"]:
                field_type = field["type"]
                field_desc = field["description"]
                field_name = field["name"]
                out_file.write(f"{tab}// {field_desc}\n")
                out_file.write(f"{tab}public var {field_name}: {conv(field_type)};\n")
            out_file.write("}\n")

        for cb in raylib_json["callbacks"]:
            cb_name = cb["name"]
            cb_ret = conv(cb["returnType"])
            cb_args = []
            bad = False
            for spec in cb["params"]:
                if spec["type"] == "va_list":
                    bad = True
                spec_type = conv(spec["type"])
                cb_args.append(f"{spec_type}")
            if bad:
                continue
            cb_args = ", ".join(cb_args)
            cb_desc = cb["description"]
            out_file.write(f"// {cb_desc}\n")
            out_file.write(f"export let {cb_name} = fn({cb_args}): {cb_ret};\n")


if __name__ == "__main__":
    main()
