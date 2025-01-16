# write_forth_screens.py

This script reads screens from a FORTH file and writes them back to a D64 file.

## Usage

To use the script, run the following command:

```bash
python write_forth_screens.py <forth_filename> <d64_filename>
```forth

- `<forth_filename>`: The path to the FORTH file containing the screens.
- `<d64_filename>`: The path to the D64 file to be updated.

## Example

```bash
python write_forth_screens.py screens.forth disk.d64
```

This command will read the screens from `screens.forth` and update `disk.d64` with the parsed screens.

## Requirements

- Python 3.x

Make sure you have Python installed on your system. You can download it from [python.org](https://www.python.org/).

## Functions

### `write_forth_screens(forth_filename, d64_filename)`

Main function to read screens from a FORTH file and write them back to a D64 file.

### `extract_linewidth(lines)`

Extract the linewidth from the first comments in the FORTH file.

### `parse_screens(lines)`

Parse the screens from the FORTH file lines.

### `update_d64_data(data, screens)`

Update the D64 data with the parsed screens.

## FORTH Source File Format

The FORTH source file should contain screens formatted as follows:

- Each screen starts with a comment line indicating the screen number.
- Screen content lines follow, which are padded to the specified linewidth.
- Comments and empty lines are ignored.

### Usage Example

```
( LINEWIDTH: 40 )

( ----------- Screen 0/1 ----------- )
: HELLO
  ." Hello, world!" CR ;

( ----------- Screen 1/1 ----------- )
: BYE
  ." Goodbye, world!" CR ;
```

In this example:

- The linewidth is set to 40 characters.
- There are two screens, each starting with a comment line indicating the screen number.
- Screen content lines are padded to the specified linewidth.
