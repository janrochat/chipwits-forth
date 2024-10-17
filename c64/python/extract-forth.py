import argparse
import cbmcodecs2


def skip_sectors(data: bytes) -> bytes:
    """
    d64 files have no header. There is an optional footer with bad sector info but we will skip that.
    According to the Super Forth 64 manual, it stores 170 FORTH screens, numbered 0 to 169.
    Each screen is 1024 bytes (4 x 256 byte tracks per screen). The following tracks / sectors are not used:
      * Track 17, Sector 20: Skipped
      * Track 18 Sector 0: Contains a byte stating the disk has been formatted
      * Track 18 Sector 1: Skipped
    Tracks are numbered from 1. Sectors are numbered from 0.
    The first 17 tracks have 21 sectors each. Track 18 has 19 sectors.
    """

    t17s0_offset = 16 * 21 * 256
    t17s20_offset = t17s0_offset + 20 * 256
    t18s0_offset = t17s20_offset + 256
    t18s1_offset = t18s0_offset + 256
    t18s2_offset = t18s1_offset + 256

    return data[0:t17s20_offset] + data[t18s2_offset:]



def extract_screen(data: bytes) -> str:
    """
    A screen is 1024 bytes. The screen has rows, each with 64 characters.
    Each character is stored as a 1 byte PETSCII value.
    We skip over 0 values
    """
    result = ""
    for i in range(0, 1024, 40):
        row = ""
        # Skip over 0 values
        for b in data[i:i+40]:
            if b == 0:
                continue
            # Decode PETSCII byte to char
            try:
                c = bytes([b]).decode("petscii_c64en_lc")
            except:
                # skip over unprintable characters
                c = ""
                pass
            row += c
        result += row + "\n"

    return result


def extract(input: str, output: str):
    # Read the d64 file into memory (174848 bytes)
    with open(input, "rb") as f:
        data = f.read()

    # Skip the unused sectors
    data = skip_sectors(data)

    # Extract 1024 byte screens, and append them to the output
    out = ""
    for i in range(0, len(data), 1024):
        screen_data = data[i:i+1024]
        out += extract_screen(screen_data)

    with open(output, "w", encoding="utf-8") as f:
        f.write(out)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, help="d64 file to extract source code from")
    parser.add_argument("--output", required=True, help="ASCII file to write source code to")
    args = parser.parse_args()

    extract(args.input, args.output)
