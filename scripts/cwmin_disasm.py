#!/usr/bin/env python3
import argparse
import hashlib
import json
import pathlib
import re
import sys

OPCODES = {
    0x00: ("BRK", "IMP"),
    0x01: ("ORA", "INDX"),
    0x05: ("ORA", "ZP"),
    0x06: ("ASL", "ZP"),
    0x08: ("PHP", "IMP"),
    0x09: ("ORA", "IMM"),
    0x0A: ("ASL", "ACC"),
    0x0D: ("ORA", "ABS"),
    0x0E: ("ASL", "ABS"),
    0x10: ("BPL", "REL"),
    0x11: ("ORA", "INDY"),
    0x15: ("ORA", "ZPX"),
    0x16: ("ASL", "ZPX"),
    0x18: ("CLC", "IMP"),
    0x19: ("ORA", "ABSY"),
    0x1D: ("ORA", "ABSX"),
    0x1E: ("ASL", "ABSX"),
    0x20: ("JSR", "ABS"),
    0x21: ("AND", "INDX"),
    0x24: ("BIT", "ZP"),
    0x25: ("AND", "ZP"),
    0x26: ("ROL", "ZP"),
    0x28: ("PLP", "IMP"),
    0x29: ("AND", "IMM"),
    0x2A: ("ROL", "ACC"),
    0x2C: ("BIT", "ABS"),
    0x2D: ("AND", "ABS"),
    0x2E: ("ROL", "ABS"),
    0x30: ("BMI", "REL"),
    0x31: ("AND", "INDY"),
    0x35: ("AND", "ZPX"),
    0x36: ("ROL", "ZPX"),
    0x38: ("SEC", "IMP"),
    0x39: ("AND", "ABSY"),
    0x3D: ("AND", "ABSX"),
    0x3E: ("ROL", "ABSX"),
    0x40: ("RTI", "IMP"),
    0x41: ("EOR", "INDX"),
    0x45: ("EOR", "ZP"),
    0x46: ("LSR", "ZP"),
    0x48: ("PHA", "IMP"),
    0x49: ("EOR", "IMM"),
    0x4A: ("LSR", "ACC"),
    0x4C: ("JMP", "ABS"),
    0x4D: ("EOR", "ABS"),
    0x4E: ("LSR", "ABS"),
    0x50: ("BVC", "REL"),
    0x51: ("EOR", "INDY"),
    0x55: ("EOR", "ZPX"),
    0x56: ("LSR", "ZPX"),
    0x58: ("CLI", "IMP"),
    0x59: ("EOR", "ABSY"),
    0x5D: ("EOR", "ABSX"),
    0x5E: ("LSR", "ABSX"),
    0x60: ("RTS", "IMP"),
    0x61: ("ADC", "INDX"),
    0x65: ("ADC", "ZP"),
    0x66: ("ROR", "ZP"),
    0x68: ("PLA", "IMP"),
    0x69: ("ADC", "IMM"),
    0x6A: ("ROR", "ACC"),
    0x6C: ("JMP", "IND"),
    0x6D: ("ADC", "ABS"),
    0x6E: ("ROR", "ABS"),
    0x70: ("BVS", "REL"),
    0x71: ("ADC", "INDY"),
    0x75: ("ADC", "ZPX"),
    0x76: ("ROR", "ZPX"),
    0x78: ("SEI", "IMP"),
    0x79: ("ADC", "ABSY"),
    0x7D: ("ADC", "ABSX"),
    0x7E: ("ROR", "ABSX"),
    0x81: ("STA", "INDX"),
    0x84: ("STY", "ZP"),
    0x85: ("STA", "ZP"),
    0x86: ("STX", "ZP"),
    0x88: ("DEY", "IMP"),
    0x8A: ("TXA", "IMP"),
    0x8C: ("STY", "ABS"),
    0x8D: ("STA", "ABS"),
    0x8E: ("STX", "ABS"),
    0x90: ("BCC", "REL"),
    0x91: ("STA", "INDY"),
    0x94: ("STY", "ZPX"),
    0x95: ("STA", "ZPX"),
    0x96: ("STX", "ZPY"),
    0x98: ("TYA", "IMP"),
    0x99: ("STA", "ABSY"),
    0x9A: ("TXS", "IMP"),
    0x9D: ("STA", "ABSX"),
    0xA0: ("LDY", "IMM"),
    0xA1: ("LDA", "INDX"),
    0xA2: ("LDX", "IMM"),
    0xA4: ("LDY", "ZP"),
    0xA5: ("LDA", "ZP"),
    0xA6: ("LDX", "ZP"),
    0xA8: ("TAY", "IMP"),
    0xA9: ("LDA", "IMM"),
    0xAA: ("TAX", "IMP"),
    0xAC: ("LDY", "ABS"),
    0xAD: ("LDA", "ABS"),
    0xAE: ("LDX", "ABS"),
    0xB0: ("BCS", "REL"),
    0xB1: ("LDA", "INDY"),
    0xB4: ("LDY", "ZPX"),
    0xB5: ("LDA", "ZPX"),
    0xB6: ("LDX", "ZPY"),
    0xB8: ("CLV", "IMP"),
    0xB9: ("LDA", "ABSY"),
    0xBA: ("TSX", "IMP"),
    0xBC: ("LDY", "ABSX"),
    0xBD: ("LDA", "ABSX"),
    0xBE: ("LDX", "ABSY"),
    0xC0: ("CPY", "IMM"),
    0xC1: ("CMP", "INDX"),
    0xC4: ("CPY", "ZP"),
    0xC5: ("CMP", "ZP"),
    0xC6: ("DEC", "ZP"),
    0xC8: ("INY", "IMP"),
    0xC9: ("CMP", "IMM"),
    0xCA: ("DEX", "IMP"),
    0xCC: ("CPY", "ABS"),
    0xCD: ("CMP", "ABS"),
    0xCE: ("DEC", "ABS"),
    0xD0: ("BNE", "REL"),
    0xD1: ("CMP", "INDY"),
    0xD5: ("CMP", "ZPX"),
    0xD6: ("DEC", "ZPX"),
    0xD8: ("CLD", "IMP"),
    0xD9: ("CMP", "ABSY"),
    0xDD: ("CMP", "ABSX"),
    0xDE: ("DEC", "ABSX"),
    0xE0: ("CPX", "IMM"),
    0xE1: ("SBC", "INDX"),
    0xE4: ("CPX", "ZP"),
    0xE5: ("SBC", "ZP"),
    0xE6: ("INC", "ZP"),
    0xE8: ("INX", "IMP"),
    0xE9: ("SBC", "IMM"),
    0xEA: ("NOP", "IMP"),
    0xEC: ("CPX", "ABS"),
    0xED: ("SBC", "ABS"),
    0xEE: ("INC", "ABS"),
    0xF0: ("BEQ", "REL"),
    0xF1: ("SBC", "INDY"),
    0xF5: ("SBC", "ZPX"),
    0xF6: ("INC", "ZPX"),
    0xF8: ("SED", "IMP"),
    0xF9: ("SBC", "ABSY"),
    0xFD: ("SBC", "ABSX"),
    0xFE: ("INC", "ABSX"),
}

MODE_SIZE = {
    "IMP": 1,
    "ACC": 1,
    "IMM": 2,
    "ZP": 2,
    "ZPX": 2,
    "ZPY": 2,
    "ABS": 3,
    "ABSX": 3,
    "ABSY": 3,
    "IND": 3,
    "INDX": 2,
    "INDY": 2,
    "REL": 2,
}

BRANCH_MNEMONICS = {"BPL", "BMI", "BVC", "BVS", "BCC", "BCS", "BNE", "BEQ"}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Disassemble CWMIN PRG and rebuild.")
    parser.add_argument("--prg", required=True, help="path to CWMIN PRG file")
    parser.add_argument("--out-dir", required=True, help="output directory")
    return parser.parse_args()


def read_prg(path: pathlib.Path) -> tuple[int, bytes, bytes]:
    data = path.read_bytes()
    if len(data) < 3:
        raise ValueError("PRG too small")
    load_addr = data[0] | (data[1] << 8)
    payload = data[2:]
    return load_addr, payload, data


def parse_basic_sys(load_addr: int, payload: bytes) -> int | None:
    if load_addr != 0x0801 or len(payload) < 5:
        return None
    next_ptr = payload[0] | (payload[1] << 8)
    if next_ptr == 0:
        return None
    idx = 4
    sys_addr = None
    while idx < len(payload) and payload[idx] != 0:
        if payload[idx] == 0x9E:
            idx += 1
            while idx < len(payload) and not (0x30 <= payload[idx] <= 0x39):
                idx += 1
            digits = []
            while idx < len(payload) and 0x30 <= payload[idx] <= 0x39:
                digits.append(chr(payload[idx]))
                idx += 1
            if digits:
                sys_addr = int("".join(digits))
            break
        idx += 1
    return sys_addr


def format_hex(value: int, width: int) -> str:
    return f"${value:0{width}X}"


def looks_like_code(payload: bytes, base_addr: int, start_addr: int) -> bool:
    pc = start_addr
    inst_count = 0
    max_addr = base_addr + len(payload)
    while inst_count < 12 and base_addr <= pc < max_addr:
        opcode = payload[pc - base_addr]
        if opcode not in OPCODES:
            return False
        mnemonic, mode = OPCODES[opcode]
        size = MODE_SIZE[mode]
        if pc - base_addr + size > len(payload):
            return False
        inst_count += 1
        pc += size
        if mnemonic in {"RTS", "RTI", "BRK"}:
            return inst_count >= 3
    return inst_count >= 6


def find_candidate_entries(payload: bytes, base_addr: int, code_map: dict[int, dict]) -> list[int]:
    max_addr = base_addr + len(payload)
    code_bytes = set()
    for addr, inst in code_map.items():
        for i in range(len(inst["bytes"])):
            code_bytes.add(addr + i)
    candidates = []
    for offset in range(0, len(payload) - 1):
        target = payload[offset] | (payload[offset + 1] << 8)
        if target in code_map or target in code_bytes:
            continue
        if not (base_addr <= target < max_addr):
            continue
        if looks_like_code(payload, base_addr, target):
            candidates.append(target)
    return candidates


def disassemble(payload: bytes, base_addr: int, entry_points: list[int]) -> tuple[dict[int, dict], set[int]]:
    code_map: dict[int, dict] = {}
    code_bytes: set[int] = set()
    queue = list(entry_points)
    seen_entries = set()
    while True:
        while queue:
            pc = queue.pop(0)
            if pc in seen_entries:
                continue
            seen_entries.add(pc)
            if pc < base_addr or pc >= base_addr + len(payload):
                continue
            while True:
                if pc in code_map:
                    break
                offset = pc - base_addr
                opcode = payload[offset]
                if opcode not in OPCODES:
                    break
                mnemonic, mode = OPCODES[opcode]
                size = MODE_SIZE[mode]
                if offset + size > len(payload):
                    break
                if any((pc + i) in code_bytes for i in range(size)):
                    break
                inst_bytes = payload[offset : offset + size]
                code_map[pc] = {
                    "mnemonic": mnemonic,
                    "mode": mode,
                    "bytes": inst_bytes,
                }
                for i in range(size):
                    code_bytes.add(pc + i)

                next_pc = pc + size
                if mnemonic in BRANCH_MNEMONICS:
                    rel = inst_bytes[1]
                    if rel >= 0x80:
                        rel -= 0x100
                    target = next_pc + rel
                    queue.append(target)
                elif mnemonic == "JSR":
                    target = inst_bytes[1] | (inst_bytes[2] << 8)
                    queue.append(target)
                elif mnemonic == "JMP" and mode == "ABS":
                    target = inst_bytes[1] | (inst_bytes[2] << 8)
                    queue.append(target)
                    break
                elif mnemonic == "JMP" and mode == "IND":
                    break
                elif mnemonic in {"RTS", "RTI", "BRK"}:
                    break

                pc = next_pc
        new_entries = find_candidate_entries(payload, base_addr, code_map)
        new_entries = [addr for addr in new_entries if addr not in seen_entries]
        if not new_entries:
            break
        queue = new_entries
    return code_map, code_bytes


def find_labels(code_map: dict[int, dict], base_addr: int, payload_size: int) -> dict[int, str]:
    labels: dict[int, str] = {}
    max_addr = base_addr + payload_size
    for addr, inst in code_map.items():
        mnemonic = inst["mnemonic"]
        mode = inst["mode"]
        data = inst["bytes"]
        if mnemonic in BRANCH_MNEMONICS:
            rel = data[1]
            if rel >= 0x80:
                rel -= 0x100
            target = addr + 2 + rel
            if base_addr <= target < max_addr and target in code_map:
                labels.setdefault(target, f"L{target:04X}")
        elif mnemonic == "JSR" or (mnemonic == "JMP" and mode == "ABS"):
            target = data[1] | (data[2] << 8)
            if base_addr <= target < max_addr and target in code_map:
                labels.setdefault(target, f"L{target:04X}")
    return labels


def is_printable(byte: int) -> bool:
    return 0x20 <= byte <= 0x7E


def render_operand(addr: int, inst: dict, labels: dict[int, str]) -> str:
    mode = inst["mode"]
    data = inst["bytes"]
    if mode == "IMP":
        return ""
    if mode == "ACC":
        return "A"
    if mode == "IMM":
        return f"#{format_hex(data[1], 2)}"
    if mode == "ZP":
        return format_hex(data[1], 2)
    if mode == "ZPX":
        return f"{format_hex(data[1], 2)},X"
    if mode == "ZPY":
        return f"{format_hex(data[1], 2)},Y"
    if mode == "ABS":
        target = data[1] | (data[2] << 8)
        return labels.get(target, format_hex(target, 4))
    if mode == "ABSX":
        target = data[1] | (data[2] << 8)
        value = labels.get(target, format_hex(target, 4))
        return f"{value},X"
    if mode == "ABSY":
        target = data[1] | (data[2] << 8)
        value = labels.get(target, format_hex(target, 4))
        return f"{value},Y"
    if mode == "IND":
        target = data[1] | (data[2] << 8)
        return f"({format_hex(target, 4)})"
    if mode == "INDX":
        return f"({format_hex(data[1], 2)},X)"
    if mode == "INDY":
        return f"({format_hex(data[1], 2)}),Y"
    if mode == "REL":
        rel = data[1]
        if rel >= 0x80:
            rel -= 0x100
        target = addr + 2 + rel
        return labels.get(target, format_hex(target, 4))
    return ""


def format_bytes(values: list[int]) -> str:
    return ", ".join(format_hex(v, 2) for v in values)


def emit_data_block(data: bytes, start_addr: int) -> list[str]:
    lines: list[str] = []
    idx = 0
    while idx < len(data):
        if is_printable(data[idx]):
            end = idx
            while end < len(data) and is_printable(data[end]):
                end += 1
            if end - idx >= 4:
                text = data[idx:end].decode("ascii")
                text = text.replace("\\", "\\\\").replace("\"", "\\\"")
                lines.append(f"    .text \"{text}\"")
                idx = end
                continue
        chunk = data[idx : idx + 16]
        lines.append(f"    .byte {format_bytes(list(chunk))}")
        idx += len(chunk)
    return lines


def disassemble_to_lines(payload: bytes, base_addr: int, code_map: dict[int, dict]) -> list[str]:
    labels = find_labels(code_map, base_addr, len(payload))
    lines = [
        "; Disassembly of CWMIN PRG",
        f"; Load address: {format_hex(base_addr, 4)}",
        ";",
        "; FORTH dictionary layout notes (C64 Super-Forth):",
        "; - NFA points at the count/flags byte (length in low 5 bits).",
        "; - LFA is the 16-bit link field stored 2 bytes before NFA.",
        "; - CFA is the aligned address after the name field (16-bit cell).",
        "; - PFA immediately follows CFA (CFA + 2).",
        "; - Threaded code stores CFA code pointers (CFA @ values).",
        ";   The <DECOM> decompiler uses these relationships to print words,",
        ";   literals (<LIT>), branches, and string literals (<.\">/<ABORT\">).",
        "",
    ]
    lines.append(f"    .org {format_hex(base_addr, 4)}")

    addr = base_addr
    end_addr = base_addr + len(payload)
    while addr < end_addr:
        if addr in labels:
            lines.append(f"{labels[addr]}:")
        inst = code_map.get(addr)
        if inst:
            operand = render_operand(addr, inst, labels)
            mnemonic = inst["mnemonic"]
            if operand:
                lines.append(f"    {mnemonic} {operand}")
            else:
                lines.append(f"    {mnemonic}")
            addr += len(inst["bytes"])
            continue

        next_code = min([a for a in code_map.keys() if a > addr], default=end_addr)
        data = payload[addr - base_addr : next_code - base_addr]
        lines.extend(emit_data_block(data, addr))
        addr = next_code
    lines.append("")
    return lines


def parse_number(token: str, labels: dict[str, int]) -> int:
    if token in labels:
        return labels[token]
    if token.startswith("$"):
        return int(token[1:], 16)
    return int(token, 10)


def parse_byte_list(text: str, labels: dict[str, int]) -> list[int]:
    values = []
    for raw in text.split(","):
        token = raw.strip()
        if not token:
            continue
        values.append(parse_number(token, labels) & 0xFF)
    return values


def parse_word_list(text: str, labels: dict[str, int]) -> list[int]:
    values = []
    for raw in text.split(","):
        token = raw.strip()
        if not token:
            continue
        value = parse_number(token, labels) & 0xFFFF
        values.extend([value & 0xFF, value >> 8])
    return values


def operand_mode(mnemonic: str, operand: str) -> str:
    if not operand:
        return "IMP"
    operand = operand.strip()
    if operand == "A":
        return "ACC"
    if mnemonic in BRANCH_MNEMONICS:
        return "REL"
    if operand.startswith("#"):
        return "IMM"
    if operand.startswith("(") and operand.endswith("),Y"):
        return "INDY"
    if operand.startswith("(") and operand.endswith(",X)"):
        return "INDX"
    if operand.startswith("(") and operand.endswith(")"):
        return "IND"
    if operand.endswith(",X"):
        value = operand[:-2].strip()
        return "ZPX" if len(value) <= 3 else "ABSX"
    if operand.endswith(",Y"):
        value = operand[:-2].strip()
        return "ZPY" if len(value) <= 3 else "ABSY"
    return "ZP" if len(operand) <= 3 else "ABS"


def assemble(lines: list[str]) -> bytes:
    def strip_comment(line: str) -> str:
        in_quote = False
        escaped = False
        for i, ch in enumerate(line):
            if ch == "\\" and not escaped:
                escaped = True
                continue
            if ch == "\"" and not escaped:
                in_quote = not in_quote
            if ch == ";" and not in_quote:
                return line[:i]
            escaped = False
        return line

    label_addrs: dict[str, int] = {}
    parsed: list[dict] = []
    pc = 0
    for raw in lines:
        line = strip_comment(raw).strip()
        if not line:
            continue
        if line.endswith(":"):
            label_addrs[line[:-1]] = pc
            continue
        if line.startswith(".org"):
            value = line.split()[1]
            pc = parse_number(value, label_addrs)
            parsed.append({"type": "org", "value": pc})
            continue
        if line.startswith(".byte"):
            values = line[len(".byte") :].strip()
            bytes_list = parse_byte_list(values, label_addrs)
            parsed.append({"type": "bytes", "values": bytes_list})
            pc += len(bytes_list)
            continue
        if line.startswith(".word"):
            values = line[len(".word") :].strip()
            bytes_list = parse_word_list(values, label_addrs)
            parsed.append({"type": "bytes", "values": bytes_list})
            pc += len(bytes_list)
            continue
        if line.startswith(".text"):
            match = re.match(r"\.text\s+\"(.*)\"$", line)
            if not match:
                raise ValueError(f"invalid text directive: {line}")
            text_value = match.group(1).replace("\\\"", "\"").replace("\\\\", "\\")
            text = text_value.encode("ascii")
            parsed.append({"type": "bytes", "values": list(text)})
            pc += len(text)
            continue
        parts = line.split(None, 1)
        mnemonic = parts[0]
        operand = parts[1].strip() if len(parts) > 1 else ""
        mode = operand_mode(mnemonic, operand)
        opcode = None
        for code, desc in OPCODES.items():
            if desc[0] == mnemonic and desc[1] == mode:
                opcode = code
                break
        if opcode is None:
            raise ValueError(f"unknown opcode for {mnemonic} {operand}")
        size = MODE_SIZE[mode]
        parsed.append(
            {
                "type": "instruction",
                "opcode": opcode,
                "operand": operand,
                "mode": mode,
                "size": size,
            }
        )
        pc += size

    output = bytearray()
    base_addr = None
    pc = 0
    for entry in parsed:
        if entry["type"] == "org":
            target = entry["value"]
            if base_addr is None:
                base_addr = target
            if target < base_addr:
                raise ValueError("org before base address")
            needed = target - base_addr
            if len(output) < needed:
                output.extend([0x00] * (needed - len(output)))
            pc = target
            continue
        if entry["type"] == "bytes":
            output.extend(entry["values"])
            pc += len(entry["values"])
            continue
        if entry["type"] == "instruction":
            output.append(entry["opcode"])
            operand = entry["operand"]
            mode = entry["mode"]
            if mode == "IMP" or mode == "ACC":
                pc += 1
                continue
            if mode == "IMM":
                value = parse_number(operand[1:], label_addrs)
                output.append(value & 0xFF)
            elif mode in {"ZP", "ZPX", "ZPY", "INDX", "INDY"}:
                token = operand
                token = token.replace("(", "").replace(")", "").replace(",X", "").replace(",Y", "")
                value = parse_number(token, label_addrs)
                output.append(value & 0xFF)
            elif mode == "REL":
                target = parse_number(operand, label_addrs)
                rel = target - (pc + 2)
                if not -128 <= rel <= 127:
                    raise ValueError(f"branch out of range at {pc:04X}")
                output.append(rel & 0xFF)
            else:
                token = operand.replace("(", "").replace(")", "").replace(",X", "").replace(",Y", "")
                value = parse_number(token, label_addrs)
                output.append(value & 0xFF)
                output.append((value >> 8) & 0xFF)
            pc += entry["size"]
    return bytes(output)


def main() -> None:
    args = parse_args()
    out_dir = pathlib.Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    prg_path = pathlib.Path(args.prg)
    load_addr, payload, prg_data = read_prg(prg_path)
    sys_addr = parse_basic_sys(load_addr, payload)
    entry_points = [sys_addr] if sys_addr is not None else []

    code_map, code_bytes = disassemble(payload, load_addr, entry_points)
    lines = disassemble_to_lines(payload, load_addr, code_map)
    asm_path = out_dir / "cwmin.asm"
    asm_path.write_text("\n".join(lines))

    rebuilt_payload = assemble(lines)
    rebuilt_prg = bytes([load_addr & 0xFF, load_addr >> 8]) + rebuilt_payload
    rebuilt_path = out_dir / "cwmin.rebuilt.prg"
    rebuilt_path.write_bytes(rebuilt_prg)

    report = {
        "prg_path": str(prg_path),
        "output_dir": str(out_dir),
        "load_address": f"{load_addr:04X}",
        "payload_size": len(payload),
        "entry_point": f"{sys_addr:04X}" if sys_addr is not None else None,
        "code_bytes": len(code_bytes),
        "data_bytes": len(payload) - len(code_bytes),
        "sha256_original": hashlib.sha256(prg_data).hexdigest(),
        "sha256_rebuilt": hashlib.sha256(rebuilt_prg).hexdigest(),
        "match": prg_data == rebuilt_prg,
    }
    report_path = out_dir / "cwmin.report.json"
    report_path.write_text(json.dumps(report, indent=2))

    if not report["match"]:
        print("Rebuilt PRG does not match original.", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
