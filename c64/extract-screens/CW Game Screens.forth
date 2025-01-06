( Input file: ../disks/Master 3of3 - CW Game Screens/CW Game Screens.d64 )
( LINEWIDTH: 40 )
( ----------- Screen 0/170 ----------- :)
 ( CHIPWITS LEFT TO DO)                 
                                        
 SEE EFFECT                             
 BLUE MENU ITEMS                        
 TITLE LOADER                           
 SERIES                                 
*MYSTERY MATRIX                         
*BOUNCER ANIMATION                      
*ENDGAME MESSAGE                        
 SPEED MENU PULLDOWN                    
 BOMB                                   
                                        
*GARBAGE CHIP REDRAN AT EDGE            
 PLAY NOTE IN WS                        
-ALPHA ONLY KEY CHECK                   
-CRUNCH LOWER, EAT HIGHER LONGER        
-FASTLOAD                               
 RETURN = OK IN NAMING                  
*OFF EDDIT OPTIONS OUT OF WS            
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 1/171 ----------- :)
( CHIPWIT GAME LOADER)                  
                                        
( FORGET IT : IT ; ) FORTH              
172 182  THRU  ( DATA & COMMON ROUTINES)
255 255 THRU ( DISK?)                   
183 195 THRU                            
246 254 THRU ( CHAR ROUTINES)           
256 265 THRU ( IBOL GRAPHICS)           
330 338 THRU ( STAT  NAMES)             
266 275 THRU  ( DEBUG)                  
320 329 THRU  ( STACK,REG STUFF)        
276 290 THRU  ( WORKSHOP)               
" S0:CWLO" DOS SAVE-FORTH "CWLO"        
EXIT  339 LOAD ( HI)                    
313 319 THRU ( MENUS)                   
311 312 THRU ( ZAP, SEE SPRITES)        
291 307 THRU  ( W2)                     
" S0:CWWRK" DOS SAVE-FORTH "CWWRK"      
196 241 THRU ( GAME)                    
308 310 THRU  ( BADS)                   
242 LOAD  ( GAME)                       
( 251 256 THRU ( CHOOSE CW)             
243 245 THRU   ( CW MASTER WORD)        
( 255 LOAD  ( DUMMY PROG)               
" S0:GAME" DOS SAVE-FORTH "GAME"        
                        

( ----------- Screen 2/172 ----------- :)
( ROBOT VARS AND CONSTS 11/4/84)        
: VAR VARIABLE ; : IS CONSTANT ;        
( VAR ROBOT.SQUARE)                     
( VAR ROBOT.ORIENTATION)                
                                        
40  IS CHIP.COUNT@                      
10 CHIP.COUNT@ 2 * * IS PROG.SIZE@      
CREATE ROBOT.PROGRAM                    
  PROG.SIZE@ ALLOT                      
                                        
                                        
VAR CURRENT.INSTRUCTION ( 0-39)         
VAR CURRENT.PANEL   ( 0-9)              
VAR K   ( KEY PRESSED)                  
VAR FUEL.REG   ( 0-1400)                
VAR RANGE.REG  ( 0-8)                   
VAR DAMAGE.REG  ( 0-1400)               
VAR CB+                                 
 ( IS COPY BUFFER FULL?)                
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 3/173 ----------- :)
( OPERATOR CONSTS, CYCLES 11/4/84)      
( 1 IS GOTO'S )                         
0 IS GO.MARKER@ 1 IS GOTO.GO@           
2 IS SUBPANEL@  3 IS BOOMERANG@         
4 IS WIRE@                              
( 2 IS ACT'S )                          
5 IS MOVE@  6 IS PICK.UP@               
7 IS QRAY@  8 IS SING@                  
( 3 IS DET'S )                          
9 IS FEEL.FOR@ 10 IS LOOK.FOR@          
11 IS SMELL@                            
( 4 IS SPEC'S)                          
12 IS COIN@  13 IS KEY@                 
( 5 IS STACK'S   6 IS SOCKET'S)         
14 IS N=@  15 IS N<@                    
16 IS O=@  17 IS M=@                    
18 IS ON.N@ 19 IS ON.O@                 
20 IS ON.M@  21 IS ST-@                 
22 IS PLUS@     23 IS MINUS@            
24 IS SOCKET@  25 IS ACT#@              
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
                                        
23 IS NUM0@ ( 24 IS NUM1@ 25 IS NUM2@   
26 IS NUM3@ 27 IS NUM4@ 28 IS NUM5@     
29 IS NUM6@ 30 IS NUM7@ )               
                                        
31 IS TH#@                              
                                        
                                        
                        

( ----------- Screen 6/176 ----------- :)
( GAMEBOARD DATA)                       
                                        
8 IS SQUARES.WIDE@                      
8 IS SQUARES.HIGH@                      
SQUARES.WIDE@ SQUARES.HIGH@ *           
  IS SQUARE.COUNT@                      
SQUARE.COUNT@ 16 + IS ROOM.SIZE@        
                                        
( CREATE ROOM.DATA( ROOM.SIZE@ ALLOT)   
                                        
53248 IS SC(                            
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
DV  POINTS                              
VAR CYCLE.CT   ( TIME COUNTDOWN)        
                                        
                                        
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
GL%     IS AC@ ( ACT ICON BKGND)        
DG%     IS  TC@ ( THING ICON BKGND)     
DG%     IS WS.BACK.COL@                 
BL%  IS WS.BORD.COL@                    
BL%  IS GM.BORD.COL@                    
 B%    IS NC@ ( NUMBER)                 
 BL%  IS OC@  ( OBJ)                    
 R%   IS  MC@  ( MOV@)                  
 B%    IS VC@   ( VARIOUS)              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
GL%     IS BAK.C  ( BACK COLOR)         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
EXIT                    

( ----------- Screen 9/179 ----------- :)
 ( MENU ITEM STRINGS  )                 
$C G.ON$ " START MISSION"               
$C G.OFF$ " END MISSION"                
$C SE$ " SERIES"                        
$C LM$ " LAST MISSION"                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 10/180 ----------- :)
( ADVENTURE NAMES)                      
                                        
17 8 * $V ADV$(                         
0 ADV$( C!                              
ADV$( " ^^ GREEDVILLE ^^^" $+           
ADV$( " ^ CHIPWIT CAVES ^" $+           
ADV$( " ^^ DOOM ROOMS ^^^" $+           
ADV$( " ^^ PEACE PATHS ^^" $+           
ADV$( " ^ MEMORY LANES ^^" $+           
ADV$( "  OCTOPUS GARDEN ^" $+           
ADV$( "  MYSTERY MATRIX ^" $+           
ADV$( " ^^^ BOOMTOWN ^^^^" $+           
                                        
CREATE CYCLE(                           
 6000 ,  10000 ,  10000 ,  16000 ,      
20000 ,  20000 ,  20000 ,  12000 ,      
                                        
                                        
CREATE TRIP.COUNT(                      
 0 C,  6 C,  0 C, 20 C,                 
 9 C, 32 C,  8 C,  3 C,                 
                                        
8 IS AD#                                
                                        
                                        
                        

( ----------- Screen 11/181 ----------- :)
( SCENARIO.PLAY( ROOM.CT( )             
: D, 10 * C, ;                          
CREATE SCENARIO.PLAY(                   
( CRP.CT) 00 C, 08 C, 08 C, 04 C,       
          03 C, 03 C, 03 C, 03 C,       
( CRP.PT) 00 D, 05 D, 10 D, 03 D,       
          03 D, 01 D, 02 D, 04 D,       
( BNC.CT) 00 C, 00 C, 02 C, 00 C,       
          02 C, 02 C, 02 C, 00 C,       
( BNC.PT) 00 D, 00 D, 25 D, 06 D,       
          06 D, 02 D, 04 D, 00 D,       
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
50 C, 1 C, 1 C, 48 C, 9 C,              
                        

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
    53265 C@ 24 OR 53265 C!  ;          
  : SCREEN.OFF ( ---)                   
    53265 C@ 239 AND  53265 C!  ;       
                                        
 : SPRITES.OFF ( ---)                   
  1 53269 C! ;                          
                                        
                                        
                                        
                        

( ----------- Screen 13/183 ----------- :)
( CW.LOAD CW.SAVE BACK.WIPE )           
: SV0 ( ---^SAVENAME CLEAR)             
  0 SAVENAME C!  ;                      
: DSK ( ---^DISK ACCESS SETUP)          
 SV.SP 0 53269 C! DISK? ;               
                                        
: CW$      ( #---)                      
  2 SAVENAME C!  ( LENGTH)              
  67 SAVENAME 1 + C! ( C)               
  64 + SAVENAME 2 + C! ( #CODE) ;       
: CW.LOAD  ( CW#--)  DSK                
  CW$ ROBOT.PROGRAM SAVENAME LR R.SP ;  
: CW.SAVE ( CW#---) DSK                 
  SV0 ( " S0:TMP1" DOS)                 
  SAVENAME " 0:TMP1" $+                 
  ROBOT.PROGRAM DUP PROG.SIZE@ + SAVE   
( ." 0:TMP1" ) SV0                      
  SAVENAME " S0:C " $+                  
  DUP 64 + SAVENAME 5 + C!              
  SAVENAME DOS ( SAVENAME COUNT TYPE)   
  SV0                                   
  SAVENAME " R0:C =TMP1" $+             
  64 + SAVENAME 5 + C!                  
  SAVENAME DOS ( SAVENAME COUNT TYPE)   
  ;                                     
                        

( ----------- Screen 14/184 ----------- :)
( REC.LAST READ.LAST)                   
: REC.LAST ( --) DSK                    
( " S0:TMP2" DOS )                      
  SV0                                   
  SAVENAME " 0:TMP2" $+                 
  ADVENTURE ADVENTURE 4 + SAVE          
  " S0:AD" DOS                          
  " R0:AD=TMP2" DOS ;                   
                                        
: READ.LAST  ( ---)                     
 ADVENTURE " AD" LR      ;              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
 ( SQUARE.XY SQUARE.XTYT +MOD)          
                                        
: SQUARE.XY  ( SQ# ---X/Y)              
 DUP SQUARES.WIDE@ MOD GAME.WIDTH@ *    
 GAME.X@ +  ( X)                        
 SWAP SQUARES.WIDE@ / GAME.HEIGHT@ *    
 GAME.Y@ +  ( Y) ;                      
                                        
                                        
                                        
: SQUARE.XTYT  ( SQ# ---XTAB/YTAB)      
 DUP SQUARES.WIDE@ MOD 3 * GAME.XT@ +   
 SWAP SQUARES.WIDE@ / 2 * GAME.YT@ + ;  
                                        
                                        
                                        
                                        
: +MOD ( N MOD# --N)                    
  MOD DUP 0< IF DROP 7 THEN ;           
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 18/188 ----------- :)
( WS.OFF)                               
                                        
: WS.OFF ( ---)                         
  9 3 DO I OFF WS( IT+ LOOP ;           
 WS.OFF FORGET WS.OFF                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 19/189 ----------- :)
( COUNT.BADDIES BADDY VARS)             
                                        
VAR CRP#  ( 3 OF CREEPS)                
CREATE CREEPS( 12 ALLOT                 
                                        
                                        
: BAD#  ( ---)                          
 CREEPS( 12 0 FILL                      
 0 CRP#        ! 0 BNC#     !           
 SQUARE.COUNT@ 0 DO                     
  I SQUARE.OBJECT                       
  CASE CREEP@ OF 1 CRP#   +!            
         I CRP#  @ 1-                   
         CREEPS( + C! ;;                
       BOUNCER@ OF                      
         1 BNC#     !                   
         ;;                             
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
 ELSE DDROP THEN ;                      
                                        
: FURNISH.ROOM ( ---)                   
 ADVENTURE @ 1- SCENARIO.PLAY( +        
 DUP C@ CREEP@ PUT.OBJECTS              
 DUP AD#              2* +  C@          
    BOUNCER@ PUT.OBJECTS                
 DUP AD#              4 * + C@          
    OIL@ PUT.OBJECTS                    
 DUP AD#              6 * + C@          
    DISK@ PUT.OBJECTS                   
 DUP AD#              8 * + C@          
    COFFEE@ PUT.OBJECTS                 
     AD#              9 * + C@          
    PIE@ PUT.OBJECTS ;                  
                        

( ----------- Screen 21/191 ----------- :)
( ROOM DATA CLEAR.ROOMS)                
VAR VIS#  ( # OF ROOMS VISITED)         
  CREATE ROOM( 50 ALLOT ( MAX ROOMS)    
: CLEAR.ROOMS( ROOM( 50 0 FILL          
  0 VIS#    ! ;                         
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
      VIS#   @ 1+ DUP                   
      TRIP.COUNT( ADVENTURE @ 1- + C@   
      = IF DROP CLEAR.ROOMS(            
    ELSE VIS#   ! THEN                  
   ELSE DROP CHUCK.GOODS THEN (         
    ( BEEN HERE)                        
  ELSE DROP THEN ;                      
                                        
                                        
                                        
                        

( ----------- Screen 22/192 ----------- :)
( LOAD.ROOM )                           
                                        
: LOAD.ROOM ( ROOM#---)  DUP 1-         
  SC(   SWAP ROOM.SIZE@ * +             
  ROOM.DATA( ROOM.SIZE@                 
  SWAPOUT CMOVE SWAPIN                  
  DUP ADVENTURE @ 4 = NOT SWAP          
  2 MOD 0= OR                           
  IF FURNISH.ROOM THEN                  
  BAD#                                  
  GOODS.CHECK ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 23/193 ----------- :)
 ( SU.PN ( SETUP.PANEL)                 
                                        
                                        
: SU.PN 25 0 DO I 40 * >R ( INDEX)      
  FIRST 2000 + R@ + 'SCREEN R@ +        
  26 CMOVE                              
  FIRST 3000 + R@ + COLOR-MEM R> +      
  26 CMOVE LOOP ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 24/194 ----------- :)
 ( SOUND WS SOUNDS)                     
                                        
: SOUND ( FREQ/A/D/S/R/VOL/WAVE)        
 ( PULSEWD/CUTOFF/RES/FILT/--)          
 V1 OFF V-CTRL  V-D                     
  >R F1    RF                           
 F-FREQ  V-PW                           
 >R >R                                  
 V-SR V-AD  V-F                         
 R> R> R>  ( VOL/WAVE/FILT)             
 ROT MV                                 
 V-CTRL ;                               
 HEX                                    
 : THING.S  23FB 0 8 0 2 F              
  S#       0 335 0 BP SOUND ;           
 : PANEL.S 1BF5 3 A 0 2 F               
  P#    627 239 9 BP SOUND ;            
 : OP.S 1EF5 3 7 0 2 F                  
  T#       0 0 4 HP  SOUND ;            
  : WIRE.S 06F5 0 8 0 2 F               
 S#       0 435 1 LP  SOUND ;           
  DECIMAL                               
                                        
                                        
                                        
                        

( ----------- Screen 25/195 ----------- :)
 ( GM.SC DB.FL)                         
                                        
 : GM.SC  ( ---)                        
 ( FLIP IN THE GAME GRAPHIC SCREEN)     
  1 M-C                                 
  FIRST 'SCREEN 1000 CMOVE              
  FIRST 1000 + COLOR-MEM 1000 CMOVE     
  BAK.C BK                              
  GM.BORD.COL@ BD                       
   5 2 D-POSITION  B%    CHAR.COLOR     
  ADV$( ADVENTURE @ 1- 17 * + 1+        
  17 TYPE  ;                            
                                        
: DB.FL  ( ---^ DEBUG FILL SCREEN)      
  'SCREEN 64 + 16  33 FILL              
  COLOR-MEM 64 + 16 BL%  FILL           
  'SCREEN 24 40 * + 26 + 14 33 FILL     
  COLOR-MEM 24 40 * + 26 + 14 GL%       
  FILL   GL%     CHAR.COLOR             
 25 2 DO  26 I D-POSITION ." !" LOOP    
 24 2 DO  39 I D-POSITION ." !" LOOP ;  
                                        
                                        
                                        
                                        
EXIT                    

( ----------- Screen 26/196 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 27/197 ----------- :)
 ( SOUNDS)     HEX                      
 : MOVE.S  14D 0 7 D 0 F                
   P#    3FC A3 B BP  SOUND ;           
                                        
 : BUMP.S 5C3 0 A 0 0 F                 
   N#    0  38C E LP  SOUND ;           
 : ZAP.SD  3F68 6 B 5 0 F               
   P#    527 247 1 HP SOUND ;           
 : CRUNCH     5F5 3 4 0 0 F             
   P#    527 435 4 LP SOUND ;           
 : SEE.SD  71C0 9 4 0 0 D               
   T# 0 187 4 HP  SOUND ;               
 : ARM.S  250 3 9 7 0 F                 
   P#    627 147 1 HP SOUND ;           
 : CREEP.S 5000 IRND 2000 + 0 5 3 0     
 F P# 200 0 F HP SOUND FRAME FRAME      
FRAME FRAME 9000 IRND 1000 + 2 3 0 0 F  
  P#    223 0 E HP  SOUND ;             
 : FEEL.S 4BC 0 8 0 0 A                 
   S#       0 386 F LP  SOUND ;         
 : FLASH.S 1368 2 B 0 0 F               
  N#    0 447 4 LP SOUND ;              
 : BOOM.S 3C3 1 B 0 0 F                 
  N#    0 35E 9 LP  SOUND ;             
 DECIMAL                                
                        

( ----------- Screen 28/198 ----------- :)
 ( ROB?)                                
 VAR ROB+   0 ROB+ !                    
: ROB? ( ---?FLAG^SHOW ROBOT?)          
 GAME.STATUS @ DEBUG.ON@ = NOT          
 ROB+ @ OR ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
  DEBUG? IF DROP DROP DROP ELSE         
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
  SWAP R> 4 - 7 *  OBJ.BLOCK( +  OBJ.   
  THEN ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
  DEBUG? OR                             
  IF DROP 0 THEN ( NOT MOVE OR DEBUG)   
  DUP 0= IF DROP ELSE                   
    ROBOT.SQUARE @ +  ( BLOCK SQUARE)   
    SQUARE.XY                           
    S2 S-POSITION OFF S-ENABLE          
    187 S-PT                            
    0 S-P ON S-ML                       
    OFF S-YEXP OFF S-XEXP               
   53283 C@ S-C 53282 C@ 0 S-M          
   W%    1 S-M                          
   255 53269                            
   FRAME C!  ( ENABLE ALL SPRITES)      
  THEN ;                                
: ERASE.ROBOT ( ---)                    
  1 53269 C! ;                          
                        

( ----------- Screen 36/206 ----------- :)
( CW.OP.MOUTH)                          
                                        
: CW.OP.MOUTH ( ---^OPEN CW'S MOUTH)    
 S4 W%    S-C ROBOT.ORIENTATION @       
 7 * 129 + FRAME  S-PT ;                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 37/207 ----------- :)
( INIT.CW DRAW.ROBOT CW.ANIM)           
CREATE CW.XY( 12 ALLOT ( XY ARRAY)      
: CW.XY! ( X/Y/SPR#---) 2- 2*           
  CW.XY( + DUP 1+ ROT SWAP C! C! ;      
 VAR CW.X VAR CW.Y                      
 : CW.GO ( X/Y---)                      
  DDUP CW.Y ! CW.X !                    
  19 - ( OFFSET UPWARDS)                
  DDUP 2 CW.XY!  DDUP 3 CW.XY!          
  DDUP 6 CW.XY!                         
  12 +  ( LOWER BODY SPRITES)           
  DDUP 4 CW.XY!  DDUP 5 CW.XY!          
  7 CW.XY!                              
  56334 C@ 254 AND 56334 C!             
  FRAME      CW.XY( 53252 12 CMOVE      
  56334 C@ 1 OR 56334 C! ;              
 : INIT.CW ( ---)                       
 ( START CW AT RIGHT X/Y)               
 ROBOT.SQUARE @ SQUARE.XY SWAP 1-       
 SWAP CW.GO ;                           
 : CW.ANIM  ( DX/DY---)                 
  S4 ROBOT.ORIENTATION @                
  7 * 128 + ( FRAME)   S-PT             
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
( DESTROY)                              
                                        
                                        
 : DESTROY ( SQ#---)                    
   DUP ROOM.DATA( + FLOOR@ SWAP C!      
   ( PUT FLOOR IN ROOM.DATA( )          
   DEBUG? NOT                           
   IF SQUARE.XTYT FLOOR@ 4 - 7 *        
     OBJ.BLOCK( + OBJ.                  
   ELSE DROP THEN ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 40/210 ----------- :)
( FLASH.CW)                             
                                        
 : FLASH.CW  ( #FLASHES---)             
(  V1 V-D N#    V-CTRL)                 
   0 DO                                 
    53289 1024 6 CMOVE ( SAVE COLORS)   
    6 0 DO 16 IRND 53289 I + C! LOOP    
     ( RANDOM COLORS  )  FLASH.S        
  FRAME  2000 IRND V-F                  
  FRAME FRAME FRAME 1024 53289 6 CMOVE  
   LOOP  ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
   CW.ANIM MOVE.S ;                     
                                        
 : CW.BACK ( ---^CW REVERSE)            
   ROBOT.ORIENTATION @ 4 + 8 MOD        
   ORIENT.XY                            
   CW.ANIM MOVE.S ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
 DUP 0< IF -1 ELSE 0 THEN ( MAKE DBL)   
  POINTS D@ D+ DDUP 0. D<               
  IF DDROP 0. THEN ( NOT BELOW 0)       
  DDUP POINTS D!                        
  DEBUG? IF DDROP                       
  ELSE 2 5 D-POSITION D. THEN           
  ;                                     
                                        
: COUNT.CYCLE ( CYCLES---)              
  CYCLE.CT @ + DUP CYCLE.CT !           
  19 5 D-POSITION                       
  DUP 1 < IF DROP 0 GAME.FINISHED@      
          PROG.STATUS ! THEN            
  DEBUG? IF DROP                        
  ELSE B%   CHAR.COLOR ABS .  THEN ;    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 44/214 ----------- :)
( CALC.ROBOT.MOVE BOOM ?BOOM)           
 FORTH                                  
 : CALC.MOVE ( --- NEXT SQ#)            
  ROBOT.ORIENTATION @                   
   ARG.BYTE C@ 64 MOD CHECK.MOV.ST      
   REVERSE@ = IF 4 + 8 MOD THEN         
   ROBOT.SQUARE @ NEXT.SQUARE ;         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 45/215 ----------- :)
( GOTO.NEXT.ROOM)                       
                                        
: NEXT.ROOM ( SQ#---NEXTROOM SQ#)       
 ERASE.ROBOT  ( FROM LAST ROOM)         
 0 ROBOT.SQUARE @ 0 DO                  
   I SQUARE.OBJECT DOOR@ = IF 1+ THEN   
 LOOP                                   
 DUP 8 +  ( NEXT ROOM/NEXT SQ^ )        
 ROOM.DATA( SQUARE.COUNT@ + + C@        
 ROBOT.SQUARE !                         
 ( GET NEXT DOOR SQ FROM AND STORE)     
 ROOM.DATA( SQUARE.COUNT@ + + C@        
 LOAD.ROOM      0 ADD.POINTS            
 ( LOAD NEXT ROOM#)                     
 INIT.CW                                
 DRAW.GAMEBOARD                         
 ROB? IF CW.INIT THEN                   
 DROP CALC.MOVE ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 46/216 ----------- :)
 ( CHECK.FOR.NEXT.ROOM)                 
                                        
: CHECK.NEXT ( NEXTSQ--NEXTSQ)          
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
  IF NEXT.ROOM THEN                     
THEN ;                                  
                                        
                                        
                                        
                        

( ----------- Screen 47/217 ----------- :)
( BUMP)                                 
: BUMP ( OBJ #MOVES---OBJ)              
( INIT.CW ( ???)                        
  ARG.BYTE C@ 64 MOD CHECK.MOV.ST       
  FORWARD@ =                            
  IF 0 DO CW.SLIDE LOOP                 
  ELSE 0 DO CW.BACK LOOP THEN           
  BUMP.S 10 0 DO FRAME LOOP             
  53265 C@ 8 - 53270 C@ 8 -             
 7 0 DO DUP 7 IRND +  53270 FRAME C!    
  SWAP DUP 4 IRND +  53265 FRAME C!     
    SWAP LOOP FRAME 53270 C! 53265 C!   
  53265 3 MASK SBIT 53270 3 MASK SBIT   
  DUP DUP BOUNCER@ = SWAP CREEP@ = OR   
  IF 5 FLASH.CW 50 UPDATE.DAMAGE        
   50 UPDATE.DAMAGE THEN                
  INIT.CW 50 UPDATE.DAMAGE ;            
VAR EXPLODED ( WAS THERE EXPLOSION?)    
 : BOOM ( ---) S2 OFF S-ENABLE          
 ROBOT.ORIENTATION @ ROBOT.SQUARE @     
 NEXT.SQUARE DESTROY 0 0 BUMP DROP      
 30 CW.Y @ DO CW.X @ I CW.GO -4 +LOOP   
  20000 UPDATE.DAMAGE 1 EXPLODED ! ;    
: ?BOOM ( OBJ ---OBJECT) 0 EXPLODED !   
 DUP BOMB@ = IF BOOM THEN ;             
                        

( ----------- Screen 48/218 ----------- :)
( MOVE)                                 
: WT ( #---) 40 * 0 DO LOOP ;           
: MOVE ( ---)                           
  CALC.MOVE CHECK.NEXT                  
  DUP SQUARE.OBJECT DUP FLOOR@ =        
  SWAP DOOR@ = OR                       
  IF   ( OK TO MOVE)                    
    INIT.CW ( ???)                      
    ARG.BYTE C@ 64 MOD CHECK.MOV.ST     
    FORWARD@ =                          
    IF 8 0 DO CW.SLIDE LOOP             
    ELSE 8 0 DO CW.BACK 1 WT LOOP       
    THEN                                
    ROBOT.SQUARE !                      
  ELSE  ( HIT SOMETHING)                
    SQUARE.OBJECT DUP WALL@ =           
    IF 1 BUMP DROP                      
    ELSE 2 BUMP ?BOOM DROP THEN         
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
    MOVE.S CW.POINT FRAME FRAME FRAME   
   MOVE.S                               
   ELSE DROP MOVE                       
   THEN                                 
   EXPLODED @ NOT                       
   IF DRAW.ROBOT MOVE.S THEN            
 ELSE DROP THEN                         
 V1 OFF V-CTRL ;                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 50/220 ----------- :)
( SIGHTLINE )                           
                                        
: SIGHTLINE ( XST/YST/XEND/YEND---)     
  ROB? IF                               
    3 PICK - SWAP 4 PICK - SWAP         
    DSWAP   ( XD/YD/XS/YS)              
    S2 ON S-ENABLE V1                   
    21 1 DO                             
      4 PICK I * 20 / 3 PICK + ( X)     
      4 PICK I * 20 / 3 PICK + ( Y)     
      S-POSITION                        
      OP.BYTE C@ 64 MOD                 
      QRAY@ = IF 16 IRND S-C            
      16200 I 400 * - V-F  THEN         
    LOOP                                
  THEN DDROP DDROP      ;               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 51/221 ----------- :)
( ZAPPER RETRACT.ZAPPER )               
                                        
: ZAPPER  ( ---)  S2 OFF S-ENABLE       
 ROB? IF                                
  S2 OFF S-ENABLE                       
  185 S-PT                              
  ROBOT.SQUARE @ SQUARE.XY              
  31 -  ( Y UP OFFSET)                  
  SWAP 2 - SWAP S-POSITION              
  W%    S-C                             
  0 S-P 0 S-ML                          
  0 S-YEXP 0 S-XEXP                     
  255 53269 FRAME C!                    
 THEN ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 52/222 ----------- :)
( ZAP.RAY)                              
                                        
: ZAP.RAY  ( TARG SQ#---)               
  DUP ROBOT.SQUARE @ SQUARES.WIDE@ -    
  = NOT  ROB? AND   ( NOT UNDER HEAD)   
  IF                                    
    S2                                  
    >R ROBOT.SQUARE @ SQUARE.XY 30 - R> 
    SQUARE.XY ZAP.SP                    
  OFF S-ENABLE 205 S-PT SIGHTLINE       
  ELSE DROP THEN                        
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 53/223 ----------- :)
( EAT.IT ZAP.IT)                        
: EAT.IT ( SQ#---)                      
  DUP SQUARE.OBJECT                     
  CASE PIE@ OF 1200 UPDATE.FUEL ;;      
    COFFEE@ OF 1200 UPDATE.FUEL ;;      
    OIL@ OF SCENARIO.PLAY(              
      AD#              5 * +            
      ADVENTURE @ 1- + C@ ADD.POINTS ;; 
   DISK@ OF SCENARIO.PLAY(              
      AD#              7 * +            
      ADVENTURE @ 1- + C@ ADD.POINTS ;; 
  ENDCASE  DESTROY ;                    
: ?PEACE ADVENTURE @ 4 =                
   IF NEGATE THEN ;                     
: ZAP.IT ( SQ#--) DUP SQUARE.OBJECT     
  CASE CREEP@ OF SCENARIO.PLAY(         
     AD#              + ADVENTURE @ 1-  
     + C@ ?PEACE ADD.POINTS ;;          
     BOUNCER@ OF SCENARIO.PLAY(         
     AD#              3 * + ADVENTURE @ 
     1- + C@ ?PEACE ADD.POINTS          
     0 BNC#     ! ;;                    
   BOMB@ OF 253 53269 C! BOOM ;;        
  ENDCASE EXPLODED @ NOT                
  IF DESTROY ELSE DROP THEN ;           
                        

( ----------- Screen 54/224 ----------- :)
( ZAP)                                  
: WAIT 200 * 0 DO LOOP ;                
: ZAP ( ---) ROBOT.ORIENTATION @        
 ROBOT.SQUARE @                         
 NEXT.SQUARE CHECK.NEXT DROP            
 ROBOT.SQUARE @                         
 8 0 DO                                 
  ROBOT.ORIENTATION @ SWAP NEXT.SQUARE  
  DUP SQUARE.OBJECT   ( TSQ#/OBJ#)      
  DUP FLOOR@ =                          
  IF DROP ( JUST FLOOR)                 
  ELSE ZAPPER  10 WAIT                  
    OVER  ZAP.SD  ZAP.RAY BUMP.S        
                                        
    DUP WALL@ = SWAP DOOR@ = OR         
    IF ( DUP ZAP.RAY)                   
    ELSE DUP ( DUP ZAP.RAY) ZAP.IT      
    THEN                                
    ROB? IF 253 53269 C! THEN LEAVE     
                                        
  THEN                                  
 LOOP DROP  ;                           
                                        
                                        
                                        
                        

( ----------- Screen 55/225 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 56/226 ----------- :)
 ( MOVE.ARM  ARM.PREP)                  
: ARM.PREP (  ---^GET READY FOR ARM)    
  ROB? IF S2 OFF S-ENABLE W%    S-C     
  OFF S-ML OFF S-XEXP                   
  ON S-YEXP 0 S-P ARM.S THEN ;          
                                        
: ARM.XY ( ORIENTATION---SPRITE OFFX/Y) 
  2 * ARM.PT( + @ SPLIT  ROBOT.SQUARE @ 
  SQUARE.XY 15 - SWAP 10 +              
 ( HEAD OFFSET) ( ARM.X/Y/HEADOFFY/X)   
  4 ROLL - ROT ROT SWAP - ;             
: MOVE.ARM ( ARM#--)  S2                
  DUP 0 = IF N ARM.XY S-POSITION        
  190 S-PT ON S-ENABLE DROP             
  ELSE 1- 188 + ROBOT.ORIENTATION @     
    2 * + ROBOT.ORIENTATION @ ARM.XY    
    FRAME                               
    S-POSITION ON S-ENABLE  S-PT THEN ; 
: ARM.OUT ( ---) ROB? IF  ARM.PREP      
 3 0 DO I MOVE.ARM 5 WAIT               
  LOOP   OFF V-CTRL THEN ;              
: ARM.IN ( ---)  ROB? IF                
 -1 2 DO I MOVE.ARM 2 WAIT              
 -1 +LOOP   ARM.PREP THEN OFF V-CTRL    
 ;                                      
                        

( ----------- Screen 57/227 ----------- :)
( SING)                                 
                                        
: SING ( ---)                           
 GET.ARG ARG.BYTE C@ 64 MOD             
 CHECK.NUM.ST                           
 NUM0@ - 0 MAX 7 MIN DUP                
 NUM.EMPTY@ = NOT                       
 IF CW.OP.MOUTH 4 8 V-AD 0 0 V-SR       
  CASE                                  
    0 OF 48 ;; 1 OF 50 ;;               
    2 OF 52 ;; 3 OF 53 ;;               
    4 OF 55 ;; 5 OF 57 ;;               
    6 OF 59 ;; 7 OF 60 ;;               
 ENDCASE P.N   5 WAIT                   
   0 0 CW.ANIM                          
 ELSE DROP THEN ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 58/228 ----------- :)
( PICK.UP ACT)                          
: PICK.UP ( ---)                        
 ROB.OR.SQ@                             
 NEXT.SQUARE CHECK.NEXT                 
 ARM.OUT CW.OP.MOUTH                    
 DUP SQUARE.OBJECT ?BOOM                
 DUP DUP WALL@ = SWAP CREEP@ = OR       
 SWAP BOUNCER@ = OR                     
 IF SQUARE.OBJECT WALL@ =               
  IF BUMP.S 50 UPDATE.DAMAGE  ARM.IN    
  ELSE 5 FLASH.CW 150 UPDATE.DAMAGE     
  ARM.IN THEN                           
 ELSE DUP SQUARE.OBJECT                 
  DUP DUP FLOOR@ = SWAP DOOR@ = OR      
  SWAP BOMB@ = OR NOT                   
  IF EAT.IT  ARM.IN                     
    5 0 DO CRUNCH 5 WT  0 0 CW.ANIM     
   CRUNCH 5 WT CW.OP.MOUTH LOOP         
    CRUNCH 0 0 CW.ANIM                  
 ELSE DROP ARM.IN THEN THEN ; EXIT      
: ACT ( OPCODE ---)                     
  CASE QRAY@ OF ZAP ;;                  
SING@ OF SING ;; PICK.UP@ OF PICK.UP ;; 
MOVE@ OF GET.ARG MOVE.ROBOT ;;          
ENDCASE ;                               
                        

( ----------- Screen 59/229 ----------- :)
 ( FEEL)                                
                                        
 : FEEL ( OBJECT ---)                   
 ROB.OR.SQ@                             
 NEXT.SQUARE CHECK.NEXT                 
 ROB? IF                                
   S2 OFF S-ENABLE OFF S-ML             
   ON S-YEXP OFF S-XEXP B%  S-C         
   ADVENTURE @ 3 = IF Y%  S-C THEN      
   0 S-P                                
   ROBOT.ORIENTATION @  DUP             
   ARM.XY S-POSITION                    
   DUP N = IF DROP 190                  
   ELSE 204 + THEN S-PT                 
   FRAME ON S-ENABLE                    
   FEEL.S  5 WAIT                       
 THEN                                   
 SQUARE.OBJECT ?BOOM                    
 = NOT  ( DON'T FEEL IT)                
 IF FALSE.FLOW THEN                     
 ROB? IF S2 OFF S-ENABLE THEN ;         
                                        
                                        
                                        
                                        
                        

( ----------- Screen 60/230 ----------- :)
( LOOK)                                 
VAR SEEN                                
: LOOK ( OBJECT---) OFF SEEN ! S3       
 ROB.OR.SQ@                             
 DDUP NEXT.SQUARE CHECK.NEXT            
 DROP                                   
 8 0 DO  ( SEARCH LOOP)                 
   DDUP NEXT.SQUARE SWAP DROP           
   DUP SQUARE.OBJECT DUP                
   FLOOR@ =                             
   FLOOR@ ARG.BYTE C@ 64 MOD = NOT AND  
   ( FLOOR NOT LOOKED FOR)              
   IF DROP ( JUST FLOOR)                
     ELSE ( OVER SIGHTLINE ) 4 PICK =   
   IF  ( SEARCH OBJECT SEEN)            
     SEE.SD Y% S-C   ( FLASH GLASSES)   
     ON SEEN !                          
     I 1+ UPDATE.RANGE ( SQS TO OBJ)    
     THEN LEAVE                         
   THEN                                 
 LOOP                                   
 SEEN @ 0= IF SEE.SD 3000 V-F R% S-C    
 FALSE.FLOW THEN ( CORRECT OBJ UNSEEN)  
 DROP DDROP 18 WT   G% S-C ;            
                                        
                        

( ----------- Screen 61/231 ----------- :)
( SMELL DETECT )                        
                                        
: SMELL ( OBJECT---)                    
  FALSE.FLOW  ( ASSUME FALSE)           
  SQUARE.COUNT@ 0 DO                    
    DUP I SQUARE.OBJECT =               
 ( COMPARE SEARCH ITEM W SQUARE IT)     
    IF THIS.CHIP 2* ROBOT.PROGRAM +     
     C@ 192 AND FLOW.CODE !             
     ( TRUE.FLOW)                       
     LEAVE THEN                         
  LOOP DROP ;                           
                                        
: D?  ( ---OBJ/FLAG   )                 
 ARG.BYTE C@ 64 MOD CHECK.OBJ.ST        
 DUP OBJ.EMPTY@ = NOT ;                 
: DF DROP FALSE.FLOW ;                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 62/232 ----------- :)
( KEYPRESS UPDATE.KEY)                  
                                        
: KEYPRESS ( ---)                       
 K @ ARG.BYTE C@ 64 MOD                 
 =  ( KEY TEST = LAST PRESSED?)         
 IF ( RIGHT KEY)                        
   NO.KEY@ K !                          
 ELSE FALSE.FLOW THEN ;                 
                                        
                                        
: UP.KEY ( ASC ---)                     
( UPDATES AND DISPLAYS KEY PRESSED)     
DUP 65 90 WITHIN NOT                    
IF DROP NO.KEY@ 64 + THEN 64 -          
37 4 D-POSITION                         
DUP NO.KEY@ = IF ." !"                  
0 197  C!  ( RESET KBRD)                
ELSE DUP 64 + EMIT THEN                 
K ! ;                                   
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 63/233 ----------- :)
( COIN SPECIAL)                         
                                        
: COIN ( ---)                           
  2 IRND 0=                             
  IF FALSE.FLOW THEN ;                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 64/234 ----------- :)
( SUBP BMR)                             
                                        
VAR R^                                  
                                        
: SUB ( ---^SUBPANEL)                   
 CURRENT.INSTRUCTION @ R^ !             
 ARG.BYTE C@ 64 MOD                     
 CURRENT.PANEL !                        
 -1 CURRENT.INSTRUCTION !               
 RIGHT.F@ FLOW.CODE ! 0 HOT.CHIP ! ;    
                                        
: BMR ( ---^BOOMERANG)                  
 0 CURRENT.PANEL !                      
 R^ @ CURRENT.INSTRUCTION !             
 ROBOT.PROGRAM THIS.CHIP 2* +           
 C@ 192 AND FLOW.CODE !                 
  ( NEW.FLOW)                           
 ;                                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 65/235 ----------- :)
( STEP? SPD)                            
                                        
                                        
 : STEP? STEP @                         
  IF 2 WT BEGIN DO.EVENTS 2 WT B.D @    
   STEP  @ NOT  OR UNTIL                
  THEN ;                                
 : SPD DB.SP @ 0 DO LOOP ;              
                                        
 : B- ( --) STEP @ IF BEGIN B.D @ NOT   
 DO.EVENTS UNTIL THEN ;  ( BUTTON OFF)  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 66/236 ----------- :)
( CHIP#.     CALC.INST)                 
VAR PN#                                 
: CHIP#.  ( ---^PRINTS CHIP #)          
  CURRENT.INSTRUCTION @                 
  BL%  CHAR.COLOR 32 4 D-POSITION       
  DUP 8 / 1 +  . 33 4 D-POSITION        
  R%   CHAR.COLOR 8 MOD 1+ . ;          
: CALC.INST ( ---)                      
 OP.BYTE C@ DUP GOTO.GO@ = SWAP         
 SOCKET@ = OR IF 0 ( JUMP TO 0)         
ELSE CURRENT.INSTRUCTION @ FLOW.CODE @  
 CASE UP.F@ OF 8 - ;; DOWN.F@ OF 8 + ;; 
     LEFT.F@ OF 1- ;;                   
    RIGHT.F@ OF 1+ ;; ENDCASE           
 THEN CURRENT.INSTRUCTION !             
 DEBUG? IF CURRENT.INSTRUCTION @        
   S2 186 S-PT                          
   ON S-YEXP ON S-XEXP OFF S-ML         
   CURRENT.PANEL @ PN# @ = NOT IF       
     DUP HOT.CHIP ! CURRENT.PANEL @ DUP 
  S2 OFF S-ENABLE PANEL.DRAW            
  CURRENT.INSTRUCTION @ CURSOR.CHIP     
  CHIP#.       ON S-ENABLE              
 PN# ! PANEL.HILIGHT THEN  SPD STEP?    
 CURSOR.CHIP CHIP#. B- THEN CHIP#. ;    
                        

( ----------- Screen 67/237 ----------- :)
 ( OP.CASE)                             
 : OP.CASE ( OPCODE--) GET.ARG          
CASE GO.MARKER@ OF NO.KEY@ UP.KEY       
 28 4 D-POSITION CURRENT.PANEL @        
 ."  " 65 + EMIT I-T ;;  SUBPANEL@      
 OF SUB ;; BOOMERANG@ OF BMR ;;         
 QRAY@ OF ZAP ;; SING@ OF SING ;;       
 PICK.UP@ OF PICK.UP ;;                 
 MOVE@ OF MOVE.ROBOT ;;                 
FEEL.FOR@ OF D? IF FEEL ELSE DF THEN ;; 
LOOK.FOR@ OF D? IF LOOK ELSE DF THEN ;; 
 SMELL@ OF D? IF SMELL ELSE DF THEN ;;  
 COIN@ OF COIN ;; KEY@ OF KEYPRESS ;;   
N=@ OF AR@ NUM= ;; N<@ OF AR@ NUM< ;;   
O=@ OF AR@ OBJ= ;; M=@ OF AR@ MOV= ;;   
ON.N@ OF AR@ ON.N ;;  ON.O@ OF AR@      
ON.O ;; ON.M@ OF AR@ ON.M ;;            
ST-@ OF AR@ D.STK ;; PLUS@ OF PLUS ;;   
MINUS@ OF MINUS ;;                      
ENDCASE ;                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 68/238 ----------- :)
( EXECUTE.ROBOT.INSTRUCTION)            
                                        
: DO.INST ( --)                         
 S2 OFF S-ENABLE                        
 PROG.STATUS @ DUP GAME.ON@ =           
 SWAP SERIES@ = OR                      
 IF ?TERMINAL DUP                       
  IF UP.KEY ELSE DROP THEN              
  GET.ACTION                            
  DUP CYCLES( + C@ NEGATE COUNT.CYCLE   
  DUP FUEL( + C@ NEGATE UPDATE.FUEL     
  OP.CASE                               
  DEBUG? IF CURRENT.INSTRUCTION @       
    CURSOR.CHIP THEN                    
  CALC.INST                             
 THEN ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 69/239 ----------- :)
( INIT.GAME)                            
                                        
: INIT.GAME ( ---)                      
  GAME.CHAR                             
  OFF GAME.STATUS !                     
  CW.INIT                               
  0. POINTS D!   0 PN# !                
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
   INIT.CW                              
   M.NAMES ;                            
                                        
                                        
                                        
                        

( ----------- Screen 70/240 ----------- :)
 ( START.GAME STOP.GAME )               
: LEAVE.GAME ( ---)                     
   1 G.ON$ GAMES$ GAMES( S.IT$          
   2 ON  GAMES( IT+                     
   1 OFF OP( IT+ L.DB                   
   2 SE$ GAMES$ GAMES( S.IT$ ;          
 : START.GAME ( ---)                    
  1 G.OFF$ GAMES$ GAMES( S.IT$          
  FRAME  SCREEN.OFF  INIT.GAME          
   GM.SC   NAME.                        
   GM.BORD.COL@ BD  CHIP#.              
   0 UPDATE.DAMAGE  0 UPDATE.RANGE      
   0 ADD.POINTS  0 COUNT.CYCLE          
   0 UPDATE.FUEL  CLEAR.STACKS          
  FRAME   SCREEN.ON DRAW.GAMEBOARD      
  1 ON OP( IT+                          
   PROG.STATUS @ SERIES@ =              
   NOT IF GAME.ON@ PROG.STATUS ! THEN ; 
 : STOP.GAME ( ---)                     
   PROG.STATUS @ SERIES@ = NOT IF       
     GAME.OFF@ PROG.STATUS !            
     LEAVE.GAME THEN ;                  
                                        
                                        
                                        
                        

( ----------- Screen 71/241 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 72/242 ----------- :)
  ( GAME)                               
: GAME ( ---)                           
                                        
  BEGIN  BADS                           
   DO.INST                              
( V1 OFF V-CTRL )                       
                                        
(  0 22 D-POSITION DEPTH DUP .          
   0> IF DUP . THEN  )                  
   DO.EVENTS                            
  PROG.STATUS @ DUP GAME.ON@ =          
  SWAP SERIES@ = OR NOT UNTIL           
                                        
   UPDATE.STATS                         
  PROG.STATUS @ WORKSHOP.ON@ = NOT      
  IF STATS.SCREEN THEN                  
  LEAVE.GAME ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 73/243 ----------- :)
 ( INIT.CHIPWITS)                       
: INIT.CHIPWITS ( ---)                  
  0 198 C!  ( KEYBD BUFF 0)             
  128 657 C! ( DISB SFT/COMM)           
  193 792 C! ( SHIFT RESTORE)           
  GAME.OFF@ PROG.STATUS ! 0 BNC^ !      
  S4 W% S-C  S6 LR% S-C S5 W% S-C       
  S3 G% S-C S7 B% S-C S8 B% S-C         
  READ.LAST CW.NUM @ CW.LOAD LOAD.STATS 
  FIRST " CW.CHR" LR   SWAPOUT          
  FIRST 53248 2816 CMOVE SWAPIN         
  FIRST " CW.SCR"  LR  LOAD.NAMES       
  1024 " JS" LR J?  ( KOAL OR JOYST)    
  2048 192 - " CW.BNC" LR               
  SCREEN.OFF  7 CHARBASE S.I            
  G.M.I B% M.BAK1 SWAPOUT               
  53248 62720 2816 CMOVE SWAPIN         
 OFF GAME.CHAR? !                       
 ADVENTURE @ AD.M                       
 57344 " CW.SPR" LR  I-JOY              
  START.GAME  STOP.GAME  LEAVE.GAME     
  0 CB+ !  ( NO PASTE PANEL) M.NAMES    
  FK ( CHECK FOR AND KILL FASTLOAD)     
   ;                                    
                                        
                        

( ----------- Screen 74/244 ----------- :)
( S^ DIE END SERIES)                    
: S^ DEBUG? IF DB- STATS.SCREEN THEN    
 2 7 D-POSITION BL% CHAR.COLOR  ;       
: DIE ( -) TURN.GAME.OFF@ PROG.STATUS ! 
  S^ FUEL.REG @ 1 <                     
  IF ."   I RAN OUT OF FUEL"  ELSE      
." I AM ENTIRELY BROKEN"  THEN ;        
: END ( ---^GAME OVER NORMALLY)         
  PROG.STATUS @ SERIES@ = NOT IF        
  TURN.GAME.OFF@ PROG.STATUS ! THEN     
  S^ ."   I FINISHED THE GAME"       ;  
: SERIES  START.GAME 0 LAST.MISSION !   
  GAME PROG.STATUS @ DUP DUP            
  WORKSHOP.ON@ = SWAP                   
  TURN.GAME.OFF@ = OR SWAP              
  GAME.OFF@ = OR NOT                    
  LAST.MISSION @ NOT AND                
  IF SERIES@ PROG.STATUS !              
    2 LM$ GAMES$ GAMES( S.IT$           
    1 G.OFF$ GAMES$ GAMES( S.IT$        
    8000 0 DO DO.EVENTS LOOP            
    PROG.STATUS @ GAME.ON@ = IF         
      TURN.GAME.OFF@ PROG.STATUS ! THEN 
  THEN ;                                
                                        
                        

( ----------- Screen 75/245 ----------- :)
 ( CW       )                           
                                        
: CW       ( ---)                       
  INIT.CHIPWITS                         
  BEGIN 1000 IRND DROP  I-T             
   PROG.STATUS @                        
    CASE GAME.OFF@ OF DO.EVENTS ;;      
         GAME.ON@ OF                    
   2 OFF GAMES( IT+  GAME ;;            
    TURN.GAME.ON@ OF START.GAME ;;      
       SERIES@ OF SERIES ;;             
   TURN.GAME.OFF@ OF STOP.GAME ;;       
    GAME.ABORTED@ OF DIE     ;;         
    GAME.FINISHED@ OF END     ;;        
     WORKSHOP.ON@ OF WORKSHOP ;;        
     WORKSHOP.OFF@ OF  W.LEAVE          
       GAME.ON@ PROG.STATUS !           
       START.GAME                       
       STOP.GAME LEAVE.GAME ;;          
    ENDCASE                             
  AGAIN ;                               
                                        
                                        
                                        
                                        
                        

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
   Y%     8 +  0 OBJ(,  ( PIE)          
   G%     8 +  1 OBJ(, ( COFFEE)        
   BL%    8 +  2 OBJ(, ( DISK)          
   BL%    8 +  3 OBJ(, ( OIL)           
   W%     8 +  4 OBJ(, ( FLOOR)         
   R%     8 +  5 OBJ(, ( BOMB)          
   R%     8 +  6 OBJ(, ( BOUNCER1)      
   P%     8 +  9 OBJ(, ( CREEP1)        
   W%     8 + 13 OBJ(, ( WALLTOP)       
   11         15 OBJ(, ( DOOR)          
   W%     8 + 14 OBJ(, ( WALLSIDE)      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 81/251 ----------- :)
 ( CRP(  )                              
                                        
 CREATE CRP(                            
 P%   8 +  9 OBJ(,  ( C1)               
 P%   8 + 10 OBJ(,  ( C2)               
 P%   8 + 11 OBJ(,  ( C3)               
 P%   8 + 12 OBJ(,  ( C4)               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
 ( DISK? FK)                            
HEX                                     
: FK  ( ---^FASTLOAD KILL)              
  330 C@ DF =  ( FASTLOAD PRESENT)      
  IF 0 1F DO FD30 I + C@                
     314 I + C! -1 +LOOP THEN ;         
 DECIMAL                                
                                        
: DISK? ( ---^CK FOR DISK) " I" DOS FK  
 CW.NUM @ ADVENTURE @   BEGIN           
  ADVENTURE " AD" LR ST 64 = NOT        
  WHILE S.SC                            
    4 10 34 12 B%    COLOR.BLOCK        
    5 11 D-POSITION                     
    B%    CHAR.COLOR                    
    ." INSERT DISK AND PRESS ANY KEY"   
    BEGIN ?TERMINAL UNTIL R.SC          
 REPEAT                                 
 ADVENTURE ! CW.NUM ! ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 86/256 ----------- :)
( *** WORKSHOP DATA ****)               
VAR HOT.CHIP                            
VAR WS.OP.BYTE                          
VAR WS.ARG.BYTE                         
VAR WS.TRUE.FLOW                        
VAR WS.FALSE.FLOW                       
VAR I.CM  ( INSERTER.COM)               
VAR WIRE^         ( 0=NONE 1=T 2=F)     
VAR NEW.CW    ( NEW CW LOADED?)         
62 IS NONE@   ( NO CHIP TOKEN)          
9999 IS NO.CHIP@                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
1 25 3 24 PANEL.RECT !RECT              
                                        
                                        
                        

( ----------- Screen 88/258 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
( SK) MG%      33 33 33 33 33 33 7 #,   
                                        
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
                                        
CREATE ACTION.TYPE( ACT#@    ALLOT      
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
                                        
CREATE OK.ACTIONS( ACT#@ ALLOT          
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
                                        
CREATE OP.W.XY( ACT#@ 4 * ALLOT         
CREATE ARG.W.XY( TH#@ 4 * ALLOT         
                                        
: ARFILL ( XL/XR/YT/YB/TOK/ARRAY---)    
  SWAP 4 * +  >R    R@ 3 + C!           
  R@ 2 + C!  R@ 1+ C! R> C! ;           
                                        
                                        
: AF ( X/X/Y/Y/ARGTOK---)               
  ARG.W.XY( ARFILL ;                    
                                        
: BLANK.THING.RECTS ( ---)              
  ARG.W.XY( TH#@ 4 * 40 FILL ;          
                                        
: OP.W.DRAW ( OPTOK) DUP >R             
  4 * OP.W.XY( + DUP 2 +                
  C@ SWAP C@ SWAP  ( X/Y)               
  R> 7 * OP.BLOCK( + OP. ;              
                                        
: PF ( X/X/Y/Y/OPTOK---)                
  OP.W.XY( ARFILL ;                     
                                        
                                        
                        

( ----------- Screen 95/265 ----------- :)
 ( OP WORK XY ASSIGNMENTS <<<)          
                                        
27 28 5 6 LOOK.FOR@ 29 30 5 6 FEEL.FOR@ 
31 32 5 6 SMELL@ 34 35 5 6 MOVE@        
37 38 5 6 SING@ PF PF PF PF PF          
                                        
27 28 7 8 ON.M@ 30 31 7 8 ON.O@         
33 34 7 7 ON.N@ 37 38 7 8               
ST-@                                    
33 34 8 8 N<@ PF PF PF PF PF            
27 28 9 10 M=@ 30 31 9 10 O=@           
33 34 9 10 N=@ 35 36 9 10 PLUS@         
37 38 9 10 MINUS@ PF PF PF PF PF        
                                        
27 28 11 13 SUBPANEL@ 30 31 11 13 WIRE@ 
34 35 11 13 KEY@ 37 38 11 13 QRAY@      
PF PF PF PF                             
27 28 14 16 GOTO.GO@ 30 31 14 16        
BOOMERANG@ 34 35 14 16 COIN@            
37 38 14 16 PICK.UP@ PF PF PF PF        
                                        
                                        
                                        
                                        
                                        
                        

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
                                        
                                        
                                        
FORGET SF                               
                                        
                        

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
 29 30 19 20 24    AF                   
 31 32 19 20 25    AF                   
 33 34 19 20 26    AF                   
 35 36 19 20 DAMAGE.REG@ AF             
 37 38 19 20 FUEL.REG@ AF               
 27 28 22 23 27    AF                   
 29 30 22 23 28    AF                   
 31 32 22 23 29    AF                   
 33 34 22 23 30    AF                   
 35 36 22 23 RANGE.REG@ AF ;            
                                        
: NE.FILL ( --)                         
 N.FILL 37 38 22 23 NUM.EMPTY@ AF ;     
                                        
: S.FILL ( --)                          
 N.FILL 37 38 22 23 NUM.STACK@ AF ;     
                                        
                                        
                                        
                                        
                        

( ----------- Screen 100/270 ----------- :)
 ( CEMIT DRAW.ACTION  DRAW.LETTER<<< )  
                                        
: CEMIT  ( X/Y/COLOR/SCREENCODE)        
  >R >R 40 * +                          
  R> OVER COLOR-MEM + C!                
  'SCREEN + R> SWAP C! ;                
                                        
: DRAW.ACTION ( TOK/X/Y--TOK/X/Y )      
  DDUP  5 PICK 7 * OP.BLOCK( +          
  OP. ;                                 
                                        
                                        
: DRAW.LETTER  ( X/Y/ASC---)            
  B%    CHAR.COLOR                      
  >R D-POSITION R>                      
  DUP 64 - 27 = IF                      
   ." !" DROP ELSE EMIT THEN ;          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 101/271 ----------- :)
( DRAW.A.THING   O.D.)                  
                                        
: DRAW.A.THING  ( TOK/X/Y---TOK/X/Y)    
  3 PICK DUP DUP                        
  DOUBLE.SIZED? SWAP KEY@ = OR          
  IF DUP SUBPANEL@ =                    
    SWAP KEY@ = OR                      
    IF DDUP 2 + SWAP 1+ SWAP            
      GET.ARG.ASC 6 PICK                
      SUBPANEL@ = IF 1+ THEN            
      DRAW.LETTER THEN                  
  ELSE   DROP DDUP  1 +                 
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
  DUP SING@ > SWAP ON.N@ < AND ;        
: DRAW.WIRE ( TOK/X/Y---)               
 SINGLE.WIRE@ WIRE.TYPE !               
 3 PICK DUP DUP GOTO.GO@ = SWAP         
  BOOMERANG@ = OR SWAP                  
   SOCKET@ = OR NOT                     
 IF  ( DRAW SOME WIRE)                  
   DDUP WIRE.XY    ( TOK/X/Y/TX/TY)     
   5 ROLL BRANCHER?                     
   IF TRUE.WIRE@ WIRE.TYPE !            
     WIRE.IT                            
     FALSE.FLOW  DDUP WIRE.XY           
     FALSE.WIRE@ WIRE.TYPE !            
     WIRE.IT                            
   ELSE WIRE.IT THEN                    
ELSE DROP THEN  DROP DROP ;             
                                        
                        

( ----------- Screen 104/274 ----------- :)
 ( CHIP.DRAW)                           
                                        
 : CHIP.DRAW  ( CHIP#--)                
   DUP 8  MOD 3 * 2+ ( X)               
   SWAP 8  / 4 * 4 + ( Y)               
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
   SU.PN                                
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
  26 18 39 24 GL%     COLOR.BLOCK       
  DUP -@ = IF DROP BLANK.THING.RECTS    
  ELSE                                  
   SETUP.LEGAL.ARGS                     
   TH#@ 0 DO                            
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
    UP.F@ OF 8  < NOT ;;                
  DOWN.F@ OF CHIP.COUNT@                
       8     - < ;;                     
  LEFT.F@ OF 8 MOD 0= NOT ;;            
 RIGHT.F@ OF 1+ 8                       
       MOD 0= NOT ;;                    
ENDCASE ;                               
: BLIP ( X/Y---^ERASE WIRE)             
  DG%     CHAR.COLOR                    
  D-POSITION ." !" ;                    
: ERASE.BLANK.WIRES ( ---)              
  WS.CHIP.RECT @XY                      
  DDUP SWAP  1+ SWAP  1 - BLIP ( UP)    
  DDUP             3 + BLIP  ( DOWN)    
  DDUP SWAP 1 - SWAP BLIP   ( LEFT)     
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
   @XY DRAW.ACTION DDROP THEN           
  WS.ARG.BYTE C@                        
  NONE@ = NOT IF WS.CHIP.RECT @XY       
    DRAW.A.THING DDROP THEN             
  DUP NONE@ = NOT IF WS.CHIP.RECT @XY   
    DRAW.WIRE                           
  ELSE DROP THEN ;                      
: PANEL.HILIGHT ( ---)                  
  ( CW.NAME$ ) DG%     CHAR.COLOR       
  0 2 D-POSITION ." PANEL"              
  MG%      CHAR.COLOR                   
  75 65 DO  ( A-J)                      
    CURRENT.PANEL @ I 65 - =            
    IF DG%     CHAR.COLOR THEN          
    I 65 - 2* 6 + 2 D-POSITION          
    I EMIT MG%      CHAR.COLOR          
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
   0 WIRE^   !                          
   0 THIS.ACT.TYPE ! ;                  
                                        
 : UPDATE.WS.COMMANDS ( ---)            
 ( IS CHIP READY TO BE INSERTED?)       
 0 I.CM !                               
 WS.ARG.BYTE C@ NONE@ = NOT             
   ( CHIP IS FINISHED)                  
 THIS.ACT.TYPE @ -@ = OR                
   ( UNARY CHIP FINISHED)               
 IF 1 I.CM ! THEN ;                     
                                        
                                        
                                        
                        

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
   ELSE DDROP GARBAGE.WS.CHIP THEN ;    
                                        
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
                                        
 : KEY.ICS  ( KEYPRESS ICONS)           
  26 18 39 24 GL%     COLOR.BLOCK       
  65   ( A) B%    CHAR.COLOR            
  24 19 DO ( VERT LOOP)                 
   38 29 DO  ( HORIZ)                   
   I J D-POSITION DUP EMIT 1+           
  LOOP 2 +LOOP DROP ."  !" ;            
                                        
 : SUBP.ICS  ( ---)                     
  B%    CHAR.COLOR                      
  26 18 39 24 GL%     COLOR.BLOCK       
   9 0 DO                               
     SUBP.WS.RECT( I 4 * +              
     @XY D-POSITION                     
     66 I + EMIT                        
  LOOP  ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 120/290 ----------- :)
( INSERT.IT <<<<)                       
                                        
: INSERT.IT ( ---)                      
  HOT.CHIP @ CURRENT.INSTRUCTION !      
  I.CM @                                
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
   DDROP ;                              
                                        
                                        
                                        
                        

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
   IF SUBP.ICS                          
   ELSE WS.OP.BYTE C@ KEY@ =            
    IF  KEY.ICS                         
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
 IF WIRE^         ! WS.BACK.COL@        
  SINGLE.WIRE@ WIRE.TYPE !              
  W%    ' WS.BACK.COL@  !               
  WS.OP.BYTE C@ BRANCHER?               
  IF WIRE^         @                    
   1 = IF TRUE.WIRE@ WIRE.TYPE !        
    ELSE FALSE.WIRE@ WIRE.TYPE ! THEN   
  THEN WS.CHIP.RECT @XY WIRE.XY WIRE.IT 
  ' WS.BACK.COL@ !                      
 ELSE DROP THEN ;                       
                        

( ----------- Screen 124/294 ----------- :)
( MOVE.WIRE?)                           
                                        
: MOVE.WIRE? ( FLOW.CODE---) DUP        
  MATCH.WIRE? DUP 0>   ( WIRE THERE)    
  IF WIRE^         @ = NOT ( SAME)      
   IF WS.FALSE.FLOW C@ WS.TRUE.FLOW C@  
    WS.FALSE.FLOW C! WS.TRUE.FLOW C!    
      ( SWAP EM)                        
    0 WIRE^         ! WS>ARG,OP DROP    
    BLANK.WS.CHIP UPDATE.WS.CHIP        
   ELSE DROP THEN  ( SAME ONE)          
  ELSE DROP ( NO WIRE THERE)            
   WIRE^         @ 1 =                  
   IF WS.TRUE.FLOW C!                   
   ELSE WS.FALSE.FLOW C! THEN           
   0 WIRE^         !                    
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
   S2 W% S-C                            
   DUP 8 MOD 24 * 36 +  ( X)            
   SWAP 8 / 32 * 78 +   ( Y)            
   DDUP FRAME S-POSITION  ON S-ENABLE   
   46 - 8 /             ( YTAB )        
   SWAP 20 - 8 / SWAP   ( XTAB)         
   DDUP OVER 1+ SWAP DUP 2+             
   WS.CHIP.RECT !RECT                   
   SWAP 1 - SWAP 1 - OVER 3 + SWAP      
   DUP 4 + WS.WIRE.RECT !RECT ;         
                                        
 : NEW.CHIP.HOT ( CHIP#---)             
   DUP 0= NOT                           
   IF DUP HOT.CHIP !                    
      DUP CURRENT.INSTRUCTION !         
      CURSOR.CHIP                       
      GET.ACTION DROP PULL.IT           
      0 WIRE^  !                        
   ELSE DROP THEN ;                     
                                        
                                        
                                        
                        

( ----------- Screen 127/297 ----------- :)
( POINT>CHIP   DRAG.CHIP)               
                                        
: POINT>CHIP ( X/Y---CHIP#)             
  78 - 32 / 8  * 0 MAX 32 MIN           
  SWAP 36 - 24 / 0 MAX 7 MIN +          
  ;                                     
VAR DRAG.CHIP^                          
: DRAG.CHIP  ( ---)                     
  PANEL.RECT @RECT BUT.XY@              
  PT.RCT                                
  IF S2 ON S-ENABLE ( IN CASE OFF)      
    BUT.XY@ POINT>CHIP DUP 0= NOT       
    IF DUP DRAG.CHIP^ @ = NOT           
      IF ( BOOP) THEN                   
      DUP DRAG.CHIP^ !   CURSOR.CHIP    
     S2 B%   FRAME S-C 1000 0 DO LOOP   
      W%    FRAME S-C                   
    ELSE DROP NONE@ DRAG.CHIP^ !        
   (  HOT.CHIP @ CURSOR.CHIP ) THEN     
  ELSE NONE@ DRAG.CHIP^ !               
    S2 OFF S-ENABLE THEN                
  ( DRAGGED OFF PANEL)                  
( 0 24 D-POSITION ." DRAG.CHIP "        
  DRAG.CHIP^ ? ) ;                      
                                        
                        

( ----------- Screen 128/298 ----------- :)
 ( PANEL.HANDLER)                       
: PANEL.HANDLER ( ---) ( SOUND)         
  BUT.XY@ POINT>CHIP                    
  DUP 0= NOT IF INSERT.IT THEN          
  NEW.CHIP.HOT NONE@ DRAG.CHIP^ !       
  B.D @ IF ERASE.BLANK.WIRES            
    BEGIN B.D @                         
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
   PT.RCT NOT  ( DRAG OFF PANEL?)       
 IF HOT.CHIP @ CURSOR.CHIP              
   GARBAGE.WS.CHIP GARBAGE.PANEL.CHIP   
 ERASE.WS.CHIP ERASE.BLANK.WIRES        
  HOT.CHIP @ NEW.CHIP.HOT  THEN         
 THEN UPDATE.WS.COMMANDS ;              
                        

( ----------- Screen 129/299 ----------- :)
( WS.WIRE.HANDLER)                      
 : WS.WIRE.HANDLER ( ---)               
   WS.CHIP.RECT @RECT BUT.XY@           
   PT.RCT                               
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
        @RECT BUT.XY@ PT.RCT            
        IF WIRE^         @  WIRE.S      
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
   PANEL.S                              
   B.X @  24 - ( SCREEN COORDS)         
   44 - 16 /   ( PANEL #)               
   0 MAX 9 MIN  ( LEGAL RANGE)          
   I.CM @ IF                            
    WS>PANEL.CHIP THEN                  
     ( INSERT FINISHED CHIP)            
   DUP CURRENT.PANEL ! ( NEW PANEL)     
                                        
   PANEL.DRAW   PANEL.HILIGHT           
   WS.ACTION.ICONS ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 131/301 ----------- :)
( ACTION.HANDLER)                       
                                        
: ACTION.HANDLER ( ---)                 
  ACT#@ GOTO.GO@ DO                     
   I ACTION.OK?                         
   IF OP.W.XY( I 4 * + @RECT            
    BUT.XY@ PT.RCT                      
    IF OP.S                             
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
   SB@ OF DROP SUBP.ICS  ;;             
   L@ OF DROP KEY.ICS  ;;               
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
  BUT.XY@ PT.RCT                        
  IF I 1 + WS.ARG.BYTE C!               
      THING.S                           
    WS>ARG,OP UPDATE.WS.CHIP            
    UPDATE.WS.COMMANDS  LEAVE           
  THEN LOOP ;                           
                                        
 : KEY.HANDLER ( ---)  THING.S          
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
  ELSE WS.OP.BYTE C@ KEY@ =             
   IF  KEY.HANDLER                      
   ELSE TH#@ 0 DO                       
    ARG.W.XY( I 4 * + @RECT BUT.XY@     
    PT.RCT IF                           
      THING.S                           
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
26 39 4 17 BUT.XY@ PT.RCT               
IF ACTION.HANDLER                       
 ELSE 5 25 2 2 BUT.XY@ PT.RCT           
 IF PANEL.SELECT.HANDLER                
  HOT.CHIP @ NEW.CHIP.HOT               
  WS>ARG,OP UPDATE.WS.CHIP              
  ELSE WS.WIRE.RECT @RECT BUT.XY@       
  PT.RCT IF WS.WIRE.HANDLER             
  ELSE 26 39 19 24 BUT.XY@ PT.RCT       
   IF THING.HANDLER                     
   ELSE 0 25 3 24 BUT.XY@ PT.RCT        
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
  0 M-C                                 
  WS.BORD.COL@ BD                       
  BAK.C BK                              
  ACT#@ 1- 0 DO I OK LOOP               
  BOOMERANG@ NOT.OK ;                   
                                        
                                        
: INIT.WS ( ---)                        
  39 HOT.CHIP !   GARBAGE.WS.CHIP       
  1 NEW.CW !                            
  0 CURRENT.INSTRUCTION !               
  0 CURRENT.PANEL !                     
  0 I.CM !                              
  39 NEW.CHIP.HOT                       
  ;                                     
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 136/306 ----------- :)
 ( W.ENTER W.LEAVE )                    
 $C W.ON$ "ENTER"                       
 $C W.OFF$ "EXIT"                       
: W.ENTER ( -) 1 0 OP( IT+  0 BNC# !    
  SCREEN.OFF B% BK B% BD SPRITES.OFF    
  S2 W% S-C  OFF S-ML                   
  3 ON WS( IT+   ( SAVECW)              
  12 4 DO I OFF GAMES( IT+  LOOP        
  9 5 DO I ON WS( IT+ LOOP ( EDIT)      
  CB+ @ NOT IF 7 OFF WS( IT+  THEN      
 1 W.OFF$ WS$ WS( S.IT$                 
  186 S-PT ON S-YEXP ON S-XEXP          
  SETUP.WORK.SCREEN                     
  RIGHT.F@ LAST.TRUE !                  
  DOWN.F@ LAST.FALSE !                  
  1 NEW.CW ! WS.ACTION.ICONS            
  PANEL.HILIGHT WS.BORD.COL@ BD         
  SCREEN.ON  ;                          
: W.LEAVE ( -) 1 1 OP( IT+              
   HOT.CHIP @ NO.CHIP@ = NOT            
   IF INSERT.IT THEN                    
  1 W.ON$ WS$ WS( S.IT$                 
  3 OFF WS( IT+                         
  9 5 DO I OFF WS( IT+ LOOP ( EDIT)     
12 4 DO I ON GAMES( IT+  LOOP ;         
                        

( ----------- Screen 137/307 ----------- :)
 ( **** WORKSHOP ****)                  
                                        
: WORKSHOP  ( ---)  W.ENTER             
  BEGIN  DO.EVENTS I-T                  
  NEW.CW @                              
  IF 0 PANEL.DRAW INIT.WS               
    ( WS.ACTION.ICONS )                 
    PANEL.HILIGHT                       
    0 NEW.CW !  THEN                    
   B.D @ IF WS.MOUSER THEN              
    PROG.STATUS @ WORKSHOP.ON@ =        
                                        
  NOT UNTIL                             
  SCREEN.OFF                            
  W.LEAVE   ;                           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 138/308 ----------- :)
( DRAW.RND.CRP TO.CW)                   
                                        
: RND.CRP ( SQ#---)                     
  DEBUG? IF DROP                        
  ELSE  SQUARE.XTYT CRP(                
    4 IRND 7 * + 3 2 BLOCK.             
    CREEP.S THEN ;                      
                                        
                                        
: TO.CW  ( SQ#---NEXTSQ#) DUP           
  DUP SQUARES.WIDE@ / ( ROW)            
  SWAP SQUARES.WIDE@ MOD ( COL)         
  ROBOT.SQUARE @ SQUARES.WIDE@ MOD      
  < IF 1 ELSE -1 THEN                   
  2 IRND 0= IF DROP 0 THEN              
  SWAP ROBOT.SQUARE @ SQUARES.WIDE@ /   
  DDUP =   ( SAME ROW)                  
  IF DDROP 0                            
  ELSE < IF SQUARES.WIDE@               
   ELSE SQUARES.WIDE@ NEGATE THEN       
  THEN 2 IRND 0= IF DROP 0 THEN         
  + + ;                                 
                                        
                                        
                                        
                        

( ----------- Screen 139/309 ----------- :)
( ?ZAP.CW  CREEP.MOVE)                  
                                        
 : ?ZAP  ( SQ#---FLAG^ZAP CW?)          
  ROBOT.SQUARE @ = NOT DUP NOT          
   ( CW IS THERE, ZAP IT)               
  IF 6 FLASH.CW -200 UPDATE.FUEL THEN ; 
                                        
                                        
 : CRP.MV ( CREEP#/SQ#---)              
  3 IRND 2 < IF  ( 66% TRY TO MOVE)     
    DUP TO.CW ( CR#/SQ#/NEXTSQ#)        
 DUP DUP DUP SQUARE.OBJECT              
 FLOOR@ = SWAP ?ZAP AND                 
 SWAP ROBOT.SQUARE @ SQUARES.WIDE@      
 - = NOT AND                            
  IF DUP 4 ROLL CREEPS( + C! ( SQ#/NX#) 
   SWAP DESTROY  ( NEXTSQ#)             
   DUP ROOM.DATA( + CREEP@ SWAP C!      
       ( STORE CREEP IN ROOM)           
                                        
  ELSE DROP SWAP DROP THEN ( SQ#)       
 ELSE SWAP DROP                         
 THEN RND.CRP ;                         
                                        
                                        
                        

( ----------- Screen 140/310 ----------- :)
( MOVE.BADDIES)                         
                                        
 : BADS ( ---)                          
   12 IRND DUP CREEPS( + C@             
   55 MIN  ( NO GARBAGE #'S)            
         ( CREEP#/CREEP SQ#)            
   DUP SQUARE.OBJECT CREEP@ =           
     ( CREEP IS STILL THERE)            
   IF CRP.MV                            
   ELSE DDROP                           
   THEN  ; EXIT                         
 ( BNC#  @                              
   DEBUG? NOT AND                       
   IF  ( SPIN.BOUNCER)                  
     BNC^   @  DUP                      
     DUP 1 = IF 2 IRND 1 =              
      IF DROP 3 THEN THEN ( BOUNCE)     
     48 * 1856 +   ( BOUNCE BUF)        
     -1296 48 CMOVE                     
     1 + 3 MOD  BNC^ !                  
   THEN ) ;                             
                                        
                                        
                                        
                                        
                        

( ----------- Screen 141/311 ----------- :)
 ( ZAP SPRITE) 2 BASE !                 
S-DEF ZAP.S                             
00000000 00000000 00000000              
00000000 00000000 00000000              
00000001 10000001 10000000              
00000000 11000011 00000000              
00000000 01100110 00000000              
00000000 00111100 00000000              
00000111 11111111 11100000              
00000000 00111100 00000000              
00000000 01100110 00000000              
00000000 11000011 00000000              
00000001 10000001 10000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 000000 DECIMAL        
: ZAP.SP SWAPOUT                        
49152 205 64 * + ZAP.S SWAPIN ;         
                        

( ----------- Screen 142/312 ----------- :)
 ( SEE SPRITE) EXIT    2 BASE !         
S-DEF SEE.S                             
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 01111110 000000                
00000000 11000011 000000                
00000000 00000011 000000                
00000000 00001110 000000                
00000000 00111000 000000                
00000000 00000000 000000                
00000000 00111000 000000                
00000000 00111000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000 DECIMAL        
: SEE.SP SWAPOUT                        
49152 205 64 * + SEE.S SWAPIN ;         
                        

( ----------- Screen 143/313 ----------- :)
(  L.DB DB- BYE.BYE)                    
 $C D+$ "DEBUG ON" $C D-$ "DEBUG OFF"   
 $C F$ "FAST"      $C S$ "SLOW"         
 $C ST+$ "STEP"    $C ST-$ "NO STEP"    
 $C R+$ "SEE ROBOT" $C R-$ "NO ROBOT"   
 VAR STEP  VAR DB.SP  0 DB.SP !         
: D.$ ( F-) 1 SWAP IF D+$ ELSE D-$ THEN 
 OP$ OP( S.IT$     ;                    
: S.$ ( F-) 2 SWAP IF F$ ELSE S$ THEN   
  OP$ OP( S.IT$     ;                   
: T.$ ( F-) 3 SWAP IF ST+$              
  ELSE ST-$ THEN OP$ OP( S.IT$  ;       
: R.$ ( F-) 4 SWAP IF R-$ ELSE R+$ THEN 
  OP$ OP( S.IT$ ;                       
: L.DB ( ---^LEAVE DEBUG)  253 53269 C! 
  5 2 DO I OFF OP( IT+  LOOP            
  1 D.$  0 S.$  1 T.$ 0 R.$             
  0 STEP ! 0 ROB+ ! 0 DB.SP ! ;         
: DB- ( ---)                            
    SCREEN.OFF GAME.CHAR 1 M-C          
  GM.SC 0 GAME.STATUS ! DRAW.GAMEBOARD  
 DRAW.NUM.ST DRAW.MOV.ST DRAW.OBJ.ST    
     0 UPDATE.FUEL 0 UPDATE.DAMAGE      
     0 UPDATE.RANGE  L.DB               
     NAME. 253 53269 C! SCREEN.ON ;     
                        

( ----------- Screen 144/314 ----------- :)
 ( BYE.BYE    OPTION.MENU)              
: BYE.BYE ( --)  REC.LAST BEGIN AGAIN ; 
: E.DB ( ---^ENTER DEBUG)               
  5 2 DO I ON  OP( IT+  LOOP            
  0 S.$ 1 T.$ 0 R.$ 0 D.$               
  1 53269 C! ;                          
 : OP.M ( ---) T.I @                    
  CASE   1 OF GAME.STATUS @             
    DEBUG.ON@ =  NOT                    
    IF DEBUG.ON@ GAME.STATUS !          
      SCREEN.OFF WS.CHAR 0 M-C          
      CURRENT.INSTRUCTION @ HOT.CHIP !  
      CURRENT.PANEL @ PANEL.DRAW        
    PANEL.HILIGHT DB.FL E.DB SCREEN.ON  
    ELSE DB- THEN ;;                    
 2 OF DB.SP @ IF 0 S.$ 0                
      ELSE 1 S.$ 10000 THEN DB.SP ! ;;  
 3 OF STEP @ IF 1 T.$ 0                 
    2 ON OP( IT+                        
      ELSE 0 T.$ 1                      
   2 OFF OP( IT+ THEN STEP ! ;;         
 4 OF ROB+ @ IF 0 R.$ 0  1 53269 C!     
ELSE 253 53269 C! 1 R.$ 1 THEN ROB+ !   
 ;;  6 OF BYE.BYE ;;                    
 ENDCASE ;                              
                        

( ----------- Screen 145/315 ----------- :)
( CLEAR.PANEL COPY.PANEL PASTE.PANEL)   
CREATE COPY.BUFF( CHIP.COUNT@ 2 * ALLOT 
: CL.P ( ---^CLEAR.PANEL) CHIP.COUNT@ 1 
  DO I CURRENT.INSTRUCTION !            
     SOCKET@ 0 !CHIP LOOP               
  1 CURRENT.INSTRUCTION !               
  CURRENT.PANEL @ PANEL.DRAW            
  PANEL.HILIGHT ZERO.STATS              
  GARBAGE.WS.CHIP UPDATE.WS.COMMANDS ;  
: CP.P ( ---^COPY.PANEL)                
  ROBOT.PROGRAM CURRENT.PANEL @         
  CHIP.COUNT@ 2 * * + COPY.BUFF(        
  CHIP.COUNT@ 2 * CMOVE                 
  7 ON WS( IT+                          
  1 CB+  ! ;                            
: PS.P ( ---^COPY.PANEL) COPY.BUFF(     
  ROBOT.PROGRAM CURRENT.PANEL @         
  CHIP.COUNT@ 2 * * + DUP >R            
  CHIP.COUNT@ 2 * CMOVE                 
  CURRENT.PANEL @ DUP 0= IF BOOMERANG@  
  ELSE SUBPANEL@ THEN                   
  R> DUP CHIP.COUNT@ 2 * + SWAP DO      
   I C@ 64 MOD OVER = IF SOCKET@ I C!   
   THEN 2 +LOOP DROP                    
  PANEL.DRAW   ZERO.STATS  ;            
                        

( ----------- Screen 146/316 ----------- :)
( WS.M)                                 
                                        
                                        
: WS.M  ( ---)                          
  T.I @                                 
  CASE                                  
     1 OF PROG.STATUS @ WORKSHOP.ON@ =  
         IF WORKSHOP.OFF@               
         ELSE WORKSHOP.ON@ THEN         
         PROG.STATUS ! ;;               
     3 OF HOT.CHIP @ NO.CHIP@ =         
       NOT IF INSERT.IT THEN SV.SP      
0 53269 C! EDIT.NAME CW.NUM @ CW.SAVE   
       M.BAR  1 53269 C!                
       1 NEW.CW ! ;;                    
     5 OF CP.P CL.P ;;                  
     6 OF CP.P ;;                       
     7 OF PS.P ;;                       
     8 OF CL.P ;;                       
   ENDCASE ;                            
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 147/317 ----------- :)
( WH.M)                                 
: WH.M  SPRITES.OFF                     
  T.I @ DUP CW.LOAD                     
  CW.NUM !   LOAD.STATS  PROG.STATUS @  
  WORKSHOP.ON@ = IF 1 NEW.CW !          
  ELSE TURN.GAME.OFF@ PROG.STATUS !     
  DEBUG? NOT IF  NAME. THEN  THEN       
 M.NAMES ( REC.LAST ) ;                 
 CREATE AD.COL( LB% C, G% C,  DG% C,    
 BL% C, BR% C, R% C, MG% C, LR% C,      
 : AD.M ( AD#---) DSK                   
   DUP 1- AD.COL( + C@ M.BAK2           
   DUP ADVENTURE ! SCREEN.OFF           
  GM.SC  GAME.CHAR NAME. SCREEN.ON      
  PROG.STATUS @ DUP  GAME.ON@ =         
  SWAP SERIES@ = OR IF                  
      TURN.GAME.OFF@ PROG.STATUS !      
THEN FIRST SWAP CASE  1 OF " A1" ;;     
   2 OF " A2" ;; 3 OF " A3" ;;          
   4 OF " A4" ;; 5 OF " A5" ;;          
   6 OF " A6" ;; 7 OF " A7" ;;          
   8 OF " A8" ;; ENDCASE LR             
   SWAPOUT FIRST 53248 4000 CMOVE       
   SWAPIN  ( REC.LAST )                 
   FIRST " CW.SCR" LR 1 53269 C! ;      
                        

( ----------- Screen 148/318 ----------- :)
( ADVENTURE.MENU)                       
: A.M T.I @ DUP                         
  4 11 WITHIN IF 3 - AD.M  M.NAMES      
  ELSE CASE                             
   1 OF PROG.STATUS @                   
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
  2 OF PROG.STATUS @                    
    CASE SERIES@ OF GAME.ON@            
         PROG.STATUS ! 1 LAST.MISSION ! 
  2 SE$ GAMES$ GAMES( S.IT$ ;;          
        0 LAST.MISSION !                
  2  LM$ GAMES$ GAMES( S.IT$            
       SERIES@ PROG.STATUS !            
   ENDCASE ;;                           
ENDCASE                                 
THEN ;                                  
                        

( ----------- Screen 149/319 ----------- :)
( DO.EVENTS)                            
                                        
 : DO.EVENTS ( ---)                     
   M.EV   ( DO MENU EVENTS)             
   IF T.M @                             
     CASE                               
       1 OF WH.M ;;                     
       2 OF WS.M ;;                     
       3 OF A.M   ;;                    
       4 OF OP.M  ;;                    
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
                                        
: ERASE.STACK ( X/Y---X/Y) DDUP         
 OVER 1+ OVER 5 + DG%     COLOR.BLOCK ; 
                                        
: DRAW.MOV.ST ( ---)                    
  36 17 ERASE.STACK                     
  MOV.ST^ @ 2- 0 MAX MOV.ST^ @ DO       
   DDUP MOV.ST( I + C@ O.D.             
 ( GET MOV FROM STACK & DRAW)           
   2+                                   
  -1 +LOOP DDROP ;                      
                                        
  : ON.M ( MOV.TOK---)                  
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
   DDUP OBJ.ST( I + C@ O.D.             
 ( GET OBJ FROM STACK & DRAW)           
   2+                                   
  -1 +LOOP DDROP ;                      
                                        
  : ON.O ( MOV.TOK---)                  
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
   DDUP NUM.ST( I + C@ O.D.             
 ( GET NUM FROM STACK & DRAW)           
   2+                                   
  -1 +LOOP DDROP ;                      
                                        
  : ON.N ( MOV.TOK---)                  
    NUM.ST^ @ STACK.LEN@ =              
    IF NUM.ST( ST.SQUASH                
 ( IF MAX SIZE SQUASH)                  
    ELSE 1 NUM.ST^ +! THEN              
 ( INC STACK TOP POINTER)               
    CHECK.NUM.ST                        
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
  MOV.ST( STACK.LEN@ 0 FILL 0 MOV.ST^ ! 
  OBJ.ST( STACK.LEN@ 0 FILL 0 OBJ.ST^ ! 
  NUM.ST( STACK.LEN@ 0 FILL 0 NUM.ST^ ! 
  MOV.EMPTY@ MOV.ST( C!                 
  OBJ.EMPTY@ OBJ.ST( C!                 
  NUM.EMPTY@ NUM.ST( C!                 
  DRAW.MOV.ST DRAW.OBJ.ST DRAW.NUM.ST ; 
                                        
                        

( ----------- Screen 158/328 ----------- :)
 ( D.STK PLUS MINUS)                    
                                        
 : D.STK ( ARG---^DROP STACK)           
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
  ELSE DDROP THEN ;                     
                                        
: MINUS ( ---)                          
  NUM.ST( NUM.ST^ @ + DUP C@            
  DUP NUM.EMPTY@ = NOT                  
  IF NUM0@ - 1- 8 +MOD NUM0@ + SWAP C!  
  DRAW.NUM.ST ELSE DDROP THEN ;         
                                        
                        

( ----------- Screen 159/329 ----------- :)
( STK <<<<<<<<)                         
: AR@ ARG.BYTE C@ 64 MOD ; EXIT         
: STK     ( OPCODE ---^STACKER)         
  ARG.BYTE C@ 64 MOD SWAP               
  CASE                                  
    N=@ OF NUM= ;;                      
    N<@ OF NUM< ;;                      
    O=@ OF OBJ= ;;                      
    M=@ OF MOV= ;;                      
    ON.N@ OF ON.N ;;                    
    ON.O@ OF ON.O ;;                    
    ON.M@ OF ON.M ;;                    
    ST-@ OF D.STK ;;                    
    PLUS@ OF DROP PLUS ;;               
    MINUS@ OF DROP MINUS ;;             
  ENDCASE ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 160/330 ----------- :)
( STAT NAME DATA STRUCTS)               
                                        
FIRST 4001 + CONSTANT STATS(            
( 8 * [2BYTES #GAMES,4 BYTES CUM SCORE, 
  4 BYTES HIGH], 8 * 1 BYTE OK ENVIR)   
( 88 BYTE BUFFER)                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 161/331 ----------- :)
( ZERO.STATS LOAD.STATS SAVE.STATS)     
: ZERO.STATS ( ---)                     
  STATS( 80 0 FILL ;                    
                                        
: LOAD.STATS ( ---)  DSK                
  0 SAVENAME C!                         
  SAVENAME " S " $+                     
  CW.NUM @ 64 + SAVENAME 2 + C!         
  STATS( SAVENAME LR R.SP ;             
                                        
                                        
: SAVE.STATS ( ---)  DSK                
( " S0.TMP" DOS ) SV0                   
  SAVENAME " 0:TMP" $+                  
  STATS( DUP 87 + SAVE ( ." 0:TMP")     
  SV0                                   
  SAVENAME " S0:S " $+                  
  CW.NUM @ 64 + SAVENAME 5 + C!         
  SAVENAME DOS ( SAVENAME COUNT TYPE)   
  SV0                                   
  SAVENAME " R0:S =TMP" $+              
  CW.NUM @ 64 + SAVENAME 5 + C!         
  SAVENAME DOS ( SAVENAME COUNT TYPE)   
             ;                          
                                        
                        

( ----------- Screen 162/332 ----------- :)
 ( UPDATE.STATS)                        
                                        
: STAT.ADR ( ---STATS ADDRESS)          
 ADVENTURE @ 1- 10 * STATS( + ;         
: UPDATE.STATS ( ---)                   
 STAT.ADR                               
 1  OVER  +! ( INC GAME#)               
 DUP 2 + D@                             
 POINTS D@ D+ 3 PICK 2 +  D!            
 6 + DUP  D@                            
 POINTS  D@ D<                          
 IF POINTS D@ ROT  D! ELSE DROP THEN    
  SAVE.STATS   ;                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 163/333 ----------- :)
( STATS.SCREEN)                         
: C. ( DNUM---^CENTER PRINT)            
  DDUP 99. D> IF ."  " THEN  ( LEFT)    
  DDUP 9999. D> IF ."  " THEN           
  D. ;                                  
: STATS.SCREEN ( ---) B%    CHAR.COLOR  
  400000. STAT.ADR 6 + D@ D<            
  IF ZERO.STATS UPDATE.STATS THEN       
  ( GARBAGE HI SCORE)                   
  27 12 38 23 GL%     COLOR.BLOCK       
  27 12 D-POSITION ." ^^^ STATS ^^"     
  29 14 D-POSITION ." MISSIONS"         
  32 15 D-POSITION STAT.ADR @ 0 C.      
  29 17 D-POSITION ." AVERAGE"          
  32 18 D-POSITION STAT.ADR 2 + D@      
  STAT.ADR @  M/                        
  DUP -1 = IF DROP 0 THEN ( /0) 0 C.    
  DROP 28 20 D-POSITION ." HIGH SCORE"  
  32 21 D-POSITION STAT.ADR 6 + D@ C. ; 
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 164/334 ----------- :)
 ( LOAD.NAMES SAVE.NAMES)               
                                        
: LOAD.NAMES ( ---)  DSK                
  0 SAVENAME C!                         
  SAVENAME " NM" $+                     
  WH$ 1+                                
  SAVENAME LR  R.SP ;                   
                                        
: SAVE.NAMES ( ---) DSK ( ." DSK")      
 ( " S0:TMP3" DOS ) SV0                 
  SAVENAME " 0:TMP3" $+                 
  WH$ 1+ DUP                            
  WH( 1 + C@ WH( 2 + C@                 
  * + SAVE  ( ." 0:TMP3")               
  SV0                                   
  SAVENAME " S0:NM" $+                  
  SAVENAME DOS ( SAVENAME COUNT TYPE)   
  SV0                                   
  SAVENAME " R0:NM=TMP3" $+             
  SAVENAME DOS    ;                     
 : NAME. ( ---)                         
 9 6 D-POSITION                         
 BL% CHAR.COLOR CW.NUM @ 1- WH(         
 1+ C@ *  WH$ + 2 +                     
 WH( 1+ C@ 1- TYPE ; ( SKIP -)          
                        

( ----------- Screen 165/335 ----------- :)
  ( ADV.)                               
: NM^  ( ---NAME ADDR)                  
 CW.NUM @ 1- WH( 1+ C@ * 1+ WH$ + ;     
                                        
: NM.  ( ---^PRINT CW NAME EDIT WNDW)   
 8 7 D-POSITION BL% CHAR.COLOR          
 NM^ 1+ WH( 1+ C@ 1- TYPE ;             
                                        
                                        
: ADV. ( AD#-1---^ADVENTURE PRINT)      
  DUP STATS( 80 + + C@ ( BEST ARRAY)    
  IF BL% ELSE B% THEN CHAR.COLOR        
  DUP 13 + 5 SWAP D-POSITION            
  3 + GAMES( 1+ C@ DUP >R ( MENU WIDTH) 
  * 1+ GAMES$ +    R> TYPE ;            
                                        
                                        
: ALL. ( ---^PRINT ALL ADVENTURES)      
   8 0 DO                               
    I ADV. LOOP ;                       
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 166/336 ----------- :)
 ( NM.SCR)                              
                                        
: NM.SCR ( ---^NAMING SCREEN)           
0 2 25 24 GL% COLOR.BLOCK               
B% CHAR.COLOR                           
7 4 D-POSITION ." THIS CHIPWIT"         
9 5 D-POSITION ." IS NAMED"             
                                        
6 6 D-POSITION ." *((((((((((((+"       
6 7 D-POSITION ." '            )"       
6 8 D-POSITION ." -&&&&&&&&&&&&,"       
NM.                                     
5 11 D-POSITION ." IT WORKS BEST IN"    
 ALL.   ( ADV NAMES)  BL% CHAR.COLOR    
 21 21 D-POSITION ." *((+"              
 21 22 D-POSITION ." ' OK )"            
 21 23 D-POSITION ." -&&,"              
 COLOR-MEM 40 R% FILL ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 167/337 ----------- :)
 ( ED.IT  FLIP)                         
VAR E^  0 E^ ! ( EDIT CHAR PTR)         
VAR CR^    ( CR PRESSED?)               
: ED.IT  ( CHAR---^EDIT NAME)           
DUP DUP DUP 20 =  ( DELETE)             
  SWAP 32 =   OR  ( SPACE)              
SWAP 65 90 WITHIN OR IF                 
  E^ @ 0= IF NM^ WH( 1+ C@ 32 FILL THEN 
  DUP 20 = IF  E^ @ 1- 0 MAX E^ !       
   DROP 32 NM^ 1+ E^ @ + C!             
  ELSE NM^ 1+ E^ @  + C!                
   E^ @ 1+ 9  MIN E^  !                 
  THEN NM.                              
ELSE 13 = IF 1 CR^ ! THEN THEN ;        
                                        
: FLIP ( ---^TOGGLE BEST ADV)           
  BUT.XY@ SWAP DROP  ( Y)               
  50 - 13 8 * -  ( OFFSET TO TOP)       
  8 /         ( ADV#)                   
  DUP STATS( 80 + + DUP                 
  C@ NOT SWAP C!                        
  ADV.                                  
  BEGIN B.D @ NOT UNTIL ;               
                                        
                                        
                        

( ----------- Screen 168/338 ----------- :)
( EDIT.NAME)                            
 : EDIT.NAME ( ---) 0 E^ ! 0 CR^ !      
   1 53269 C!  0 198 C! ( KEYBUFF)      
   NM.SCR  ( DRAW THE SCREEN)           
   BEGIN  ?TERMINAL DUP                 
     IF ED.IT ELSE DROP THEN            
     B.D @  IF 6 19 13 20 BUT.XY@       
       PT.RCT IF FLIP THEN              
     THEN 21 24 21 23 BUT.XY@           
  PT.RCT    ( OK BUTTON)                
  CR^ @ OR UNTIL ( RETURN PRESSED)      
  SAVE.NAMES  SAVE.STATS ;              
: M.NAMES ( ---) PROG.STATUS @          
  WORKSHOP.ON@ = NOT                    
  IF  8 0 DO  ( ADVENTURES)             
     STATS( 80 + I + C@                 
     IF BL% ELSE B% THEN                
     GAMES( 6 + I + C! ( BLUE OR BLACK) 
 I ADVENTURE @ 1- = IF 46 ELSE 32 THEN  
     GAMES$ 1 + GAMES( 1+ C@ DUP >R     
     3 * + R> I * +  C! ( CURR ADV)     
    LOOP THEN                           
16 0 DO I CW.NUM @ 1- = IF 46 ELSE 32   
  THEN  WH$ 1 + WH( 1+ C@ I * + C!      
LOOP ;                                  
                        
