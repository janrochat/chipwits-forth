════════════════════════════════════════   SCREEN 001
( CHIPWITS DEMO  9-18-84)               
FORGET IT : IT ;                        
2 6 THRU   ( VARS)                      
100 107 THRU ( HEAD SPRITES)            
108 115 THRU ( FEET SPRITES)            
116 120 THRU ( OBJ SPRITES)             
10 40 THRU                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 002
 ( VARIABLES)                           
: VAR VARIABLE ; : IS CONSTANT ;        
VAR ROBOT.SQUARE                        
VAR ROBOT.ORIENTATION                   
VAR ROBOT.X VAR ROBOT.Y                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 003
( ROOM VARS, ROOM)                      
                                        
8 IS SQS.WD@ 8 IS SQS.HI@               
SQS.WD@ SQS.HI@ * IS SQU.CNT@           
SQU.CNT@ 16 + IS ROOM.SIZE@             
                                        
                                        
: T, 1 C, ; ( TOP)                      
: W, 2 C, ; ( WALL)                     
: F, 3 C, ; ( FLOOR)                    
CREATE ROOM.DATA(                       
                                        
T, W, W, T, W, W, W, T,                 
T, F, F, T, F, F, F, T,                 
T, F, F, W, F, F, F, T,                 
                                        
T, F, F, F, F, T, T, T,                 
T, F, F, F, F, T, W, T,                 
T, F, F, F, F, W, F, T,                 
T, F, T, F, F, F, F, T,                 
W, W, W, W, W, W, W, W,                 
                                        
16 ALLOT ( DOOR DATA)                   
                                        
                                        
════════════════════════════════════════   SCREEN 004
( ORIENTATION CONSTANTS)                
                                        
7 IS W 6 IS SW 5 IS S 4 IS SE           
3 IS E 2 IS NE 1 IS N 0 IS NW           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 006
( MOVE.SOUND)                           
                                        
: MOVE.SOUND ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 009
( CHAR.COPY)                            
                                        
: CHAR.COPY  ( BANK# CHARBASE# --)      
 ( SEE P134 MEM MAP)                    
 56334 C@  254 AND 56334 C!             
 1 C@  251 AND 1 C!                     
 2DUP                                   
 2048 * ( CHARBASE)                     
 SWAP 16384 * + ( BOTTOM OF SET)        
 256 0 DO  ( CHARACTERS)                
  8 0 DO ( BYTES/CHAR)                  
    DUP                                 
    J 8 * I + ( BYTE INDEX)             
    DUP >R                              
    53248 + C@    (  ROM CHARSET)       
    SWAP R> + C!  ( RAM CHARSET)        
  LOOP                                  
 LOOP DROP                              
 1 C@ 4 OR 1 C!                         
 56334 C@ 1 OR 56334 C!                 
 CHARBASE BANK ;                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 010
( CHAR.COPY)                            
                                        
: CHAR.COPY  ( BANK# CHARBASE# --)      
 ( SEE P134 MEM MAP)                    
 56334 C@  254 AND 56334 C!             
 1 C@  251 AND 1 C!                     
 2DUP                                   
 2048 * ( CHARBASE)                     
 SWAP 16384 * + ( BOTTOM OF SET)        
 256 0 DO  ( CHARACTERS)                
  8 0 DO ( BYTES/CHAR)                  
    DUP                                 
    J 8 * I + ( BYTE INDEX)             
    DUP >R                              
    53248 + C@    (  ROM CHARSET)       
    SWAP R> + C!  ( RAM CHARSET)        
  LOOP                                  
 LOOP DROP                              
 1 C@ 4 OR 1 C!                         
 56334 C@ 1 OR 56334 C!                 
 DROP DROP  ;                           
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 011
( HEAD.INIT)                            
( INITIALIZE HEAD SPRITE)               
HEX : HEAD.LOAD ( ---)                  
    8000 HEAD0 8040 HEAD1               
    8080 HEAD2 80C0 HEAD3               
    8100 HEAD4 8140 HEAD5               
    8180 HEAD6 81C0 HEAD7               
; DECIMAL                               
: S.HEAD S4 ;                           
: HEAD.INIT ( ---) HEAD.LOAD            
  S.HEAD ON S-MULTI ( MULTICOLOR)       
  MED.GRAY S-COLOR  ( 2)                
                                        
  OFF S-YEXP OFF S-XEXP                 
  0 S-POINTER ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 012
( FEET.INIT)                            
( INITIALIZE FEET SPRITE)               
HEX  : FEET.LOAD ( ---)                 
    8200 FEET0 8240 FEET1               
    8280 FEET2 82C0 FEET3               
    8300 FEET4 8340 FEET5               
    8380 FEET6 83C0 FEET7               
; DECIMAL                               
: S.FEET S3 ;                           
: FEET.INIT ( ---) FEET.LOAD            
  S.FEET ON S-MULTI ( MULTICOLOR)       
  RED S-COLOR  ( 2)                     
                                        
  OFF S-YEXP OFF S-XEXP                 
  8 S-POINTER ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 013
( OBJ.INIT)                             
HEX : OBJ.LOAD                          
    8800 PIE.S                          
    8840 COFFEE.S                       
    8880 BRICK.S                        
    88C0 COFFEE2.S                      
; DECIMAL                               
: OBJ.S  ( COLOR POINTER ---)           
  S-POINTER S-COLOR                     
  OFF S-YEXP OFF S-XEXP                 
  ON S-MULTI ;                          
                                        
: OBJ.INIT ( ---) OBJ.LOAD              
  S5 BROWN 32 OBJ.S ( PIE)              
  S8 BLACK 33 OBJ.S ( COFFEE)           
  S1 LT.RED 34 OBJ.S ( BRICK)           
  S2 LT.RED 34 OBJ.S ( BRICK)           
  S7 BROWN 32 OBJ.S ( PIE)              
  S6 BLUE 35 OBJ.S ( BLUE CUP)          
  ;                                     
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 015
( B2.INIT  BANK 2 INITIALIZER)          
( SEE P 48, 64 SOUND & GRAPHICS)        
                                        
: B2.INIT  ( ---)                       
  ( 56576 C@ 253 AND 56576 C!)          
  1 16 * 4 + 53272 C!                   
  132 648 C! ( OUTPUT TO 132 * 356)     
  147 EMIT   ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 016
( S.IN   S.TEST CW.PLOP)                
 : S.IN  (  S-POINTER---)               
    DUP S.HEAD S-POINTER                
    S.FEET 8 + S-POINTER ;              
                                        
 : S.TEST ( ---)                        
  3 0 DO                                
   8 0 DO I S.IN 10 WAIT LOOP           
  LOOP ;                                
                                        
 : CW.PLOP ( ---)                       
   S.HEAD 100 127 S-POSITION            
   ON S-ENABLE                          
   S.FEET 100 110 S-POSITION            
   ON S-ENABLE ;                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 017
( COLOR.TEST SPRITES.OFF)               
                                        
: COLOR.TEST ( ---)                     
 0 0 D-POSITION                         
 ."  {$90}        {$9F}  {$9C}        {$9E}  "          
 0 1 D-POSITION                         
 ."  {$81}  {$95}  {$96}{$A0} {$97}  {$98}  {$99}  {$9A}  {$9B}  "          
 ;                                      
                                        
 : SPRITES.OFF ( ---)                   
   S1 OFF S-ENABLE                      
   S2 OFF S-ENABLE                      
   S3 OFF S-ENABLE                      
   S4 OFF S-ENABLE                      
   S5 OFF S-ENABLE                      
   S6 OFF S-ENABLE                      
   S7 OFF S-ENABLE                      
   S8 OFF S-ENABLE ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 020
( GRAPH.INIT)                           
( SETUP GRAPHICS)                       
: GRAPH.INIT ( ---)                     
                                        
 WHITE 0 S-MULTIR ( 1 COLOR)            
 GREEN 1 S-MULTIR ( 3)                  
 2 4 CHAR.COPY                          
 HEAD.INIT                              
 FEET.INIT                              
 OBJ.INIT ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 021
( GAME STUFF ,VARS)                     
                                        
: $IS $CONSTANT ;                       
$IS F$ " {$9F}{$B7}{$B7}{$D0} {$9D}{$9D}{$9D}  {$AA}"                   
                                        
$IS W$ " {$96}{$AF}{$AF}{$BA} {$9D}{$9D}{$9D}{$95}  {$A7}{$92}"                 
                                        
                                        
$IS T$ " {$96}{$AF}{$AF}{$BA} {$9D}{$9D}{$9D}{$AF}{$AF}{$BA}{$92}"                  
                                        
$IS R$ "       {$9D}{$9D}{$9D}{$9D}{$9D}     "              
$IS R1$ " {$9D}{$9D}{$9D}{$9D}{$9D}     "                   
                                        
                                        
                                        
: R$.? R$ $. R1$ $. ;                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 022
( DRAW.ROOM)                            
                                        
: DRAW.ROOM ( ---)                      
  ROOM.DATA( 1-                         
  SQS.HI@ 0 DO                          
   SQS.WD@ 0 DO                         
   I 3 * 1 + J 2 * 5 + D-POSITION       
   1+ DUP C@                            
   CASE                                 
     1 OF T$ $. ;;                      
     2 OF W$ $. ;;                      
     3 OF F$ $. ;;                      
   ENDCASE                              
 LOOP LOOP DROP ."  " ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 023
( GAME.BK)                              
                                        
: GAME.BK ( ---)                        
  BLACK BKGND PURPLE BORDER             
  33832 960 160 FILL                    
  ( FILL SCREEN INVERSE BLANKS)         
  55336 960 36 FILL                     
  ( FILL COLOR MEM W CYAN)              
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 024
 ( GAME.WNDW STAT.WNDWS)                
: GAME.WNDW ( ---)                      
  0 2 D-POSITION                        
  ."                             "      
  0 3 D-POSITION                        
  ."  ====== GREEDVILLE ====== "        
  0 4 D-POSITION                        
  ."                           "        
  1 5 D-POSITION                        
  ." {$92}                          "       
  0 5 D-POSITION                        
  16 0 DO ."  {$92}  {$9D}{$9D} " LOOP              
  24 5 D-POSITION                       
  16 0 DO ." {$92}    {$9D}{$9D}" LOOP              
  0 21 D-POSITION                       
  ."                            "       
  1 22 D-POSITION                       
  ." {$92}{$9C}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2} {$BE}"     
  26 3 D-POSITION                       
  19 0 DO ." {$A1} {$9D}" LOOP                  
  ;                                     
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 027
 ( STATUS.WNDW)                         
                                        
: STATUS.WNDW ( ---)                    
 27 5 D-POSITION                        
 ."      STATUS   "                     
 27 6 D-POSITION                        
 6 0 DO                                 
  27 6 I + D-POSITION                   
 ."   {$92}             {$9C}{$A1}{$92} "               
 LOOP                                   
 27 12 D-POSITION                       
 ."              {$9C}{$A1}{$92} "                  
 28 13 D-POSITION                       
 ." {$9C}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2} {$BE}{$92}"                    
 28 6 D-POSITION                        
 ." {$9E}"  R$.?                            
 33 6 D-POSITION                        
 ." {$9A}"  R$.?                            
 28 9 D-POSITION                        
 ."  "  R$.?                            
 33 9 D-POSITION                        
 ." {$99}"  R$.? ;                          
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 028
 ( MEMORY.WNDW)                         
                                        
: MEMORY.WNDW ( ---)                    
 27 14 D-POSITION                       
 ."      MEMORY   "                     
 27 15 D-POSITION                       
 6 0 DO                                 
  27 15 I + D-POSITION                  
 ."   {$92}             {$9C}{$A1}{$92} "               
 LOOP                                   
 27 21 D-POSITION                       
 ."              {$9C}{$A1}{$92} "                  
 28 22 D-POSITION                       
 ." {$9C}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2}{$A2} {$BE}{$92}"                    
 28 15 D-POSITION                       
 ." {$9B}"  R$.?                            
 28 18 D-POSITION                       
 R$.?                                   
 33 15 D-POSITION                       
 ." {$98}" R$.?                             
 33 18 D-POSITION                       
 R$.? ;                                 
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 029
( S.SQUARE.XY OBJ.PUT)                  
: S.SQUARE.XY ( SQ# ---X/Y)             
  DUP 8 MOD 24 * 7 + 24 + ( X)          
  SWAP 8 / 16 * 40 + 50 + ( Y) ;        
 ( SEE P 140 C64 PROG REF)              
                                        
: ROOM.PUT ( OBJ# SQ# ---)              
  ROOM.DATA( + C! ;                     
                                        
: OBJ.PUT ( ---)                        
  50 S.SQUARE.XY S1 S-POSITION          
  ON S-ENABLE  ( BRICK)                 
  29 S.SQUARE.XY S2 S-POSITION          
  ON S-ENABLE ( BRICK)                  
  34 S.SQUARE.XY S6 S-POSITION          
  ON S-ENABLE   1 22 ROOM.PUT           
  22 S.SQUARE.XY S5 S-POSITION          
  ON S-ENABLE ( COFFEE)                 
  1 34 ROOM.PUT                         
  34 S.SQUARE.XY S8 S-POSITION          
  ON S-ENABLE                           
  1 12 ROOM.PUT                         
  12 S.SQUARE.XY S7 S-POSITION          
  ON S-ENABLE ;                         
                                        
════════════════════════════════════════   SCREEN 030
( GAME.INIT)                            
                                        
: GAME.INIT ( ---)                      
 0 0 D-POSITION                         
 ."    OPTIONS  GAME  WORKSHOP  "       
 ."                "                    
  GAME.BK                               
  GAME.WNDW                             
  DRAW.ROOM                             
  SCORE.WNDW                            
  STATUS.WNDW                           
  MEMORY.WNDW                           
  OBJ.PUT ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 031
(  CW.SQUARE.PUT)                       
                                        
: CW.POSITION ( X/Y ---)                
  2DUP 16 -                             
  S.HEAD S-POSITION ON S-ENABLE         
  S.FEET S-POSITION ON S-ENABLE ;       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 032
( CW.SQUARE.PUT)                        
                                        
: CW.SQUARE.PUT ( SQ# ---)              
  S.SQUARE.XY                           
  2DUP ROBOT.Y !                        
  ROBOT.X !                             
  CW.POSITION ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 033
( SQUARE.OBJECT NEXT.SQUARE)            
                                        
: SQUARE.OBJECT ( SQ# ---OBJ#)          
  ROOM.DATA( + C@ ;                     
                                        
: NEXT.SQUARE ( ORIENT/SQ--NEXTSQ#)     
 SWAP                                   
 CASE N OF 8 - ;; E OF 1 + ;;           
      S OF 8 + ;; W OF 1 - ;;           
      NE OF 7 - ;;                      
      SE OF 9 + ;;                      
      SW OF 7 + ;;                      
      NW OF 9 - ;;                      
 ENDCASE ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 035
 ( SLIDE)                               
                                        
                                        
 : SLIDE ( X/YDELTAS---)                
   8 0 DO 2DUP                          
                                        
   ROBOT.Y @ + DUP ROBOT.Y !            
   SWAP ROBOT.X @ + DUP ROBOT.X !       
   SWAP                                 
   CW.POSITION                          
    MOVE.SOUND 1 WAIT                   
   LOOP DROP DROP ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 036
 ( CW.SLIDE)                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
 : CW.SLIDE ( ---)                      
   ROBOT.ORIENTATION @                  
   CASE N OF 0 -2 SLIDE ;;              
        NE OF 3 -2 SLIDE ;;             
        E OF 3 0 SLIDE ;;               
        SE OF 3 2 SLIDE ;;              
        S OF 0 2 SLIDE ;;               
        SW OF -3 2 SLIDE ;;             
        W OF -3 0 SLIDE ;;              
        NW OF -3 -2 SLIDE ;;            
   ENDCASE                              
   ;                                    
                                        
════════════════════════════════════════   SCREEN 037
( CW.TURN)                              
                                        
: CW.TURN ( ---)                        
  ROBOT.ORIENTATION @                   
  OSC3@ 2 MOD ( PSEUDORND)              
  CASE 0 OF 1 + ;;                      
       1 OF 1 - ;;                      
  ENDCASE                               
  DUP 7 > IF DROP 0 THEN                
  DUP 0 < IF DROP 7 THEN                
  DUP S.IN 5 WAIT                       
  ROBOT.ORIENTATION ! ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 038
( CW.INIT)                              
                                        
: CW.INIT                               
  9 ROBOT.SQUARE !                      
  9 CW.SQUARE.PUT                       
  SW ROBOT.ORIENTATION !                
  SW S.IN                               
  S.HEAD ON S-ENABLE                    
  S.FEET ON S-ENABLE ;                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 039
( CW.CHUG)                              
                                        
: CW.CHUG ( ---)                        
  BEGIN                                 
    ROBOT.ORIENTATION @                 
    ROBOT.SQUARE @                      
    NEXT.SQUARE DUP SQUARE.OBJECT       
    3 = IF  ( FLOOR)                    
      CW.SLIDE                          
      ROBOT.SQUARE !                    
      RDTIM DROP 10 MOD                 
      1 < IF CW.TURN  THEN              
    ELSE                                
      DROP CW.TURN                      
    THEN                                
  AGAIN ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 040
( CW.DEMO)                              
: CW.DEMO ( ---)                        
 ." {$93}   CHIPWITS DEMO BY INTERACTI"     
 ." VE ARTS."                           
  GRAPH.INIT                            
  B2.INIT                               
  GAME.INIT                             
  2 BANK                                
  CW.INIT                               
  SOUND.INIT                            
  V3 NOISE V-CTRL 65535 V-FREQ          
  ( SET UP FOR RANDOM NUMBERS)          
  ( SEE P 103 C64 FORTH MANUAL)         
  CW.CHUG ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 081
 ( COFFEE OBJ)                          
 4 BASE !                               
                                        
 0000 0000 0000                         
 1111 1111 1110                         
 1111 1111 1110                         
 1113 3311 1110                         
 1133 3331 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
                                        
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110 DECIMAL                 
                                        
 OBJ.STUFF                              
                                        
 CREATE PIE$ OBJ$,                      
                                        
════════════════════════════════════════   SCREEN 100
( SPRITES -- HEAD0)                     
4 BASE !                                
S-DEF HEAD0                             
0000 0000 0000                          
0222 2220 0000                          
0122 2222 0000                          
0112 2222 2000                          
0311 2222 2200                          
0131 2111 1110                          
0111 2111 1110                          
1111 2111 1110                          
2111 2222 2220                          
1211 2111 1110                          
1121 2111 1110                          
0112 2111 1112                          
0111 2111 1112                          
0011 2111 1112                          
0002 1111 1110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 101
( SPRITES -- HEAD1)                     
4 BASE !                                
S-DEF HEAD1                             
0000 0000 0000                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0011 1111 1100                          
0011 1111 1100                          
0011 1111 1100                          
0222 2222 2220                          
0211 1111 1120                          
0211 1111 1120                          
0211 1111 1120                          
0011 1111 1100                          
0011 1111 1100                          
0022 2002 2200                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 102
( SPRITES -- HEAD2)                     
4 BASE !                                
S-DEF HEAD2                             
0000 0000 0000                          
0000 0222 2220                          
0000 2222 2210                          
0002 2222 2110                          
0022 2222 1130                          
0111 1112 1310                          
0111 1113 1110                          
0111 1112 1111                          
0222 2222 1112                          
0111 1112 1121                          
0111 1111 2211                          
2111 1112 1110                          
2111 1112 1110                          
2111 1112 1100                          
0111 1111 2000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 103
( SPRITES -- HEAD3)                     
4 BASE !                                
S-DEF HEAD3                             
0000 0000 0000                          
0002 2222 2200                          
0222 2222 2100                          
1111 1121 1100                          
1111 1121 1330                          
1113 3333 3330                          
1131 1123 3330                          
1111 1123 3100                          
1111 1121 1110                          
0111 1112 1111                          
0111 1111 2112                          
0222 1112 2221                          
1111 2221 2111                          
1221 1111 2110                          
1111 1112 1000                          
1111 2220 0000                          
0222 2220 0000                          
0211 2110 0000                          
0211 2110 0000                          
0211 2110 0000                          
0211 2110 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 104
( SPRITES -- HEAD4)                     
4 BASE !                                
S-DEF HEAD4                             
0000 0000 0000                          
0222 2222 0000                          
0122 2222 2000                          
0112 2222 2200                          
0112 1111 1110                          
0312 1111 1110                          
0133 3333 3330                          
0113 3333 3330                          
0112 3331 3330                          
2212 1111 1110                          
1121 1111 1111                          
1112 1111 1112                          
1111 2222 2221                          
0211 1111 1110                          
0221 2111 1110                          
0222 0222 0000                          
0212 0222 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 105
( SPRITES -- HEAD5)                     
4 BASE !                                
S-DEF HEAD5                             
0000 0000 0000                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0011 1111 1100                          
0011 1111 1100                          
0033 3333 3300                          
0033 3113 3300                          
0233 3113 3320                          
0211 1111 1120                          
0211 1111 1120                          
0221 1111 1220                          
0212 2222 2120                          
0011 1111 1100                          
0011 1111 1100                          
0022 2002 2200                          
0022 2002 2200                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 106
( SPRITES -- HEAD6)                     
4 BASE !                                
S-DEF HEAD6                             
0000 0000 0000                          
0000 2222 2220                          
0002 2222 2210                          
0022 2222 2110                          
0111 1111 1110                          
0111 1111 2130                          
0333 3333 3310                          
0333 3333 3110                          
0333 1333 2110                          
0111 1111 2122                          
1111 1111 1211                          
2111 1112 2111                          
1222 2222 1111                          
0111 1111 1120                          
0111 1112 1220                          
0000 2220 2220                          
0000 2220 2120                          
0000 1120 1120                          
0000 1120 1120                          
0000 1120 1120                          
0000 1120 1120                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 107
( SPRITES -- HEAD7)                     
4 BASE !                                
S-DEF HEAD7                             
0000 0000 0000                          
0022 2222 2000                          
0012 2222 2220                          
0011 1211 1111                          
0331 1211 1111                          
0333 3333 3111                          
0333 3211 1311                          
0013 3211 1111                          
0111 1211 1111                          
1111 2111 1110                          
2112 1111 1110                          
1222 2111 2220                          
1112 1222 1111                          
0112 1111 1221                          
0001 2111 1111                          
0000 0222 1111                          
0000 0222 2220                          
0000 0211 2110                          
0000 0211 2110                          
0000 0211 2110                          
0000 0211 2110                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 108
( SPRITES -- FEET0)                     
4 BASE !                                
S-DEF FEET0                             
0000 2000 2000                          
0000 2220 2220                          
0000 2220 2220                          
0110 1220 1220                          
1122 1222 1220                          
1222 2222 2220                          
0222 2222 2220                          
0122 2222 2220                          
0112 2222 2220                          
0110 2220 2220                          
0000 1220 1220                          
0000 1100 1100                          
0000 1100 1100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 109
( SPRITES -- FEET1)                     
4 BASE !                                
S-DEF FEET1                             
0020 2002 0200                          
0022 2002 2200                          
0022 2002 2200                          
0022 2002 2100                          
0012 2002 2100                          
0012 2012 2210                          
0122 2112 2210                          
0122 2112 2210                          
0122 2102 2200                          
0022 2012 2210                          
0122 2112 2210                          
0122 2111 0110                          
0110 1100 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 110
( SPRITES -- FEET2)                     
4 BASE !                                
S-DEF FEET2                             
0002 0002 0000                          
0222 0222 0000                          
0222 0222 0000                          
0221 0221 0110                          
0221 2221 2211                          
0222 2222 2221                          
0222 2222 2220                          
0222 2222 2210                          
0222 2222 2110                          
0222 0222 0110                          
0221 0221 0000                          
0011 0011 0000                          
0011 0011 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 111
( SPRITES -- FEET3)                     
4 BASE !                                
S-DEF FEET3                             
0000 0020 0000                          
0002 2220 0000                          
0222 2220 0000                          
0222 2120 0000                          
0212 2120 0000                          
0212 2220 0000                          
0222 2222 2110                          
0222 2221 2211                          
0222 2221 1211                          
0222 2221 1222                          
0222 2222 2110                          
0111 0111 1110                          
0111 0111 0100                          
0010 0010 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 112
( SPRITES -- FEET4)                     
4 BASE !                                
S-DEF FEET4                             
0200 0200 0000                          
0222 0222 0000                          
0222 0222 0000                          
0122 0122 0000                          
0122 0122 0000                          
0222 2222 0000                          
0222 2222 2000                          
0122 2211 2110                          
0112 2111 1111                          
0110 2111 1111                          
0000 1222 2222                          
0000 1100 1100                          
0000 1100 1100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 113
( SPRITES -- FEET5)                     
4 BASE !                                
S-DEF FEET5                             
0020 2002 0200                          
0022 2002 2200                          
0022 2002 2200                          
0022 2002 2200                          
0012 2002 2100                          
0012 2002 2100                          
0122 2112 2210                          
0122 2112 2210                          
0122 2112 2210                          
0021 2002 1200                          
0111 1111 1110                          
0122 2112 2210                          
0110 1111 0010                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 114
( SPRITES -- FEET6)                     
4 BASE !                                
S-DEF FEET6                             
0000 0020 0020                          
0000 2220 2220                          
0000 2220 2220                          
0000 2210 2210                          
0000 2210 2210                          
0000 2222 2220                          
0002 2222 2220                          
0112 1122 2210                          
1111 1112 2110                          
1111 1112 0110                          
2222 2221 0000                          
0011 0011 0000                          
0011 0011 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 115
( SPRITES -- FEET7)                     
4 BASE !                                
S-DEF FEET7                             
0000 0200 0000                          
0000 0222 2000                          
0000 0222 2220                          
0000 0212 2220                          
0000 0212 2120                          
0000 0222 2120                          
0112 2222 2220                          
1122 1222 2220                          
1121 1222 2220                          
2221 1222 2220                          
0112 2222 2220                          
0111 1110 1110                          
0010 1110 1110                          
0000 0100 0100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 116
( PIE.S)                                
4 BASE !                                
S-DEF PIE.S                             
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0022 0000                          
0000 0022 2000                          
0000 0212 2200                          
0000 2221 2220                          
0002 2222 1222                          
0222 2222 2122                          
2222 2222 2212                          
0111 3113 1112                          
0131 1111 1312                          
0311 1311 3112                          
2222 2222 2222                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 117
( COFFEE.S)                             
4 BASE !                                
S-DEF COFFEE.S                          
0000 0000 0000                          
0000 0100 1000                          
0000 1001 0000                          
0000 1001 0000                          
0000 0000 0000                          
0003 3330 0000                          
0033 2233 0000                          
0332 2223 3000                          
0332 2223 3330                          
0333 3333 3033                          
0333 3313 3033                          
0333 3313 3033                          
0333 3313 3330                          
0333 3313 3000                          
0033 3333 0000                          
0003 3330 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 118
( BRICK.S)                              
4 BASE !                                
S-DEF BRICK.S                           
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 119
( COFFEE2.S)                            
4 BASE !                                
S-DEF COFFEE2.S                         
0000 0000 0000                          
0000 0100 1000                          
0000 1001 0000                          
0000 1001 0000                          
0000 0000 0000                          
0002 2220 0000                          
0022 0022 0000                          
0220 0002 2000                          
0220 0002 2220                          
0222 2222 2022                          
0222 2212 2022                          
0222 2212 2022                          
0222 2212 2220                          
0222 2212 2000                          
0022 2222 0000                          
0002 2220 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
DECIMAL                                 
════════════════════════════════════════   SCREEN 160
( EDITOR PATCHES)                       
                        : SE DUP R# ! PP
 QUIT ;                                 
        : 16) 16 SE ; : 17) 17 SE ;     
                                : 18) 18
 SE ; : 19) 19 SE ;                     
                : 20) 20 SE ; : 21) 21 S
E ;                                     
: 22) 22 SE ; : 23) 23 SE ;             
                        : 24) 24 SE ; : 
25) 25 SE ;                             
                                        
                                : S-C/L 
40 ' C/L ! ;                            
                : N-C/L 64 ' C/L ! ;    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 161
( PRINTER OPENER)                       
." 4 CLOSE --- TURNS OFF PRINTER."      
4 4 3 " 0" OPEN                         
4 CMD                                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
