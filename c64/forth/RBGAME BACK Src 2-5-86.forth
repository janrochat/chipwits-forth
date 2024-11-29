════════════════════════════════════════   SCREEN 001
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 002
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
════════════════════════════════════════   SCREEN 003
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
════════════════════════════════════════   SCREEN 011
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
════════════════════════════════════════   SCREEN 012
 ( ROB?)                                
 VAR ROB+   0 ROB+ !                    
: ROB? ( ---?FLAG^SHOW ROBOT?)          
 GAME.STATUS @ DEBUG.ON@ = NOT          
 ROB+ @ OR ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 014
( WALLS@)                               
 WALL@ 3 + IS WALLS@    EXIT            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 019
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
════════════════════════════════════════   SCREEN 021
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
════════════════════════════════════════   SCREEN 027
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 028
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 030
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
                                        
                                        
════════════════════════════════════════   SCREEN 031
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 032
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
════════════════════════════════════════   SCREEN 033
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
════════════════════════════════════════   SCREEN 034
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
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 035
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
════════════════════════════════════════   SCREEN 036
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 042
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
════════════════════════════════════════   SCREEN 044
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 046
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
════════════════════════════════════════   SCREEN 047
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
════════════════════════════════════════   SCREEN 048
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
════════════════════════════════════════   SCREEN 049
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 050
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
════════════════════════════════════════   SCREEN 051
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
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 052
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 053
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 054
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 055
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
════════════════════════════════════════   SCREEN 060
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 061
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
════════════════════════════════════════   SCREEN 062
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
════════════════════════════════════════   SCREEN 063
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
════════════════════════════════════════   SCREEN 064
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
                                        
════════════════════════════════════════   SCREEN 065
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
════════════════════════════════════════   SCREEN 066
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
                                        
════════════════════════════════════════   SCREEN 067
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 069
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 070
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
                                        
════════════════════════════════════════   SCREEN 071
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
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 072
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 073
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
════════════════════════════════════════   SCREEN 074
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
════════════════════════════════════════   SCREEN 078
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
════════════════════════════════════════   SCREEN 079
( CL.DR  CLOSE DOOR)                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 080
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
════════════════════════════════════════   SCREEN 081
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 082
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 084
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
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 085
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 091
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 095
( CALC.ROBOT.MOVE )                     
 FORTH                                  
 : CALC.MOVE ( --- NEXT SQ#)            
  ROBOT.ORIENTATION @                   
   ARG.BYTE C@ 64 MOD CHECK.MOV.ST      
   REVERSE@ = IF 4 + 8 MOD THEN         
   ROBOT.SQUARE @ NEXT.SQUARE ;         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 097
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
                                        
                                        
════════════════════════════════════════   SCREEN 100
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
════════════════════════════════════════   SCREEN 106
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
════════════════════════════════════════   SCREEN 107
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
                                        
                                        
════════════════════════════════════════   SCREEN 111
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
════════════════════════════════════════   SCREEN 113
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
════════════════════════════════════════   SCREEN 114
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
                                        
                                        
════════════════════════════════════════   SCREEN 115
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
════════════════════════════════════════   SCREEN 123
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
════════════════════════════════════════   SCREEN 125
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 126
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
                                        
                                        
════════════════════════════════════════   SCREEN 127
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
════════════════════════════════════════   SCREEN 140
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
                                        
                                        
════════════════════════════════════════   SCREEN 141
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
                                        
════════════════════════════════════════   SCREEN 151
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
════════════════════════════════════════   SCREEN 152
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
