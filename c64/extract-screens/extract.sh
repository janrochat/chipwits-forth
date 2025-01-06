#!/bin/bash

# Define the python script path
PYTHON_SCRIPT="dump_forth_screens.py"

# Define the list of files and their corresponding output filenames and optional linewidth
FILES=(
    "../disks/Char Bak 11-2-84/Char Bak 11-2-84.d64#Char Bak 11-2-84.forth"
    "../disks/Character Screens/Character Screens.d64#Character Screens.forth"
    "../disks/CW Forth 9-18-84/CW Forth 9-18-84.d64#CW Forth 9-18-84.forth"
    "../disks/CW Forth Bak/CW Forth Bak.d64#CW Forth Bak.forth#64"
    "../disks/Master 3of3 - CW Game Screens/CW Game Screens.d64#CW Game Screens.forth"
    "../disks/CW Graphics/CW Graphics.d64#CW Graphics.forth"
    "../disks/Master 2of3 - CW Joy+Menu Screen/CW Joy+Menu Screen.d64#CW Joy+Menu Screen.forth"
    "../disks/CW Sprite Bak 2/CW Sprite Bak 2.d64#CW Sprite Bak 2.forth"
    "../disks/CW Sprite Bak/CW Sprite Bak.d64#CW Sprite Bak.forth"
    "../disks/CW Sprite Screens/CW Sprite Screens.d64#CW Sprite Screens.forth"
    "../disks/Master 1of3 - Forth Source Screens/Forth Source Screens.d64#Forth Source Screens.forth#64"
    "../disks/Game Bak Screens 11-3-84/Game Bak Screens 11-3-84.d64#Game Bak Screens 11-3-84.forth"
    "../disks/Game Screens/Game Screens.d64#Game Screens.forth"
    "../disks/Joystick + Menu Bak/Joystick + Menu Bak.d64#Joystick + Menu Bak.forth"
    "../disks/Joystick + Menu Stuff Backups/Joystick + Menu Stuff Backups.d64#Joystick + Menu Stuff Backups.forth"
    "../disks/RBFORT BAK Src 2-5-86/RBFORT BAK Src 2-5-86.d64#RBFORT BAK Src 2-5-86.forth#64"
    "../disks/RBGAME BACK Src 2-5-86/RBGAME BACK Src 2-5-86.d64#RBGAME BACK Src 2-5-86.forth"
)

# Loop through each file and call the python script

IFS='#'
for FILE in "${FILES[@]}"; do
    set -- $FILE
    D64_FILE=$1
    OUTPUT_FILE=$2
    LINEWIDTH=${3:-40}  # Default linewidth to 40 if not provided

    python3 "$PYTHON_SCRIPT" "$D64_FILE" "$OUTPUT_FILE" "$LINEWIDTH"
done
unset IFS


