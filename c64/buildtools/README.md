# chipwits-C64-build

Build instructions to rebuild the C64 version of ChipWits

It took a little bit longer than expected (quote Doug: “it always takes longer”), but these steps produce a build nearly identical to the 1985 release. More details about the recovery process will follow soon.

During an extensive investigation, we confirmed the correct compilation order of all required FORTH words. Where needed, adjustments were stored as FORTH SCREENS on the buildtools.d64 disk. These SCREENS are also in the SCREENS.FORTH file. If you wish to change them, you can update buildtools.d64 with the write_forth_screens.py script.

## Build Instructions (C64 version of ChipWits)

In September 2023, the ChipWits team recovered Commodore C64 disks containing the original 1985 ChipWits source code. This guide explains how to build that code, using the recovered disk images and a Commodore 64 emulator (VICE). 

> [!NOTE]
> Ensure two disk drives (drive 8 and drive 9) are set up in VICE.

### Source Code

Clone or download the ChipWits-Forth repository:
• https://github.com/chipwits/chipwits-forth/tree/main/c64  
Disk images are under c64/disks, except buildtools.d64.

### Handling Read Errors

> [!TIP]
> If a read error occurs when switching disks (e.g. seeing “0) 73, CBM DOS V2.6 1541,00,00”), clear buffers, then retry e.g. :
>
> ```forth
> EMPTY-BUFFERS
> 1 LIST
> ```

### Step 1: Load the Compiler

1. Attach “CW BOOT.D64” (drive 8).  
2. In BASIC:

   ```basic
   LOAD "CWMIN",8,1
   RUN
   ```

   You should see the Super-Forth start screen.

### Step 2: Build FORTH System Files

1. Attach “buildtools.d64” to drive 8 and “Forth Source screens.d64” to drive 9.  
2. In FORTH:

   ```forth
   DR1
   64 ' C/L !
   1 LIST
   EMPY-BUFFERS
   1 LIST
   1 LOAD
   2 LOAD
   DR0
   ```

### Step 3: Build the ChipWits Source (First Part)

1. Attach “CW Joy+Menu Screen.d64” to drive 9.  
2. In FORTH:

   ```forth
   EMPTY-BUFFERS
   79 LIST
   171 LIST
   79 LOAD
   ```

### Step 4: Build the ChipWits Source (Second Part)

Attach the disk “CW Game Screens.d64” to drive 9. Make sure drive 8 is still pointing to buildtools.d64, then:

1. Attach “CW Game Screens.d64” to drive 9.  
2. In FORTH:

   ```forth
   EMPTY-BUFFERS
   80 LIST
   171 LIST
   80 LOAD
   ```

### Step 5: Run ChipWits

If all went well, you can run:

```forth
CW
```

This executes the main ChipWits program. The result also gets saved to buildtools.d64. To run it later:

1. Attach “buildtools.d64” to drive 8 in VICE.

2. In BASIC:

   ```basic
   LOAD "GAME",8,1
   RUN
   ```

3. Then in FORTH:

   ```forth
   CW
   ```

For questions or suggestions, you can find more information on the ChipWits website or join the ChipWits Discord. For questions or suggestions, visit the ChipWits Discord (see <www.chipwits.com>).
