import sys
import string

DEFAULT_LINEWIDTH = 40

def write_forth_screens(forth_filename, d64_filename):
    """
    Main function to read screens from a FORTH file and write them back to a D64 file.
    """
    global LINEWIDTH
    with open(forth_filename, 'r') as f:
        lines = f.readlines()
    
    # Extract the linewidth from the FORTH file comments
    LINEWIDTH = extract_linewidth(lines)
    # Parse the screens from the FORTH file
    screens = parse_screens(lines)
    
    # Open the existing D64 file and update it with the parsed screens
    with open(d64_filename, 'r+b') as f:
        data = bytearray(f.read())
        updated_data = update_d64_data(data, screens)
        f.seek(0)
        f.write(updated_data)

    return data

def extract_linewidth(lines):
    """
    Extract the linewidth from the first comments in the FORTH file.
    """
    for line in lines:
        if line.startswith("( LINEWIDTH:"):
            return int(line.split(":")[1].strip().rstrip(")"))
    return DEFAULT_LINEWIDTH

def parse_screens(lines):
    """
    Parse the screens from the FORTH file lines.
    """
    screens = {}
    screen_nr = None
    screen_data = []

    for line in lines:
        if line.startswith("( ----------- Screen"):
            # Extract the screen number
            screen_nr = int(line.split()[3].split("/")[0])
            screen_data = []
        elif line.startswith("(") and line.endswith(")"):
            # Skip comment lines
            continue
        else:
            # Strip the newline characters and pad the line to LINEWIDTH with spaces
            screen_data.append(line.rstrip('\r\n').ljust(LINEWIDTH)[:LINEWIDTH])

        if screen_nr is not None:
            screens[screen_nr] = screen_data

    return screens

def update_d64_data(data, screens):
    """
    Update the D64 data with the parsed screens.
    """
    screen_size = 1024
    
    for screen_nr, screen_text in screens.items():
        # Join the list into a single string
        screen_text = ''.join(screen_text)
        # Calculate the offset for the screen in the D64 file
        offset = screen_nr * 0x400 if screen_nr < 89 else screen_nr * 0x400 + 0x300
        # Convert the screen text to bytes and pad to the screen size
        screen_data = [ord(c) for c in screen_text.ljust(screen_size)[:screen_size]]
        # Update the D64 data with the screen data
        data[offset:offset + screen_size] = screen_data
    
    return data

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python write_forth_screens.py <forth_filename> <d64_filename>")
        sys.exit(1)

    forth_filename = sys.argv[1]
    d64_filename = sys.argv[2]
    write_forth_screens(forth_filename, d64_filename)
