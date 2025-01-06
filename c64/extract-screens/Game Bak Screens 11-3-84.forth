( Input file: ../disks/Game Bak Screens 11-3-84/Game Bak Screens 11-3-84.d64 )
( LINEWIDTH: 40 )
( ----------- Screen 0/170 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 1/171 ----------- :)
( CHIPWIT GAME LOADER)                  
                                        
( FORGET IT : IT ; ) FORTH              
172 197  THRU  ( DATA & COMMON ROUTINES)
246 254 THRU ( CHAR ROUTINES)           
256 265 THRU ( IBOL GRAPHICS)           
330 339 THRU ( STAT  NAMES)             
266 275 THRU  ( DEBUG)                  
320 329 THRU  ( STACK,REG STUFF)        
276 290 THRU  ( WORKSHOP)               
313 319 THRU ( MENUS)                   
291 307 THRU  ( W2)                     
198 241 THRU ( GAME)                    
308 311 THRU  ( BADS)                   
242 LOAD  ( GAME)                       
( 251 256 THRU ( CHOOSE CW)             
243 245 THRU   ( CW MASTER WORD)        
( 255 LOAD  ( DUMMY PROG)               
                                        
DR0                                     
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 2/172 ----------- :)
( ROBOT VARS AND CONSTS 11/4/84)        
: VAR VARIABLE ; : IS CONSTANT ;        
( VAR ROBOT.SQUARE)                     
( VAR ROBOT.ORIENTATION)                
8  IS CHIPS.WIDE@ 5 IS CHIPS.HIGH@      
CHIPS.WIDE@ CHIPS.HIGH@ *               
 IS CHIP.COUNT@                         
10 CHIP.COUNT@ 2 * * IS PROG.SIZE@      
CREATE ROBOT.PROGRAM                    
  PROG.SIZE@ ALLOT                      
                                        
16 IS CHIPWIT.COUNT@                    
VAR CURRENT.INSTRUCTION ( 0-39)         
VAR CURRENT.PANEL   ( 0-9)              
VAR KEY.PRESSED                         
VAR FUEL.REG   ( 0-1400)                
VAR RANGE.REG  ( 0-8)                   
VAR DAMAGE.REG  ( 0-1400)               
VAR COPY.BUFF.FULL                      
 ( IS COPY BUFFER FULL?)                
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 3/173 ----------- :)
( OPERATOR CONSTS, CYCLES 11/4/84)      
  1 IS GOTO'S                           
0 IS GO.MARKER@ 1 IS GOTO.GO@           
2 IS SUBPANEL@  3 IS BOOMERANG@         
4 IS WIRE@                              
  2 IS ACT.ON.WORLD'S                   
5 IS MOVE@  6 IS PICK.UP@               
7 IS QRAY@  8 IS SING@                  
  3 IS DETECT'S                         
9 IS FEEL.FOR@ 10 IS LOOK.FOR@          
11 IS SMELL.FOR@                        
  4 IS SPECIAL'S                        
12 IS FLIP.COIN@  13 IS KEYPRESS@       
  5 IS STACK'S   6 IS SOCKET'S          
14 IS NUMBER=@  15 IS NUMBER<@          
16 IS OBJECT=@  17 IS MOVE=@            
18 IS ON.NUMBER@ 19 IS ON.OBJECT@       
20 IS ON.MOVE@  21 IS DROP.STACK@       
22 IS PLUS@     23 IS MINUS@            
24 IS SOCKET@  25 IS ACTION.COUNT@      
CREATE CYCLES(                          
0 C, 1 C, 1 C, 1 C, 0 C, 3 C, 1 C,      
1 C, 2 C, 4 C, 4 C, 4 C, 3 C, 3 C,      
2 C, 2 C, 2 C, 2 C, 1 C, 1 C, 1 C,      
1 C, 1 C, 1 C, 1 C,                     
                        

( ----------- Screen 4/174 ----------- :)
( ARG, CODE, ORIENT CONSTS FUEL( )      
( PROGRAM FLOW BITS)                    
0 IS UP.F@ 64 IS DOWN.F@                
128 IS LEFT.F@  192 IS RIGHT.F@         
VAR OP.BYTE  VAR ARG.BYTE               
VAR FLOW.CODE                           
                                        
( CHIPWIT ORIENTATION)                  
7 IS W   6 IS SW  5 IS S   4 IS SE      
3 IS E   2 IS NE  1 IS N   0 IS NW      
                                        
( ARGS WHICH DON'T INDEX TO GRAPHS)     
27 IS NO.KEY@                           
1 IS PANELA@ 2 IS PANELB@               
3 IS PANELC@ 4 IS PANELD@               
5 IS PANELE@ 6 IS PANELF@               
7 IS PANELG@                            
                                        
CREATE FUEL(                            
0 C, 1 C, 1 C, 1 C, 0 C, 5 C, 5 C,      
7 C, 2 C, 4 C, 2 C, 2 C, 1 C, 1 C,      
1 C, 1 C, 1 C, 1 C, 1 C, 1 C, 1 C,      
1 C, 1 C, 1 C, 1 C,                     
                                        
                                        
                        

( ----------- Screen 5/175 ----------- :)
( ARGUMENT CONSTANTS 11/4/84)           
                                        
0 IS TURN.RIGHT@ 1 IS TURN.LEFT@        
2 IS FORWARD@    3 IS REVERSE@          
                                        
4 IS PIE@        5 IS COFFEE@           
6 IS DISK@       7 IS OIL@              
8 IS FLOOR@   9 IS BOMB@                
10 IS BOUNCER@  11 IS CREEP@            
( 12 IS WALL@)    13 IS DOOR@           
                                        
14 IS DAMAGE.REG@ 15 IS FUEL.REG@       
16 IS RANGE.REG@                        
                                        
17 IS MOV.STACK@  18 IS NUM.STACK@      
19 IS OBJ.STACK@  20 IS MOV.EMPTY@      
21 IS NUM.EMPTY@  22 IS OBJ.EMPTY@      
                                        
23 IS NUM0@ 24 IS NUM1@ 25 IS NUM2@     
26 IS NUM3@ 27 IS NUM4@ 28 IS NUM5@     
29 IS NUM6@ 30 IS NUM7@                 
                                        
31 IS THING.COUNT@                      
                                        
                                        
                        

( ----------- Screen 6/176 ----------- :)
( GAMEBOARD DATA)                       
                                        
8 IS SQUARES.WIDE@                      
8 IS SQUARES.HIGH@                      
SQUARES.WIDE@ SQUARES.HIGH@ *           
  IS SQUARE.COUNT@                      
SQUARE.COUNT@ 16 + IS ROOM.SIZE@        
                                        
( CREATE ROOM.DATA( ROOM.SIZE@ ALLOT)   
                                        
53248 IS SCENARIO.BUFFER@               
 ( SCENARIOS ARE LOADED HERE)           
VAR THIS.ROOM@                          
                                        
24 IS GAME.WIDTH@ 16 IS GAME.HEIGHT@    
                                        
1 IS GAME.XT@ 8 IS GAME.YT@             
( TAB POSITIONS FOR UPPER LEFT GAME)    
24 GAME.XT@ 8 * + IS GAME.X@            
50 GAME.YT@ 8 * + IS GAME.Y@            
( SPRITE XY FOR UPPER LEFT)             
                                        
( VAR WALL.COVERS  ( WALL HIDES CW?)    
                                        
                                        
                        

( ----------- Screen 7/177 ----------- :)
( GAME DRIVER DATA)                     
CREATE ADVENTURE 6 ALLOT 1 ADVENTURE !  
ADVENTURE 2 + IS CW.NUM  1 CW.NUM !     
DVARIABLE  POINTS                       
VAR CYCLE.CT   ( TIME COUNTDOWN)        
VAR SOUND.ON   ( TOGGLE)                
VAR DEBUG.SPEED                         
                                        
VAR GAME.STATUS 1 IS DEBUG.ON@          
2 IS STATS.ON@  3 IS TURN.DEBUG.ON@     
4 IS TURN.STATS.ON@                     
                                        
VAR PROG.STATUS                         
 1 IS TURN.GAME.ON@                     
 2 IS GAME.ON@                          
 3 IS WORKSHOP.ON@                      
 4 IS WORKSHOP.OFF@                     
 5 IS GAME.ABORTED@ ( DEAD CHIPWIT)     
 6 IS TURN.GAME.OFF@                    
 7 IS GAME.FINISHED@ ( OUT OF CYCLES)   
 8 IS GAME.OFF@  ( WAIT FOR CHOICE)     
 9 IS QUIT@  ( BYE)                     
 10 IS SERIES@  ( MULTI-GAME)           
                                        
VAR LAST.MISSION                        
                        

( ----------- Screen 8/178 ----------- :)
( COLOR CONSTANTS)                      
LT.GRAY IS AC@ ( ACT ICON BKGND)        
DK.GRAY IS  TC@ ( THING ICON BKGND)     
DK.GRAY IS WS.BACK.COL@                 
BLUE IS WS.BORD.COL@                    
BLUE IS GM.BORD.COL@                    
 BLACK IS NC@ ( NUMBER)                 
 BLUE IS OC@  ( OBJ)                    
 RED  IS  MC@  ( MOV@)                  
 BLACK IS VC@   ( VARIOUS)              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
LT.GRAY IS BAK.C  ( BACK COLOR)         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
EXIT                    

( ----------- Screen 9/179 ----------- :)
 ( FILE AND MENU STUFF)                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 10/180 ----------- :)
( ADVENTURE NAMES)                      
                                        
15 8 * $VARIABLE ADV$(                  
0 ADV$( C!                              
ADV$( " ^ GREEDVILLE ^^" $CONCAT        
ADV$( "  CHIPWIT CAVES " $CONCAT        
ADV$( " ^ DOOM ROOMS ^^" $CONCAT        
ADV$( " ^ PEACE PATHS ^" $CONCAT        
ADV$( "  MEMORY LANES ^" $CONCAT        
ADV$( " OCTOPUS GARDEN^" $CONCAT        
ADV$( " ^^ CES DEMO ^^^" $CONCAT        
ADV$( " ^^ BOOMTOWN ^^^" $CONCAT        
                                        
CREATE CYCLE(                           
 6000 ,  10000 ,  10000 ,  16000 ,      
20000 ,  20000 ,   2000 ,  12000 ,      
                                        
                                        
CREATE TRIP.COUNT(                      
 0 C,  6 C,  0 C, 20 C,                 
 9 C, 32 C, 12 C,  3 C,                 
                                        
8 IS ADVENTURE.COUNT@                   
                                        
16 $VARIABLE CW.NAME$                   
                        

( ----------- Screen 11/181 ----------- :)
( SCENARIO.PLAY( ROOM.CT( )             
: D, 10 * C, ;                          
CREATE SCENARIO.PLAY(                   
( CRP.CT) 00 C, 08 C, 08 C, 04 C,       
          03 C, 03 C, 00 C, 03 C,       
( CRP.PT) 00 D, 05 D, 10 D, 03 D,       
          03 D, 01 D, 00 D, 04 D,       
( BNC.CT) 00 C, 00 C, 02 C, 00 C,       
          02 C, 02 C, 00 C, 00 C,       
( BNC.PT) 00 D, 00 D, 25 D, 06 D,       
          06 D, 02 D, 00 D, 00 D,       
( OIL.CT) 10 C, 06 C, 00 C, 04 C,       
          02 C, 00 C, 00 C, 00 C,       
( OIL/PT) 05 D, 05 D, 00 D, 02 D,       
          03 D, 05 D, 15 D, 00 D,       
( DSK.CT) 03 C, 02 C, 00 C, 02 C,       
          00 C, 00 C, 00 C, 00 C,       
( DSK.PT) 10 D, 10 D, 00 D, 15 D,       
          25 D, 25 D, 25 D, 25 D,       
( COF.CT) 03 C, 04 C, 02 C, 03 C,       
          03 C, 01 C, 00 C, 00 C,       
( PIE.CT) 03 C, 00 C, 02 C, 03 C,       
          02 C, 04 C, 00 C, 02 C,       
CREATE ROOM.CT( 4 C, 8 C, 12 C,         
50 C, 1 C, 1 C, 1  C, 9 C,              
                        

( ----------- Screen 12/182 ----------- :)
 ( COLOR.BLOCK SCREEN.ON,SPRITES.OFF)   
: COLOR.BLOCK ( L/T/R/B/COLOR---)       
  >R                                    
  SWAP 4 ROLL SWAP  ( T/B/L/R)          
  OVER - 1+   ( T/B/L/WIDTH)            
  R> 5 ROLL 5 ROLL  ( L/W/CL/T/B)       
  1+ SWAP DO  ( YTAB)                   
   I 40 * 4 PICK + >R                   
   'SCREEN R@ + 3 PICK 3 PICK           
   7 > PROG.STATUS @ WORKSHOP.ON@ =     
NOT AND  IF 32 ELSE 33 THEN FILL        
   ( BLANKS IF LT.GRAY)                 
   COLOR-MEM R> + 3 PICK 3 PICK FILL    
  LOOP                                  
  DROP DROP DROP ;                      
  : SCREEN.ON ( ---)                    
    53265 C@ 24 OR 53265 C! ;           
  : SCREEN.OFF ( ---)                   
    53265 C@ 239 AND  53265 C! ;        
                                        
 : SPRITES.OFF ( ---)                   
  1 53269 C! ;                          
                                        
                                        
                                        
                        

( ----------- Screen 13/183 ----------- :)
( CW.LOAD CW.SAVE BACK.WIPE )           
                                        
: BACK.WIPE ( COLOR---)                 
 'SCREEN  1000 33 FILL ( REV BLANK)     
 COLOR-MEM 1000 ROT FILL ;              
                                        
: CW.FILE$ ( #---)                      
  5 SAVENAME C!  ( LENGTH)              
  64 SAVENAME 1+ C! ( @)                
  48 SAVENAME 2+ C! ( 0)                
  58 SAVENAME 3 + C! ( :)               
  67 SAVENAME 4 + C! ( C)               
  64 + SAVENAME 5 + C! ( #CODE) ;       
                                        
: CW.LOAD  ( CW#--)  CW.FILE$           
  ROBOT.PROGRAM SAVENAME LOADRAM ;      
                                        
: CW.SAVE ( CW#---)                     
  CW.FILE$                              
  ROBOT.PROGRAM DUP PROG.SIZE@ +        
  SAVE ;                                
                                        
                                        
                                        
                                        
                        

( ----------- Screen 14/184 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 15/185 ----------- :)
 ( GET.ACTION THIS.CHIP @CHIP !CHIP)    
                                        
: THIS.CHIP  ( --- ABS.CHIP)            
  CURRENT.PANEL @ CHIP.COUNT@ *         
  CURRENT.INSTRUCTION @ + ;             
                                        
: @CHIP  ( ---OP.BYTE/ARG.BYTE)         
  THIS.CHIP 2* ROBOT.PROGRAM +          
  DUP 1+ SWAP C@  ( OP.BYTE)            
  SWAP C@ ( ARG.BYTE) ;                 
                                        
: !CHIP  ( OP/ARG---)  >R >R            
  THIS.CHIP 2* ROBOT.PROGRAM +          
  DUP R> SWAP C!  ( OP)                 
  R> SWAP 1+ C!  ( ARG) ;               
                                        
: GET.ACTION ( --- ACTION.TOKEN)        
  ROBOT.PROGRAM THIS.CHIP 2* + C@       
  DUP 192 AND FLOW.CODE !               
  64 MOD DUP OP.BYTE C! ;               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 16/186 ----------- :)
( GET.ARG FALSE.FLOW IRND WITHIN )      
VARIABLE RND HERE RND !                 
: RAND RND @ 31421 * 6927 + DUP RND ! ; 
: IRND ( MAX--RND)                      
  RAND U* SWAP DROP ;                   
                                        
: GET.ARG.ASC ( -ASCII) ARG.BYTE C@     
  64 MOD 64 + ( 1 IS A) ;               
                                        
: FALSE.FLOW ( ---)                     
  ARG.BYTE C@ 192 AND FLOW.CODE ! ;     
                                        
: WITHIN ( N/MIN/MAX---FLAG)            
  1+ 3 PICK > ROT ROT 1- > AND ;        
                                        
: GET.ARG ( ---)                        
  ROBOT.PROGRAM THIS.CHIP 2* + 1+       
  C@ ARG.BYTE C! ;                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 17/187 ----------- :)
 ( SQUARE.XY SQUARE.XTYT DEBUG? +MOD)   
                                        
: SQUARE.XY  ( SQ# ---X/Y)              
 DUP SQUARES.WIDE@ MOD GAME.WIDTH@ *    
 GAME.X@ +  ( X)                        
 SWAP SQUARES.WIDE@ / GAME.HEIGHT@ *    
 GAME.Y@ +  ( Y) ;                      
                                        
                                        
                                        
: SQUARE.XTYT  ( SQ# ---XTAB/YTAB)      
 DUP SQUARES.WIDE@ MOD 3 * GAME.XT@ +   
 SWAP SQUARES.WIDE@ / 2 * GAME.YT@ + ;  
                                        
: DEBUG? ( ---FLAG)                     
 ( IS DEBUG MODE ON?)                   
GAME.STATUS @ DEBUG.ON@ = ;             
                                        
                                        
                                        
: +MOD ( N MOD# --N)                    
  MOD DUP 0< IF DROP 7 THEN ;           
                                        
                                        
                                        
                        

( ----------- Screen 18/188 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 19/189 ----------- :)
( COUNT.BADDIES BADDY VARS)             
                                        
VAR CREEP.COUNT                         
CREATE CREEPS( 12 ALLOT                 
VAR BOUNCERS ( 0 OR 1)                  
VAR BOUNCER.SQ                          
VAR BOUNCER.STATE                       
                                        
: COUNT.BADDIES ( ---)                  
 CREEPS( 12 0 FILL                      
 0 CREEP.COUNT ! 0 BOUNCERS !           
 SQUARE.COUNT@ 0 DO                     
  I SQUARE.OBJECT                       
  CASE CREEP@ OF 1 CREEP.COUNT +!       
         I CREEP.COUNT @ 1-             
         CREEPS( + C! ;;                
       BOUNCER@ OF                      
         1 BOUNCERS !                   
         I BOUNCER.SQ !  ;;             
  ENDCASE                               
 LOOP ;                                 
                                        
                                        
                                        
                                        
                        

( ----------- Screen 20/190 ----------- :)
 ( PUT.OBJECTS FURNISH.ROOM)            
                                        
: PUT.OBJECTS ( COUNTLIM/OBJCODE--)     
 SWAP IRND DUP 0>                       
 IF 0 DO BEGIN SQUARE.COUNT@ IRND       
     DUP SQUARE.OBJECT                  
     FLOOR@ =                           
     IF OVER SWAP ROOM.DATA( + C! 1     
     ELSE DROP 0 THEN                   
    UNTIL LOOP DROP                     
 ELSE 2DROP THEN ;                      
                                        
: FURNISH.ROOM ( ---)                   
 ADVENTURE @ 1- SCENARIO.PLAY( +        
 DUP C@ CREEP@ PUT.OBJECTS              
 DUP ADVENTURE.COUNT@ 2* +  C@          
    BOUNCER@ PUT.OBJECTS                
 DUP ADVENTURE.COUNT@ 4 * + C@          
    OIL@ PUT.OBJECTS                    
 DUP ADVENTURE.COUNT@ 6 * + C@          
    DISK@ PUT.OBJECTS                   
 DUP ADVENTURE.COUNT@ 8 * + C@          
    COFFEE@ PUT.OBJECTS                 
     ADVENTURE.COUNT@ 9 * + C@          
    PIE@ PUT.OBJECTS ;                  
                        

( ----------- Screen 21/191 ----------- :)
( ROOM DATA CLEAR.ROOMS)                
VAR ROOMS.VISITED                       
  CREATE ROOM( 50 ALLOT ( MAX ROOMS)    
: CLEAR.ROOMS( ROOM( 50 0 FILL          
  0 ROOMS.VISITED ! ;                   
: CHUCK.GOODS ( ---^ERASE GOOD THINGS)  
ROOM.DATA( DUP SQUARE.COUNT@ + SWAP DO  
  I C@ DUP  DISK@ = SWAP OIL@ = OR      
    IF FLOOR@ I C! THEN                 
LOOP ;                                  
: GOODS.CHECK ( ROOM#---)               
 ADVENTURE @ DUP 4 7 WITHIN SWAP 2      
  = OR IF 1 ELSE 0 THEN  ( ERASEABLES)  
  IF 1- DUP ROOM( + C@ NOT ( NOT VIS)   
    IF ROOM( + 1 SWAP C!                
      ROOMS.VISITED @ 1+ DUP            
      TRIP.COUNT( ADVENTURE @ 1- + C@   
      = IF DROP CLEAR.ROOMS(            
    ELSE ROOMS.VISITED ! THEN           
   ELSE DROP CHUCK.GOODS THEN (         
    ( BEEN HERE)                        
  ELSE DROP THEN ;                      
                                        
                                        
                                        
                        

( ----------- Screen 22/192 ----------- :)
( LOAD.ROOM )                           
                                        
: LOAD.ROOM ( ROOM#---)  DUP 1-         
  SCENARIO.BUFFER@ SWAP ROOM.SIZE@ * +  
  ROOM.DATA( ROOM.SIZE@                 
  SWAPOUT CMOVE SWAPIN                  
  DUP ADVENTURE @ 4 = NOT SWAP          
  2 MOD 0= OR                           
  IF FURNISH.ROOM THEN                  
  COUNT.BADDIES                         
  GOODS.CHECK ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 23/193 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 24/194 ----------- :)
 ( SOUNDS)                              
 : MOVE.SOUND  ;                        
                                        
                                        
 : BUMP.SOUND ;                         
                                        
 : ZAP.SOUND ;                          
                                        
 : CRUNCH ;                             
                                        
 : SEE.SOUND ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 25/195 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 26/196 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 27/197 ----------- :)
 ( SETUP.GAME.SCREEN)                   
                                        
 : SETUP.GAME.SCREEN  ( ---)            
 ( FLIP IN THE GAME GRAPHIC SCREEN)     
  1 MULTI-COLOR                         
  FIRST 'SCREEN 1000 CMOVE              
  FIRST 1000 + COLOR-MEM 1000 CMOVE     
  BAK.C 0 BKGND                         
  GM.BORD.COL@ BORDER                   
   6 2 D-POSITION  BLACK CHAR.COLOR     
  ADV$( ADVENTURE @ 1- 15 * + 1+        
  15 TYPE  ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
EXIT                    

( ----------- Screen 28/198 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 29/199 ----------- :)
( CLEAN.UP)                             
                                        
 : CLEAN.UP ( ---)                      
   64 0 DO                              
     I SQUARE.OBJECT                    
     DUP DUP                            
      WALL@ = SWAP DOOR@ = OR           
      SWAP FLOOR@ = OR NOT              
      IF FLOOR@ I ROOM.DATA( + C!       
      THEN                              
   LOOP ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 30/200 ----------- :)
( ROOM STUFFER FOR DEMO)                
 WALL@ 2+ IS WALLS@                     
: R, ( OBJ# SQ# ---)                    
  ROOM.DATA( + C! ;                     
: BLANK.ROOM ( ---)                     
  ROOM.SIZE@ 0 DO                       
  FLOOR@ ROOM.DATA( I + C! LOOP ;       
 BLANK.ROOM                             
 WALL@ 0 R, WALL@ 1 R, WALL@ 2 R,       
 WALL@ 3 R, WALL@ 4 R, DOOR@ 5 R,       
 WALL@ 6 R, WALL@ 7 R,                  
 WALL@  8 R,                            
 WALL@ 11 R,                            
 WALL@ 15 R,                            
 WALL@ 16 R,             BOMB@ 20 R,    
 DOOR@ 23 R,                            
 DOOR@ 24 R,                            
 COFFEE@ 29 R,   WALL@ 31 R,            
 WALL@ 32 R,  WALL@ 39 R,               
WALL@ 40 R,      WALL@ 47 R,            
WALL@ 48 R,    WALL@ 55 R,              
WALL@ 56 R, WALL@ 57 R, WALL@ 58 R,     
WALL@ 59 R, WALL@ 60 R, DOOR@ 61 R,     
WALL@ 62 R, WALL@ 63 R,                 
                                        
                        

( ----------- Screen 31/201 ----------- :)
( DRAW.THING )                          
                                        
: DRAW.THING ( SQX/SQY/OBJ#---)         
  DUP WALL@ = IF                        
   3 PICK 3 PICK SQUARES.WIDE@ * +      
   DUP SQUARES.WIDE@ + SQUARE.OBJECT    
   ( SQUARE TOWARD USER IS WALL)        
   WALL@ =                              
   SWAP 56 < AND  ( NOT BOTTOM ROW)     
   NOT IF DROP  WALLS@  THEN            
   ( LEAVE WALLSIDE TOKEN)              
  THEN >R                               
  2 * GAME.YT@ + SWAP 3 * GAME.XT@ +    
  SWAP R> 4 - 7 *  OBJ.BLOCK( +  OBJ. ; 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 32/202 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 33/203 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 34/204 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 35/205 ----------- :)
 ( BLOCK.WALL <<<<<< ERASE.ROBOT)       
                                        
: BLOCK.WALL ( ORIENT#--^DRAWS WALL IN) 
  ( FRONT OF CW)                        
  CASE S OF SQUARES.WIDE@ ;;            
       E OF 1 ;; W OF -1 ;;             
       0                                
  ENDCASE                               
  OP.BYTE C@ 64 MOD MOVE@ = NOT         
  IF DROP 0 THEN ( NO MOVE TO BLOCK)    
  DUP 0= IF DROP ELSE                   
    ROBOT.SQUARE @ +  ( BLOCK SQUARE)   
    SQUARE.XY                           
    S2 S-POSITION OFF S-ENABLE          
    187 S-POINTER                       
    0 S-PRIORITY ON S-MULTI             
    OFF S-YEXP OFF S-XEXP               
   53283 C@ S-COLOR 53282 C@ 0 S-MULTIR 
   WHITE 1 S-MULTIR                     
   255 53269                            
   FRAME C!  ( ENABLE ALL SPRITES)      
  THEN ;                                
: ERASE.ROBOT ( ---)                    
  1 53269 C! ;                          
                                        
                        

( ----------- Screen 36/206 ----------- :)
( CW.OP.MOUTH)                          
                                        
: CW.OP.MOUTH ( ---^OPEN CW'S MOUTH)    
 S4 WHITE S-COLOR ROBOT.ORIENTATION @   
 7 * 129 + FRAME  S-POINTER ;           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 37/207 ----------- :)
( INIT.CW.GRAPHICS DRAW.ROBOT CW.ANIM)  
CREATE CW.XY( 12 ALLOT ( XY ARRAY)      
: CW.XY! ( X/Y/SPR#---) 2- 2*           
  CW.XY( + DUP 1+ ROT SWAP C! C! ;      
 VAR CW.X VAR CW.Y  : T 1 CW.LOAD .S ;  
 : CW.GO ( X/Y---)                      
  2DUP CW.Y ! CW.X !                    
  19 - ( OFFSET UPWARDS)                
  2DUP 2 CW.XY!  2DUP 3 CW.XY!          
  2DUP 6 CW.XY!                         
  12 +  ( LOWER BODY SPRITES)           
  2DUP 4 CW.XY!  2DUP 5 CW.XY!          
  7 CW.XY!                              
  56334 C@ 254 AND 56334 C!             
  FRAME      CW.XY( 53252 12 CMOVE      
  56334 C@ 1 OR 56334 C! ;              
 : INIT.CW.GRAPHICS ( ---)              
 ( START CW AT RIGHT X/Y)               
 ROBOT.SQUARE @ SQUARE.XY SWAP 1-       
 SWAP CW.GO ;                           
 : CW.ANIM  ( DX/DY---)                 
  S4 ROBOT.ORIENTATION @                
  7 * 128 + FRAME    S-POINTER          
   CW.Y @ + SWAP CW.X @ + SWAP CW.GO ;  
 : DRAW.ROBOT ( ---)  0 0 CW.ANIM ;     
                        

( ----------- Screen 38/208 ----------- :)
( DRAW.GAMEBOARD)                       
                                        
: DRAW.GAMEBOARD ( ---)                 
  ROOM.DATA( 1-                         
  SQUARES.HIGH@ 0 DO                    
   SQUARES.WIDE@ 0 DO                   
     1+ DUP C@                          
     I J ROT DRAW.THING                 
   LOOP                                 
  LOOP DROP ;                           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 39/209 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 40/210 ----------- :)
( FLASH.CW)                             
                                        
 : FLASH.CW  ( #FLASHES---)             
   0 DO                                 
    53289 1024 6 CMOVE ( SAVE COLORS)   
    6 0 DO 16 IRND 53289 I + C! LOOP    
     ( RANDOM COLORS  )                 
    2 WAIT 1024 53289 6 CMOVE 2 WAIT    
   LOOP ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 41/211 ----------- :)
 ( ORIENT.XY    CW.SLIDE)               
                                        
 : ORIENT.XY ( ORIENTATION#---)         
  CASE N OF 0 -2 ;; NE OF 3 -2 ;;       
   E OF 3 0 ;;  SE OF 3 2 ;;            
   S OF 0 2 ;;  SW OF -3 2 ;;           
   W OF -3 0 ;; NW OF -3 -2 ;;          
  ENDCASE ;                             
                                        
 : CW.SLIDE ( ---^ MOVE CW FORWARD)     
   ROBOT.ORIENTATION @ ORIENT.XY        
   CW.ANIM MOVE.SOUND ;                 
                                        
 : CW.BACK.SLIDE ( ---^CW REVERSE)      
   ROBOT.ORIENTATION @ 4 + 8 MOD        
   ORIENT.XY                            
   CW.ANIM MOVE.SOUND ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 42/212 ----------- :)
( NEXT.SQUARE)                          
                                        
                                        
: NEXT.SQUARE ( ORIENT/SQ#--NEXT SQ#)   
 ( WHAT IS NEXT SQUARE#?)               
 SWAP 0 WALL.COVERS !                   
 CASE                                   
  N OF SQUARES.WIDE@ - ;;               
  E OF 1+ ;;                            
  S OF SQUARES.WIDE@ + ;;               
  W OF 1- ;;                            
 NE OF 7 - DUP                          
  CHECK.COVER IF E BLOCK.WALL THEN ;;   
 SE OF DUP 9 + SWAP                     
  CHECK.COVER IF S BLOCK.WALL THEN ;;   
 SW OF DUP 7 + SWAP                     
  CHECK.COVER IF S BLOCK.WALL THEN ;;   
 NW OF 9 - DUP                          
  CHECK.COVER IF W BLOCK.WALL THEN ;;   
ENDCASE ;                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 43/213 ----------- :)
( ADD.POINTS COUNT.CYCLES)              
                                        
: ADD.POINTS  ( POINTS---)              
  0 POINTS D@ D+ DDUP POINTS D!         
  DEBUG? IF DDROP                       
  ELSE 2 5 D-POSITION D. THEN           
  ;                                     
                                        
: COUNT.CYCLE ( CYCLES---)              
  CYCLE.CT @ + DUP CYCLE.CT !           
  19 5 D-POSITION                       
  DUP 1 < IF DROP 0 GAME.FINISHED@      
          PROG.STATUS ! THEN            
  DEBUG? IF DROP                        
  ELSE BLUE CHAR.COLOR ABS .  THEN ;    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 44/214 ----------- :)
( CALC.ROBOT.MOVE BOOM ?BOOM)           
 FORTH                                  
 : CALC.ROBOT.MOVE ( --- NEXT SQ#)      
  ROBOT.ORIENTATION @                   
   ARG.BYTE C@ 64 MOD CHECK.MOV.ST      
   REVERSE@ = IF 4 + 8 MOD THEN         
   ROBOT.SQUARE @ NEXT.SQUARE ;         
                                        
 VAR EXPLODED  (  AS THERE EXPLOSION?)  
 : BOOM ( ---^HIT A BOMB, END GAME)     
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
: ?BOOM ( OBJECT --- OBJECT)            
 0 EXPLODED !                           
 DUP BOMB@ = IF BOOM THEN ;             
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 45/215 ----------- :)
( GOTO.NEXT.ROOM)                       
                                        
: GOTO.NEXT.ROOM ( SQ#---NEXTROOM SQ#)  
 ERASE.ROBOT  ( FROM LAST ROOM)         
 0 ROBOT.SQUARE @ 0 DO                  
   I SQUARE.OBJECT DOOR@ = IF 1+ THEN   
 LOOP                                   
 DUP 8 +  ( NEXT ROOM/NEXT SQ^ )        
 ROOM.DATA( SQUARE.COUNT@ + + C@        
 ROBOT.SQUARE !                         
 ( GET NEXT DOOR SQ FROM AND STORE)     
 ROOM.DATA( SQUARE.COUNT@ + + C@        
 LOAD.ROOM                              
 ( LOAD NEXT ROOM#)                     
 INIT.CW.GRAPHICS                       
 DRAW.GAMEBOARD  CW.INIT                
 DROP CALC.ROBOT.MOVE ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 46/216 ----------- :)
 ( CHECK.FOR.NEXT.ROOM)                 
                                        
: CHECK.FOR.NEXT.ROOM ( NEXTSQ--NEXTSQ) 
 ROBOT.SQUARE @ SQUARE.OBJECT DOOR@ =   
 IF ROBOT.SQUARE @    ( NXT/ROB)        
  DUP 0 7 WITHIN                        
  IF DROP DUP 0<      ( NXT/FLAG)       
  ELSE                ( NXT/ROB)        
   DUP 8 55 WITHIN ( EAST OR WEST)      
   IF SQUARES.WIDE@   ( NXT/ROB/WD)     
     MOD 0=           ( NXT/FLAG)       
     IF ( WEST)                         
       DUP SQUARES.WIDE@ MOD            
       SQUARES.WIDE@ 1- =  ( NXT/FLAG)  
     ELSE DUP SQUARES.WIDE@ MOD 0=      
     THEN   ( NXT/FLAG)                 
   ELSE DROP   ( SOUTH) ( NXT)          
     DUP SQUARE.COUNT@ 1- > ( NXT/FLG)  
   THEN                                 
  THEN                                  
  IF GOTO.NEXT.ROOM THEN                
THEN ;                                  
                                        
                                        
                                        
                        

( ----------- Screen 47/217 ----------- :)
( BUMP)                                 
                                        
: BUMP ( OBJ #MOVES---OBJ)              
  INIT.CW.GRAPHICS ( ???)               
  ARG.BYTE C@ 64 MOD CHECK.MOV.ST       
  FORWARD@ =                            
  IF 0 DO CW.SLIDE LOOP                 
  ELSE 0 DO CW.BACK.SLIDE LOOP THEN     
  BUMP.SOUND                            
  DUP DUP BOUNCER@ = SWAP CREEP@ = OR   
  IF 5 FLASH.CW 50 UPDATE.DAMAGE THEN   
  ( SHAKE THE SCREEN)                   
  50 UPDATE.DAMAGE ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 48/218 ----------- :)
( MOVE)                                 
: WT ( #---) 40 * 0 DO LOOP ;           
: MOVE ( ---)                           
  CALC.ROBOT.MOVE CHECK.FOR.NEXT.ROOM   
  DUP SQUARE.OBJECT DUP FLOOR@ =        
  SWAP DOOR@ = OR                       
  IF   ( OK TO MOVE)                    
    INIT.CW.GRAPHICS ( ???)             
    ARG.BYTE C@ 64 MOD CHECK.MOV.ST     
    FORWARD@ =                          
    IF 8 0 DO CW.SLIDE 1 WT  LOOP       
    ELSE 8 0 DO CW.BACK.SLIDE 1 WT LOOP 
    THEN                                
    ROBOT.SQUARE !                      
  ELSE  ( HIT SOMETHING)                
    SQUARE.OBJECT DUP WALL@ =           
    IF 1 BUMP DROP                      
    ELSE 5 BUMP ?BOOM DROP THEN         
  THEN  ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 49/219 ----------- :)
 (  MOVE-ROBOT)                         
                                        
: MOVE.ROBOT ( ---)                     
 ARG.BYTE C@ 64 MOD                     
 CHECK.MOV.ST DUP MOV.EMPTY@ = NOT      
 IF DUP FORWARD@ <                      
   IF ( ROTATION ARG)                   
    TURN.RIGHT@ = IF 1 ELSE -1 THEN     
    ROBOT.ORIENTATION @ + 8 +MOD        
    MOVE.SOUND CW.POINT MOVE.SOUND      
   ELSE DROP MOVE                       
   THEN                                 
   EXPLODED @ NOT                       
   IF DRAW.ROBOT MOVE.SOUND THEN        
 ELSE DROP THEN ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 50/220 ----------- :)
( SIGHTLINE DESTROY)                    
                                        
: SIGHTLINE ( SQ#--)                    
  DROP ;                                
                                        
                                        
                                        
                                        
 : DESTROY ( SQ#---)                    
   DUP ROOM.DATA( + FLOOR@ SWAP C!      
   ( PUT FLOOR IN ROOM.DATA( )          
   DEBUG? NOT                           
   IF SQUARE.XTYT FLOOR@ 4 - 7 *        
     OBJ.BLOCK( + OBJ.                  
   ELSE DROP THEN ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 51/221 ----------- :)
( ZAPPER RETRACT.ZAPPER )               
                                        
: ZAPPER  ( ---)  S2 OFF S-ENABLE       
  185 S-POINTER                         
  ROBOT.SQUARE @ SQUARE.XY              
  31 -  ( Y UP OFFSET)                  
  SWAP 2 - SWAP S-POSITION              
  WHITE S-COLOR                         
  0 S-PRIORITY 0 S-MULTI                
  0 S-YEXP 0 S-XEXP                     
  255 53269 FRAME C! ;                  
                                        
                                        
                                        
: RETRACT.ZAPPER ( ---)                 
  253 53269 C! ;                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 52/222 ----------- :)
( ZAP.RAY)                              
                                        
: ZAP.RAY  ( TARG SQ#---)               
  DUP ROBOT.SQUARE @ SQUARES.WIDE@ -    
  = NOT  ( NOT UNDER HEAD)              
  IF                                    
    DROP  ( DRAW RAY)                   
  ELSE DROP THEN                        
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 53/223 ----------- :)
( EAT.IT ZAP.IT)                        
: EAT.IT ( SQ#---)                      
  DUP SQUARE.OBJECT                     
  CASE PIE@ OF 1200 UPDATE.FUEL ;;      
    COFFEE@ OF 1200 UPDATE.FUEL ;;      
    OIL@ OF SCENARIO.PLAY(              
      ADVENTURE.COUNT@ 5 * +            
      ADVENTURE @ 1- + C@ ADD.POINTS ;; 
   DISK@ OF SCENARIO.PLAY(              
      ADVENTURE.COUNT@ 7 * +            
      ADVENTURE @ 1- + C@ ADD.POINTS ;; 
  ENDCASE  DESTROY ;                    
: ?PEACE ADVENTURE @ 4 =                
   IF NEGATE THEN ;                     
: ZAP.IT ( SQ#--) DUP SQUARE.OBJECT     
  CASE CREEP@ OF SCENARIO.PLAY(         
     ADVENTURE.COUNT@ + ADVENTURE @ 1-  
     + C@ ?PEACE ADD.POINTS ;;          
     BOUNCER@ OF SCENARIO.PLAY(         
     ADVENTURE.COUNT@ 3 * + ADVENTURE @ 
     1- + C@ ?PEACE ADD.POINTS          
     0 BOUNCERS ! ;;                    
   BOMB@ OF RETRACT.ZAPPER BOOM ;;      
  ENDCASE EXPLODED @ NOT                
  IF DESTROY ELSE DROP THEN ;           
                        

( ----------- Screen 54/224 ----------- :)
( ZAP)                                  
                                        
: ZAP ( ---) ROBOT.ORIENTATION @        
 ROBOT.SQUARE @                         
 NEXT.SQUARE CHECK.FOR.NEXT.ROOM DROP   
 ROBOT.SQUARE @                         
 8 0 DO                                 
  ROBOT.ORIENTATION @ SWAP NEXT.SQUARE  
  DUP SQUARE.OBJECT   ( TSQ#/OBJ#)      
  DUP FLOOR@ =                          
  IF DROP ( JUST FLOOR)                 
  ELSE ZAPPER  10 WAIT                  
    OVER ZAP.RAY ZAP.SOUND              
    DUP WALL@ = SWAP DOOR@ = OR         
    IF DUP ZAP.RAY                      
    ELSE DUP DUP ZAP.RAY ZAP.IT         
    THEN                                
    RETRACT.ZAPPER  ( ???)  LEAVE       
  THEN                                  
 LOOP DROP ;                            
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 55/225 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 56/226 ----------- :)
 ( MOVE.ARM  ARM.PREP)                  
: ARM.PREP (  ---^GET READY FOR ARM)    
  S2 OFF S-ENABLE WHITE S-COLOR         
  OFF S-MULTI OFF S-XEXP                
  ON S-YEXP 0 S-PRIORITY ;              
                                        
: ARM.XY ( ORIENTATION---SPRITE OFFX/Y) 
  2 * ARM.PT( + @ SPLIT  ROBOT.SQUARE @ 
  SQUARE.XY 15 - SWAP 10 +              
 ( HEAD OFFSET) ( ARM.X/Y/HEADOFFY/X)   
  4 ROLL - ROT ROT SWAP - ;             
: MOVE.ARM ( ARM#--)  S2                
  DUP 0 = IF N ARM.XY S-POSITION        
  194 S-POINTER ON S-ENABLE DROP        
  ELSE 1- 192 + ROBOT.ORIENTATION @     
    2 * + ROBOT.ORIENTATION @ ARM.XY    
    ON                                  
    FRAME                               
    S-ENABLE S-POSITION  S-POINTER      
  THEN ;                                
: ARM.OUT ( ---) ARM.PREP               
   3 0 DO I MOVE.ARM 5  WAIT LOOP ;     
: ARM.IN ( ---)                         
 -1 2 DO I MOVE.ARM 2  WAIT -1 +LOOP    
 ARM.PREP ;                             
                        

( ----------- Screen 57/227 ----------- :)
( SING)                                 
                                        
: SING ( ---)                           
       ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 58/228 ----------- :)
( PICK.UP ACT.ON.WORLD)                 
: PICK.UP ( ---)                        
 ROB.OR.SQ@                             
 NEXT.SQUARE CHECK.FOR.NEXT.ROOM        
 ARM.OUT CW.OP.MOUTH                    
 DUP SQUARE.OBJECT ?BOOM                
 DUP DUP WALL@ = SWAP CREEP@ = OR       
 SWAP BOUNCER@ = OR                     
 IF SQUARE.OBJECT WALL@ =               
  IF BUMP.SOUND 50 UPDATE.DAMAGE        
  ELSE 5 FLASH.CW 150 UPDATE.DAMAGE     
  ARM.IN THEN                           
 ELSE DUP SQUARE.OBJECT                 
  DUP DUP FLOOR@ = SWAP DOOR@ = OR      
  SWAP BOMB@ = OR NOT                   
  IF EAT.IT  ARM.IN                     
    5 0 DO CRUNCH 0 0 CW.ANIM           
    3 WT CRUNCH CW.OP.MOUTH LOOP        
    CRUNCH 0 0 CW.ANIM                  
 ELSE DROP ARM.IN THEN THEN ;           
: ACT.ON.WORLD ( OPCODE ---)            
  CASE QRAY@ OF ZAP ;;                  
SING@ OF SING ;; PICK.UP@ OF PICK.UP ;; 
MOVE@ OF GET.ARG MOVE.ROBOT ;;          
ENDCASE ;                               
                        

( ----------- Screen 59/229 ----------- :)
 ( FEEL.FOR)                            
                                        
 : FEEL.FOR ( OBJECT ---)               
 ROB.OR.SQ@                             
 NEXT.SQUARE CHECK.FOR.NEXT.ROOM        
 ARM.PREP BLACK  S-COLOR                
 2 MOVE.ARM  8 WAIT                     
 SQUARE.OBJECT ?BOOM                    
 = NOT  ( DON'T FEEL IT)                
 IF FALSE.FLOW THEN                     
 S2 OFF S-ENABLE ;                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 60/230 ----------- :)
( LOOK.FOR)                             
VAR SEEN                                
: LOOK.FOR ( OBJECT---) OFF SEEN !      
 ROB.OR.SQ@                             
 2DUP NEXT.SQUARE CHECK.FOR.NEXT.ROOM   
 DROP                                   
 6 0 DO  ( SEARCH LOOP)                 
   2DUP NEXT.SQUARE SWAP DROP           
   DUP SQUARE.OBJECT DUP                
   FLOOR@ = IF DROP ( JUST FLOOR)       
     ELSE OVER SIGHTLINE 4 PICK =       
   IF  ( SEARCH OBJECT SEEN)            
     ON SEEN !                          
     I 1+ UPDATE.RANGE ( SQS TO OBJ)    
     SEE.SOUND THEN LEAVE               
   THEN                                 
 LOOP                                   
 SEEN @ 0= IF FALSE.FLOW THEN           
 ( CORRECT OBJECT NOT SEEN)             
 DROP 2DROP ;                           
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 61/231 ----------- :)
( SMELL.FOR DETECT.&.BRANCH )           
                                        
: SMELL.FOR ( OBJECT---)                
  FALSE.FLOW  ( ASSUME FALSE)           
  SQUARE.COUNT@ 0 DO                    
    DUP I SQUARE.OBJECT =               
 ( COMPARE SEARCH ITEM W SQUARE IT)     
    IF THIS.CHIP 2* ROBOT.PROGRAM +     
     C@ 192 AND FLOW.CODE !             
     ( TRUE.FLOW)                       
     LEAVE THEN                         
  LOOP DROP ;                           
                                        
: DETECT.&.BRANCH ( OPCODE---)          
 ARG.BYTE C@ 64 MOD CHECK.OBJ.ST        
 DUP OBJ.EMPTY@ = NOT                   
 IF SWAP                                
  CASE FEEL.FOR@ OF FEEL.FOR ;;         
       LOOK.FOR@ OF LOOK.FOR ;;         
      SMELL.FOR@ OF SMELL.FOR ;;        
  ENDCASE                               
 ELSE 2DROP FALSE.FLOW THEN ;           
                                        
                                        
                                        
                        

( ----------- Screen 62/232 ----------- :)
( KEYPRESS UPDATE.KEY)                  
                                        
: KEYPRESS ( ---)                       
 KEY.PRESSED @ ARG.BYTE C@ 64 MOD       
 =  ( KEY TEST = LAST PRESSED?)         
 IF ( RIGHT KEY)                        
   NO.KEY@ KEY.PRESSED !                
 ELSE FALSE.FLOW THEN ;                 
                                        
                                        
: UPDATE.KEY ( ASC ---)                 
( UPDATES AND DISPLAYS KEY PRESSED)     
DUP 96 > ( LOWER CASE?)                 
IF 32 - THEN                            
DUP DUP 64 < SWAP 90 > OR               
IF DROP NO.KEY@ 64 + THEN 64 -          
  ( ONLY ALPHA)                         
37 4 D-POSITION                         
DUP NO.KEY@ = IF ." !"                  
0 197  C!  ( RESET KBRD)                
ELSE DUP 64 + EMIT THEN                 
KEY.PRESSED ! ;                         
                                        
                                        
                                        
                        

( ----------- Screen 63/233 ----------- :)
( FLIP.COIN SPECIAL)                    
                                        
: FLIP.COIN ( ---)                      
  2 IRND 0=                             
  IF FALSE.FLOW THEN ;                  
                                        
: SPECIAL ( OPCODE---)                  
 CASE FLIP.COIN@ OF FLIP.COIN ;;        
    KEYPRESS@ OF KEYPRESS ;;            
 ENDCASE ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 64/234 ----------- :)
( SUBPANEL BOOMERANG)                   
                                        
: FUDGE -1 CURRENT.INSTRUCTION !        
  RIGHT.F@ FLOW.CODE ! ;                
VAR RETURN^                             
                                        
: SUBPANEL ( ---)                       
 CURRENT.INSTRUCTION @ RETURN^ !        
 ARG.BYTE C@ 64 MOD                     
 CURRENT.PANEL !                        
 0 CURRENT.INSTRUCTION !                
 ;                                      
                                        
: BOOMERANG ( ---)                      
 0 CURRENT.PANEL !                      
 RETURN^ @ CURRENT.INSTRUCTION !        
 ROBOT.PROGRAM THIS.CHIP 2* +           
 C@ 192 AND FLOW.CODE !                 
  ( NEW.FLOW)                           
 ;                                      
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 65/235 ----------- :)
( GOTO)                                 
                                        
: GOTO ( OP.CODE---)                    
 GET.ARG                                
 CASE                                   
   GO.MARKER@ OF NO.KEY@ UPDATE.KEY     
   28 4 D-POSITION CURRENT.PANEL @      
   ."  " 64 + EMIT ;;                   
   SUBPANEL@ OF SUBPANEL ;;             
   BOOMERANG@ OF BOOMERANG ;;           
 ENDCASE ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 66/236 ----------- :)
( CALC.NEXT.INSTRUCTION)                
: CHIP#.  ( ---^PRINTS CHIP #)          
  CURRENT.INSTRUCTION @                 
  DUP 8 / 10 * SWAP 8 MOD +             
  ."  " 32 4 D-POSITION . ." " ;        
                                        
: CALC.NEXT.INSTRUCTION ( ---)          
 OP.BYTE C@ DUP GOTO.GO@ = SWAP         
 SOCKET@ = OR IF 0 ( JUMP TO 0)         
 ELSE                                   
   CURRENT.INSTRUCTION @                
   FLOW.CODE @                          
   CASE                                 
       UP.F@ OF CHIPS.WIDE@ - ;;        
     DOWN.F@ OF CHIPS.WIDE@ + ;;        
     LEFT.F@ OF 1- ;;                   
    RIGHT.F@ OF 1+ ;;                   
   ENDCASE                              
 THEN                                   
 CURRENT.INSTRUCTION !                  
 CHIP#. ;                               
                                        
                                        
                                        
                                        
                        

( ----------- Screen 67/237 ----------- :)
( GROUP( )                              
( ARRAY THAT GROUPS OPS BY FUNCTION)    
CREATE GROUP(                           
 GOTO'S C, GOTO'S C, GOTO'S C,          
 GOTO'S C, GOTO'S C,                    
                                        
 ACT.ON.WORLD'S C,  ACT.ON.WORLD'S C,   
 ACT.ON.WORLD'S C,  ACT.ON.WORLD'S C,   
                                        
 DETECT'S C, DETECT'S C, DETECT'S C,    
                                        
 SPECIAL'S C, SPECIAL'S C,              
                                        
 STACK'S C, STACK'S C, STACK'S C,       
 STACK'S C, STACK'S C, STACK'S C,       
 STACK'S C, STACK'S C, STACK'S C,       
 STACK'S C,                             
                                        
 SOCKET'S C,                            
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 68/238 ----------- :)
( EXECUTE.ROBOT.INSTRUCTION)            
                                        
: EXECUTE.ROBOT.INSTRUCTION ( --)       
 PROG.STATUS @ DUP GAME.ON@ =           
 SWAP SERIES@ = OR                      
 IF ?TERMINAL DUP                       
  IF UPDATE.KEY ELSE DROP THEN          
  GET.ACTION                            
  DUP CYCLES( + C@ NEGATE COUNT.CYCLE   
  DUP FUEL( + C@ NEGATE UPDATE.FUEL     
  DUP GROUP( + C@  ( GET OP GROUP)      
  CASE                                  
    GOTO'S OF GOTO ;;                   
    ACT.ON.WORLD'S OF ACT.ON.WORLD ;;   
    DETECT'S OF                         
       GET.ARG DETECT.&.BRANCH ;;       
    SPECIAL'S OF                        
       GET.ARG SPECIAL ;;               
    STACK'S OF GET.ARG STACKER ;;       
    SOCKET'S OF DROP ;;                 
  ENDCASE                               
  CALC.NEXT.INSTRUCTION                 
 THEN ;                                 
                                        
                                        
                        

( ----------- Screen 69/239 ----------- :)
( INIT.GAME)                            
                                        
: INIT.GAME ( ---)                      
  GAME.CHAR                             
                                        
  CW.INIT                               
  0. POINTS D!                          
  0 CURRENT.INSTRUCTION !               
  0 CURRENT.PANEL !                     
  0 EXPLODED !                          
  0 DAMAGE.REG ! 6999 FUEL.REG !        
  CLEAR.ROOMS(                          
  CYCLE( ADVENTURE @ 1- 2* + @          
  CYCLE.CT !                            
  ADVENTURE @ 1- ROOM.CT( + C@ IRND     
  1 + LOAD.ROOM                         
  BEGIN SQUARE.COUNT@ IRND DUP          
   ROBOT.SQUARE ! SQUARE.OBJECT         
   FLOOR@ = UNTIL ( RANDOM START)       
 8 IRND  CW.POINT                       
 ADVENTURE @ 7 = IF                     
   17 ROBOT.SQUARE !                    
   E CW.POINT                           
   PIE@ ROOM.DATA( 45 + C! THEN         
   INIT.CW.GRAPHICS  ;                  
                        

( ----------- Screen 70/240 ----------- :)
 ( START.GAME STOP.GAME )               
$CONSTANT G.ON$ "START MISSION"         
$CONSTANT G.OFF$ "END MISSION"          
$CONSTANT SE$ "SERIES"                  
$CONSTANT LM$ "LAST MISSION"            
: LEAVE.GAME ( ---)                     
   1 G.ON$ GAMES$ GAMES( SET.ITEM$      
   2 OFF GAMES( ITEM.ENABLE             
   2 SE$ GAMES$ GAMES( SET.ITEM$ ;      
 : START.GAME ( ---)                    
  1 G.OFF$ GAMES$ GAMES( SET.ITEM$      
   SCREEN.OFF  INIT.GAME                
   SETUP.GAME.SCREEN                    
   GM.BORD.COL@ BORDER  CHIP#.          
   0 UPDATE.DAMAGE  0 UPDATE.RANGE      
   0 ADD.POINTS  0 COUNT.CYCLE          
   0 UPDATE.FUEL  CLEAR.STACKS          
   SCREEN.ON                            
   DRAW.GAMEBOARD                       
   PROG.STATUS @ SERIES@ =              
   NOT IF GAME.ON@ PROG.STATUS ! THEN ; 
 : STOP.GAME ( ---)                     
   PROG.STATUS @ SERIES@ = NOT IF       
     GAME.OFF@ PROG.STATUS ! THEN ;     
                                        
                        

( ----------- Screen 71/241 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 72/242 ----------- :)
  ( GAME)                               
: GAME ( ---)                           
                                        
  BEGIN                                 
   DO.EVENTS                            
   MOVE.BADDIES                         
   GAME.STATUS @ DEBUG.ON@ =            
   IF ( SHOW.DEBUG ) THEN               
   EXECUTE.ROBOT.INSTRUCTION            
 ( 0 22 D-POSITION .S)                  
  PROG.STATUS @ GAME.ON@ = NOT UNTIL    
  UPDATE.STATS STATS.SCREEN             
  LEAVE.GAME ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 73/243 ----------- :)
 ( INIT.CHIPWITS)                       
: INIT.CHIPWITS ( ---)                  
  LT.GRAY BKGND SCREEN.OFF              
  GRAPH.MEM.INIT 0 157 C! ( MSG OFF)    
  BLACK  M.BAK1                         
  LT.BLUE M.BAK2                        
  GRAPH.LOAD  OFF GAME.CHAR? !          
  128 657 C! ( DISABLE SFT/COMM)        
  GAME.OFF@ PROG.STATUS !               
  S4 WHITE S-COLOR                      
  S6 LT.RED S-COLOR                     
  S5 WHITE S-COLOR                      
  S3 GREEN S-COLOR                      
  S7 BLACK S-COLOR                      
  S8 BLACK S-COLOR                      
  I-JOY     7 CHARBASE                  
  READ.LAST CW.NUM @ CW.LOAD            
  ADVENTURE @ AD.M  LOAD.STATS          
  START.GAME                            
  STOP.GAME  LEAVE.GAME                 
  3 OFF WORKSHOP( ITEM.ENABLE           
  ( NO SAVE CHIPWIT)                    
  7 OFF WORKSHOP( ITEM.ENABLE           
  ( NO PASTE PANEL) ;                   
                                        
                        

( ----------- Screen 74/244 ----------- :)
( STAT.POINTS TOO.BAD ENDGAME SERIES)   
: STAT.POINTS                           
  28 23 D-POSITION                      
  BLUE CHAR.COLOR ;                     
: TOO.BAD ( ---^CW DIES)                
  TURN.GAME.OFF@ PROG.STATUS !          
  STAT.POINTS  FUEL.REG @ 1 <           
  IF ." OUT OF FUEL"                    
  ELSE ." DAMAGED"  THEN ;              
: ENDGAME ( ---^GAME OVER NORMALLY)     
  PROG.STATUS @ SERIES@ = NOT IF        
  TURN.GAME.OFF@ PROG.STATUS !          
  THEN STAT.POINTS                      
  ." GAME OVER"       ;                 
: SERIES ( ---)                         
  START.GAME 0 LAST.MISSION !           
  GAME PROG.STATUS @ DUP DUP            
  WORKSHOP.ON@ = SWAP                   
  TURN.GAME.OFF@ = OR SWAP              
  GAME.OFF@ = OR NOT                    
  LAST.MISSION @ NOT AND                
  IF SERIES@ PROG.STATUS !              
  ( MENU STUFF)                         
  1000 0 DO DO.EVENTS LOOP THEN ;       
                                        
                        

( ----------- Screen 75/245 ----------- :)
 ( CHIPWITS )                           
                                        
: CHIPWITS ( ---)                       
  INIT.CHIPWITS                         
  BEGIN 1000 IRND DROP                  
   PROG.STATUS @                        
    CASE GAME.OFF@ OF DO.EVENTS ;;      
         GAME.ON@ OF GAME ;;            
    TURN.GAME.ON@ OF START.GAME ;;      
     ( SERIES@ OF SERIES ;; )           
   TURN.GAME.OFF@ OF STOP.GAME ;;       
    GAME.ABORTED@ OF TOO.BAD ;;         
    GAME.FINISHED@ OF ENDGAME ;;        
     WORKSHOP.ON@ OF WORKSHOP ;;        
     WORKSHOP.OFF@ OF  W.LEAVE          
       GAME.ON@ PROG.STATUS !           
       START.GAME                       
       STOP.GAME ;;                     
    ENDCASE                             
  AGAIN ;                               
                                        
                                        
                                        
                                        
 EXIT                                   
                        

( ----------- Screen 76/246 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 77/247 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 78/248 ----------- :)
( ARM.PT()                              
                                        
: P, SWAP C, C, ;                       
                                        
CREATE ARM.PT(  ( REL XY OF ARM ROOT)   
22 13 P,  ( NW)                         
11 14 P,  ( N)                          
0 13 P,  ( NE)                          
0 4  P,  ( E)                           
0 3  P,  ( SE)                          
11 6  P,  ( S)                          
22 3  P,  ( SW)                         
23 5  P,  ( W)                          
                                        
: OBJ.  ( X/Y/BLOCKARRAY---)            
  3 2 BLOCK. ;                          
: OP.   ( X/Y/BLOCK---)                 
  2 3 BLOCK. ;                          
: ARG.   ( X/Y/BLOCK---)                
  2 2 BLOCK. ;                          
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 79/249 ----------- :)
 ( OBJECT ARRAY BUILDER )               
 VAR CHAR.PT                            
 58  CONSTANT START.OBJ                 
: OBJ(, ( COLOR / OBJ# ---)             
  6 * START.OBJ + DUP CHAR.PT !         
  256 MOD   >R   ( STARTCHAR)           
  C,   R@ C, R@ 1+ C, R@ 2+ C,          
  R@ 3 + C, R@ 4 + C, R> 5 + C, ;       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 80/250 ----------- :)
 ( OBJ.BLOCK(  )                        
                                        
 CREATE OBJ.BLOCK(                      
   YELLOW 8 +  0 OBJ(,  ( PIE)          
   GREEN  8 +  1 OBJ(, ( COFFEE)        
   BLUE   8 +  2 OBJ(, ( DISK)          
   BLUE   8 +  3 OBJ(, ( OIL)           
   WHITE  8 +  4 OBJ(, ( FLOOR)         
   RED    8 +  5 OBJ(, ( BOMB)          
   RED    8 +  6 OBJ(, ( BOUNCER1)      
   PURPLE 8 +  9 OBJ(, ( CREEP1)        
   WHITE  8 + 13 OBJ(, ( WALLTOP)       
   11         15 OBJ(, ( DOOR)          
   WHITE  8 + 14 OBJ(, ( WALLSIDE)      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 81/251 ----------- :)
 ( BOUNCER.BLOCK(  CREEP.BLOCK(  )      
                                        
 CREATE BOUNCER.BLOCK(                  
 RED  8 +  6 OBJ(,  ( B1)               
 RED  8 +  7 OBJ(,  ( B2)               
 RED  8 +  8 OBJ(,  ( B3)               
                                        
                                        
 CREATE CREEP.BLOCK(                    
 PURPLE  8 +  9 OBJ(,  ( C1)            
 PURPLE  8 + 10 OBJ(,  ( C2)            
 PURPLE  8 + 11 OBJ(,  ( C3)            
 PURPLE  8 + 12 OBJ(,  ( C4)            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 82/252 ----------- :)
 ( GAME.CHAR WS.CHAR)                   
 VAR GAME.CHAR?  ( ARE GAME.CHARS ON?)  
 96 8 * CONSTANT L@                     
 63488 58 8 * + CONSTANT S@             
 63488 96 8 * - CONSTANT B@             
 : SWITCH ( --) SWAPOUT                 
 ( MOVES ALTERNATE CHARS INTO SET)      
 S@ 1024 L@ CMOVE                       
 ( INTO BUFFER)                         
 B@ S@ L@ CMOVE                         
 ( ALT INTO SET)                        
 1024 B@ L@ CMOVE                       
 ( SAVE OUT SET) SWAPIN ;               
                                        
 : GAME.CHAR ( ---)                     
   GAME.CHAR? @ NOT IF SWITCH           
     ON GAME.CHAR? ! THEN ;             
 : WS.CHAR ( ---)                       
   GAME.CHAR? @ IF SWITCH               
                                        
                                        
                                        
                                        
                                        
     OFF GAME.CHAR? ! THEN ;            
                        

( ----------- Screen 83/253 ----------- :)
( CW.INIT  CW.POINT <<<<<<<)            
                                        
: CW.INIT  ( ---)  FRAME                
  253 53269 C! ;                        
                                        
  CREATE P( 6 ALLOT                     
: CW.POINT  ( CW ROT 0-7 ---)           
  DUP 7 * 128 +  ( ROT/SPRITE ADDR)     
  DUP P( 1+ C!                          
  2+ DUP P( 3 + C!                      
  1+ DUP P( 2 + C!                      
  1+ DUP P(     C!                      
  1+ DUP P( 4 + C!                      
  1+     P( 5 + C!                      
  FRAME P( 'SCREEN 1018 + 6 CMOVE       
  ROBOT.ORIENTATION ! ( STORE NEW)      
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 84/254 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 85/255 ----------- :)
 ( DUMMY PROGRAM <<<<<<)                
 : P.STUFF ( OP/FLOW/ARG/FLOW/CH#--)    
  CURRENT.INSTRUCTION !                 
  + ROT ROT + SWAP !CHIP ;              
                                        
 : BLANK.PANEL ( ---)                   
   0 CURRENT.PANEL !                    
   CHIP.COUNT@ 0 DO                     
    SOCKET@ RIGHT.F@ 0 0 I P.STUFF      
   LOOP                                 
   GO.MARKER@ RIGHT.F@ 0 0 0 P.STUFF ;  
   BLANK.PANEL                          
   LOOK.FOR@ RIGHT.F@                   
    CREEP@ DOWN.F@ 1 P.STUFF            
   FEEL.FOR@ DOWN.F@                    
    PIE@ RIGHT.F@ 2 P.STUFF             
   MOVE@ LEFT.F@                        
    FORWARD@ 0 3 P.STUFF                
   SING@ RIGHT.F@                       
    NUM5@ 0 9 P.STUFF                   
   WIRE@ DOWN.F@                        
    0 0 10 P.STUFF                      
   GOTO.GO@ 0 0 0 18 P.STUFF            
  FORGET P.STUFF                        
                                        
                        

( ----------- Screen 86/256 ----------- :)
( *** WORKSHOP DATA ****)               
VAR HOT.CHIP                            
VAR WS.OP.BYTE                          
VAR WS.ARG.BYTE                         
VAR WS.TRUE.FLOW                        
VAR WS.FALSE.FLOW                       
VAR PULLER.COM                          
VAR INSERTER.COM                        
VAR GARBAGE.COM                         
VAR WIRE.SELECTED ( 0=NONE 1=T 2=F)     
VAR NEW.CW    ( NEW CW LOADED?)         
62 IS NONE@   ( NO CHIP TOKEN)          
9999 IS NO.CHIP@                        
                                        
VAR CURSOR.COUNT                        
2 IS CURSOR.RATE@                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 87/257 ----------- :)
( WIRE DATA)                            
 138 IS SINGLE.WIRE@                    
 142 IS TRUE.WIRE@                      
 146 IS FALSE.WIRE@                     
 150 IS BLANK.WIRE@                     
 : RECT CREATE 4 ALLOT ;                
 RECT WS.CHIP.RECT                      
 RECT WS.WIRE.RECT                      
 RECT UP.WS   RECT DOWN.WS              
 RECT LEFT.WS  RECT RIGHT.WS            
 RECT PANEL.RECT                        
                                        
: !RECT ( XL/XR/YT/YB/RECTAD---)        
 ( STORES 4 BYTE RECTANGLE)             
 >R                                     
 R@  3 + C! R@ 2 + C!                   
 R@  1+ C!  R> C! ;                     
: @RECT  ( RECTADDR---XL/XR/YT/YB)      
  >R                                    
  R@ C@ R@ 1+ C@ R@ 2 + C@ R> 3 + C@ ;  
: @XY  ( RECTADR ---XL/YT)              
  DUP C@ SWAP 2 + C@ ;                  
1 25 4 24 PANEL.RECT !RECT              
                                        
                                        
                        

( ----------- Screen 88/258 ----------- :)
 ( DEBUG.SCREEN <<<<<<)                 
                                        
 : DEBUG.SCREEN  ( ---)                 
  ( THIS TOGGLES WITH GAME SCREEN)      
 ;                                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 89/259 ----------- :)
( OP.BLOCK( )                           
: #, 1 SWAP DO I  ROLL C, -1 +LOOP  ;   
  CREATE OP.BLOCK(                      
( GO)  VC@ 58 59 60 61 62 63 7 #,       
( LOOP) VC@ 64 65 66 67 68 69 7 #,      
( SUBP) VC@ 70 71 72 73 32 32 7 #,      
( BMR) VC@ 74 75 76 77 78 79 7 #,       
( WIRE) VC@ 80 81 82 83 84 85 7 #,      
( MOV) MC@ 86 87 32 32 32 32 7 #,       
( PICK) VC@ 88 89 90 91 92 93 7 #,      
( ZAP) VC@ 94 95 96 97 98 99 7 #,       
( SNG) NC@ 100 101 32 32 32 32 7 #,     
( FL) OC@ 102 103 32 32 32 32 7 #,      
( LK) OC@ 104 105 32 32 32 32 7 #,      
( SM) OC@ 106 107 32 32 32 32 7 #,      
( F) VC@ 108 109 110 111 112 113 7 #,   
( KE) VC@ 114 115 116 117 32 32 7 #,    
( N=) NC@ 118 119 32 32 32 32 7 #,      
( N<) NC@ 118 122 32 32 32 32 7 #,      
( O=) OC@ 120 119 32 32 32 32 7 #,      
( M=) MC@ 121 119 32 32 32 32 7 #,      
                                        
                                        
                                        
                                        
                        

( ----------- Screen 90/260 ----------- :)
( OP.BLOCK( CONT'D   ARG.BLOCK( )       
                                        
( ^N) NC@ 123 124 32 32 32 32 7 #,      
( ^O) OC@ 123 126 32 32 32 32 7 #,      
( ^M) MC@ 123 125 32 32 32 32 7 #,      
( DR) VC@ 127 128 32 32 32 32 7 #,      
( +) NC@ 32 32 129 130 32 32 7 #,       
( -) NC@ 32 32 131 132 32 32 7 #,       
( SK) MED.GRAY 33 33 33 33 33 33 7 #,   
                                        
CREATE ARG.BLOCK(                       
                                        
( RT) MC@ 154 155 156 157 5 #,          
( LT) MC@ 158 159 160 161 5 #,          
( UP) MC@ 162 163 164 165 5 #,          
( DN) MC@ 166 167 168 169 5 #,          
( PI) OC@ 170 171 172 173 5 #,          
( CF) OC@ 174 175 176 177 5 #,          
( DS) OC@ 178 179 180 181 5 #,          
( OL) OC@ 182 183 184 185 5 #,          
( FL) OC@ 186 187 188 189 5 #,          
( BM) OC@ 190 191 192 193 5 #,          
( BN) OC@ 194 195 196 197 5 #,          
( CR) OC@ 198 199 200 201 5 #,          
                                        
                        

( ----------- Screen 91/261 ----------- :)
 ( ARG.BLOCK( CONT'D)                   
                                        
( WL) OC@ 202 203 204 205 5 #,          
( DR) OC@ 206 207 208 209 5 #,          
                                        
( DR) NC@ 210 211 212 213 5 #,          
( FR) NC@ 214 215 216 217 5 #,          
( RR) NC@ 218 219 220 221 5 #,          
( MS) MC@ 222 223 224 225 5 #,          
( NS) NC@ 226 227 228 229 5 #,          
( OS) OC@ 230 231 232 233 5 #,          
( ME) MC@ 234 235 236 237 5 #,          
( NE) NC@ 234 235 236 237 5 #,          
( OE) OC@ 234 235 236 237 5 #,          
                                        
( N0) NC@ 238 239 240 241 5 #,          
( N1) NC@ 238 239 242 243 5 #,          
( N2) NC@ 238 239 244 245 5 #,          
( N3) NC@ 238 239 246 247 5 #,          
( N4) NC@ 248 249 246 247 5 #,          
( N5) NC@ 250 251 246 247 5 #,          
( N6) NC@ 252 253 246 247 5 #,          
( N7) NC@ 254 255 246 247 5 #,          
                                        
                                        
                        

( ----------- Screen 92/262 ----------- :)
( ACTION.TYPE( )                        
VAR THIS.ACT.TYPE                       
100 IS TS@  101 IS MS@  102 IS ST@      
  ( THING-STACK, MOVE-ST, STACK)        
103 IS T@   104 IS TE@  105 IS M@       
  ( THING, THING-EMPTY,  MOVE)          
106 IS ME@  107 IS N@   108 IS NE@      
  ( MOVE-EMPTY,NUMBER,NUM-EMPTY)        
109 IS S@   110 IS L@   111 IS SB@      
  ( SING, LETTER,SUBPANEL)              
112 IS -@   ( NO ARG)                   
                                        
CREATE ACTION.TYPE( ACTION.COUNT@ ALLOT 
: AT ( OP/TYPE--)                       
  SWAP ACTION.TYPE( + C! ;              
0 -@ AT  1 -@  AT  2 SB@ AT  3 -@ AT    
4 -@ AT  5 MS@ AT  6 -@ AT   7 -@ AT    
8 S@ AT  9 TS@ AT 10 TS@ AT 11 TS@ AT   
12 -@ AT 13 L@ AT 14 NE@ AT 15 NE@ AT   
16 TE@ AT 17 ME@ AT 18 N@ AT 19 T@ AT   
20 M@ AT 21 ST@ AT 22 -@ AT 23 -@ AT    
24 -@ AT                                
                                        
FORGET AT                               
                                        
                        

( ----------- Screen 93/263 ----------- :)
( OK.ACTIONS(  DOUBLE.SIZED?)           
                                        
CREATE OK.ACTIONS( ACTION.COUNT@ ALLOT  
: ACTION.OK?  ( TOKEN ---FLAG)          
  OK.ACTIONS( + C@ ;                    
                                        
: NOT.OK ( ACT.TOKEN--)                 
  OK.ACTIONS( + 0 SWAP C! ;             
                                        
: OK  ( TOK---)                         
  OK.ACTIONS( + 1 SWAP C! ;             
                                        
: DOUBLE.SIZED?  ( OP TOKEN---FLAG)     
  DUP ACTION.TYPE( + C@ -@ =            
  SWAP SUBPANEL@ = OR ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 94/264 ----------- :)
( OP.W.XY(  ARG.W.XY(  <<<)             
                                        
CREATE OP.W.XY( ACTION.COUNT@ 4 * ALLOT 
CREATE ARG.W.XY( THING.COUNT@ 4 * ALLOT 
                                        
: ARFILL ( XL/XR/YT/YB/TOK/ARRAY---)    
  SWAP 4 * +  >R    R@ 3 + C!           
  R@ 2 + C!  R@ 1+ C! R> C! ;           
                                        
                                        
: AF ( X/X/Y/Y/ARGTOK---)               
  ARG.W.XY( ARFILL ;                    
                                        
: BLANK.THING.RECTS ( ---)              
  ARG.W.XY( THING.COUNT@ 4 * 40 FILL ;  
                                        
: OP.W.DRAW ( OPTOK) DUP >R             
  4 * OP.W.XY( + DUP 2 +                
  C@ SWAP C@ SWAP  ( X/Y)               
  R> 7 * OP.BLOCK( + OP. ;              
                                        
: PF ( X/X/Y/Y/OPTOK---)                
  OP.W.XY( ARFILL ;                     
                                        
                                        
                        

( ----------- Screen 95/265 ----------- :)
 ( OP WORK XY ASSIGNMENTS <<<)          
                                        
27 28 5 6 LOOK.FOR@ 29 30 5 6 FEEL.FOR@ 
31 32 5 6 SMELL.FOR@ 34 35 5 6 MOVE@    
37 38 5 6 SING@ PF PF PF PF PF          
                                        
27 28 7 8 ON.MOVE@ 30 31 7 8 ON.OBJECT@ 
33 34 7 7 ON.NUMBER@ 37 38 7 8          
DROP.STACK@                             
33 34 8 8 NUMBER<@ PF PF PF PF PF       
27 28 9 10 MOVE=@ 30 31 9 10 OBJECT=@   
33 34 9 10 NUMBER=@ 35 36 9 10 PLUS@    
37 38 9 10 MINUS@ PF PF PF PF PF        
                                        
27 28 11 13 SUBPANEL@ 30 31 11 13 WIRE@ 
34 35 11 13 KEYPRESS@ 37 38 11 13 QRAY@ 
PF PF PF PF                             
27 28 14 16 GOTO.GO@ 30 31 14 16        
BOOMERANG@ 34 35 14 16 FLIP.COIN@       
37 38 14 16 PICK.UP@ PF PF PF PF        
                                        
FORGET PF                               
                                        
                                        
                                        
                        

( ----------- Screen 96/266 ----------- :)
( SUBP.WD.RECT( <<<<<<)                 
                                        
CREATE SUBP.WS.RECT( 9 4 * ALLOT        
                                        
: SF ( X/X/Y/Y/SUBINDEX---)             
( FILLS SUBPANEL ARRAY)                 
 SUBP.WS.RECT( ARFILL ;                 
                                        
 29 30 19 20 0 SF ( B)                  
 33 34 19 20 1 SF ( C)                  
 37 38 19 20 2 SF ( D)                  
 29 30 21 22 3 SF ( E)                  
 33 34 21 22 4 SF ( F)                  
 37 38 21 22 5 SF ( G)                  
 29 30 23 24 6 SF ( H)                  
 33 34 23 24 7 SF ( I)                  
 37 38 23 24 8 SF ( J)                  
                                        
 ( LETTER SITS IN UPPER LEFT OF)        
 ( 4 CHAR SENSITIVE SQUARE.)            
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 97/267 ----------- :)
( T.FILL TS.FILL TE.FILL <<<)           
: T.FILL ( ---)                         
  BLANK.THING.RECTS                     
  27 28 19 20 PIE@ AF                   
  29 30 19 20 COFFEE@ AF                
  31 32 19 20 CREEP@ AF                 
  33 34 19 20 BOMB@ AF                  
  35 36 19 20 BOUNCER@ AF               
  27 28 22 23 OIL@ AF                   
  29 30 22 23 DISK@ AF                  
  31 32 22 23 WALL@ AF                  
  33 34 22 23 DOOR@ AF                  
  35 36 22 23 FLOOR@ AF ;               
                                        
: TS.FILL ( ---)                        
  T.FILL 37 38 20 21 OBJ.STACK@ AF ;    
                                        
: TE.FILL ( ---)                        
  T.FILL 37 38 21 21 OBJ.EMPTY@ AF ;    
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 98/268 ----------- :)
( M.FILL MS.FILL ME.FILL ST.FILL <<)    
                                        
: M.FILL ( --)                          
  BLANK.THING.RECTS                     
  28 29 19 20 FORWARD@ AF               
  31 32 19 20 REVERSE@ AF               
  28 29 22 23 TURN.RIGHT@ AF            
  31 32 22 23 TURN.LEFT@ AF             
;                                       
                                        
: MS.FILL ( ---)                        
 M.FILL 36 37 20 21 MOV.STACK@ AF ;     
                                        
: ME.FILL ( --)                         
 M.FILL 36 37 20 21 MOV.EMPTY@ AF ;     
                                        
: ST.FILL ( --)   BLANK.THING.RECTS     
 28 29 20 21 MOV.STACK@ AF              
 32 33 20 21 NUM.STACK@ AF              
 36 37 20 21 OBJ.STACK@ AF ;            
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 99/269 ----------- :)
( N.FILL NE.FILL S.FILL <<<<<)          
                                        
: N.FILL ( ---)                         
 BLANK.THING.RECTS                      
 27 28 19 20 NUM0@ AF                   
 29 30 19 20 NUM1@ AF                   
 31 32 19 20 NUM2@ AF                   
 33 34 19 20 NUM3@ AF                   
 36 37 19 20 DAMAGE.REG@ AF             
 38 39 19 20 FUEL.REG@ AF               
 27 28 22 23 NUM4@ AF                   
 29 30 22 23 NUM5@ AF                   
 31 32 22 23 NUM6@ AF                   
 33 34 22 23 NUM7@ AF                   
 36 37 22 23 RANGE.REG@ AF ;            
                                        
: NE.FILL ( --)                         
 N.FILL 38 39 22 23 NUM.EMPTY@ AF ;     
                                        
: S.FILL ( --)                          
 N.FILL 38 39 22 23 NUM.STACK@ AF ;     
                                        
                                        
                                        
                                        
                        

( ----------- Screen 100/270 ----------- :)
 ( CEMIT DRAW.ACTION  DRAW.LETTER<<< )  
                                        
: CEMIT  ( X/Y/COLOR/SCREENCODE)        
  >R >R 40 * +                          
  R> OVER COLOR-MEM + C!                
  'SCREEN + R> SWAP C! ;                
                                        
: DRAW.ACTION ( TOK/X/Y--TOK/X/Y )      
  2DUP  5 PICK 7 * OP.BLOCK( +          
  OP. ;                                 
                                        
                                        
: DRAW.LETTER  ( X/Y/ASC---)            
  BLACK CHAR.COLOR                      
  >R D-POSITION R>                      
  DUP 64 - 27 = IF                      
   ." !" DROP ELSE EMIT THEN ;          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 101/271 ----------- :)
( DRAW.A.THING   O.D.)                  
                                        
: DRAW.A.THING  ( TOK/X/Y---TOK/X/Y)    
  3 PICK DUP DUP                        
  DOUBLE.SIZED? SWAP KEYPRESS@ = OR     
  IF DUP SUBPANEL@ =                    
    SWAP KEYPRESS@ = OR                 
    IF 2DUP 2 + SWAP 1+ SWAP            
      GET.ARG.ASC 6 PICK                
      SUBPANEL@ = IF 1+ THEN            
      DRAW.LETTER THEN                  
  ELSE   DROP 2DUP  1 +                 
    ARG.BYTE C@ 64 MOD 5 * ARG.BLOCK( + 
    ARG.                                
  THEN ;                                
                                        
: O.D.   ( X/Y/ARG---)                  
  ( OBJECT DRAW)                        
  5 * ARG.BLOCK( + ARG. ;               
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 102/272 ----------- :)
( INVERT.CHIP<<<<<<< WIRE.XY)           
                                        
: INVERT.CHIP ( CHIP#---)               
 DROP ;                                 
                                        
VAR WIRE.OFF ( CHAR OFFSET OF FLOW)     
: WIRE.XY ( CHIP X/Y--WIRE X/Y)         
  FLOW.CODE @ DUP 64 / WIRE.OFF !       
  CASE UP.F@ OF 1- SWAP 1+ SWAP ;;      
    DOWN.F@ OF 3 + ;;                   
    LEFT.F@ OF SWAP 1- SWAP ;;          
   RIGHT.F@ OF 2 + SWAP 2 + SWAP ;;     
  ENDCASE ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 103/273 ----------- :)
( WIRE.IT BRANCHER? DRAW.WIRE<<<< )     
 VAR WIRE.TYPE  ( T/FALSE/SINGLE)       
                                        
: WIRE.IT ( X/Y--)                      
   WS.BACK.COL@ WIRE.OFF @              
   WIRE.TYPE @ + CEMIT ;                
                                        
: BRANCHER? ( OPCODE---FLAG)            
  DUP SING@ > SWAP ON.NUMBER@ < AND ;   
: DRAW.WIRE ( TOK/X/Y---)               
 SINGLE.WIRE@ WIRE.TYPE !               
 3 PICK DUP DUP GOTO.GO@ = SWAP         
  BOOMERANG@ = OR SWAP                  
   SOCKET@ = OR NOT                     
 IF  ( DRAW SOME WIRE)                  
   2DUP WIRE.XY    ( TOK/X/Y/TX/TY)     
   5 ROLL BRANCHER?                     
   IF TRUE.WIRE@ WIRE.TYPE !            
     WIRE.IT                            
     FALSE.FLOW  2DUP WIRE.XY           
     FALSE.WIRE@ WIRE.TYPE !            
     WIRE.IT                            
   ELSE WIRE.IT THEN                    
ELSE DROP THEN  DROP DROP ;             
                                        
                        

( ----------- Screen 104/274 ----------- :)
 ( CHIP.DRAW)                           
                                        
 : CHIP.DRAW  ( CHIP#--)                
   DUP CHIPS.WIDE@ MOD 3 * 2+ ( X)      
   SWAP CHIPS.WIDE@ / 4 * 4 + ( Y)      
   GET.ACTION ROT ROT                   
   DRAW.ACTION                          
   GET.ARG DRAW.A.THING                 
   DRAW.WIRE    ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 105/275 ----------- :)
 ( NEW.WS PANEL.DRAW )                  
                                        
: NEW.WS ( ---^REFRESH WORKSCREEN)      
 FIRST 2000 + 'SCREEN 1000 CMOVE        
 FIRST 3000 + COLOR-MEM 1000 CMOVE ;    
                                        
                                        
 : PANEL.DRAW  ( PAN#---)               
   DUP 0= IF SUBPANEL@ OK               
    BOOMERANG@ NOT.OK                   
   ELSE SUBPANEL@ NOT.OK                
    BOOMERANG@ OK THEN                  
   CURRENT.PANEL !                      
   NEW.WS                               
   CHIP.COUNT@ 0 DO                     
     I CURRENT.INSTRUCTION !            
     I CHIP.DRAW                        
   LOOP                                 
   HOT.CHIP @ CURRENT.INSTRUCTION ! ;   
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 106/276 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 107/277 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 108/278 ----------- :)
( SETUP.LEGAL.ARGS)                     
                                        
: SETUP.LEGAL.ARGS ( TYPE---)           
  CASE                                  
   T@ OF T.FILL ;;                      
   TE@ OF TE.FILL ;;                    
   TS@ OF TS.FILL ;;                    
   M@ OF M.FILL ;;                      
   ME@ OF ME.FILL ;;                    
   MS@ OF MS.FILL ;;                    
   N@ OF N.FILL ;;                      
   NE@ OF NE.FILL ;;                    
   S@ OF S.FILL ;;                      
   ST@ OF ST.FILL ;;                    
  ENDCASE ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 109/279 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 110/280 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 111/281 ----------- :)
( WS.ACTION.ICONS)                      
                                        
: WS.ACTION.ICONS ( ---)                
  ( DRAW BOOMERANG OR SUBP IN WHITE)    
 ( WHEN NOT OK)                         
 ( USE OP.W.DRAW) ;                     
                                        
                                        
                                        
                                        
: WS.THING.ICONS ( TYPE---)             
  26 18 39 24 LT.GRAY COLOR.BLOCK       
  DUP -@ = IF DROP BLANK.THING.RECTS    
  ELSE                                  
   SETUP.LEGAL.ARGS                     
   THING.COUNT@ 0 DO                    
    ARG.W.XY( I 4 * +                   
    DUP C@ 40 = NOT                     
    IF @XY  ( GET X/Y FROM RECT)        
      I  O.D.                           
    ELSE DROP THEN                      
   LOOP                                 
  THEN ;                                
EXIT                                    
                                        
                        

( ----------- Screen 112/282 ----------- :)
 EXIT                                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 113/283 ----------- :)
( WIRE.OK?  ERASE.BLANK.W.. BUT.XY@)    
                                        
 : WIRE.OK? ( FLOW.CODE---FLAG)         
   CURRENT.INSTRUCTION @ SWAP           
   CASE                                 
    UP.F@ OF CHIPS.WIDE@ < NOT ;;       
  DOWN.F@ OF CHIP.COUNT@                
       CHIPS.WIDE@ - < ;;               
  LEFT.F@ OF CHIPS.WIDE@ MOD 0= NOT ;;  
 RIGHT.F@ OF 1+ CHIPS.WIDE@             
       MOD 0= NOT ;;                    
ENDCASE ;                               
: BLIP ( X/Y---^ERASE WIRE)             
  DK.GRAY CHAR.COLOR                    
  D-POSITION ." !" ;                    
: ERASE.BLANK.WIRES ( ---)              
  WS.CHIP.RECT @XY                      
  2DUP SWAP  1+ SWAP  1 - BLIP ( UP)    
  2DUP             3 + BLIP  ( DOWN)    
  2DUP SWAP 1 - SWAP BLIP   ( LEFT)     
  SWAP 2 + SWAP 2 +  BLIP ( RT)         
  ;                                     
                                        
                                        
                                        
                        

( ----------- Screen 114/284 ----------- :)
( ERASE.WS.CHIP BLANK.WS.CHIP WS.NAME)  
                                        
: ERASE.WS.CHIP ( ---)  SOCKET@         
  WS.CHIP.RECT @XY                      
  DRAW.ACTION DROP DROP DROP ;          
                                        
: BL.WR ( FLOW.CODE ---)                
  WS.CHIP.RECT @XY ROT                  
  CASE                                  
    UP.F@ OF 1- SWAP 1+ SWAP 150 ;;     
  DOWN.F@ OF 3 +  151 ;;                
  LEFT.F@ OF SWAP 1- SWAP 152 ;;        
 RIGHT.F@ OF 2 + SWAP 2 + SWAP 153 ;;   
  ENDCASE  WS.BACK.COL@ SWAP CEMIT ;    
                                        
 : BLANK.WS.CHIP ( ---)                 
  ERASE.WS.CHIP                         
  UP.F@ WIRE.OK? IF UP.F@ BL.WR THEN    
DOWN.F@ WIRE.OK? IF DOWN.F@ BL.WR THEN  
LEFT.F@ WIRE.OK? IF LEFT.F@ BL.WR THEN  
RIGHT.F@ WIRE.OK? IF RIGHT.F@ BL.WR THEN
 ;                                      
                                        
                                        
                                        
                        

( ----------- Screen 115/285 ----------- :)
 ( UPDATE.WS.CHIP PANEL.HILIGHT)        
 : UPDATE.WS.CHIP ( ---)                
  WS.OP.BYTE C@                         
  DUP DUP BOOMERANG@ = NOT              
  SWAP GOTO.GO@ = NOT AND               
  IF BLANK.WS.CHIP                      
  ELSE ERASE.BLANK.WIRES THEN           
  DUP NONE@ = NOT  IF WS.CHIP.RECT      
   @XY DRAW.ACTION 2DROP THEN           
  WS.ARG.BYTE C@                        
  NONE@ = NOT IF WS.CHIP.RECT @XY       
    DRAW.A.THING 2DROP THEN             
  DUP NONE@ = NOT IF WS.CHIP.RECT @XY   
    DRAW.WIRE                           
  ELSE DROP THEN ;                      
: PANEL.HILIGHT ( ---)                  
  ( CW.NAME$ ) DK.GRAY CHAR.COLOR       
  0 2 D-POSITION ." PANEL"              
  MED.GRAY CHAR.COLOR                   
  75 65 DO  ( A-J)                      
    CURRENT.PANEL @ I 65 - =            
    IF DK.GRAY CHAR.COLOR THEN          
    I 65 - 2* 6 + 2 D-POSITION          
    I EMIT MED.GRAY CHAR.COLOR          
  LOOP ;                                
                        

( ----------- Screen 116/286 ----------- :)
 ( GARBAGE.PANEL,WS.CHIP UPDATE.WS.C..) 
                                        
 : GARBAGE.PANEL.CHIP ( ---)            
   HOT.CHIP @ CURRENT.INSTRUCTION !     
   SOCKET@ 0 !CHIP BLANK.WS.CHIP        
   UPDATE.WS.CHIP ;                     
                                        
 : GARBAGE.WS.CHIP ( ---)               
   NONE@ WS.ARG.BYTE C!                 
   0 WS.TRUE.FLOW C! 0 WS.FALSE.FLOW C! 
   NONE@ WS.OP.BYTE C!                  
   0 WIRE.SELECTED !                    
   0 THIS.ACT.TYPE ! ;                  
                                        
 : UPDATE.WS.COMMANDS ( ---)            
 ( IS CHIP READY TO BE INSERTED?)       
 0 INSERTER.COM !                       
 WS.ARG.BYTE C@ NONE@ = NOT             
   ( CHIP IS FINISHED)                  
 THIS.ACT.TYPE @ -@ = OR                
   ( UNARY CHIP FINISHED)               
 IF 1 INSERTER.COM ! THEN ;             
                                        
                                        
                                        
                        

( ----------- Screen 117/287 ----------- :)
( PANEL.CHIP>WS WS>PANEL.CHIP WS>ARG)   
                                        
 : PANEL.CHIP>WS    ( ---)              
   @CHIP OVER SOCKET@ = NOT IF          
     DUP DUP ARG.BYTE C! 64 MOD         
     WS.ARG.BYTE C! 192 AND             
     WS.FALSE.FLOW C!                   
     DUP DUP OP.BYTE C! 64 MOD          
     WS.OP.BYTE C! 192 AND              
     WS.TRUE.FLOW C!                    
     WS.OP.BYTE C@ ACTION.TYPE( +       
     C@ THIS.ACT.TYPE !                 
   ELSE 2DROP GARBAGE.WS.CHIP THEN ;    
                                        
 : WS>PANEL.CHIP   ( ---)               
   WS.TRUE.FLOW C@ WS.OP.BYTE C@ +      
   DUP OP.BYTE C!                       
   WS.FALSE.FLOW C@ WS.ARG.BYTE C@ +    
   DUP ARG.BYTE C!                      
   !CHIP ;                              
 : WS>ARG,OP  ( ---)                    
   WS.TRUE.FLOW C@ DUP FLOW.CODE C!     
   WS.OP.BYTE C@ + OP.BYTE C!           
   WS.FALSE.FLOW C@ WS.ARG.BYTE C@ +    
   ARG.BYTE C! ;                        
                        

( ----------- Screen 118/288 ----------- :)
( WIRE.PROG LEGAL.WIRE TEST.LEGAL.WIRE) 
 VAR LAST.TRUE VAR LAST.FALSE           
 : WIRE.PROG ( FLOW---NEW.FLOW)         
  CASE UP.F@ OF RIGHT.F@ ;;             
    RIGHT.F@ OF DOWN.F@ ;;              
     DOWN.F@ OF LEFT.F@ ;;              
     LEFT.F@ OF UP.F@ ;;                
  ENDCASE ;                             
: LEGAL.WIRE ( ---)                     
  BEGIN LAST.TRUE @ DUP WIRE.OK?        
   NOT IF WIRE.PROG THEN DUP            
   LAST.TRUE ! WIRE.OK? UNTIL           
  LAST.TRUE @ WS.TRUE.FLOW C!           
  BEGIN LAST.FALSE @ DUP DUP            
   WIRE.OK? NOT SWAP LAST.TRUE @ = OR   
   IF WIRE.PROG THEN DUP DUP            
   LAST.FALSE ! WIRE.OK? SWAP LAST.TRUE 
  @ = NOT AND UNTIL ( FALSE = TRUE)     
   LAST.FALSE @ WS.FALSE.FLOW C! ;      
 : TEST.LEGAL.WIRE ( ---)               
   WS.OP.BYTE C@ 64 MOD DUP DUP         
   NONE@ = SWAP GOTO.GO@ = OR SWAP      
   BOOMERANG@ = OR LAST.TRUE @          
   LAST.FALSE @ = OR                    
   IF LEGAL.WIRE THEN ;                 
                        

( ----------- Screen 119/289 ----------- :)
( KEYPRESS,SUBPANEL.THING.ICONS)        
                                        
 : KEYPRESS.THING.ICONS                 
  26 18 39 24 LT.GRAY COLOR.BLOCK       
  65   ( A) BLACK CHAR.COLOR            
  24 19 DO ( VERT LOOP)                 
   38 29 DO  ( HORIZ)                   
   I J D-POSITION DUP EMIT 1+           
  LOOP 2 +LOOP DROP ."  !" ;            
                                        
 : SUBPANEL.THING.ICONS ( ---)          
  BLACK CHAR.COLOR                      
  26 18 39 24 LT.GRAY COLOR.BLOCK       
   9 0 DO                               
     SUBP.WS.RECT( I 4 * +              
     @XY D-POSITION                     
     66 I + EMIT                        
  LOOP  ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 120/290 ----------- :)
( INSERT.IT <<<<)                       
                                        
: INSERT.IT ( ---)                      
  HOT.CHIP @ CURRENT.INSTRUCTION !      
  INSERTER.COM @                        
  IF WS>PANEL.CHIP                      
  ZERO.STATS                            
  ELSE GARBAGE.WS.CHIP  THEN            
  ERASE.BLANK.WIRES                     
  HOT.CHIP @ CHIP.DRAW                  
  UPDATE.WS.COMMANDS ;                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 121/291 ----------- :)
( CALC.BLANK.WIRES)                     
                                        
: CALC.BLANK.WIRES  ( ---)              
   WS.CHIP.RECT @RECT                   
   DROP SWAP DROP  ( XL/YT)             
   UP.F@ WIRE.OK?                       
   IF OVER DUP 2 + 3 PICK 1- DUP        
   ELSE 40 40 40 40 THEN                
   UP.WS !RECT                          
   DOWN.F@ WIRE.OK?                     
   IF OVER 1- DUP 2 + 3 PICK 3 + DUP    
   ELSE 40 40 40 40 THEN                
   DOWN.WS !RECT                        
   LEFT.F@ WIRE.OK?                     
   IF OVER 1- DUP 3 PICK 1- DUP 3 +     
   ELSE 40 40 40 40 THEN                
   LEFT.WS !RECT                        
   RIGHT.F@ WIRE.OK?                    
   IF OVER 2 + DUP 3 PICK DUP 3 +       
   ELSE 40 40 40 40 THEN                
   RIGHT.WS !RECT                       
   2DROP ;                              
                                        
                                        
                                        
                        

( ----------- Screen 122/292 ----------- :)
( PULL.IT )                             
                                        
: PULL.IT ( ---)                        
   HOT.CHIP @ CURRENT.INSTRUCTION !     
   PANEL.CHIP>WS                        
   UPDATE.WS.COMMANDS                   
   CALC.BLANK.WIRES                     
   WS>ARG,OP                            
   UPDATE.WS.CHIP                       
   WS.OP.BYTE C@ SUBPANEL@ =            
   IF SUBPANEL.THING.ICONS              
   ELSE WS.OP.BYTE C@ KEYPRESS@ =       
    IF  KEYPRESS.THING.ICONS            
    ELSE WS.OP.BYTE C@                  
     DUP NONE@ =  ( NO LEGAL ARGS)      
     IF DROP -@ ELSE ACTION.TYPE( + C@  
     THEN WS.THING.ICONS                
   THEN THEN ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 123/293 ----------- :)
 ( MATCH.WIRE? SELECT.WIRE)             
                                        
 : MATCH.WIRE? ( FLOW.CODE----CODE)     
 ( 0=NONE,TRUE=1,FALSE=2)               
 DUP WS.TRUE.FLOW C@ =                  
 IF DROP 1 ELSE                         
   WS.OP.BYTE C@ BRANCHER?              
     ( NO FALSE ON NON-BRANCHERS)       
   IF WS.FALSE.FLOW C@ =                
     IF 2 ELSE 0 THEN                   
   ELSE DROP 0                          
   THEN                                 
 THEN ;                                 
 : SELECT.WIRE ( FLOW.CODE---)          
 MATCH.WIRE? DUP                        
 IF WIRE.SELECTED ! WS.BACK.COL@        
  SINGLE.WIRE@ WIRE.TYPE !              
  WHITE ' WS.BACK.COL@  !               
  WS.OP.BYTE C@ BRANCHER?               
  IF WIRE.SELECTED @                    
   1 = IF TRUE.WIRE@ WIRE.TYPE !        
    ELSE FALSE.WIRE@ WIRE.TYPE ! THEN   
  THEN WS.CHIP.RECT @XY WIRE.XY WIRE.IT 
  ' WS.BACK.COL@ !                      
 ELSE DROP THEN ;                       
                        

( ----------- Screen 124/294 ----------- :)
( MOVE.WIRE?)                           
                                        
: MOVE.WIRE? ( FLOW.CODE---) DUP        
  MATCH.WIRE? DUP 0>   ( WIRE THERE)    
  IF WIRE.SELECTED @ = NOT ( SAME)      
   IF WS.FALSE.FLOW C@ WS.TRUE.FLOW C@  
    WS.FALSE.FLOW C! WS.TRUE.FLOW C!    
      ( SWAP EM)                        
    0 WIRE.SELECTED ! WS>ARG,OP DROP    
    BLANK.WS.CHIP UPDATE.WS.CHIP        
   ELSE DROP THEN  ( SAME ONE)          
  ELSE DROP ( NO WIRE THERE)            
   WIRE.SELECTED @ 1 =                  
   IF WS.TRUE.FLOW C!                   
   ELSE WS.FALSE.FLOW C! THEN           
   0 WIRE.SELECTED !                    
   WS>ARG,OP BLANK.WS.CHIP              
   UPDATE.WS.CHIP                       
  THEN                                  
  WS.TRUE.FLOW C@ LAST.TRUE !           
  WS.FALSE.FLOW C@ LAST.FALSE ! ;       
                                        
                                        
                                        
                                        
                        

( ----------- Screen 125/295 ----------- :)
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 126/296 ----------- :)
 ( CURSOR.CHIP NEW.CHIP.HOT)            
                                        
 : CURSOR.CHIP ( CHIP#---)              
   S2 ON S-ENABLE                       
   DUP 8 MOD 24 * 36 +  ( X)            
   SWAP 8 / 32 * 78 +   ( Y)            
   2DUP FRAME S-POSITION                
   46 - 8 /             ( YTAB )        
   SWAP 20 - 8 / SWAP   ( XTAB)         
   2DUP OVER 1+ SWAP DUP 2+             
   WS.CHIP.RECT !RECT                   
   SWAP 1 - SWAP 1 - OVER 3 + SWAP      
   DUP 4 + WS.WIRE.RECT !RECT ;         
                                        
 : NEW.CHIP.HOT ( CHIP#---)             
   DUP 0= NOT                           
   IF DUP HOT.CHIP !                    
      DUP CURRENT.INSTRUCTION !         
      CURSOR.CHIP                       
      GET.ACTION DROP PULL.IT           
   ELSE DROP THEN ;                     
                                        
                                        
                                        
                                        
                        

( ----------- Screen 127/297 ----------- :)
( POINT>CHIP   DRAG.CHIP)               
                                        
: POINT>CHIP ( X/Y---CHIP#)             
  78 - 32 / CHIPS.WIDE@ * 0 MAX 32 MIN  
  SWAP 36 - 24 / 0 MAX 7 MIN +          
  ;                                     
VAR DRAG.CHIP^                          
: DRAG.CHIP  ( ---)                     
  PANEL.RECT @RECT BUT.XY@              
  PT.IN.RECT                            
  IF S2 ON S-ENABLE ( IN CASE OFF)      
    BUT.XY@ POINT>CHIP DUP 0= NOT       
    IF DUP DRAG.CHIP^ @ = NOT           
      IF ( BOOP) THEN                   
      DUP DRAG.CHIP^ !   CURSOR.CHIP    
      S2 BLACK FRAME S-COLOR 1 WAIT     
      WHITE FRAME S-COLOR               
    ELSE DROP NONE@ DRAG.CHIP^ !        
   (  HOT.CHIP @ CURSOR.CHIP ) THEN     
  ELSE NONE@ DRAG.CHIP^ !               
    S2 OFF S-ENABLE THEN                
  ( DRAGGED OFF PANEL)                  
  0 24 D-POSITION ." DRAG.CHIP "        
  DRAG.CHIP^ ? ;                        
                                        
                        

( ----------- Screen 128/298 ----------- :)
 ( PANEL.HANDLER)                       
: PANEL.HANDLER ( ---) ( SOUND)         
  BUT.XY@ POINT>CHIP                    
  DUP 0= NOT IF INSERT.IT THEN          
  NEW.CHIP.HOT NONE@ DRAG.CHIP^ !       
  BUTTON.DOWN @ IF                      
    ERASE.BLANK.WIRES                   
    BEGIN BUTTON.DOWN @                 
    WHILE DRAG.CHIP REPEAT THEN         
  DRAG.CHIP^ @ NONE@ = NOT              
  IF GARBAGE.PANEL.CHIP ERASE.WS.CHIP   
    HOT.CHIP @ CHIP.DRAW                
    DRAG.CHIP^ @ DUP HOT.CHIP !         
    DUP CURRENT.INSTRUCTION !           
    WS.TRUE.FLOW C@ LAST.TRUE !         
    WS.FALSE.FLOW C@ LAST.FALSE !       
    LEGAL.WIRE CURSOR.CHIP              
    CALC.BLANK.WIRES INSERT.IT          
    UPDATE.WS.CHIP HOT.CHIP @ CHIP.DRAW 
 ELSE PANEL.RECT  @RECT BUT.XY@         
    PT.IN.RECT NOT  ( DRAG OFF PANEL?)  
    IF ( GARBAGE.WS.CHIP                
      GARBAGE.PANEL.CHIP ERASE.WS.CHIP  
      ERASE.BLANK.WIRES ) THEN          
 THEN UPDATE.WS.COMMANDS ;              
                        

( ----------- Screen 129/299 ----------- :)
( WS.WIRE.HANDLER)                      
 : WS.WIRE.HANDLER ( ---)               
   WS.CHIP.RECT @RECT BUT.XY@           
   PT.IN.RECT                           
   IF PANEL.HANDLER                     
    ELSE WS.OP.BYTE C@ DUP DUP GOTO.GO@ 
     = NOT SWAP BOOMERANG@ = NOT AND    
     SWAP NONE@ = NOT AND               
     IF FLOW.CODE @ >R  ( SAVE IT)      
     4 0 DO                             
       I 64 * DUP FLOW.CODE ! WIRE.OK?  
       IF  FLOW.CODE @                  
        CASE UP.F@ OF UP.WS ;;          
          DOWN.F@ OF DOWN.WS ;;         
          LEFT.F@ OF LEFT.WS ;;         
         RIGHT.F@ OF RIGHT.WS ;;        
        ENDCASE  ( WIRE RECT)           
        @RECT BUT.XY@ PT.IN.RECT        
        IF WIRE.SELECTED @              
         IF FLOW.CODE @ MOVE.WIRE?      
         ELSE FLOW.CODE @ SELECT.WIRE   
         THEN LEAVE                     
       THEN THEN                        
     LOOP R> FLOW.CODE !                
   THEN THEN ;                          
EXIT                    

( ----------- Screen 130/300 ----------- :)
 ( PANEL.SELECT.HANDLER)                
                                        
 : PANEL.SELECT.HANDLER ( ---)          
                                        
   BUTTON.X @  24 - ( SCREEN COORDS)    
   44 - 16 /   ( PANEL #)               
   0 MAX 9 MIN  ( LEGAL RANGE)          
   INSERTER.COM @ IF                    
    WS>PANEL.CHIP THEN                  
     ( INSERT FINISHED CHIP)            
   DUP CURRENT.PANEL ! ( NEW PANEL)     
                                        
   PANEL.DRAW   PANEL.HILIGHT           
   WS.ACTION.ICONS ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 131/301 ----------- :)
( ACTION.HANDLER)                       
                                        
: ACTION.HANDLER ( ---)                 
  ACTION.COUNT@ GOTO.GO@ DO             
   I ACTION.OK?                         
   IF OP.W.XY( I 4 * + @RECT            
    BUT.XY@ PT.IN.RECT                  
    IF ( SOUND)                         
     LEGAL.WIRE                         
     I WS.OP.BYTE C!                    
     NONE@ WS.ARG.BYTE C!               
     I ACTION.TYPE( + C@ DUP            
     THIS.ACT.TYPE !                    
     WS>ARG,OP UPDATE.WS.CHIP           
     UPDATE.WS.COMMANDS                 
     DUP                                
     TS@ S@ WITHIN                      
     IF WS.THING.ICONS                  
     ELSE DUP CASE                      
   SB@ OF DROP SUBPANEL.THING.ICONS  ;; 
   L@ OF DROP KEYPRESS.THING.ICONS  ;;  
   -@ OF WS.THING.ICONS ;;              
     ENDCASE THEN                       
   THEN THEN                            
 LOOP ;                                 
EXIT                    

( ----------- Screen 132/302 ----------- :)
( SUBP.HANDLER,KEY.HANDLER)             
                                        
: SUBP.HANDLER ( ---)                   
 9 0 DO                                 
  SUBP.WS.RECT( I 4 * + @RECT           
  BUT.XY@ PT.IN.RECT                    
  IF I 1 + WS.ARG.BYTE C!               
    ( THING.SOUND)                      
    WS>ARG,OP UPDATE.WS.CHIP            
    UPDATE.WS.COMMANDS  LEAVE           
  THEN LOOP ;                           
                                        
 : KEY.HANDLER ( ---)                   
   BUT.XY@  50 -  20 8 * - 8 /          
   0 MAX 2 MIN  ( ROW) 9 *              
   SWAP 24 - 29 8 * - 8 /               
   0 MAX 8 MIN  ( COL) + 1 +            
   ( LETTER 1=A 27=NONE)                
   WS.ARG.BYTE C!                       
   WS>ARG,OP UPDATE.WS.CHIP             
   UPDATE.WS.COMMANDS ;                 
                                        
                                        
                                        
                                        
EXIT                    

( ----------- Screen 133/303 ----------- :)
( THING.HANDLER)                        
                                        
: THING.HANDLER ( ---)                  
  WS.OP.BYTE C@ SUBPANEL@ =             
  IF  SUBP.HANDLER                      
  ELSE WS.OP.BYTE C@ KEYPRESS@ =        
   IF  KEY.HANDLER                      
   ELSE THING.COUNT@ 0 DO               
    ARG.W.XY( I 4 * + @RECT BUT.XY@     
    PT.IN.RECT IF                       
      ( SOUND)                          
     I WS.ARG.BYTE C!                   
     WS>ARG,OP                          
     UPDATE.WS.CHIP                     
     UPDATE.WS.COMMANDS LEAVE           
    THEN                                
   LOOP THEN                            
  THEN ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 134/304 ----------- :)
( WS.MOUSER)                            
: WS.MOUSER  ( ---)                     
26 39 4 17 BUT.XY@ PT.IN.RECT           
IF ACTION.HANDLER                       
 ELSE 5 25 2 2 BUT.XY@ PT.IN.RECT       
 IF PANEL.SELECT.HANDLER                
  HOT.CHIP @ NEW.CHIP.HOT               
  WS>ARG,OP UPDATE.WS.CHIP              
  ELSE WS.WIRE.RECT @RECT BUT.XY@       
  PT.IN.RECT IF WS.WIRE.HANDLER         
  ELSE 26 39 19 24 BUT.XY@ PT.IN.RECT   
   IF THING.HANDLER                     
   ELSE 0 25 5 24 BUT.XY@ PT.IN.RECT    
    IF PANEL.HANDLER                    
    THEN                                
   THEN                                 
  THEN                                  
 THEN                                   
THEN                                    
 ;                                      
                                        
                                        
                                        
                                        
                                        
EXIT                    

( ----------- Screen 135/305 ----------- :)
 ( SETUP.WORK.SCREEN INIT.WS)           
                                        
: SETUP.WORK.SCREEN ( ---)              
  WS.CHAR                               
  NEW.WS                                
  0 MULTI-COLOR                         
  WS.BORD.COL@ BORDER                   
  BAK.C BKGND                           
  ACTION.COUNT@ 1- 0 DO I OK LOOP       
  BOOMERANG@ NOT.OK ;                   
                                        
                                        
: INIT.WS ( ---)                        
  39 HOT.CHIP !   GARBAGE.WS.CHIP       
  1 NEW.CW !                            
  0 CURRENT.INSTRUCTION !               
  0 CURRENT.PANEL !                     
  0 PULLER.COM !                        
  0 INSERTER.COM !                      
  0 GARBAGE.COM !                       
  39 NEW.CHIP.HOT                       
  ;                                     
                                        
                                        
                                        
                        

( ----------- Screen 136/306 ----------- :)
 ( W.ENTER W.LEAVE )                    
 $CONSTANT W.ON$ "ENTER"                
 $CONSTANT W.OFF$ "EXIT"                
: W.ENTER ( ---)                        
  SCREEN.OFF BLACK BKGND BLACK BORDER   
  SPRITES.OFF                           
  S2 WHITE S-COLOR  OFF S-MULTI         
  3 ON WORKSHOP( ITEM.ENABLE ( SAVECW)  
12 4 DO I OFF GAMES( ITEM.ENABLE LOOP   
  COPY.BUFF.FULL @ NOT                  
  IF 7 OFF WORKSHOP( ITEM.ENABLE THEN   
 1 W.OFF$ WORKSHOP$ WORKSHOP( SET.ITEM$ 
  186 S-POINTER ON S-YEXP ON S-XEXP     
  SETUP.WORK.SCREEN                     
  RIGHT.F@ LAST.TRUE !                  
  DOWN.F@ LAST.FALSE !                  
  1 NEW.CW ! WS.ACTION.ICONS            
  PANEL.HILIGHT WS.BORD.COL@ BORDER     
  SCREEN.ON  ;                          
 : W.LEAVE ( ---)                       
   HOT.CHIP @ NO.CHIP@ = NOT            
   IF INSERT.IT THEN                    
  1 W.ON$ WORKSHOP$ WORKSHOP( SET.ITEM$ 
  3 OFF WORKSHOP( ITEM.ENABLE           
12 4 DO I ON GAMES( ITEM.ENABLE LOOP ;  
                        

( ----------- Screen 137/307 ----------- :)
 ( **** WORKSHOP ****)                  
                                        
: WORKSHOP  ( ---)  W.ENTER             
  BEGIN  DO.EVENTS                      
   BUTTON.DOWN @ IF WS.MOUSER THEN      
  NEW.CW @                              
  IF INIT.WS                            
    CURRENT.PANEL @ PANEL.DRAW          
    ( WS.ACTION.ICONS )                 
    PANEL.HILIGHT                       
    0 NEW.CW !  THEN                    
    PROG.STATUS @ WORKSHOP.ON@ =        
                                        
  NOT UNTIL                             
  SCREEN.OFF                            
  W.LEAVE   ;                           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 138/308 ----------- :)
( DRAW.RND.CRP TO.CW)                   
                                        
: DRAW.RND.CRP ( SQ#---)                
  SQUARE.XTYT CREEP.BLOCK(              
  4 IRND 7 * + 3 2 BLOCK.               
  ( CREEP.SOUND) ;                      
                                        
                                        
: TO.CW  ( SQ#---NEXTSQ#) DUP           
  DUP SQUARES.WIDE@ / ( ROW)            
  SWAP SQUARES.WIDE@ MOD ( COL)         
  ROBOT.SQUARE @ SQUARES.WIDE@ MOD      
  < IF 1 ELSE -1 THEN                   
  2 IRND 0= IF DROP 0 THEN              
  SWAP ROBOT.SQUARE @ SQUARES.WIDE@ /   
  2DUP =   ( SAME ROW)                  
  IF 2DROP 0                            
  ELSE < IF SQUARES.WIDE@               
   ELSE SQUARES.WIDE@ NEGATE THEN       
  THEN 2 IRND 0= IF DROP 0 THEN         
  + + ;                                 
                                        
                                        
                                        
                                        
                        

( ----------- Screen 139/309 ----------- :)
( ?ZAP.CW  CREEP.MOVE)                  
                                        
 : ?ZAP.CW  ( SQ#---FLAG)               
  ROBOT.SQUARE @ = NOT DUP NOT          
   ( CW IS THERE, ZAP IT)               
  IF 6 FLASH.CW -200 UPDATE.FUEL THEN ; 
                                        
                                        
 : CREEP.MOVE ( CREEP#/SQ#---)          
  3 IRND 1 = IF  ( 33% TRY TO MOVE)     
    DUP TO.CW ( CR#/SQ#/NEXTSQ#)        
 DUP DUP DUP SQUARE.OBJECT              
 FLOOR@ = SWAP ?ZAP.CW AND              
 SWAP ROBOT.SQUARE @ SQUARES.WIDE@      
 - = NOT AND                            
  IF DUP 4 ROLL CREEPS( + C! ( SQ#/NX#) 
   SWAP DESTROY  ( NEXTSQ#)             
   DUP ROOM.DATA( + CREEP@ SWAP C!      
       ( STORE CREEP IN ROOM)           
                                        
  ELSE DROP SWAP DROP THEN ( SQ#)       
 ELSE SWAP DROP                         
 THEN DRAW.RND.CRP ;                    
                                        
                                        
                        

( ----------- Screen 140/310 ----------- :)
 ( SPIN.BOUNCER <<<<)                   
                                        
 : SPIN.BOUNCER ( STATE---)             
   DROP ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 141/311 ----------- :)
( MOVE.BADDIES)                         
                                        
 : MOVE.BADDIES ( ---)                  
   12 IRND DUP CREEPS( + C@             
   55 MIN  ( NO GARBAGE #'S)            
         ( CREEP#/CREEP SQ#)            
   DUP SQUARE.OBJECT CREEP@ =           
     ( CREEP IS STILL THERE)            
   IF CREEP.MOVE                        
   ELSE 2DROP                           
   THEN                                 
   BOUNCERS @                           
   IF                                   
     BOUNCER.STATE @ SPIN.BOUNCER THEN ;
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 142/312 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 143/313 ----------- :)
( REC.LAST READ.LAST)                   
                                        
: REC.LAST ( ---)                       
  0 SAVENAME C!                         
  SAVENAME " @:TMP" $CONCAT             
  ADVENTURE ADVENTURE 3 + SAVE          
  " S0:AD" DOS                          
  " R0:AD=TMP" DOS ;                    
                                        
                                        
: READ.LAST  ( ---)                     
 ADVENTURE " AD" LOADRAM ;              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 144/314 ----------- :)
 ( BYE.BYE    OPTION.MENU)              
                                        
 : BYE.BYE ( --)                        
   ;                                    
                                        
                                        
                                        
 : OPTION.MENU ( ---)                   
   THIS.ITEM @                          
   CASE                                 
     1 OF ( DEBUG ON)  ;;               
     2 OF BYE.BYE ;;                    
   ENDCASE ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 145/315 ----------- :)
( CLEAR.PANEL COPY.PANEL PASTE.PANEL)   
CREATE COPY.BUFF( CHIP.COUNT@ 2 * ALLOT 
: CLEAR.PANEL ( ---) CHIP.COUNT@ 1      
  DO I CURRENT.INSTRUCTION !            
     SOCKET@ 0 !CHIP LOOP               
  1 CURRENT.INSTRUCTION !               
  CURRENT.PANEL @ PANEL.DRAW            
  ( ZERO.STATS)                         
  GARBAGE.WS.CHIP UPDATE.WS.COMMANDS ;  
: COPY.PANEL ( ---)                     
  ROBOT.PROGRAM CURRENT.PANEL @         
  CHIP.COUNT@ 2 * * + COPY.BUFF(        
  CHIP.COUNT@ 2 * CMOVE                 
  7 ON WORKSHOP( ITEM.ENABLE            
  1 COPY.BUFF.FULL ! ;                  
: PASTE.PANEL ( ---) COPY.BUFF(         
  ROBOT.PROGRAM CURRENT.PANEL @         
  CHIP.COUNT@ 2 * * + DUP >R            
  CHIP.COUNT@ 2 * CMOVE                 
  CURRENT.PANEL @ DUP 0= IF BOOMERANG@  
  ELSE SUBPANEL@ THEN                   
  R> DUP CHIP.COUNT@ 2 * + SWAP DO      
   I C@ 64 MOD OVER = IF SOCKET@ I C!   
   THEN 2 +LOOP DROP                    
  PANEL.DRAW ( ZERO.STATS) ;            
                        

( ----------- Screen 146/316 ----------- :)
( WS.MENU)                              
                                        
                                        
: WS.MENU  ( ---)                       
  THIS.ITEM @                           
  CASE                                  
     1 OF PROG.STATUS @ WORKSHOP.ON@ =  
         IF WORKSHOP.OFF@               
         ELSE WORKSHOP.ON@ THEN         
         PROG.STATUS ! ;;               
     3 OF HOT.CHIP @ NO.CHIP@ =         
       NOT IF INSERT.IT THEN            
       CW.NUM @ CW.SAVE                 
     ( EDIT.NAME SET.MENU.NAMES)        
       1 NEW.CW ! ;;                    
     5 OF COPY.PANEL CLEAR.PANEL ;;     
     6 OF COPY.PANEL ;;                 
     7 OF PASTE.PANEL ;;                
     8 OF CLEAR.PANEL ;;                
   ENDCASE ;                            
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 147/317 ----------- :)
( WH.MENU)                              
: WH.MENU  SPRITES.OFF                  
  THIS.ITEM @ DUP CW.LOAD               
  CW.NUM !                              
  PROG.STATUS @ WORKSHOP.ON@ =          
  IF 1 NEW.CW !                         
  ELSE TURN.GAME.OFF@ PROG.STATUS !     
  THEN   ( SET.CW.MENU.NAMES )          
    REC.LAST  ;                         
 CREATE AD.COL( LT.BLUE C, GREEN C,     
  DK.GRAY C,  BLUE C,  BROWN C,         
  RED C,  MED.GRAY C, LT.RED C,         
 : AD.M ( AD#---) SPRITES.OFF           
   DUP 1- AD.COL( + C@ M.BAK2           
   DUP ADVENTURE ! ( FOR NOW)           
   PROG.STATUS @ GAME.ON@ =             
   IF TURN.GAME.OFF@ PROG.STATUS !      
THEN FIRST SWAP CASE  1 OF " A1" ;;     
   2 OF " A2" ;; 3 OF " A3" ;;          
   4 OF " A4" ;; 5 OF " A5" ;;          
   6 OF " A6" ;; 7 OF " A7" ;;          
   8 OF " A8" ;; ENDCASE LOADRAM        
   SWAPOUT FIRST 53248 4096 CMOVE       
   SWAPIN  REC.LAST                     
   FIRST " CW.SCR" LOADRAM ;            
                        

( ----------- Screen 148/318 ----------- :)
( ADVENTURE.MENU)                       
: ADVENTURE.MENU                        
  THIS.ITEM @  DUP                      
  CASE                                  
   1 OF DROP PROG.STATUS @              
     CASE                               
      WORKSHOP.ON@ OF                   
       TURN.GAME.ON@ PROG.STATUS ! ;;   
      SERIES@ OF                        
       TURN.GAME.OFF@ PROG.STATUS ! ;;  
      GAME.ON@ OF                       
       TURN.GAME.OFF@ PROG.STATUS ! ;;  
      GAME.OFF@ OF                      
       TURN.GAME.ON@ PROG.STATUS ! ;;   
    ENDCASE ;;                          
  2 OF DROP PROG.STATUS @               
    CASE SERIES@ OF GAME.ON@            
         PROG.STATUS ! 1 LAST.MISSION ! 
         ( MENU STUFF <<<) ;;           
        0 LAST.MISSION !                
       ( MENU STUFF<<<)                 
       SERIES@ PROG.STATUS !            
   ENDCASE ;;                           
  3 - AD.M                              
ENDCASE ;                               
                        

( ----------- Screen 149/319 ----------- :)
( DO.EVENTS)                            
                                        
 : DO.EVENTS ( ---)                     
   DO.MENU.EVENTS                       
   IF THIS.MENU @                       
     CASE                               
       1 OF WH.MENU ;;                  
       2 OF WS.MENU ;;                  
       3 OF ADVENTURE.MENU ;;           
       4 OF OPTION.MENU ;;              
     ENDCASE                            
   THEN                                 
   ;                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 150/320 ----------- :)
( STACK & REG STUFF)                    
                                        
                                        
                                        
256 IS STACK.LEN@                       
                                        
CREATE MOV.ST( 256 ALLOT                
CREATE NUM.ST( 256 ALLOT                
CREATE OBJ.ST( 256 ALLOT                
                                        
VAR MOV.ST^                             
VAR NUM.ST^                             
VAR OBJ.ST^                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 151/321 ----------- :)
( CHECK.MOV,OBJ,NUM.ST)                 
                                        
: CHECK.MOV.ST ( ARG---ARG)             
 ( IF ARG IS MOVE STACK RETURN MOVE)    
 DUP MOV.STACK@ = IF DROP               
   MOV.ST( MOV.ST^ @ + C@ THEN ;        
                                        
: CHECK.OBJ.ST ( ARG--ARG)              
 DUP OBJ.STACK@ = IF DROP               
   OBJ.ST( OBJ.ST^ @ + C@ THEN ;        
                                        
: CHECK.NUM.ST ( ARG--ARG)              
 DUP CASE                               
  NUM.STACK@ OF DROP                    
     NUM.ST( NUM.ST^ @ + C@ ;;          
  DAMAGE.REG@ OF DROP DAMAGE.REG @      
     200 / NUM0@ + ;;                   
  FUEL.REG@ OF DROP FUEL.REG @          
    1000 / 1+ NUM0@ + ;;                
  RANGE.REG@ OF DROP RANGE.REG @        
    NUM0@ + ;;                          
 ( ELSE IT'S A NUMBER)                  
ENDCASE ;                               
                                        
                                        
                        

( ----------- Screen 152/322 ----------- :)
 ( UPDATE.FUEL,DAMAGE)                  
                                        
 : NUM.PLOP  ( NUMBER/X/Y---)           
  ( DRAWS NUMBER BEAKER)  ROT           
  NUM0@ + 5 * ( INDEX INTO ARG.BLOCK( ) 
  ARG.BLOCK( + ARG. ;                   
                                        
 : UPDATE.FUEL ( FUEL PTS---)           
 FUEL.REG @ + 6999 MIN DUP FUEL.REG !   
 DUP 1 < IF GAME.ABORTED@ PROG.STATUS ! 
            DROP 0                      
         ELSE 1000 / 1+ THEN            
 32 9  NUM.PLOP ;                       
                                        
 : UPDATE.DAMAGE ( DAMAGE.PTS---)       
   DAMAGE.REG @ + DUP DAMAGE.REG !      
   DUP 1399 >                           
   IF GAME.ABORTED@ PROG.STATUS !       
      DROP 7                            
   ELSE 200 / THEN                      
   28 9  NUM.PLOP ;                     
                                        
                                        
                                        
                                        
                        

( ----------- Screen 153/323 ----------- :)
( UPDATE.RANGE ST.SQUASH)               
                                        
: UPDATE.RANGE ( RANGE ---)             
 DUP RANGE.REG !                        
 36 9  NUM.PLOP ;                       
                                        
                                        
: ST.SQUASH ( STACK ADDR---)            
 ( PUSHES DOWN FULL STACK)              
 ( BOTTOM ITEM IS LOST)                 
 DUP 1+ SWAP STACK.LEN@ 1- CMOVE ;      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 154/324 ----------- :)
( ERASE.STACK DRAW.MOV.ST ON.MOV.ST)    
                                        
: ERASE.STACK ( X/Y---X/Y) 2DUP         
 OVER 1+ OVER 5 + DK.GRAY COLOR.BLOCK ; 
                                        
: DRAW.MOV.ST ( ---)                    
  36 17 ERASE.STACK                     
  MOV.ST^ @ 2- 0 MAX MOV.ST^ @ DO       
   2DUP MOV.ST( I + C@ O.D.             
 ( GET MOV FROM STACK & DRAW)           
   2 +                                  
  -1 +LOOP 2DROP ;                      
                                        
  : ON.MOV.ST ( MOV.TOK---)             
    MOV.ST^ @ STACK.LEN@ =              
    IF MOV.ST( ST.SQUASH                
 ( IF MAX SIZE SQUASH)                  
    ELSE 1 MOV.ST^ +! THEN              
 ( INC STACK TOP POINTER)               
    MOV.ST^ @ MOV.ST( + C!              
 ( STORE NEW ITEM)                      
    DRAW.MOV.ST ;                       
                                        
                                        
                                        
                        

( ----------- Screen 155/325 ----------- :)
( DRAW.OBJ.ST ON.OBJ.ST)                
                                        
: DRAW.OBJ.ST ( ---)                    
  32 17 ERASE.STACK                     
  OBJ.ST^ @ 2- 0 MAX OBJ.ST^ @ DO       
   2DUP OBJ.ST( I + C@ O.D.             
 ( GET OBJ FROM STACK & DRAW)           
   2 +                                  
  -1 +LOOP 2DROP ;                      
                                        
  : ON.OBJ.ST ( MOV.TOK---)             
    OBJ.ST^ @ STACK.LEN@ =              
    IF OBJ.ST( ST.SQUASH                
 ( IF MAX SIZE SQUASH)                  
    ELSE 1 OBJ.ST^ +! THEN              
 ( INC STACK TOP POINTER)               
    OBJ.ST^ @ OBJ.ST( + C!              
 ( STORE NEW ITEM)                      
    DRAW.OBJ.ST ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 156/326 ----------- :)
( DRAW.NUM.ST ON.NUM.ST)                
                                        
: DRAW.NUM.ST ( ---)                    
  28 17 ERASE.STACK                     
  NUM.ST^ @ 2- 0 MAX NUM.ST^ @ DO       
   2DUP NUM.ST( I + C@ O.D.             
 ( GET NUM FROM STACK & DRAW)           
   2 +                                  
  -1 +LOOP 2DROP ;                      
                                        
  : ON.NUM.ST ( MOV.TOK---)             
    NUM.ST^ @ STACK.LEN@ =              
    IF NUM.ST( ST.SQUASH                
 ( IF MAX SIZE SQUASH)                  
    ELSE 1 NUM.ST^ +! THEN              
 ( INC STACK TOP POINTER)               
    NUM.ST^ @ NUM.ST( + C!              
 ( STORE NEW ITEM)                      
    DRAW.NUM.ST ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 157/327 ----------- :)
( NUM= NUM< OBJ= MOV= CLEAR.STACKS)     
                                        
: NUM= ( ARG---^ IS ARG= STACK TOP?)    
  CHECK.NUM.ST ( FOR REGISTER ARGS)     
  NUM.ST( NUM.ST^ @ + C@ =              
  NOT IF FALSE.FLOW THEN ;              
: NUM< ( ARG---)                        
  CHECK.NUM.ST                          
  NUM.ST( NUM.ST^ @ + C@ >              
  NOT IF FALSE.FLOW THEN ;              
: OBJ= ( ARG---)                        
  OBJ.ST( OBJ.ST^ @ + C@ =              
  NOT IF FALSE.FLOW THEN ;              
: MOV= ( ARG---)                        
  MOV.ST( MOV.ST^ @ + C@ =              
  NOT IF FALSE.FLOW THEN ;              
: CLEAR.STACKS ( ---)                   
  MOV.ST( STACK.LEN@ ERASE 0 MOV.ST^ !  
  OBJ.ST( STACK.LEN@ ERASE 0 OBJ.ST^ !  
  NUM.ST( STACK.LEN@ ERASE 0 NUM.ST^ !  
  MOV.EMPTY@ MOV.ST( C!                 
  OBJ.EMPTY@ OBJ.ST( C!                 
  NUM.EMPTY@ NUM.ST( C!                 
  DRAW.MOV.ST DRAW.OBJ.ST DRAW.NUM.ST ; 
                                        
                        

( ----------- Screen 158/328 ----------- :)
 ( DROP.STACK PLUS MINUS)               
                                        
 : DROP.STACK ( ARG---)                 
  CASE                                  
   MOV.STACK@ OF MOV.ST^ @ 1- 0 MAX     
      MOV.ST^ ! DRAW.MOV.ST ;;          
   OBJ.STACK@ OF OBJ.ST^ @ 1- 0 MAX     
      OBJ.ST^ ! DRAW.OBJ.ST ;;          
   NUM.STACK@ OF NUM.ST^ @ 1- 0 MAX     
      NUM.ST^ ! DRAW.NUM.ST ;;          
  ENDCASE ;                             
                                        
: PLUS ( ---^ INC NUMBER STACK)         
  NUM.ST( NUM.ST^ @ + DUP C@            
  DUP NUM.EMPTY@ = NOT                  
  IF NUM0@ - 1+ 8 MOD NUM0@ + SWAP C!   
    DRAW.NUM.ST                         
  ELSE 2DROP THEN ;                     
                                        
: MINUS ( ---)                          
  NUM.ST( NUM.ST^ @ + DUP C@            
  DUP NUM.EMPTY@ = NOT                  
  IF NUM0@ - 1- 8 +MOD NUM0@ + SWAP C!  
  DRAW.NUM.ST ELSE 2DROP THEN ;         
                                        
                        

( ----------- Screen 159/329 ----------- :)
( STACKER <<<<<<<<)                     
                                        
: STACKER ( OPCODE ---)                 
  ARG.BYTE C@ 64 MOD SWAP               
  CASE                                  
    NUMBER=@ OF NUM= ;;                 
    NUMBER<@ OF NUM< ;;                 
    OBJECT=@ OF OBJ= ;;                 
    MOVE=@ OF MOV= ;;                   
    ON.NUMBER@ OF ON.NUM.ST ;;          
    ON.OBJECT@ OF ON.OBJ.ST ;;          
    ON.MOVE@ OF ON.MOV.ST ;;            
    DROP.STACK@ OF DROP.STACK ;;        
    PLUS@ OF DROP PLUS ;;               
    MINUS@ OF DROP MINUS ;;             
  ENDCASE ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 160/330 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 161/331 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 162/332 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 163/333 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 164/334 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 165/335 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 166/336 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 167/337 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 168/338 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
