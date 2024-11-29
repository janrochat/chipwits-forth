════════════════════════════════════════   SCREEN 001
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 003
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
════════════════════════════════════════   SCREEN 004
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
                                        
════════════════════════════════════════   SCREEN 005
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
                                        
════════════════════════════════════════   SCREEN 006
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
                                        
════════════════════════════════════════   SCREEN 007
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
                                        
════════════════════════════════════════   SCREEN 008
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 010
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
                                        
════════════════════════════════════════   SCREEN 011
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
════════════════════════════════════════   SCREEN 012
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
                                        
                                        
════════════════════════════════════════   SCREEN 013
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
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 015
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 016
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 017
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
                                        
                                        
════════════════════════════════════════   SCREEN 020
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
════════════════════════════════════════   SCREEN 027
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 030
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
════════════════════════════════════════   SCREEN 035
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
════════════════════════════════════════   SCREEN 037
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
════════════════════════════════════════   SCREEN 040
( FLASH.CW)                             
                                        
 : FLASH.CW  ( #FLASHES---)             
   0 DO                                 
    53289 1024 6 CMOVE ( SAVE COLORS)   
    6 0 DO 16 IRND 53289 I + C! LOOP    
     ( RANDOM COLORS  )                 
    2 WAIT 1024 53289 6 CMOVE 2 WAIT    
   LOOP ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 046
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
                                        
                                        
════════════════════════════════════════   SCREEN 053
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
════════════════════════════════════════   SCREEN 054
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 056
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
════════════════════════════════════════   SCREEN 058
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
════════════════════════════════════════   SCREEN 060
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 069
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
════════════════════════════════════════   SCREEN 070
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
════════════════════════════════════════   SCREEN 073
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
════════════════════════════════════════   SCREEN 074
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
════════════════════════════════════════   SCREEN 078
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 082
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
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 083
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 085
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
════════════════════════════════════════   SCREEN 087
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
                                        
════════════════════════════════════════   SCREEN 090
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
════════════════════════════════════════   SCREEN 091
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
                                        
════════════════════════════════════════   SCREEN 092
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
════════════════════════════════════════   SCREEN 094
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
                                        
════════════════════════════════════════   SCREEN 095
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
                                        
                                        
════════════════════════════════════════   SCREEN 096
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 098
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 099
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
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 101
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
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 103
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
════════════════════════════════════════   SCREEN 105
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
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 111
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
════════════════════════════════════════   SCREEN 113
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
                                        
                                        
════════════════════════════════════════   SCREEN 114
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
                                        
                                        
════════════════════════════════════════   SCREEN 115
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
════════════════════════════════════════   SCREEN 117
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
════════════════════════════════════════   SCREEN 118
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
════════════════════════════════════════   SCREEN 123
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
════════════════════════════════════════   SCREEN 125
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 127
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
════════════════════════════════════════   SCREEN 128
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
════════════════════════════════════════   SCREEN 129
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
════════════════════════════════════════   SCREEN 130
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 131
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
════════════════════════════════════════   SCREEN 132
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
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 133
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 134
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 135
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
                                        
                                        
════════════════════════════════════════   SCREEN 136
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
════════════════════════════════════════   SCREEN 138
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
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 139
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
                                        
════════════════════════════════════════   SCREEN 140
 ( SPIN.BOUNCER <<<<)                   
                                        
 : SPIN.BOUNCER ( STATE---)             
   DROP ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 143
( REC.LAST READ.LAST)                   
                                        
: REC.LAST ( ---)                       
  0 SAVENAME C!                         
  SAVENAME " @:TMP" $CONCAT             
  ADVENTURE ADVENTURE 3 + SAVE          
  " S0:AD" DOS                          
  " R0:AD=TMP" DOS ;                    
                                        
                                        
: READ.LAST  ( ---)                     
 ADVENTURE " AD" LOADRAM ;              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 145
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
════════════════════════════════════════   SCREEN 147
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
════════════════════════════════════════   SCREEN 148
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
════════════════════════════════════════   SCREEN 154
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
                                        
                                        
════════════════════════════════════════   SCREEN 155
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
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 156
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
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 157
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
════════════════════════════════════════   SCREEN 158
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
