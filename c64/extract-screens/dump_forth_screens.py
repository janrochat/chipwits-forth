import sys
import string

# to extract all FORTH screens from a D64 file, use the following command:
# find ../disks -type f -name "*.d64" -exec sh -c '
#   for f do
#     python dump_forth_screens.py  "$f" "$(basename "$f" .d64).forth"
#   done
# ' sh {} +


# Define the default linewidth at the top of the file
DEFAULT_LINEWIDTH = 40

def dump_forth_screens(d64_filename, output_filename=None, linewidth=DEFAULT_LINEWIDTH):
    global LINEWIDTH
    LINEWIDTH = linewidth
    with open(d64_filename, 'rb') as f:
        data = f.read()
        dump_screens(data, output_filename, d64_filename)

def dump_screens(data, output_filename, d64_filename):
    screen_size = 1024  # Size of a FORTH screen in bytes
    output = []
    output.append(f"( Input file: {d64_filename} )")
    output.append(f"( LINEWIDTH: {LINEWIDTH} )")
    for screen_nr in range(169):  # Assuming a maximum of 169 screens
        if screen_nr < 89:
            offset = screen_nr * 0x400
        else:
            offset = screen_nr * 0x400 + 0x300  # Adjust for screens > 88

        screen_data = data[offset:offset + screen_size]
        if len(screen_data) < screen_size:
            break  # Stop if we reach the end of the data

        output.append(format_screen(screen_nr, screen_data))

    if output_filename:
        with open(output_filename, 'w') as f:
            f.write('\n'.join(output))
    else:
        print('\n'.join(output))

def format_screen(screen_nr, screen_data):
    printable_chars = string.ascii_letters + string.digits + string.punctuation + ' '
    screen_text = ''.join(chr(b) if chr(b) in printable_chars else ' ' for b in screen_data)
    
    result = [f"( ----------- Screen {screen_nr}/{screen_nr+170} ----------- :)"]
    for i in range(0, len(screen_text), LINEWIDTH):
        result.append(screen_text[i:i+LINEWIDTH])
    result.append('')
    return '\n'.join(result)

if __name__ == "__main__":
    if len(sys.argv) not in [2, 3, 4]:
        print("Usage: python dump_forth_screens.py <d64_filename> [output_filename] [linewidth]")
        sys.exit(1)

    d64_filename = sys.argv[1]
    output_filename = sys.argv[2] if len(sys.argv) >= 3 else None
    linewidth = int(sys.argv[3]) if len(sys.argv) == 4 else DEFAULT_LINEWIDTH
    dump_forth_screens(d64_filename, output_filename, linewidth)
