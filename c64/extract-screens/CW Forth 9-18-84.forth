( Input file: ../disks/CW Forth 9-18-84/CW Forth 9-18-84.d64 )
( LINEWIDTH: 40 )
( ----------- Screen 0/170 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 1/171 ----------- :)
( CHIPWITS DEMO  9-18-84)               
FORGET IT : IT ;                        
2 6 THRU   ( VARS)                      
100 107 THRU ( HEAD SPRITES)            
108 115 THRU ( FEET SPRITES)            
116 120 THRU ( OBJ SPRITES)             
10 40 THRU                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 2/172 ----------- :)
 ( VARIABLES)                           
: VAR VARIABLE ; : IS CONSTANT ;        
VAR ROBOT.SQUARE                        
VAR ROBOT.ORIENTATION                   
VAR ROBOT.X VAR ROBOT.Y                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 3/173 ----------- :)
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
                                        
                                        
                        

( ----------- Screen 4/174 ----------- :)
( ORIENTATION CONSTANTS)                
                                        
7 IS W 6 IS SW 5 IS S 4 IS SE           
3 IS E 2 IS NE 1 IS N 0 IS NW           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 5/175 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 6/176 ----------- :)
( MOVE.SOUND)                           
                                        
: MOVE.SOUND ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 7/177 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 8/178 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 9/179 ----------- :)
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
                                        
                                        
                                        
                                        
                        

( ----------- Screen 10/180 ----------- :)
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
                                        
                                        
                                        
                                        
                        

( ----------- Screen 11/181 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 12/182 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 13/183 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 14/184 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 15/185 ----------- :)
( B2.INIT  BANK 2 INITIALIZER)          
( SEE P 48, 64 SOUND & GRAPHICS)        
                                        
: B2.INIT  ( ---)                       
  ( 56576 C@ 253 AND 56576 C!)          
  1 16 * 4 + 53272 C!                   
  132 648 C! ( OUTPUT TO 132 * 356)     
  147 EMIT   ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 16/186 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 17/187 ----------- :)
( COLOR.TEST SPRITES.OFF)               
                                        
: COLOR.TEST ( ---)                     
 0 0 D-POSITION                         
 ."                          "          
 0 1 D-POSITION                         
 ."                          "          
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 18/188 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 19/189 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 20/190 ----------- :)
( GRAPH.INIT)                           
( SETUP GRAPHICS)                       
: GRAPH.INIT ( ---)                     
                                        
 WHITE 0 S-MULTIR ( 1 COLOR)            
 GREEN 1 S-MULTIR ( 3)                  
 2 4 CHAR.COPY                          
 HEAD.INIT                              
 FEET.INIT                              
 OBJ.INIT ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 21/191 ----------- :)
( GAME STUFF ,VARS)                     
                                        
: $IS $CONSTANT ;                       
$IS F$ "            "                   
                                        
$IS W$ "              "                 
                                        
                                        
$IS T$ "             "                  
                                        
$IS R$ "                 "              
$IS R1$ "           "                   
                                        
                                        
                                        
: R$.? R$ $. R1$ $. ;                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 22/192 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 23/193 ----------- :)
( GAME.BK)                              
                                        
: GAME.BK ( ---)                        
  BLACK BKGND PURPLE BORDER             
  33832 960 160 FILL                    
  ( FILL SCREEN INVERSE BLANKS)         
  55336 960 36 FILL                     
  ( FILL COLOR MEM W CYAN)              
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 24/194 ----------- :)
 ( GAME.WNDW STAT.WNDWS)                
: GAME.WNDW ( ---)                      
  0 2 D-POSITION                        
  ."                             "      
  0 3 D-POSITION                        
  ."  ====== GREEDVILLE ====== "        
  0 4 D-POSITION                        
  ."                           "        
  1 5 D-POSITION                        
  ."                            "       
  0 5 D-POSITION                        
  16 0 DO ."        " LOOP              
  24 5 D-POSITION                       
  16 0 DO ."        " LOOP              
  0 21 D-POSITION                       
  ."                            "       
  1 22 D-POSITION                       
  ."                              "     
  26 3 D-POSITION                       
  19 0 DO ."    " LOOP                  
  ;                                     
                                        
                                        
                                        
                                        
                        

( ----------- Screen 25/195 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 26/196 ----------- :)
( SCORE.WNDW)                           
                                        
: SCORE.WNDW ( ---)                     
27 2 D-POSITION                         
."   "                                  
27 2 D-POSITION                         
." CYCLES SCORE"                        
27 3 D-POSITION                         
."  1291   170    "                     
28 4 D-POSITION                         
."                "                     
;                                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 27/197 ----------- :)
 ( STATUS.WNDW)                         
                                        
: STATUS.WNDW ( ---)                    
 27 5 D-POSITION                        
 ."      STATUS   "                     
 27 6 D-POSITION                        
 6 0 DO                                 
  27 6 I + D-POSITION                   
 ."                     "               
 LOOP                                   
 27 12 D-POSITION                       
 ."                  "                  
 28 13 D-POSITION                       
 ."                "                    
 28 6 D-POSITION                        
 ."  "  R$.?                            
 33 6 D-POSITION                        
 ."  "  R$.?                            
 28 9 D-POSITION                        
 ."  "  R$.?                            
 33 9 D-POSITION                        
 ."  "  R$.? ;                          
                                        
                                        
                                        
                        

( ----------- Screen 28/198 ----------- :)
 ( MEMORY.WNDW)                         
                                        
: MEMORY.WNDW ( ---)                    
 27 14 D-POSITION                       
 ."      MEMORY   "                     
 27 15 D-POSITION                       
 6 0 DO                                 
  27 15 I + D-POSITION                  
 ."                     "               
 LOOP                                   
 27 21 D-POSITION                       
 ."                  "                  
 28 22 D-POSITION                       
 ."                "                    
 28 15 D-POSITION                       
 ."  "  R$.?                            
 28 18 D-POSITION                       
 R$.?                                   
 33 15 D-POSITION                       
 ."  " R$.?                             
 33 18 D-POSITION                       
 R$.? ;                                 
                                        
                                        
                                        
                        

( ----------- Screen 29/199 ----------- :)
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
                                        
                        

( ----------- Screen 30/200 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 31/201 ----------- :)
(  CW.SQUARE.PUT)                       
                                        
: CW.POSITION ( X/Y ---)                
  2DUP 16 -                             
  S.HEAD S-POSITION ON S-ENABLE         
  S.FEET S-POSITION ON S-ENABLE ;       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 32/202 ----------- :)
( CW.SQUARE.PUT)                        
                                        
: CW.SQUARE.PUT ( SQ# ---)              
  S.SQUARE.XY                           
  2DUP ROBOT.Y !                        
  ROBOT.X !                             
  CW.POSITION ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 33/203 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 34/204 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 35/205 ----------- :)
 ( SLIDE)                               
                                        
                                        
 : SLIDE ( X/YDELTAS---)                
   8 0 DO 2DUP                          
                                        
   ROBOT.Y @ + DUP ROBOT.Y !            
   SWAP ROBOT.X @ + DUP ROBOT.X !       
   SWAP                                 
   CW.POSITION                          
    MOVE.SOUND 1 WAIT                   
   LOOP DROP DROP ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 36/206 ----------- :)
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
                                        
                        

( ----------- Screen 37/207 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 38/208 ----------- :)
( CW.INIT)                              
                                        
: CW.INIT                               
  9 ROBOT.SQUARE !                      
  9 CW.SQUARE.PUT                       
  SW ROBOT.ORIENTATION !                
  SW S.IN                               
  S.HEAD ON S-ENABLE                    
  S.FEET ON S-ENABLE ;                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 39/209 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 40/210 ----------- :)
( CW.DEMO)                              
: CW.DEMO ( ---)                        
 ."     CHIPWITS DEMO BY INTERACTI"     
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 41/211 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 42/212 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 43/213 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 44/214 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 45/215 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 46/216 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 47/217 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 48/218 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 49/219 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 50/220 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 51/221 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 52/222 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 53/223 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 54/224 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 55/225 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 56/226 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 57/227 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 58/228 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 59/229 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 60/230 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 61/231 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 62/232 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 63/233 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 64/234 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 65/235 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 66/236 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 67/237 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 68/238 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                       ".  !     ".  ! %
     %  0  "0  !     %$   Z& )s Q+A*9  F
 LN   : MT  : MT $ 9  # % %   M9  F  N  
 : MT  : MT $ 9  * # % % *   M9   ALIG  
N   "   &  2 t$  :   >     T T  L  9  # 
%O  %    T T  : L  9  # : % %O     $ 9  
F  N   MT  : %-N M OT    % M9  F   ML   
"   " "$ |+TL    H H H  ".  !  s Q+A*9  
FPS pLg  H FBAS  L   L FRESE  L     L  9
  FINI  L   L     L  9  FE  L   L  9  FZ
  L   L9 s   t$9  FN  L   L[ s   t$9  FO
  M   L "  s   t$9  SF  M   L "  s  L   
  "  s  : L $ L  9  SF .M   L "  s  L  /
  "  s    BOUND LWg    NOT [W   W  #W   
  "   % 69  NEXT-POINTE kW   3 "    K5  
  /   9  - *  9  MOVE-SPRIT  W   W W  #W
   5rW9  DRAWLIN  W   W  #W   T9  VALID-
POINT  W   W  #W   $ $ "     * "@   s  *
 "  > s  * "  > s / t$    +SgW1 9  NEW-P
OIN  W  WW  WV  /   /W1 

( ----------- Screen 69/239 ----------- :)
  INTABLE  J J    ]     h     p     t   
  s     l     \     C         W         
F   h             #   #         {    SIN
TABL wJ  /  "2 >      "3   %J     J9  S1
8  J  /  "Z >      "   *   J9  SI  K   "
h  $/        "h   /  "  >      "     KH$
     K9  CO 5K      :; 4$  4$  T  H$ T$ 
 4   4   4    } } 9  ELLIPS  T   "h  $ "
              9  * "h   0  "   % $"!uK "
 '   "d    "   %   $"!;K " '   "   % * "
d    "   %   4 $    } } } 9  CIRCL  U  T
 T T  "d  "K  % % % U9  +90DE  V     -90
DE 0V     DIRECTION =Vg           R*9  D
I fH    bH  R*9  GCH  H  /   r  "  2    
 r /   r ^$ =r   | /   r /  " "2  $ "  2
  $ $ "  2  $ $ "  2  $ $ "  2  $ * "! 2
  $    r /   A*  r   ( /   r  "t 2     r
 /   Q+/   B       r  "  bH$ 9  <DECOM  
H  /      "      2   b /   /  ";   2  $ 
"    2    S     1ARRA \S    d e    x  *d
   9  2ARRA lS    /     d e    x T  %  Z
&    d  %  r 9  S-DE  S     "?   0    * 
$ $$          x  * "? w 9  STRIN  S     
 B  ""  * $  /   / e w    x   9  WAV  Sg
  T PLAY.NOT  T   "     "   *   * R * % 
6 S37$T  379  V-DEFAUL (

( ----------- Screen 70/240 ----------- :)
  4 qF   "  <F9  5  F   "  <F9  6  F   "
  <F9  7  F   "  <F9  8  F   "  <F9  9  
F   "  <F9  10  F   "  <F9  11  F   "  <
F9  12  F   "  <F9  13  F   "  <F9  14  
G   "  <F9  15  G   "  <F9   *G   E  9  
 :G   "   *0 "!B "!'F     "  >G9   FG  /
  "  0 "!"!B 'F   YQ  9 K51 9  S hQ  [ K
51 9  S wQ   "  K51 9  S  Q   "  K51 9  
S  Q   "  K51 9  S  Q   "  K51 9  S  Q  
 "  K51 9  TRIANGL  Q     SAWTOOT  Q  ! 
 PULS  Q  A  NOIS  Q     RIN  R     RESE
  R     SYN  R     FILT (R     FILT 3R  
   FILT ?R     FILTE KR     LOWP  J4  a4
IQ P 4 4 "   "   49  DIRECTIONS-INI CY  
HW  WV/  "     *0 / "!    "!r 1  "      
$ 9  CSOUND-INI uY   8 "   6     7 "    
 7$R37 R37   "  ~79  CURVE-INI  Y  WW1 H
W1  Y6SgW1 QY!Y Y9  C-CURV  Y     Y X9  
CALL-RDRAGO  Z  uZ9  LDRAGO (Z  /       
 X    /    NO   : MT  : %-N M OT  : % M9
  RSCAL mO   MO -N L  9  #Z& M9  LSCAL  
O   MB -N9  L   #Z& M9  FI  O   M    D /
       O -N L  9  #  & B -N9  L   #   : 
    "   L  Z&$   -NZ&    9  FAB  O   M-N
m Z& M9  FNEGAT  P   M-N9 Z& M9  FMI 5P 
  : MT  : %-N M OT j; % 

( ----------- Screen 71/241 ----------- :)
  "@    L $ L  9  @EXPONEN VM   L4M\M/  
"  s  "    T  M     "   $     "  s  %9  
!EXPONEN  M  /  "    /  "    Z&2 t$     
"   L   */  "  s /     /  "  2 t$     " 
  L  $  "  s  $4M\M9  <RO  M  Z&Z&9  E &
N   M-N  r  . E  9  F 5N   MT  * $m    %
      "!;   0 H   r /    4     W1 r /   
;W1 r    4    #W1 9  DRA ?X  KX W  $ gW 
      W W    6SgW1  W  #W   4 W9  MOVE-D
IRECTIO  X  WW     "  s WW1 9  C-DRA  X 
 /        X    / O  X9V X/ O  XFV X$ 9  
SPRITES-INI  X  ^Q "   V "@  V   5 P.6 S
o5 S 59  HI-RES-INI  Y   "   3 S   "h  $
 "Z   ;K9  D2 oK      9  EASY-BIT  K    
0 T  K K %  /        %   %d O      %d  "
        9  2'S-BI  K  T  K/        K %  
 %B      K %   ,    $  %O        %B 9  1
'S-BI  K  T /       }  %B      K "   % ;
   %  9  SQR  L    9  "   KZ&$  "   K K%
L9  2ROO                           DRAGO
N JV S                            ?  ?  
?  <  x        `  p 88 p   *  DRAGON yV 
S                                  }   ~
  >    `  `  p 8p Tp     X-NE  Vg VA Y-N
E  Wg OT X-IN  Wg NT Y-IN 'Wg RI LENGT 3
Wg    DIR-IND ?Wg    IN-

( ----------- Screen 72/242 ----------- :)
  $    : r / mH^$ = !/  "Q 2      *c%   
  "  2     LI    $  H    r  H^$ =$ 9  DE
CO BI        $   bH1 LI    r  NOT FOUND9
  TABL  I      0          x  *[       9 
 SINTABLE  I J[   2     b    !|! !*"}" "
 #g# # #8$x$ $ $'%[% % % % &5&X&x& & & &
 & & & ' ' ' ' S  T   "   "   7     7 Q$
T1    "  ~79  S.DIS ZTg  L L.DIS  Tg CE 
AC  Tg E  B-LIN  T   4    9  $A / T T ; 
 * 4    9  $A / T T ;    $ T1    # T1 > 
 % % % %Z& * "   &     4   T1  *$    *  
   4   T1 $    T   T   $ T     T1  T    
0  T   T$  T           4$  4$     "     
 >G9   hG   $ *'FJG9    G  l)  $"9    G 
 l)  /   /               1  *   %    } 9
    G  l)     "    j  GB,9    G   G9 l)$
 9    G   G "  l)$ 9  S  H   E *  $  %  
/ lG Ew 9  S  H  T T l)   %   %)! H %l)1
  %JG %1 l)1 9  GI  Fg E  GIN \H    bH  
r / bH1   AS WR     BANDPAS dR     HIGHP
AS rR     NOTC  R     NOTE-VALUE  Rg    
   ~               .  NOTE  R  d  R    9
  3OF  R     V  R     61 9  V  R  9  61 
9  V  R  [  61 9  OF  S     O  S     FAL
S  S     TRU #S     JOY /S     JOY :S   
  UPOR ES     COLOR-ME P

( ----------- Screen 73/243 ----------- :)
  O GZFV X/ O 7Z$ 9  RDRAGO =Z  /       
 X    / O GZ9V X/ O uZ$ 9  D-CURV kZ   "
   YGZ9  WAIT-5-SE  Z   "    0 "!"!  $  
   9  DEM  Z   "  [    Z 8 Z   Z 8 Z    
9   X9V X/ O  XFV X$ 9  SPRITES-INI  X  
^Q "   V "@  V   5 P.6 So5 S 59  HI-RES-
INI  Y   "   3 S  M9  F MP  rO}  M9  FMA
 pP  :;:;TPrOSO9  BLAC  P     ORANG  P  
   WHIT  P     BROW  P     RE  P     LT.
RE  P     CYA  P     GRAY  P     PURPL  
P     GRAY  P     GREE  Q     LT.GREE  Q
     BLU  Q     LT.BLU 'Q     YELLO 2Q  
   GRAY @Q     S MQ    K51 9  S   y91 9 
 .  9        0 w9    0* (      0* ( *0 "
!      [ w9A         r  EMPTY STACK   9 
 .INDE  9  /  $9 Z& +9  &$    $     "   
 [ R* $    Q+9  ?ESTAC  9      K  EMPTY 
STACK9  BMOV (:  Z&Z&   ,    Z&      Z&w
 9  COP H:   $     *    1 B,9  SCOP l:  
Z&Z&B  *    69  OSC3  7   "   69  ENV3  
7   "   69  SID.INI  7   "  x6     "    
1    "    1  "    1 x6   "    j    61 9 
 SOUND.INI  7   "  x61  79  FINI  8g    
RWSEC (8  Z&[  "Z&Z&   * "   &T Z&/  "X 
>     O  + % &9  READSR 48   $ $9 =8$ 9 
 WRITEDS m8   $ $  =8$ 9

( ----------- Screen 74/244 ----------- :)
    $ "  s  A A  ! n@   ! =K  INCORRECT 
ADDRESSING  G@   @        G@   "  s     
G@   "  s  "                n@9  ADC ]Bo
B`n  AND  BoB n  CMP  CoB n  EOR  CoB@n 
 LDA  CoB n  ORA 'CoB n  SBC 3CoB n  STA
 ?CoB l  ASL KCoB    DEC WCoB    INC cCo
B    LSR oCoBA    RIORIT  5   "  X59  S-
MULT  5   "  X59  S-POINTE  5   3 "    K
5      9  S-PO  5   "  K5  d      "     
"  K5  N. . "  K5  d     9  S-COLO  5   
"' K5      9  S-S-COLLISIO $6   "    9  
S-B-COLLISIO >6   "    9  SI X6g E  VOIC
 r6g ID SID |6  x6      9  VOICE  @   " 
 G@1 9  X  @   "  G@1 9  )  @   "  G@1 9
    @   "  G@1 9  BO  @  }@  9  SE  @  }
@[ 9  RP  @  }@ "  9  UPMOD  @      G@  
 "  s        "  G@$ 9 G@   "  s         
0 /        $B   s   9  CP  @         x  
   n@9  BRK IAWA  CLC bAWA  CLD lAWA  CL
I vAWAX   E s3   "   " "     "  s  $ "  
  9  BITMA  3  [   z3 "   "   .9  CHARBA
S  3  d  "     "  s  $ "    9  S-MULTI  
3   "%     9  MULTI-MOD  4   "   "   .9 
 B-GRAPHIC "4   "   "   .9  B-FIL =4  33
 "@ Z&j 9  B-COLO X4     * 3    9  B-COL
-FIL o4     3 "  Z&j 9  

( ----------- Screen 75/245 ----------- :)
    9  2  >   :9  2CONSTAN  >   ;9  2DRO
  >  } 9  2DU  >    9  2OVE  >  :;9  2SW
A  >   :9  2VARIABL  >   ;9  >BINAR  >  
? 9  EMPT  >   !   "  r 1  !5,   "     "
0 w 9  ERAS  ?    j 9  FLUS 5?   (9   E?
    9  OCTA S?   "    1 9  U. ]?     *  
9  [' q?  u   9    l1          9  "   $ 
"O   0 "!   "  2 t$    / "!1 B  "      $
 9  APPLICATIO  1   "e% "     ! $   $1 r
  "     $1 r  "   *1  "   "    / O      
!/  $ "   */    "  s B   / t$    $  )9  
SWAPOU  1   "   "   . "   "   .9  SWAPI 
`2   "   "  s. "   "  s.9  H  2      "  
      $  "  R* "    0 / "!    /  "     $
 "~ >  $    $  ". a     $  "   ;       !
  \ $    %  1 9  'TITL 4<g  = TITL  <   
  "  R*r  SUPER-FORTH 64 VERSION 1.1.0  
9  TRIA  =     "   + *$  "     "   $   *
0   "!$"       !9      =  #  "  a 9  <EM
IT7 ==    [ '   B 9  C *   $B    *  [ 9 
 NO {D   "    9  C  D     0  D     0  D 
    >  D     V  D  P  AGAIN  D  9 '  C9 
 WHILE  D  T / 9 '  %ADr 9  REPEAT  D  T
 T 9 '  C % %[   WD9  END-COD  E      2 
1 0*r 2      *  # r  CODE ERROR, STACK D
EPTH CHANGE9  ENTERCOD  

( ----------- Screen 76/246 ----------- :)
  0 "! $s:B     $ 9  DSWA  :   "   & "  
 &9  D  :  9   9  D0  :   $  9  D  :   :
 :9  D  :   :> 9  D  :  / r    *  9  DCO
NSTAN  :     *       x /    *r   9  DOVE
  ;   "   % "   %9  DMA 2;  :;:;>      :
} 9  DMI J;  :;:;> t$     :} 9  DU c;  T
 T  "     % % "     CALCNEX  8   $   *Z&
 $ $ *  /        *$ Z&Z& *      $  *$   
Z&Z& *9 081 9  CINI  8   $  B 5,        
 "   + *$ Z& $  9  COPYSDIS  8     "   8
 8  r  INSERT SOURCE DISK   !$ w8r  INSE
RT DEST DISK   !$  808      9  .S  9    
 .S q9     "y91 9  .S {9   "   "   ROL {
CoB!   ROR  CoBa   STX  CoB    CPX  CoB 
   CPY  CoB    LDX  CoB    LDY  CoB    S
TY  CoB    JSR  CoB    JMP  CoB@   BIT  
CoB    BEGIN  C    9 9  UNTIL  D  T 9 ' 
 %    B     9  IF  D          [ 9  THEN 
;D  [ '    $       *1      $B    *  9  E
LSE OD    OF  6   6   "      9  V  6   6
 69  SID  6  x6      9  V-FRE  6  r*9  6
   69  V-P  6  r* "   6[  69  V-A  6    
 "   69  V-S  7     "   69  V-CTR  7   "
   69  F-FRE *7     "   + "   6 "   69  
RESFIL =7     "   69  MODEVO ^7     "   
69  PADDLE t7   "   6 " 

( ----------- Screen 77/247 ----------- :)
  CLV  AWA  DEX  AWA  DEY  AWA  INX  AWA
  INY  AWA  NOP  AWA  PHA  AWAH PHP  AWA
  PLA  AWAh PLP  AWA( RTI  AWA@  RTS  AW
A` SEC  AWA8 SED  BWA  SEI  BWAx TAX  BW
A  TAY !BWA  TSX +BWA  TXA 5BWA  TXS ?BW
A  TYA IBWA  M/CP SB           x / B    
"  s      "  G@$  B-  4g E  B-  4g E  B-
PE  4g AS B-ERAS  4     41 9  B-DRA  4  
9  41 9  B-PLO  4     41  41 /  "  s  "(
    * "  s    $ "  s   33   4   *Z& "  s
  "   *  N. .9  SPRIT  4g  S S-FSE B5  K
5  N. .9  S-ENABL O5   "  X59  S-XEX d5 
  "  X59  S-YEX y5   "  X59  S-P   ASSEM
BLE  ?    0E   XSAV          ?     UA  ?
     I  ?       ?     PO  ?     POPTW  ?
     PU  ?     PUS  ?     NEX  ?     SET
UP  ?  o  INDE  @g                      
          , MOD  @g    . @@    G@1 9   K
@  9 G@1 9  ME Z@  [ G@1 9  , h@   "  G@
1 9  , x   j2   29  H  2  j21  29  HC  2
  j2   29  HC  2  j2   29  'BAN  2   "  
   "  s  "   - "   "9  'SCREE  2   "    
 "  s  "   " 2  9  'BITMA  3   "     "  
s  "   " 2  9  'CHARBAS )3   "     "  s 
 "   " 2  9  BAN M3   "   "  s. "   - " 
    "  s  $ "    9  SCRE

( ----------- Screen 78/248 ----------- :)
   "  s J 9  ID  =   " =    1    "  s Q+
 "L     1 9  VLE  =g (  VTA  =g    VLIS 
 =   "   $1 2      =  O  $     $   "  s 
           $1 /  = =   $   $ $  R* $ "  
/    ;   $    $ 9  '  =  0*9  -TEX C>   
    *0 $ r /     "!    /     / ;    ![  
    *$ 9  2 N>    ?   ?0*9  COD xE     *
  /   1 n@ E9  ;COD  E         - E9  CHK
LI  E  /  "  s K  OFF SCREEN9  LIN  E   
E/  %1 l)    B,9   P  E   $B  * E9  *w 9
  EDITO  E    /H ?       * E$  * Ew 9  S
 #F  /  %1  Fc%9  0 7F    <F9  1 JF  9 <
F9  2 WF  [ <F9  3 dF   "  <F9       > 9
  DVARIABL ~;     "  e 9  PAUS  ;       
  "    0            "    0     9  INDE  
;     $  / Z&  B Z&Z&   $ #B > K  BLK NO
. ERROR0 "! 9 ;       !9     9  DUM  ;  
      T   0   / "!  /    "    [ R*/  "  
  0 / "!     "        $ A*/  "     "    
0 / "!     $ $  H  L   PA  $     "D   9 
 PAG  $  O   # 9  PF  $  9 .+ "    9  PI
C  $  / 9   K  PICK ARGUMENT < 1d 0*    
9  PRE  %g    QUER 5%   *   "P M   L 1 9
  QUI @%      1  -   &H% ! *  t$    r  O
K    9  R \%o,L RSHIF  % %  L %V v    L 
  R/  %  Y   # 9  R  %o,

( ----------- Screen 79/249 ----------- :)
    LOO  "   "  '           9  LSHIF  " 
"  L "  6    L   M  "     -T ;  *|+ %  9
  M*  "     - *; T  *; T  $ -Z&Z&m  * %|
+Z& %|+Z&     % +Z&Z& % + *$  *Z&  9  M 
 #  _(  9  M d#   $T T /    %;  + % % -A
  * %A  *9  M/MO q#  T    % + % *T  + %9
  MA  #           XO  - -  U H  U   L   
  -     *1 9  [COMPILE  -  u   t$K  NOT 
FOUND$     9    -   "   *1 9  THR  -  B 
 *0 "! +"! "       !    9  SYSCAL  .   (
} } 9  MAS 3.  9  * "9  RECU G.   ! $   
 9  SBI X.   $   "   -s  +9  CBI l.   $ 
 s  +9  FBI  .  Z&    s.     .9    L    
     L   HER         9  HE      "    1 9
  HL   o,F HOL      "   !$  !    9    ! 
% I  !+!      H     L   I $!            
[ 9  IMMEDIAT :!   ! "@  +9  INPLF O!g  
  INIT-FORT g!     INIT-USE t!     INTER
PRE  !  "   # 9    ! !      H     L   KE
  !  ,       9  U/MO  + +               
  *      6 6 & 8         H    h      6 6
     L   U  +     *  > 9  UNTI  ,  9 '  
         9  U  ,     UPDAT 0,  <%     " 
  $<%  1 9  US 9,g    USE X,           e
 H  e L   VARIABL b,    [ e 9  VOC-LIN ~
,o,  VOCABULAR  ,      #

( ----------- Screen 80/250 ----------- :)
                                        
       L  H             h      L   EXECU
T   %           L   EXI   ; h  h  L   EX
PEC 2       # 9  FENC D o,   FIL W    $ 
           } $ 9  FIN c         $       
  9  FIRS        FLAS   g l  FL   o,D FO
RGE        -      & ; P e x             
      2 D V g x      SIG  )         "-  
!9  SMUDG  )   ! "   +9  SP  ) *     L  
 SP  *o,  SP !*2* H  L   SPAC **    a 9 
 SPACE 9*     #        0 A*    9  SPLI I
*t*    L3* STAT j*o,P SYSDE {*g    SWA  
* *  H          L   TEX  *         0* ( 
*    9  DIGI     8   00   0 8    0      
   H L   H  L   DLITERA      *       * "
 "9  DNEGAT   ; 8          LK$ D /     0
    "  9  DOES I          "      x 9    
  i    e   8h    h    L   DOSER \       
*        '  '       L   D   o,  DP   o,B
 DR                  `          h    i  
        '`  '       (`         0        
               Z   ?(   8`    `      8  
     i: M    0 L `         \  `         
LE( S->  &  /   H$9  SAV X(r(   o     * 
       L (       R) S )              L  
 SY i( (     o  L       

( ----------- Screen 81/251 ----------- :)
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
                                        
                        

( ----------- Screen 82/252 ----------- :)
   # 9  LATES  !        9  LEAV  ! !    
             L   LF  !   "    9  LIMI  "
     LIS  "  / l)1 /     >     /   1 r  
 SCREEN # + "        0   "! "    r  ) "!
l)  |        !      9  <LIT  " "  H     
         L   LITERA  "   *         "  9 
 LOA  "  7   # 9   9  WARNIN  ,o,  WHIL 
 ,  ?!r 9  WHER  ,        ]     / l)1 r 
   SCREEN # /   L    "   $    / r  LINE#
       Z&            Q+L    "  >       L
         / T      %  B    "  2     O R* 
%  0  "^ a     9  WIDT  ,o,  WOR |-     
 # 9    -           *     %$ 9          
K  NOT IN CURRENT VOCABULARY$ ^$/ _    ,
K  IN PROTECTED DICTIONARYT  %2    ,    
   %     ,         ,   % $ ,          / 
 ,1 /  "     $ "  /  % ,     $  1       
     %  1 9  FORT        Z   FREEZ      
"     "     ! "0 w  "  r    !1 9  G     
          B    -   $/     B    $  B w 9 
 THE  *  u [ '    $   *1 9  TI  *o,  T&S
CAL  *      # 9  TOGGL  * +  U   L   TRA
VERS  +   * $   "   $         *$ 9  TYP 
#+  /        $   *0 "!  a 9         } 9 
 U J+~+                6 6 6      u     
u     u      L   U w+   

( ----------- Screen 83/253 ----------- :)
     $1 9  DR          )9  DR       9  )
9  DR       [  )9  DR        "   )9  DRO
   & L   DU   1   H  L   ELS )   [ '    
        *[  *[ 9  EMI 9       # 9  EMPTY
-BUFFER Z      " $       "O   0  "  "!1 
  "! "    1  "      9  ENCLOS k      o  
8                      H       h    L   
S  (  '*  9  SAVE-BUFFER  (    B   0  " 
 + $     9  SAVE-FORT  (         ""  * $
  /     P)  P)  w     }  "    p(9  SAVEN
AM  )g  SUPER-FORTH 64      SC E)o,N SEC
/BL f)g    SET-DR o)     $$ 9  SEC/TR })
g       * ? T i ~                 -NE v0
  {  / " "    <%1   ^,1     1 9 l)1 9  F
-APPEN  0   /  B     B / l)1 0 "!  L0 / 
   "!  1  !     "  C/9  F-EDI  0   0 09 
 F-SAV  1   / / "O   0 "!   "  s  "   - 
   "!r  0 "       "  C/9  F-LOA +1   0 /
9    "    0 / L0 /9  "     !     "  C/9 
 F-NUMBE  g          ' Q    e     e   H 
 )   8  )  )  h        L &   i'         
    )   8  )  )                         
L    i          jj    0     0 M         
   i             `  )    $(     $(      
'    '`      ]   ?(     '      L   ?(   
  '`               `    

( ----------- Screen 84/254 ----------- :)
         (2064)   RL  L   Z    x        
  . Z!F[   2 {   J l D     <         c U
1:4 0 03 14 \I \B-P 4 0 \ #             
          `    L      h                i
       L   EBS#                         
                                   k    
                  NO. ERROR + "   &$ 9  
<T&SCALC          *[  "/  "` >     r B  
"# d  )  /   /  "   %>     $       Z& * 
  * )    9  <WORD     f  *    >     } } 
    1   4 L $  $  / T         B  %/  "  
> K  INPUT > 255B w   9  <VOCABULARY79 Z
      "     "       ,     ,1         Q  
 #          i e      e           HL     
                       HL   <INTERPRET  
          *                  #        $ 
   B           $  "P     9  <KEY 6      
r!            L3* <LINE        *        
9  <LOAD       t$K  UNLOADABLE    T L   
T   L 1     /     / 9  ?LOADIN         t
$K  USE ONLY WHEN LOADING9  ?PAIR       
K  CONDITIONALS NOT PAIRED9  ?STAC     0
* ( * ,K  EMPTY STACK0* ( "u    ,K  FULL
 STACK9  ?STREA G   K  INPUT STREAM EXHA
USTED9  ?TERMINA         # 9         H  
      L   ABOR         #

( ----------- Screen 85/255 ----------- :)
      L                  L  L   <?TERMIN
AL            L3* <ABORT      *P     c%9
  <ABORT" (        ,   %  Q+ *c%     %/ 
    B T 9  <BLOCK @    $    T <%  /    %
  d   0 T t$    $  %+ /  %9  %  /    %  
d t$    / <%1  %$ r 9  <CMOV q   / 9    
   } $       9    # 9  BORDE      "    9
  BPDR        BRANC        e H   e   h  
L   BUFFE     ^,  <%  2     ^,  T $ ^,1 
^,  /    "  2 t$($  s K  BUFFERS FULL/ T
 T     ^,1  %         %r  %   "  s    % 
%1  %<%1  %r 9  BY "      "    9  C     
    L   C         9 e 9  C/             
     L   0       > 9  0BRANC            
    i       L  L           1 5   9   9  
1 =   9   9   J      2 W f   6 L   2 _  
 [   9  2 m   [   9  2 z   [   9  79-STA
NDAR     9       0*y 1     2 1    * .   
 H  H   i    e   L            9  * -9   
    8             L | l  L &   *{  "  p!
1  "   $1  $ "     "     "  a r H       
   SUPER-FORTH 64 V1.1.1   COPYRIGHT 198
3 BY ELLIOT B. SCHNEIDER     ^,1  "  <%1
    !   "  1   2 9  COMPIL     u  %/ r T
     9  CONFIGUR       r   NO. OF DRIVES
?  !/  "1   /  "   ,t$K 

( ----------- Screen 86/256 ----------- :)
      T  # %v#9          u     u     L  
 +   &    u           u   L   +         
  H$9  +BU <    "    /  "2     $   / <% 
   9  +LOO M    "  '           9   t    
 1  "  e 9       8             u     u  
   L   -FIN         # 9  -TRAILIN     / 
  0     O         ULL/ 2         % }  , 
     /   Q+A*r   ISN'T UNIQUE    -   $B 
     "  s  "  2        */ B Z&   "     *
B  *e /  "   +  O  "   + !  [ e     1   
   i H e L   CS   o,> CURREN s o,@ D |  
                                     L  
 D        u     u     u     u           
    o                                   
      3               L    -        #Z& 
"   $       "     "0    !9  # D   }  !  
 $ $  9  #BUF n      #     H    $      9
         t$K  NOT FOUND$  "9  '-FIN   o,
  '?TERMINA   o,  'ABOR   o,  'BLOC   o,
  'C   o  x r 2 1 9  <VOCABULARYFIG     
   "               ,     ,1    x r 2 1 9
         t$9   .    *  9  >I : o,6 > F V
   H  H  L    O       9  ?COM a    *  t$
K   COMPILE ONLY9  ?CONFIGUR m        # 
 r  DRIVES9  ?CS     0*y     K  DEFINITI
ON NOT FINISHED9  ?DU   

( ----------- Screen 87/257 ----------- :)
    1  ! %L 1  %  1 9  <LOOP            
                      hhhhL$ L   <NUMBER
         Z&/ B    "- 2 / T    "    1 ? /
     >   @ /    ". 2 t$K  NOT RECOGNIZED
    1 ? /     > K  NOT RECOGNIZED$  %   
 9 9  <PAGE 1        L   <R/W      */  #
>  $   $K   BLK    9  ABORT     u   K f 
   "" 2     9 L $       "  ""  -/   B  *
 $     "" 2 t$  e 9  AB     / A 9  AGAI 
5   9 '           9  ALLO C     $ 9  AN 
] u   5 H  5   L   BAS m o,8 BEGI     u 
  9 9  BKGN      "!   9  B        BLAN  
     j 9  BL   o,: BLOC           <CMOVE
        o L                     L   <CR 
  !      L   <DO   2   H  H  H  HL   <EM
IT ) L     $           J L   <EXPECT A  
  $   $0 ? /  "  2      !$         / "! 
   "!B 1 $ 9     $ 9  <FILL a      o   L
                 L   <FIND        o     
  Q )? -  @  C           L   CATNI      
         L   CF       9  CHANG      " " 
        "  1 { 9  CHARI   A    r!       
 L3* CLEA 6    $    +  "    j B,9  CMOV 
Q   / 9       } $       9  COL o    CL  
      )    @                            
                        

( ----------- Screen 88/258 ----------- :)
         P I      L   <      $ !1 9  <+L
OOP   !       HH      }     h}     h    
          L" L   <-FIND        -2       
9  <." Q    %  / B  %  T Q+9  </LOOP k !
       H      }     h}     L   <;CODE   
   % ! $  1 9  <<CMOVE        o         
 e      e          OUT OF RANGE *a B  " 
#1   r   DR0 SELECTED  9  CONSTAN       
        H   L   CONTEX   o,< CONVER (   
B / T           ,  *    |+$ Z&    |+    
  B     9   $  %     %9  COUN 5   / B  *
  9  C         # 9  CREAT        -/ / B 
    2 K  ATTEMPTED TO REDEFINE N       !
    O     9       _(  9  .     f    "" 2
     9 L $   @  ""  *        r  -/   B  
$     "" 2 t$   *        B e       Q+9  
.LIN         Q+9  . t   T _( %  9       
   *$ 9  /LOO      "  '           9  /MO
     T _( %v#9          0        *    L 
  0       L   D+           9 9  D       
  A*9  D.        "    K  EMPTY STACKT  *
 $/       Z& )s  % $  R*Q+9  D     Z&  2
     Z&Z&9          *   *$  *$ 9  DAB 9 
  /   9  DDRO f    DDU u     H      h   
 H  L   DECIMA      "    1 9  DEFINITION
     2     1 9  DEPT    

( ----------- Screen 89/259 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 90/260 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 91/261 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 92/262 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 93/263 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 94/264 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 95/265 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 96/266 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 97/267 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 98/268 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 99/269 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 100/270 ----------- :)
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
                        

( ----------- Screen 101/271 ----------- :)
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
                        

( ----------- Screen 102/272 ----------- :)
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
                        

( ----------- Screen 103/273 ----------- :)
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
                        

( ----------- Screen 104/274 ----------- :)
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
                        

( ----------- Screen 105/275 ----------- :)
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
                        

( ----------- Screen 106/276 ----------- :)
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
                        

( ----------- Screen 107/277 ----------- :)
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
                        

( ----------- Screen 108/278 ----------- :)
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
                        

( ----------- Screen 109/279 ----------- :)
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
                        

( ----------- Screen 110/280 ----------- :)
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
                        

( ----------- Screen 111/281 ----------- :)
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
                        

( ----------- Screen 112/282 ----------- :)
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
                        

( ----------- Screen 113/283 ----------- :)
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
                        

( ----------- Screen 114/284 ----------- :)
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
                        

( ----------- Screen 115/285 ----------- :)
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
                        

( ----------- Screen 116/286 ----------- :)
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
                        

( ----------- Screen 117/287 ----------- :)
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
                        

( ----------- Screen 118/288 ----------- :)
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
                        

( ----------- Screen 119/289 ----------- :)
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
                        

( ----------- Screen 120/290 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 121/291 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 122/292 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 123/293 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 124/294 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 125/295 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 126/296 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 127/297 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 128/298 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 129/299 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 130/300 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 131/301 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 132/302 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 133/303 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 134/304 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 135/305 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 136/306 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 137/307 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 138/308 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 139/309 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 140/310 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 141/311 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 142/312 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 143/313 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 144/314 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 145/315 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 146/316 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 147/317 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 148/318 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 149/319 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 150/320 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 151/321 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 152/322 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 153/323 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 154/324 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 155/325 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 156/326 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 157/327 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 158/328 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 159/329 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 160/330 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 161/331 ----------- :)
( PRINTER OPENER)                       
." 4 CLOSE --- TURNS OFF PRINTER."      
4 4 3 " 0" OPEN                         
4 CMD                                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 162/332 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 163/333 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 164/334 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 165/335 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 166/336 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 167/337 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 168/338 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
