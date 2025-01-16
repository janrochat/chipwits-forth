# dump_forth_screens.py

This Python script extracts all FORTH screens from a D64 file and outputs them either to a specified file or to the console. The script reads the binary data from the D64 file, processes each screen, and formats it for readability.

## Usage

To run the script, use the following command:

```sh
python dump_forth_screens.py <d64_filename> [output_filename] [linewidth]
```

- `d64_filename`: The path to the D64 file containing the FORTH screens.
- `output_filename`: (Optional) The file to write the extracted screens to. If not provided, the output will be printed to the console.
- `linewidth`: (Optional) The number of characters per line in the output. Defaults to 40 if not provided.

## Example

To extract screens from a D64 file and save them to a `.forth` file:

```sh
python dump_forth_screens.py example.d64 example.forth
```

To extract screens and print them to the console with a custom linewidth:

```sh
python dump_forth_screens.py example.d64 - 80
```

## FORTH Screens and C64 Disk Mapping

A FORTH screen is a block of 1024 bytes (1 KB) used to store source code or data in the FORTH programming language. On a Commodore 64 (C64) disk, these screens are stored sequentially.

### Screen Mapping

- Screens 0 to 88 are stored contiguously, each occupying 1024 bytes.
- Screens 89 to 168 are also 1024 bytes each but have an additional offset of 768 bytes (0x300) after screen 88.

This script processes up to 169 screens, reading the appropriate bytes from the D64 file and formatting them for output.

## Script Details

- `DEFAULT_LINEWIDTH`: The default number of characters per line in the output.
- `dump_forth_screens(d64_filename, output_filename, linewidth)`: Main function to read the D64 file and extract screens.
- `dump_screens(data, output_filename, d64_filename)`: Processes the binary data and extracts screens.
- `format_screen(screen_nr, screen_data)`: Formats a single screen for output, ensuring only printable characters are included.

## Notes

- The script assumes a maximum of 169 screens.
- Non-printable characters in the screen data are replaced with spaces for readability.
```