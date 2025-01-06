( Input file: ../disks/RBGAME BACK Src 2-5-86/RBGAME BACK Src 2-5-86.d64 )
( LINEWIDTH: 40 )
( ----------- Screen 0/170 ----------- :)
(                                       
                                        
                                        
                                        
                                        
                                        
                (                       
                                        
                                        
                                        
                                        
                                        
                                (       
                                        
                                        
                                        
                                        
                                        
                                        
        (                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 1/171 ----------- :)
( CHIPWIT GAME LOADER HI)               
172 LOAD     ( ZAP SPRITE )             
180 192 THRU ( DRAW.GAMEBOARD)          
198 207 THRU ( MENUS)                   
( ENV EDITOR)                           
210 226 THRU  ( W2)                     
260 298 THRU ( GAME)                    
310 312 THRU  ( BADS)                   
173 LOAD    ( ENV ED CURSOR SPRITE)     
230 255 THRU ( ENV.EDIT)                
320 323 THRU   ( CW MASTER WORD)        
FRE " S0:GAME" DOS SAVE-FORTH "GAME"    
DR0                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 2/172 ----------- :)
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
                        

( ----------- Screen 3/173 ----------- :)
 ( ECR SPRITE ENV ED CURSR) 2 BASE !    
S-DEF ECR.S                             
11111111 11111111 11111111              
11111111 11111111 11111111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11111111 11111111 11111111              
11111111 11111111 11111111              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 000000 DECIMAL        
: ECR.SP SWAPOUT                        
49152 205 64 * + ECR.S SWAPIN ;         
                        

( ----------- Screen 4/174 ----------- :)
(                                       
                                        
                                        
                                        
                                        
                                        
                (                       
                                        
                                        
                                        
                                        
                                        
                                (       
                                        
                                        
                                        
                                        
                                        
                                        
        (                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 5/175 ----------- :)
(                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 6/176 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 7/177 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 8/178 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 9/179 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 10/180 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 11/181 ----------- :)
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
                        

( ----------- Screen 12/182 ----------- :)
 ( ROB?)                                
 VAR ROB+   0 ROB+ !                    
: ROB? ( ---?FLAG^SHOW ROBOT?)          
 GAME.STATUS @ DEBUG.ON@ = NOT          
 ROB+ @ OR ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 13/183 ----------- :)
( CLEAN.UP)   EXIT                      
                                        
 : CLEAN.UP ( ---)                      
   64 0 DO                              
     I SQUARE.OBJECT                    
     DUP DUP                            
      WALL@ = SWAP DOOR@ = OR           
      SWAP FLOOR@ = OR NOT              
      IF FLOOR@ I ROOM.DATA( + C!       
      THEN                              
   LOOP ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 14/184 ----------- :)
( WALLS@)                               
 WALL@ 3 + IS WALLS@    EXIT            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 15/185 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 16/186 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 17/187 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 18/188 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 19/189 ----------- :)
 ( BLOCK.WALL <<<<<< ERASE.ROBOT)       
                                        
: BLOCK.WALL ( ORIENT#--^DRAWS WALL IN) 
  ( FRONT OF CW)                        
  CASE S OF SQUARES.WIDE@ ;;            
       E OF 1 ;; W OF -1 ;;             
       0                                
  ENDCASE                               
  OP.BYTE C@ 64 MOD MOVE@ = NOT         
  DEBUG? OR PROG.STATUS @ ENV.ON@ = OR  
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
                        

( ----------- Screen 20/190 ----------- :)
( CW.OP.MOUTH)                          
                                        
: CW.OP.MOUTH ( ---^OPEN CW'S MOUTH)    
 S4 W%    S-C ROBOT.ORIENTATION @       
 7 * 129 + FRAME  S-PT ;                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 21/191 ----------- :)
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
                        

( ----------- Screen 22/192 ----------- :)
( DRAW.GAMEBOARD)                       
                                        
: DRAW.GAMEBOARD ( ---)                 
  ROOM.DATA( 1-                         
  SQUARES.HIGH@ 0 DO                    
   SQUARES.WIDE@ 0 DO                   
     1+ DUP C@                          
     I J ROT DRAW.THING                 
   LOOP                                 
  LOOP DROP ;                           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 23/193 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 24/194 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 25/195 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 26/196 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 27/197 ----------- :)
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 28/198 ----------- :)
( DEBUG MENU STRINGS)                   
 $C D+$ "DEBUG ON" $C D-$ "DEBUG OFF"   
 $C F$ "FAST"      $C S$ "SLOW"         
 $C ST+$ "STEP"    $C ST-$ "NO STEP"    
 $C R+$ "SEE ROBOT" $C R-$ "NO ROBOT"   
 VAR STEP  VAR DB.SP  0 DB.SP !         
: D.$ ( F-) 1 SWAP IF D+$ ELSE D-$ THEN 
 OP$ OP( S.IT$     ;                    
: S.$ ( F-) 2 SWAP IF F$ ELSE S$ THEN   
  OP$ OP( S.IT$     ;                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 29/199 ----------- :)
( DB- DEBUG.OFF)                        
                                        
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
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 30/200 ----------- :)
 (   E.DB GET.RB PUT.RB)                
                                        
                                        
: E.DB ( ---^ENTER DEBUG)               
  5 2 DO I ON  OP( IT+  LOOP            
  0 S.$ 1 T.$ 0 R.$ 0 D.$               
  1 53269 C! ;                          
                                        
: GET.RB  ( ---)                        
  SPRITES.OFF                           
    1  CW.LOAD  ( FOR NOW)              
    PROG.STATUS @                       
   WORKSHOP.ON@ = IF 1 NEW.CW !         
   ELSE TURN.GAME.OFF@ PROG.STATUS !    
  DEBUG? NOT IF  NAME. THEN  THEN ;     
                                        
  : PUT.RB ( ---)                       
  HOT.CHIP @ NO.CHIP@ =                 
  NOT IF INSERT.IT THEN SV.SP           
0 53269 C! EDIT.NAME 1 CW.SAVE ( <<)    
       M.BAR  1 53269 C!                
       1 NEW.CW ! ;                     
                                        
                                        
                                        
                        

( ----------- Screen 31/201 ----------- :)
 ( OP.M  -    OPTION.MENU)              
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
 ;; 10 OF ABORT ;;                      
 ENDCASE ;                              
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 32/202 ----------- :)
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
  8 ON RB( IT+                          
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
                        

( ----------- Screen 33/203 ----------- :)
( R.M ROBOT.MENU)                       
: R.M  ( ---)                           
  T.I @  CASE                           
( EDIT)                                 
     1 OF WORKSHOP.ON@                  
         PROG.STATUS ! ;;               
( NEW)                                  
     2 OF ( NEW.ROBOT) ;;               
( LOAD)                                 
     3 OF  GET.RB ;;                    
                                        
                                        
                                        
( SAVE)                                 
     4 OF PUT.RB  ;;                    
                                        
                                        
                                        
                                        
     6 OF CP.P CL.P ;;                  
     7 OF CP.P ;;                       
     8 OF PS.P ;;                       
     9 OF CL.P ;;                       
   ENDCASE ;                            
                                        
                        

( ----------- Screen 34/204 ----------- :)
( ENV.LOAD)                             
                                        
 : ENV.LOAD ( AD#---) DSK               
  DROP                                  
(  SCREEN.OFF                           
  GM.SC  GAME.CHAR NAME. SCREEN.ON)     
  PROG.STATUS @ DUP  GAME.ON@ =         
  SWAP SERIES@ = OR IF                  
      TURN.GAME.OFF@ PROG.STATUS !      
THEN                                    
   FIRST 1024 1000 CMOVE                
      ( SAVE GAME COLORS)               
    FIRST  " A1C" LR                    
   FIRST ENV.DATA( HEAD.LEN@ CMOVE      
                                        
   SWAPOUT FIRST 53248 2048 CMOVE       
   SWAPIN  ENV.CLR C@ M.BAK2            
  1024 FIRST 1000 CMOVE ( RESTORE CLRS) 
   1 53269 C! ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 35/205 ----------- :)
( M.M MISSION  MENU)                    
: M.M T.I @                             
 CASE                                   
   1 OF PROG.STATUS @                   
     CASE WORKSHOP.ON@ OF               
       TURN.GAME.ON@ PROG.STATUS ! ;;   
      ENV.ON@ OF                        
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
  2 SE$    MS$    MS( S.IT$ ;;          
        0 LAST.MISSION !                
  2  LM$    MS$    MS( S.IT$            
       SERIES@ PROG.STATUS !            
   ENDCASE ;;                           
ENDCASE ;                               
                                        
                        

( ----------- Screen 36/206 ----------- :)
( ENVIRONMENT MENU)                     
                                        
VAR NEW.ENV?                            
                                        
: E.M T.I @                             
   CASE                                 
 ( EDIT)                                
     1 OF ENV.ON@ PROG.STATUS ! ;;      
 ( NEW)                                 
     2 OF 1 NEW.ENV? !          ;;      
 ( LOAD)                                
     3 OF  1 ENV.LOAD     ( <<<)        
           2 NEW.ENV? ! ;;              
 ( SAVE)                                
     4 OF ( SAVE ENVIRON) ;;            
  ENDCASE ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 37/207 ----------- :)
( DO.EVENTS)                            
                                        
 : DO.EVENTS ( ---)                     
   M.EV   ( DO MENU EVENTS)             
   IF T.M @                             
     CASE                               
       1 OF M.M ;;                      
       2 OF R.M ;;                      
       3 OF E.M   ;;                    
       4 OF OP.M  ;;                    
     ENDCASE                            
   THEN                                 
   ;                                    
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 38/208 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 39/209 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 40/210 ----------- :)
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
                                        
                                        
                                        
                        

( ----------- Screen 41/211 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 42/212 ----------- :)
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
                        

( ----------- Screen 43/213 ----------- :)
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
                                        
                                        
                                        
                                        
                        

( ----------- Screen 44/214 ----------- :)
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 45/215 ----------- :)
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
                                        
                                        
                                        
                        

( ----------- Screen 46/216 ----------- :)
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
                                        
                        

( ----------- Screen 47/217 ----------- :)
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
                        

( ----------- Screen 48/218 ----------- :)
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

( ----------- Screen 49/219 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 50/220 ----------- :)
( ACTION.HANDLER)                       
                                        
: ACTION.HANDLER ( ---)                 
  ACT#@ GOTO.GO@ DO                     
   I OK@                                
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

( ----------- Screen 51/221 ----------- :)
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

( ----------- Screen 52/222 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 53/223 ----------- :)
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

( ----------- Screen 54/224 ----------- :)
 ( SETUP.WORK.SCREEN INIT.WS)           
                                        
: SETUP.WORK.SCREEN ( ---)              
  WS.CHAR                               
  NEW.WS                                
  0 M-C                                 
  WS.BORD.COL@ BD                       
  BAK.C BK                              
  ACT#@ 1- 0 DO I OK! LOOP              
  BOOMERANG@ NOT.OK ;                   
                                        
                                        
: INIT.WS ( ---)                        
  39 HOT.CHIP !   GARBAGE.WS.CHIP       
  1 NEW.CW !                            
  0 CURRENT.INSTRUCTION !               
  0 CURRENT.PANEL !                     
  0 I.CM !                              
  39 NEW.CHIP.HOT                       
  ;                                     
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 55/225 ----------- :)
 ( W.ENTER W.LEAVE )                    
                                        
                                        
: W.ENTER ( -) 1 0 OP( IT+              
  SCREEN.OFF B% BK B% BD SPRITES.OFF    
  S2 W% S-C  OFF S-ML                   
  4 ON RB( IT+   ( SAVECW)              
  ( DISABLE ENV LOAD)                   
 10 6 DO I ON RB( IT+ LOOP ( EDIT)      
  CB+ @ NOT IF 9 OFF RB( IT+  THEN      
  ( EDIT CHOSEN AGAIN?)                 
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
                                        
  4 OFF RB( IT+                         
 10 6 DO I OFF RB( IT+ LOOP ( EDIT)     
 ( ENABLE ENV LOAD)  ;                  
                        

( ----------- Screen 56/226 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 57/227 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 58/228 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 59/229 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 60/230 ----------- :)
( ENV.DATA)                             
                                        
 CREATE DOOR.R( 4 8 * ALLOT             
  ( 8 DOOR RECTS)                       
 CREATE NEXT( 8 ALLOT                   
  ( NEXT DOORS)                         
 CREATE THIS( 8 ALLOT                   
  ( THIS DOOR)                          
                                        
                                        
 VAR DOOR#  ( CURRENT DOOR 0-7 )        
 VAR SQ#    ( CURRENT SQUARE 0-63)      
                                        
 VAR TH     ( CURRENT INSERT THING)     
            ( DOOR, LOCK OR WALL)       
 VAR RM.TH  ( THING UNDER CURSOR)       
                                        
 VAR OLD.RM#                            
 VAR OLD.DOOR#                          
 VAR OLD.SQ#                            
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 61/231 ----------- :)
 ( CL.BTN SAVE.RM SAVE.HD)              
                                        
: CL.BTN ( ---^ CLEAR BUTTON XY)        
 0 B.X ! 0 B.Y ! ;                      
: SC.RM^  ( ROOM#---ADDR) 1- SC(        
 HEAD.LEN@ + COMP.RM.SIZE@ ROT * + ;    
                                        
: SAVE.RM ( ---)                        
  ( TAKE OLD ENV AND COMPRESS)          
  SWAPOUT                               
  ROOM.DATA(  64 +  ( SRC)              
  ROOM# @ SC.RM^ 32 + 16 CMOVE          
  ( SAVE DOORS AS IS)                   
   32 0 DO  ( 2 SQUARES --> 1 BYTE)     
     ROOM.DATA( I 2* +                  
     DUP 1+ C@ SWAP C@  ( 2 SQUARES)    
     CATNIB                             
     ROOM# @ SC.RM^ I + C!              
   LOOP                                 
   SWAPIN ;                             
                                        
: SAVE.HD ( ---^SAVE HEADER INFO)       
 SWAPOUT                                
 ENV.DATA( SC( HEAD.LEN@ CMOVE          
 SWAPIN ;                               
                        

( ----------- Screen 62/232 ----------- :)
( NEWS? ROOM.CNT.)                      
                                        
: NEWS? ( SQ#--DIRECTION^NORTH,EAST..)  
  (            OR 0 IF NOT EDGE)        
  DUP 0 7 WITHIN                        
  IF DROP N                             
  ELSE DUP 8 55 WITHIN                  
   IF DUP  SQUARES.WIDE@ MOD 0=         
     IF DROP  W                         
     ELSE  SQUARES.WIDE@ MOD 7 =        
       IF E ELSE 0 THEN                 
     THEN                               
   ELSE 55 > IF S ELSE 0 THEN           
   THEN                                 
  THEN ;                                
                                        
: ROOM.CNT. ( ---)                      
 ( PRINT ROOM.CNT)                      
 B% CHAR.COLOR  0 2 D-POSITION ." ROOM" 
 1 3 D-POSITION ROOM# @ DUP 10 <        
 IF ."  " THEN .                        
 1 4 D-POSITION  ." OF"                 
 2 5 D-POSITION ROOM.CNT C@ .           
 ;                                      
                                        
                        

( ----------- Screen 63/233 ----------- :)
( NEW.RM  NEW.ENV E.RM ( ERASE ROOM)    
                                        
$C NEW( " UNTITLED        "             
  21052 ,                               
  1000 , 0 C, 0 C, 0 , 0 ,              
  255 C, 255 C, 255 C,                  
  0 C,                                  
  0 C, 100 C, 0 C, 100 C,  0 C, 100 C,  
  0 C, B% C,  8 ALLOT                   
: E.RM ( -) 0 7 25 24 GL% COLOR.BLOCK ; 
: NEW.RM  ( ---) E.RM                   
  ( LOAD AND SAVE NEW EMPTY ROOM)       
 ROOM.CNT C@ 1+ DUP ROOM# ! ROOM.CNT C! 
  64 0 DO                               
    I NEWS? IF                          
       WALL@ ELSE FLOOR@ THEN           
    ROOM.DATA( I + C!                   
  LOOP                                  
  ROOM.DATA( SQUARE.COUNT@ + 16 0 FILL  
     ( DOORS)                           
  SAVE.RM ;                             
                                        
: NEW.ENV ( ---)                        
  NEW( ENV.DATA( HEAD.LEN@ CMOVE        
  NEW.RM ;                              
                        

( ----------- Screen 64/234 ----------- :)
( NEWS. NEWS.PT.RCT CNCL.RCT CT.DRS)    
                                        
: NEWS. ( NEWS---)                      
CASE N OF ." TOP" ;;                    
     E OF ." RIGHT" ;;                  
     W OF ." LEFT" ;;                   
     S OF ." BOTTOM" ;;                 
ENDCASE ;                               
                                        
: NEWS.PT.RCT ( NEWS---FLAG)            
 ( DID BUTTON CLICK ON THAT WALL?)      
 CASE N OF 4 21 8 9 ;;                  
      E OF 21 23 10 21 ;;               
      W OF 1 3 10 21 ;;                 
      S OF 4 21 22 23 ;;                
 ENDCASE                                
   BUT.XY@ PT.RCT ;                     
                                        
: CNCL.RCT ( ---RECT OF CANCEL BTN)     
  15 24 4 6 ;                           
                                        
: CT.DRS ( DOOR SQ#---DOOR#)            
  0 K  !   0 DO I SQ.DL=                
                                        
  IF 1 K +! THEN LOOP K @    ;          
                        

( ----------- Screen 65/235 ----------- :)
( NEW.DOORS)                            
: NEW.DOORS ( ---) DOOR.R( 32 50 FILL   
0  K ! SQUARE.COUNT@ 0 DO               
I SQ.DL=                                
  IF I NEWS?  I SQUARE.XTYT ROT         
  CASE                                  
   N OF 1- OVER 2+ OVER ( RECT)         
     4 PICK 1+ 4 PICK  ( RM# XY)        
     I I SQUARES.WIDE@ - ( SQ,NEXT) ;;  
   E OF SWAP 3 + SWAP OVER OVER 2+      
     4 PICK 4 PICK 1+                   
     I I 1+ ;;                          
   W OF SWAP 1- SWAP OVER OVER 2+       
     4 PICK 4 PICK 1+                   
     I I 1- ;;                          
   S OF 2+ OVER 2+ OVER                 
     4 PICK 1+ 4 PICK                   
     I I SQUARES.WIDE@ + ;; ENDCASE     
  K     @ NEXT( + C!                    
  K     @ THIS( + C!                    
  D-POSITION  K     @                   
  ROOM.DATA( SQUARE.COUNT@ + + C@ .     
  ROT SWAP K     @ 4 * DOOR.R( + !RECT  
  1 K     +! THEN                       
LOOP DRAW.GAMEBOARD 1 53269 C!   ;      
                        

( ----------- Screen 66/236 ----------- :)
( IN.DR <INSERT.DOOR> POINT>SQ CURS.SQ) 
                                        
: IN.DR ( DR.SQ#/CN.SQ#/CN.RM#/DOOR#---)
DUP ROOM.DATA( SQUARE.COUNT@ + + DUP >R 
   DUP 1+ 8 4 PICK 1+ - <CMOVE          
  ( OPEN THE ROOM# ARRAY)               
   SWAP R@ C!  ( INSERT RM#)            
 R@ 8 + DUP 1+ 8 4 ROLL 1+ - <CMOVE     
 R> 8 + C!     ( INSERT SQ)             
 TH @ ROOM.DATA( ROT + C!               
 DRAW.GAMEBOARD ;                       
                                        
: POINT>SQ ( X/Y---SQ#)                 
  GAME.Y@ - 16 / SQUARES.WIDE@ *        
  0 MAX 56 MIN                          
  SWAP GAME.X@ -  24 / 0 MAX 7 MIN + ;  
                                        
: CURS.SQ  ( SQ#---^DRAWS CURSOR ON SQ) 
   S2 W% S-C                            
   DUP 8 MOD 24 * GAME.X@ + ( X)        
   SWAP 8 / 16 * GAME.Y@ +              
   FRAME S-POSITION                     
   ON S-ENABLE  ;                       
                                        
                                        
                        

( ----------- Screen 67/237 ----------- :)
( CONNECT.DOORS)                        
                                        
: CONNECT.DOORS ( ---)                  
   E.RM                                 
   BUT.XY@ POINT>SQ DUP SQ#  !          
   CT.DRS DOOR# !                       
   SQ# @ OLD.SQ# @ OLD.RM# @            
   DOOR# @ IN.DR SAVE.RM                
    ( INSERT DOOR INTO NEW ROOM)        
   OLD.DOOR# @                          
   DOOR# @ OLD.DOOR# !  DOOR# !         
   OLD.SQ# @                            
   SQ# @ OLD.SQ# ! SQ# !                
   OLD.RM# @                            
   ROOM# @ OLD.RM# ! DUP ROOM# !        
   LOAD.ROOM                            
   SQ# @ OLD.SQ# @ OLD.RM# @            
   DOOR# @ IN.DR                        
                                        
             ;                          
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 68/238 ----------- :)
 ( VAL.  #. )                           
                                        
: #. ( INT ---^PRINTS SIGNED #)         
  DUP 0 < IF 231 EMIT ELSE ."  " THEN   
  ABS                                   
  DUP 1000 < IF ."  " THEN              
  DUP 100 < IF ."  " THEN               
  DUP 10 < IF ."  " THEN                
  . ."   " 229 EMIT ;                   
: P. 34 SWAP D-POSITION 100 - 10 * #. ; 
: VAL. ( VAL# 0-5---)  ."  "            
 CASE                                   
  0 OF 31  6 D-POSITION CYCLES @ DUP    
    10000 < IF ."  " THEN #. ;;         
 1 OF OIL.PNT C@ 13 P. ;;               
 2 OF DSK.PNT C@ 15 P. ;;               
 3 OF CRP.PNT C@ 17 P. ;;               
 4 OF FOOD.CNT C@ 36 21 D-POSITION . ;; 
 5 OF CRP.CNT C@ 36 23 D-POSITION . ;;  
ENDCASE ."  " ;                         
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 69/239 ----------- :)
 ( ERASE.THINGS ENV.THINGS)             
                                        
 : ERASE.THINGS ( ---)                  
 ( ERASE OBJECTS AND CLEAR RECTS)       
   BLANK.THING.RECTS                    
  4 2 24 6 GL% COLOR.BLOCK              
  ;                                     
                                        
: ENV.THINGS ( ---)                     
 TH#@ 0 DO                              
   ARG.W.XY( I 4 * +                    
   DUP C@ 40 = NOT                      
    IF @XY                              
      I 4 - 7 * OBJ.BLOCK( + OBJ.       
                                        
                                        
    ELSE DROP THEN                      
 LOOP ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 70/240 ----------- :)
( EDGE.THINGS, MID.THINGS)              
: EDGE.THINGS ( ---)                    
 ( DRAW LEGAL EDGE OBJECTS)             
 RM.TH @ DUP  LOCK@ = SWAP DOOR@ = OR   
 IF   7 9 3 4 WALL@ AF  THEN            
 RM.TH @ WALL@ =                        
 63 CT.DRS 8 < AND                      
 IF 13 15 3 4 DOOR@ AF                  
    19 21 3 4 LOCK@ AF THEN             
 ENV.THINGS ;                           
                                        
: MID.THINGS ( ---)                     
 ( DRAW LEGAL MIDFLOOR THINGS)          
 5 7 2 3 PIE@ AF                        
 9 11 2 3 COFFEE@ AF                    
 13 15 2 3 DISK@ AF                     
 17 19 2 3 OIL@ AF                      
 21 23 2 3 KEE@ AF                      
 5 7 5 6 WALL@ AF                       
 9 11 5 6 FLOOR@ AF                     
 13 15 5 6 CREEP@ AF                    
 17 19 5 6 BOMB@ AF                     
 ENV.THINGS ;                           
                                        
                                        
                        

( ----------- Screen 71/241 ----------- :)
( ROOM.HND)                             
                                        
: ROOM.HND ( ---^BUTTON DOWN IN ROOM)   
  BUT.XY@ POINT>SQ                      
  DUP SQUARE.OBJECT RM.TH !             
  DUP SQ# @ = NOT                       
  IF DUP NEWS?  ( AT EDGE)              
    IF DUP DUP DUP DUP                  
     0 = SWAP 7 = OR SWAP               
     56 = OR SWAP 63 = OR ( CORNERS)    
     IF DROP                            
     ELSE DUP SQ# ! ERASE.THINGS        
       CURS.SQ                          
       EDGE.THINGS THEN                 
    ELSE                                
     DUP  SQ# ! ERASE.THINGS            
     CURS.SQ                            
     MID.THINGS                         
    THEN                                
  ELSE DROP THEN ;                      
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 72/242 ----------- :)
( DOOR.HND)                             
                                        
: DOOR.HND ( ---)                       
 8 0 DO                                 
   DOOR.R( I 4 * + @RECT                
   BUT.XY@ PT.RCT IF                    
    SAVE.RM  ERASE.THINGS               
    I THIS( + C@ ROBOT.SQUARE !         
    I NEXT( + C@ DUP 200 > IF           
        256 - THEN CHECK.NEXT           
     ( MINUS NEXT SQUARES, NORTH)       
    DROP                                
    0 7 25 24 GL% COLOR.BLOCK           
    NEW.DOORS                           
    ROOM.CNT.                           
    0 SQ# !                             
    LEAVE THEN                          
 LOOP ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 73/243 ----------- :)
( VAL+-)                                
                                        
: VAL+-  ( X/Y---[-1OR1]/FLAG)          
( CHECKS TO SEE IF MOUSE DOWN IN)       
( PLUS OR MINUS PART OF RECT)           
DDUP SWAP DUP 3 + ROT DUP  ( PLUS RECT) 
BUT.XY@ PT.RCT                          
IF DDROP 1 1                            
ELSE SWAP 4 + DUP 3 + ROT DUP ( MINUS)  
 BUT.XY@ PT.RCT                         
 IF -1 1                                
 ELSE 0                                 
 THEN                                   
THEN ;                                  
CREATE P( OIL.PNT , DSK.PNT , CRP.PNT , 
: CYC+ ( ---FLAG )  0                   
  30 6 VAL+- IF 100 * CYCLES @ +        
   0 MAX 32000 MIN CYCLES ! 0 VAL.      
  1+  THEN ;                            
: PT+ ( ---FLAG) 0                      
  3 0 DO 33 13 I 2* + VAL+-             
   IF  I 2* P( + @ DUP C@ ROT +         
    0 MAX 200 MIN SWAP C!               
    I 1+ VAL. 1+ LEAVE THEN             
  LOOP ;                                
                        

( ----------- Screen 74/244 ----------- :)
( CT+ CLR+ VAL.HND)                     
: CT+ ( ---FLAG) 0                      
2 0 DO 33 21 I 2* + VAL+-               
 IF  I 0= IF FOOD.CNT ELSE CRP.CNT THEN 
    DUP C@ ROT +                        
    0 MAX  10 MIN SWAP C!               
    I 4 + VAL. 1+ LEAVE THEN            
  LOOP ;                                
                                        
: CLR+ ( ---)                           
  31 35 9 9 BUT.XY@ PT.RCT              
  IF ENV.CLR C@ 1+                      
   DUP DUP W% = SWAP B% = OR IF 1+ THEN 
     16 MOD  DUP M.BAK2                 
     ENV.CLR C! THEN ;                  
                                        
 : VAL.HND ( ---)                       
   CYC+ NOT                             
   IF PT+ NOT                           
     IF CT+ NOT                         
       IF CLR+                          
       THEN                             
     THEN                               
   THEN                                 
   CL.BTN ;                             
                        

( ----------- Screen 75/245 ----------- :)
( BTN,  WND1   CNCL)                    
: BTN ( WD/X/Y---) BL% CHAR.COLOR DDUP  
DDUP D-POSITION  34 EMIT D-POSITION     
34 EMIT 3 PICK 0 DO ." &" LOOP ." #  '" 
   DDUP 1+ D-POSITION ." )"             
   DDUP 2+ D-POSITION ." %"             
   3 ROLL 0 DO ." (" LOOP ." $"         
   SWAP 1+ SWAP 1+ D-POSITION ;         
: CNCL ( -) 8 15 4 BTN ."  CANCEL" ;    
: WND1 ( ---FLAG) S.SC CNCL CL.BTN      
( 0=CANCEL,1=NEW ROOM,2=OLD ROOM)       
5 2 D-POSITION ." CONNECT TO"           
 COLOR-MEM 40 R% FILL ROOM.CNT C@       
 50 < IF 3 5  3 BTN ." NEW" THEN        
 3 10 3 BTN ." OLD"                     
 8 6 D-POSITION ." ROOM "               
 BEGIN 5  9 3 5 BUT.XY@ PT.RCT          
     ROOM.CNT C@ 50 < AND IF 1 1 ( NEW) 
     ELSE 10 14 3 5 BUT.XY@ PT.RCT      
      IF 2 1 ( OLD)                     
      ELSE CNCL.RCT BUT.XY@ PT.RCT      
       IF 0 1 ( CANCEL) R.SC            
       ELSE 0                           
     THEN THEN THEN                     
   UNTIL CL.BTN ;                       
                        

( ----------- Screen 76/246 ----------- :)
( W2        NEW ROOM DOOR)              
: DR. ( -) 5 2 D-POSITION ." CLICK "    
OLD.SQ# @ NEWS? 4 + 8 MOD               
 NEWS. ."  WALL TO" ;                   
: W2 ( ---FLAG)                         
 ( 0 = CANCEL, 1 = DOOR CONNECTED)      
 SAVE.RM   S2 OFF S-ENABLE              
 NEW.RM DRAW.GAMEBOARD                  
 ROOM.CNT. S.SC                         
 DR.                                    
                                        
                                        
 5 3 D-POSITION ." CONNECT DOOR "       
 CNCL                                   
 BEGIN                                  
  OLD.SQ# @ NEWS? 4 + 8 MOD NEWS.PT.RCT 
  IF 1 1                                
        CONNECT.DOORS                   
  ELSE CNCL.RCT BUT.XY@ PT.RCT          
    IF ROOM.CNT C@ 1- ROOM.CNT C!       
       0 1  R.SC                        
    ELSE 0 THEN                         
  THEN                                  
 UNTIL                                  
 CL.BTN ;                               
                        

( ----------- Screen 77/247 ----------- :)
( OLD.CN CONNECT OLD ROOM O.DR.)        
                                        
: OLD.CN ( --CONNECT FLAG)              
  OLD.SQ# @ NEWS? 4 + 8 MOD NEWS.PT.RCT 
  IF  ( CLICKED ON CORRECT WALL)        
    BUT.XY@ POINT>SQ                    
    SQUARE.OBJECT WALL@ =               
    IF CONNECT.DOORS 1                  
    ELSE 0 THEN                         
  ELSE 0 THEN CL.BTN ;                  
                                        
: CK.DL ( ---FLAG^ ARE THERE LESS THAN) 
( 8 DOORS OR LESS THAN 7 IF IN 1ST RM?) 
63 CT.DRS 8 <                           
 ROOM# @ OLD.RM# @ = IF                 
   DROP 63 CT.DRS 7 < THEN ;            
: O.DR. ( OLD DOOR PRINT)               
  CK.DL IF DR.                          
    5 3 D-POSITION ." CONNECT DOOR OR"  
  THEN                                  
  5 4 D-POSITION ." CLICK DOOR"         
  5 5 D-POSITION ." NUMBER FOR"         
  5 6 D-POSITION ." OLD ROOM "          
  CNCL  ;                               
                                        
                        

( ----------- Screen 78/248 ----------- :)
( W3 OLD ROOM DOOR)                     
                                        
: W3 ( ---FLAG) CL.BTN                  
  ( 0=CNCL, 1 = CONNECTED)              
  SAVE.RM S2 OFF S-ENABLE               
  O.DR.                                 
                                        
                                        
                                        
  BEGIN                                 
   1 24 8 23 BUT.XY@ PT.RCT             
   CK.DL AND                            
   IF ( CHECK FOR RIGHT DOOR)           
     OLD.CN                             
     IF 1 1 ELSE 0 THEN                 
   ELSE 0 25 7 24 BUT.XY@ PT.RCT        
    IF SAVE.RM DOOR.HND 0               
       CL.BTN O.DR.                     
    ELSE CNCL.RCT BUT.XY@ PT.RCT        
      IF 0 1                            
      ELSE 0 THEN                       
    THEN                                
   THEN                                 
  UNTIL ;                               
                                        
                        

( ----------- Screen 79/249 ----------- :)
( CL.DR  CLOSE DOOR)                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 80/250 ----------- :)
( ADD.DOOR)                             
VAR ST.RM# ( STARTING ROOM)             
: ADD.DOOR ( ---)                       
  ROOM# @ DUP  OLD.RM# ! ST.RM# !       
  SQ# @ CT.DRS OLD.DOOR#  !             
  SQ# @ OLD.SQ# !                       
                                        
  BEGIN                                 
    ERASE.THINGS                        
    WND1  ( NEW ROOM, OLD ROOM?)        
    ERASE.THINGS                        
    CASE 0 OF 1 ( CANCEL) ;;            
         1 OF                           
              W2  ( NEW ROOM DOOR)      
              ;;                        
         2 OF W3 ( OLD.RM.DR) ;;        
    ENDCASE                             
                                        
    SAVE.RM                             
    ST.RM# @ DUP LOAD.ROOM ROOM# !      
    NEW.DOORS  ROOM.CNT.                
    0 SQ# !                             
  UNTIL M.BAR                           
  ERASE.THINGS CL.BTN ;                 
                                        
                        

( ----------- Screen 81/251 ----------- :)
( ENV.TH.HND ENVIRONMENT THING HANDLER) 
                                        
 : ENV.TH.HND ( ---)                    
    TH#@ 0 DO                           
      ARG.W.XY( I 4 * + @RECT BUT.XY@   
      PT.RCT IF                         
        SQ# @ NEWS?                     
        IF ( OUTER WALL) I TH !         
         I DOOR@ = I LOCK@ = OR         
         IF ADD.DOOR                    
         ELSE  ( CLOSE.DOOR)            
         THEN                           
        ELSE                            
         I ROOM.DATA( SQ# @ + C!        
         DRAW.GAMEBOARD                 
        THEN                            
      THEN                              
    LOOP ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 82/252 ----------- :)
( ENV.MS ENVIRONMENT MOUSER)            
                                        
: ENV.MS ( ---)                         
   1 24 8 23 BUT.XY@ PT.RCT             
   IF ROOM.HND                          
   ELSE 0 25 7 24 BUT.XY@ PT.RCT        
     IF DOOR.HND                        
     ELSE 5 23 2 6 BUT.XY@ PT.RCT       
       IF ENV.TH.HND                    
       ELSE 30 39 6 23 BUT.XY@ PT.RCT   
         IF VAL.HND THEN                
       THEN                             
     THEN                               
   THEN ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 83/253 ----------- :)
  ( E.SCRN)                             
: <. 228 EMIT ."      " 229 EMIT ;      
: E.SCRN ( ---^ENV EDIT SCREEN)         
 1 53269 C! ( BYE ROBOT)                
 BAK.C BK W% BD                         
 0 2 39 24 GL% COLOR.BLOCK              
 0 1 39 1 W% COLOR.BLOCK                
 ROOM.CNT.                              
 28 2 D-POSITION ."  ENVIRONMENT"       
 31 5 D-POSITION ." CYCLES"             
 30 6 D-POSITION 228 EMIT ."       "    
 229 EMIT 31 8 D-POSITION ." COLOR"     
 31 9 D-POSITION ."        "            
 27 11 D-POSITION  ."  ^^ POINTS ^^^"   
 29 13 D-POSITION ." OIL " <.           
                                        
 28 15 D-POSITION ." DISK " <.          
 28 17 D-POSITION ." CRAB " <.          
                                        
 27 19 D-POSITION ." ^^ MAXIMUM ^^"     
 28 21 D-POSITION ." FOOD "  <.         
 27 23 D-POSITION ." CRABS " <.         
 6 0 DO I VAL. LOOP                     
                                        
 NEW.DOORS DRAW.GAMEBOARD ;             
                        

( ----------- Screen 84/254 ----------- :)
( E.ENTER)                              
                                        
: E.ENTER ( ---)                        
 SCREEN.ON ( LATER SCREEN.OFF)          
 GAME.CHAR                              
 1 M-C  0 NEW.ENV? !                    
 0 ROB+ ! ( TURN OFF ROBOT DRAW)        
 1 ROOM# !                              
 1 LOAD.ROOM                            
 E.SCRN ERASE.THINGS                    
 S2 ECR.SP OFF S-ENABLE 205 S-PT        
 OFF S-YEXP OFF S-XEXP                  
   ( SETUP CURSOR SPRITE)               
 SCREEN.ON ;                            
                                        
                                        
 : E.LEAVE ( ---)                       
   1 ROB+ ! SAVE.RM SAVE.HD ;           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 85/255 ----------- :)
 ( ENV.EDIT)                            
                                        
: ENV.EDIT ( ---)                       
  E.ENTER                               
  BEGIN                                 
    DO.EVENTS  I-T                      
    NEW.ENV? @ CASE                     
     1 OF  NEW.ENV E.ENTER ;;           
     2 OF E.ENTER ;;                    
    ENDCASE                             
    DEPTH IF 0 0 D-POSITION DEPTH .     
       DUP . THEN                       
    B.D @ IF ENV.MS THEN                
    PROG.STATUS @ ENV.ON@ = NOT         
  UNTIL                                 
  E.LEAVE ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 86/256 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 87/257 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 88/258 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 89/259 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 90/260 ----------- :)
( DESTROY)                              
                                        
                                        
 : DESTROY ( SQ#---)                    
   DUP ROOM.DATA( + FLOOR@ SWAP C!      
   ( PUT FLOOR IN ROOM.DATA( )          
   DEBUG? NOT                           
   IF SQUARE.XTYT FLOOR@ 4 - 7 *        
     OBJ.BLOCK( + OBJ.                  
   ELSE DROP THEN ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 91/261 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 92/262 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 93/263 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 94/264 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 95/265 ----------- :)
( CALC.ROBOT.MOVE )                     
 FORTH                                  
 : CALC.MOVE ( --- NEXT SQ#)            
  ROBOT.ORIENTATION @                   
   ARG.BYTE C@ 64 MOD CHECK.MOV.ST      
   REVERSE@ = IF 4 + 8 MOD THEN         
   ROBOT.SQUARE @ NEXT.SQUARE ;         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 96/266 ----------- :)
( GOTO.NEXT.ROOM)                       
VAR ROOM#                               
: NEXT.ROOM ( SQ#---NEXTROOM SQ#)       
 ERASE.ROBOT  ( FROM LAST ROOM)         
 0 ROBOT.SQUARE @ 0 DO                  
   I SQ.DL= IF 1+ THEN                  
 LOOP                                   
 DUP 8 +  ( NEXT ROOM/NEXT SQ^ )        
 ROOM.DATA( SQUARE.COUNT@ + + C@        
 ROBOT.SQUARE !                         
 ( GET NEXT DOOR SQ FROM AND STORE)     
 ROOM.DATA( SQUARE.COUNT@ + + C@        
 DUP ROOM# !                            
 LOAD.ROOM                              
 ( LOAD NEXT ROOM#)                     
 PROG.STATUS @ ENV.ON@ = NOT IF         
   0 ADD.POINTS THEN                    
 ROB? IF INIT.CW THEN                   
 DRAW.GAMEBOARD                         
 ROB? IF CW.INIT THEN                   
 DROP CALC.MOVE ;                       
                                        
                                        
                                        
                                        
                        

( ----------- Screen 97/267 ----------- :)
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
                                        
                                        
                                        
                        

( ----------- Screen 98/268 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 99/269 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 100/270 ----------- :)
( BUMP)                                 
: BUMP ( OBJ #MOVES---OBJ)              
                                        
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
  DUP  CREEP@ =                         
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
                        

( ----------- Screen 101/271 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 102/272 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 103/273 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 104/274 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 105/275 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 106/276 ----------- :)
( EAT.IT ZAP.IT)                        
: EAT.IT ( SQ#---)                      
  DUP SQUARE.OBJECT                     
  CASE                                  
    COFFEE@ OF 1200 UPDATE.FUEL ;;      
    OIL@ OF OIL.PNT C@  100 -   10 *    
      ADD.POINTS ;;                     
                                        
   DISK@ OF DSK.PNT C@ 10 100 - *       
     ADD.POINTS ;;                      
                                        
  ENDCASE  DESTROY ;                    
                                        
                                        
: ZAP.IT ( SQ#--) DUP SQUARE.OBJECT     
  CASE CREEP@ OF                        
    CRP.PNT C@ 100 - 10 *               
    ADD.POINTS ;;                       
                                        
                                        
                                        
                                        
   BOMB@ OF 253 53269 C! BOOM ;;        
  ENDCASE EXPLODED @ NOT                
  IF DESTROY ELSE DROP THEN ;           
                        

( ----------- Screen 107/277 ----------- :)
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
    IF                                  
    ELSE DUP  ZAP.IT                    
    THEN                                
    ROB? IF 253 53269 C! THEN LEAVE     
                                        
  THEN                                  
 LOOP DROP  ;                           
                                        
                                        
                                        
                        

( ----------- Screen 108/278 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 109/279 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 110/280 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 111/281 ----------- :)
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
                        

( ----------- Screen 112/282 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 113/283 ----------- :)
( PICK.UP ACT)                          
: PICK.UP ( ---)                        
 ROB.OR.SQ@                             
 NEXT.SQUARE CHECK.NEXT                 
 ARM.OUT CW.OP.MOUTH                    
 DUP SQUARE.OBJECT ?BOOM                
 DUP WALL@ = SWAP CREEP@ = OR           
                                        
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
                        

( ----------- Screen 114/284 ----------- :)
 ( FEEL)                                
                                        
 : FEEL ( OBJECT ---)                   
 ROB.OR.SQ@                             
 NEXT.SQUARE CHECK.NEXT                 
 ROB? IF                                
   S2 OFF S-ENABLE OFF S-ML             
   ON S-YEXP OFF S-XEXP B%  S-C         
   ENV.CLR  C@ DG% = IF Y%  S-C THEN    
   ( YELLOW ARM OVER DARK GREEN BACK)   
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
                                        
                                        
                                        
                        

( ----------- Screen 115/285 ----------- :)
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
                                        
                        

( ----------- Screen 116/286 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 117/287 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 118/288 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 119/289 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 120/290 ----------- :)
( COIN SPECIAL)                         
                                        
: COIN ( ---)                           
  2 IRND 0=                             
  IF FALSE.FLOW THEN ;                  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 121/291 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 122/292 ----------- :)
( STEP? SPD)                            
                                        
                                        
 : STEP? STEP @                         
  IF 2 WT BEGIN DO.EVENTS 2 WT B.D @    
   STEP  @ NOT  OR UNTIL                
  THEN ;                                
 : SPD DB.SP @ 0 DO LOOP ;              
                                        
 : B- ( --) STEP @ IF BEGIN B.D @ NOT   
 DO.EVENTS UNTIL THEN ;  ( BUTTON OFF)  
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 123/293 ----------- :)
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
                        

( ----------- Screen 124/294 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 125/295 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 126/296 ----------- :)
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
                                        
  CYCLES @                              
  CYCLE.CT !                            
  ROOM.CNT C@  IRND                     
  1 + LOAD.ROOM   ( FOR NOW)            
  BEGIN SQUARE.COUNT@ IRND DUP          
   ROBOT.SQUARE ! SQUARE.OBJECT         
   FLOOR@ = UNTIL ( RANDOM START)       
 8 IRND  CW.POINT                       
   INIT.CW                              
    ;                                   
                                        
                                        
                                        
                        

( ----------- Screen 127/297 ----------- :)
 ( START.GAME STOP.GAME )               
: LEAVE.GAME ( ---)                     
   1 G.ON$ MS$ MS( S.IT$                
   2 ON  MS( IT+                        
   1 OFF OP( IT+ L.DB                   
   2 SE$ MS$ MS( S.IT$ ;                
 : START.GAME ( ---)                    
  1 G.OFF$ MS$ MS( S.IT$                
                                        
                                        
  FRAME  ( SCREEN.OFF)  INIT.GAME       
   GM.SC   NAME.                        
   CHIP#.                               
   0 UPDATE.DAMAGE  0 UPDATE.RANGE      
   0 ADD.POINTS  0 COUNT.CYCLE          
   0 UPDATE.FUEL  CLEAR.STACKS          
  FRAME  DRAW.GAMEBOARD  SCREEN.ON      
  1 ON OP( IT+                          
   PROG.STATUS @ SERIES@ =              
   NOT IF GAME.ON@ PROG.STATUS ! THEN ; 
 : STOP.GAME ( ---)                     
   PROG.STATUS @ SERIES@ = NOT IF       
     GAME.OFF@ PROG.STATUS !            
     LEAVE.GAME THEN ;                  
                                        
                        

( ----------- Screen 128/298 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 129/299 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 130/300 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 131/301 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 132/302 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 133/303 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 134/304 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 135/305 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 136/306 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 137/307 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 138/308 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 139/309 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 140/310 ----------- :)
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
                                        
                                        
                                        
                        

( ----------- Screen 141/311 ----------- :)
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
  IF DUP 4 ROLL CR( + C! ( SQ#/NX#)     
   SWAP DESTROY  ( NEXTSQ#)             
   DUP ROOM.DATA( + CREEP@ SWAP C!      
       ( STORE CREEP IN ROOM)           
                                        
  ELSE DROP SWAP DROP THEN ( SQ#)       
 ELSE SWAP DROP                         
 THEN RND.CRP ;                         
                                        
                                        
                        

( ----------- Screen 142/312 ----------- :)
( MOVE.BADDIES)                         
                                        
 : BADS ( ---)                          
  6 IRND 0 DO                           
   CRP# @ IRND DUP CR( + C@             
   55 MIN  ( NO GARBAGE #'S)            
         ( CREEP#/CREEP SQ#)            
   DUP SQUARE.OBJECT CREEP@ =           
     ( CREEP IS STILL THERE)            
   IF CRP.MV                            
   ELSE DDROP                           
   THEN                                 
  LOOP ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 143/313 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 144/314 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 145/315 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 146/316 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 147/317 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 148/318 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 149/319 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 150/320 ----------- :)
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
  PROG.STATUS @ DUP WORKSHOP.ON@ = NOT  
  SWAP ENV.ON@ = NOT AND                
  IF STATS.SCREEN THEN                  
  LEAVE.GAME ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 151/321 ----------- :)
 ( INIT.RB)                             
: INIT.RB ( ---)                        
  0 198 C!  ( KEYBD BUFF 0)             
  128 657 C! ( DISB SFT/COMM)           
(   193 792 C! ( SHIFT RESTORE<<<<<<)   
  GAME.OFF@ PROG.STATUS !               
  S4 W% S-C  S6 LR% S-C S5 W% S-C       
  S3 G% S-C S7 B% S-C S8 B% S-C         
                                        
  63488 96 8 * -                        
  " RB.CHR" LR                          
  FIRST " CW.SCR" LR SWAPOUT            
  FIRST SC( 2048 + 1000 CMOVE           
  SWAPIN  ( MOVE GAME CHARS HIGH)       
  FIRST 1000 + FIRST 1000 CMOVE         
  1024 " JS" LR J?  ( KOAL OR JOYST)    
  SCREEN.OFF  7 CHARBASE S.I            
  G.M.I B% M.BAK1                       
 OFF GAME.CHAR? !                       
  1 CW.LOAD  ( FOR NOW <<<<)            
 1 ENV.LOAD  ( FOR NOW)                 
 57344 " CW.SPR" LR  I-JOY              
  START.GAME  STOP.GAME  LEAVE.GAME     
  0 CB+ !  ( NO PASTE PANEL) ;          
                                        
                        

( ----------- Screen 152/322 ----------- :)
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
    2 LM$ MS$ MS( S.IT$                 
    1 G.OFF$ MS$ MS( S.IT$              
    8000 0 DO DO.EVENTS LOOP            
    PROG.STATUS @ GAME.ON@ = IF         
      TURN.GAME.OFF@ PROG.STATUS ! THEN 
  THEN ;                                
                                        
                        

( ----------- Screen 153/323 ----------- :)
 ( RB       )                           
                                        
: RB       ( ---)                       
  INIT.RB                               
  BEGIN 1000 IRND DROP  I-T             
   PROG.STATUS @                        
    CASE GAME.OFF@ OF DO.EVENTS ;;      
         GAME.ON@ OF                    
   2 OFF MS( IT+  GAME ;;               
    TURN.GAME.ON@ OF START.GAME ;;      
       SERIES@ OF SERIES ;;             
   TURN.GAME.OFF@ OF STOP.GAME ;;       
   GAME.ABORTED@ OF DIE     ;;          
   GAME.FINISHED@ OF END     ;;         
   WORKSHOP.ON@ OF WORKSHOP ;;          
   ENV.ON@ OF ENV.EDIT ;;               
                                        
                                        
                                        
    ENDCASE                             
  AGAIN ;                               
                                        
                                        
                                        
                                        
                        

( ----------- Screen 154/324 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 155/325 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 156/326 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 157/327 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 158/328 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 159/329 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 160/330 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 161/331 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 162/332 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 163/333 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 164/334 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 165/335 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 166/336 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 167/337 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 168/338 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        
