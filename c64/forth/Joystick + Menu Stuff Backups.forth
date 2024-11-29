════════════════════════════════════════   SCREEN 003
( CURS.SPR)     EXIT                    
2 BASE !                                
S-DEF CURS.SPR                          
11111111 11110000 00000000              
11111111 11100000 00000000              
11111111 11000000 00000000              
11111111 10000000 00000000              
11111111 10000000 00000000              
11111111 11000000 00000000              
11111111 11100000 00000000              
11111111 11110000 00000000              
11110011 11111000 00000000              
11100001 11111100 00000000              
11000000 11111110 00000000              
00000000 01111110 00000000              
00000000 00111100 00000000              
00000000 00011000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
════════════════════════════════════════   SCREEN 004
( GRAPH.MEM.INITGRAPH.LOAD,SET M.BAK1,2)
                                        
 : GRAPH.MEM.INIT ( ---)                
   3 BANK 3 SCREEN                      
   3 16 * 4 + 53272 C! ( OUT TO 0 SCR)  
   204 648 C!  ( SCR 192 * 256)         
   147 EMIT ( CLEAR SCREEN)             
   6 CHARBASE ;                         
                                        
 : GRAPH.LOAD  ( ---)                   
   63488 96 8 * -  " CW.CHR" LOADRAM    
   57344 " CW.SPR" LOADRAM ;            
                                        
 : M.BAK1  ( COLOR---^SET MULTI CLR1)   
   53282 C! ;                           
                                        
 : M.BAK2  ( COLOR---)                  
   53283 C! ;                           
                                        
 : CHAR.COPY ( ---)                     
   56334 C@ 254 AND 56334 C!            
   1 C@ 251 AND 1 C!                    
   53248 61440 4096 CMOVE               
   1 C@ 4 OR 1 C!                       
════════════════════════════════════════   SCREEN 010
( JOYSTICK READER)                      
: READ.JOY ( ---) JOY2 C@               
DUP 127 = NOT IF 255 XOR                
  DUP 1 AND  ( UP?)                     
  IF CURS.Y @ 2- 50 MAX CURS.Y !        
  ELSE DUP 2 AND  ( DOWN?)              
    IF CURS.Y @ 2+ 234 MIN CURS.Y !     
    THEN                                
  THEN                                  
  DUP 4 AND  ( LEFT?)                   
  IF CURS.X @ 2- 24 MAX CURS.X !        
  ELSE DUP 8 AND   ( RIGHT?)            
    IF CURS.X @ 2+ 330 MIN CURS.X !     
    THEN                                
  THEN                                  
  16 AND IF ON BUTTON.DOWN !            
     CURS.X @ BUTTON.X !                
     CURS.Y @ BUTTON.Y !                
  ELSE OFF BUTTON.DOWN ! THEN           
ELSE 0 BUTTON.DOWN ! DROP THEN ;        
: JOY.TEST ( ---)  S1                   
  20000 0 DO                            
   READ.JOY  CURS.X @ CURS.Y @          
   S-POSITION LOOP ;                    
════════════════════════════════════════   SCREEN 011
( PT.IN.RECT)                           
: PT.IN.RECT                            
 ( LCRX/RX/TY/BY/PTX/PTY--FLAG)         
 ( DETERMINE IF PT IS IN RECTANGLE)     
 ( RECT COORD IN CHARACTER SCALE)       
SWAP >R                                 
 50 - 8 /  ( Y IN CHAR COORDS)          
 DUP ROT > ( LX/RX/TY/PTY/F)            
 ROT ROT > OR NOT  ( IN Y RANGE)        
 IF                                     
   R> 24 - 8 /  ( X IN CHAR COORDS)     
   DUP ROT >  ( LX/PTX/F)               
   ROT ROT >  OR NOT ( IN X RANGE)      
   IF  1 ELSE 0 THEN                    
 ELSE R> DROP 2DROP                     
 0 THEN ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 013
( JOY.READ VARS)                        
                                        
 51 CONSTANT J.TOP                      
 235 CONSTANT J.BOT                     
 25 CONSTANT J.LEFT                     
 331 CONSTANT J.RIGHT                   
 J.RIGHT 256 - CONSTANT J.RT.LO         
                                        
 EXIT                                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 014
( MACHINE LANG READ.JOY)   HEX          
CODE   READ.JOY                         
  D019     LDA,  ( GET INTERRUPT FLAGS) 
 1 # AND, 0=  ( RASTER INTERRUPT?)      
 IF, ' I-SYSTEM JMP,  ( EXIT TO SYS)    
 ELSE,  ( MY INTERRUPT)                 
  D019     STA,  ( CLEAR IT)            
  0 # LDX,  BUTTON.DOWN STX, ( CLEAR)   
  DC00      LDA, ( GET JOY2 VAL)        
  7F #      CMP, ( 7F = NO JOY)         
  0= NOT IF,     ( JOY ACTIVE)          
   .A    LSR,   ( UP TEST)              
   CS NOT IF,      ( UP BUTTON)         
    D001 LDY,  ( GRAB SPR0 Y)           
    J.TOP #  CPY, ( AT TOP?)            
    0= NOT IF, DEY, DEY, THEN, ( NO)    
    D001 STY,  ( NEW SPR0 Y)            
   THEN,                                
   .A    LSR,   ( DOWN TEST)            
   CS NOT IF,   ( DOWN THROWN)          
    D001 LDY,  ( GET SPR0 Y)            
    J.BOT # CPY,  ( AT BOT?)            
    0= NOT IF, INY, INY, THEN, ( NO)    
    D001 STY,                           
════════════════════════════════════════   SCREEN 015
( MACHINE READ.JOY  CONT.D)             
   .A   LSR,  ( LEFT.TEST)              
   CS  NOT   IF,                        
     D010 LDX, D000 LDY, ( SPR0 X H/L)  
     1 # CPX, 0= NOT IF, ( SPR0<255)    
       J.LEFT # CPY,  ( LEFT EDGE?)     
       0= IF, INY, INY, THEN, ( BACK)   
     THEN,                              
     DEY, DEY, FF # CPY, ( CROSS SEAM)  
     0= IF, D010 DEC, THEN,             
     D000 STY,  ( NEW SPR0 X)           
   THEN,                                
   .A   LSR, ( RIGHT TEST)              
   CS NOT  IF,  ( RIGHT BUTTON)         
     D010 LDX,  D000  LDY,              
     1 # CPX,  ( SPR0 >255?)            
     0= IF,    ( YES)                   
       J.RT.LO # CPY,  ( RT EDGE?)      
       0= IF, DEY, DEY, THEN, ( BACK)   
     THEN,                              
     INY, INY, 1 # CPY, ( MOVE RIGHT)   
     0= IF, D010 INC, THEN, ( SPR0 HI)  
        ( IF 1 THEN INC HI BIT)         
     D000 STY,                          
════════════════════════════════════════   SCREEN 016
( MACHINE READ.JOY END)                 
                                        
   .A    LSR,                           
   CS NOT   ( FIRE BUTTON PUSHED?)      
   IF,                                  
    1 #   LDA,                          
    BUTTON.DOWN STA, ( TURN ON VAR)     
    D001 LDA,        ( SPR0 Y)          
    BUTTON.Y    STA,                    
    D000 LDA,        ( SPR0 X LO)       
    BUTTON.X    STA,                    
    D010 LDA,        ( SPR0 X HI)       
    BUTTON.X 1+ STA,                    
   THEN,                                
  THEN,  ( JOY STICK ACTIVE)            
 THEN,                                  
 ' I-USER  JMP, ( NO SYS INTERRUPT)     
 END-CODE                               
 DECIMAL                                
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 017
( MACHINE JOY.TEST)                     
S1 ON   S-ENABLE                        
 100 100 S-POSITION                     
: JOY.TEST                              
                                        
                                        
                                        
   10000 0 DO                           
     100 0 DO  READ.JOY LOOP            
   LOOP ;                               
                                        
                                        
 : JOY.TIMER ( ---)                     
   0. SETTIM                            
   30000 0 DO LOOP                      
   RDTIM DROP 6 / .                     
   ." 30000 EMPTY LOOP" CR              
   0. SETTIM                            
   30000 0 DO LOOP                      
   RDTIM DROP 6 / .                     
   ." 30000 EMPT LOOP" CR               
  ;                                     
                                        
                                        
════════════════════════════════════════   SCREEN 018
 ( I-JOY)                               
                                        
 : I-JOY  ( ---)                        
 ( SET UP CURSOR JOYSTICK INTERRUPT)    
 788 @ 59953 = IF I-INIT THEN           
  ( FORTH IRQ ROTUINE SETUP)            
( -12352 CURS.SPR  ( PUT CURSOR GR)     
 S1 184 S-POINTER                       
 J.LEFT J.TOP S-POSITION                
 WHITE S-COLOR                          
 ON S-ENABLE                            
 53265 7 MASK CBIT ( CLEAR HI BIT)      
 251 53266 C! ( RASTER INT LO BYTE)     
 56334 C@ 254 AND 56334 C!              
 ' READ.JOY 5 I-SET                     
 53274 0 MASK SBIT                      
 ( ENABLE RASTER INTERRUPT)             
 56334 C@ 1 OR 56334 C! ;               
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 019
( BUT.XY@)                              
                                        
CODE BUT.XY@ ( ---BUTX/BUTY)            
  ' BUTTON.X LDA,                       
  DEX, DEX,                             
  BOT STA,                              
  ' BUTTON.X 1+ LDA,                    
  BOT 1+ STA,                           
  ' BUTTON.Y LDA, PHA,                  
  0 # LDA,                              
 PUSH JMP,                              
END-CODE                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 032
( SHOW.MENU DISABLED, MEN$, ITEM.OFF)   
VARIABLE ARR.ADDR ( MENU ARRAY)         
: SHOW.MENU ( STRING ADDR/ARR ADRR--)   
  DUP C@ MEN.X ! DUP 1+ C@ MEN.WD !     
  DUP 2+ C@ MEN.HI !                    
  ARR.ADDR ! MEN$.ADDR !                
  MEN.HI @ 0 DO                         
   ARR.ADDR @ 3 + I + C@ ( DISABLED?)   
   IF RED ELSE BLACK   THEN             
   I DISP.ITEM  LOOP                    
  BOT.SHADOW ;                          
                                        
: DISABLED,  ( ---)                     
( COMPILE 16 0'S FOR ITEM ENABLED       
  ARRAY)                                
0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 
0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 
;                                       
: MEN$, ( STRING ADDR---)               
  MEN$.ADDR @ SWAP $CONCAT ;            
: ITEM.OFF ( ITEM#/FLAG---)             
  SWAP 2+ MENU( @ +  C! ;               
                                        
: ITEM.ENABLE  ( ITEM#/FLAG/MENUAD---)  
════════════════════════════════════════   SCREEN 033
( WAREHOUSE)                            
CREATE WAREHOUSE(  1 C, ( LEFT EDGE)    
 10 C,  ( WIDTH)  16 C, ( HEIGHT)       
 DISABLED,                              
16 10 * $VARIABLE WAREHOUSE$            
0 WAREHOUSE$ C!                         
16 MEN.WD ! WAREHOUSE$ MEN$.ADDR !      
" GREEDY    " MEN$,                     
" MISTER CW " MEN$,                     
" 3         " MEN$,                     
" 4         " MEN$,                     
" 5         " MEN$,                     
" 6         " MEN$,                     
" 7         " MEN$,                     
" 8         " MEN$,                     
" 9         " MEN$,                     
" 10        " MEN$,                     
" 11        " MEN$,                     
" 12        " MEN$,                     
" 13        " MEN$,                     
" 14        " MEN$,                     
" 15        " MEN$,                     
" 16        " MEN$,                     
: WH.MENU.                              
════════════════════════════════════════   SCREEN 034
( WORKSHOP)                             
CREATE WORKSHOP(  12 C, ( LEFT EDGE)    
 12 C,  ( WIDTH)  8 C, ( HEIGHT)        
 DISABLED,                              
8 12 * $VARIABLE WORKSHOP$              
0 WORKSHOP$ C! WORKSHOP( MENU( !        
16 MEN.WD ! WORKSHOP$ MEN$.ADDR !       
" ENTER       " MEN$,                   
" ............" MEN$, 2 1 ITEM.OFF      
" SAVE CHIPWIT" MEN$,                   
" ............" MEN$, 4 1 ITEM.OFF      
" CUT PANEL   " MEN$,                   
" COPY PANEL  " MEN$,                   
" PASTE PANEL " MEN$,                   
" CLEAR PANEL " MEN$,                   
                                        
: WS.MENU.                              
 WORKSHOP$ WORKSHOP( SHOW.MENU ;        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 035
( GAMES)                                
CREATE GAMES(  22 C, ( LEFT EDGE)       
 14 C,  ( WIDTH)  11 C, ( HEIGHT)       
 DISABLED, GAMES( MENU( !               
11 14 * $VARIABLE GAMES$                
0 GAMES$ C!                             
16 MEN.WD ! GAMES$ MEN$.ADDR !          
" START GAME    " MEN$,                 
" SERIES        " MEN$,                 
" .............." MEN$, 3 1 ITEM.OFF    
" GREEDVILLE    " MEN$,                 
" CHIPWIT CAVES " MEN$,                 
" DOOM ROOMS    " MEN$,                 
" PEACE PATHS   " MEN$,                 
" MEMORY LANES  " MEN$,                 
" OCTOPUS GARDEN" MEN$,                 
" CES DEMO      " MEN$,                 
" BOOMTOWN      " MEN$,                 
: GM.MENU.                              
GAMES$ GAMES( SHOW.MENU ;               
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 036
( OPTIONS)                              
CREATE OPTIONS(  29 C, ( LEFT EDGE)     
 9 C,  ( WIDTH)  2 C, ( HEIGHT)         
 DISABLED,                              
2 9 * $VARIABLE OPTIONS$                
0 OPTIONS$ C!                           
16 MEN.WD ! OPTIONS$ MEN$.ADDR !        
" DEBUG ON " MEN$,                      
" QUIT     " MEN$,                      
                                        
: OP.MENU.                              
 OPTIONS$ OPTIONS( SHOW.MENU ;          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 037
 ( SET.ITEM$)                           
                                        
: SET.ITEM$ ( ITEM#/STRADDR/MEN$/MEN(--)
 1 + C@  >R  ( WIDTH)                   
 1+ MEN$.ADDR !                         
 SWAP 1- R@ *  MEN$.ADDR @ + ( STR/IT$) 
 ( START ADDRESS OF ITEM$)              
 DUP R> 32 FILL  ( ERASE OLD)           
 SWAP COUNT    ( IT$/STR$/CNT)          
 SWAP            ( IT$/CNT/STR$)        
 ROT ROT CMOVE  ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 080
( IN.MENU.BAR?)                         
                                        
VARIABLE THIS.MENU                      
VARIABLE THIS.ITEM                      
VARIABLE MENU.RIGHT                     
VARIABLE ITEM.COUNT                     
 : IN.MENU.BAR? ( ---FLAG)              
 0 39 0 0  ( X/X/Y/Y)                   
 BUT.XY@                                
 PT.IN.RECT ;                           
                                        
 CREATE MENU.ARRAY(                     
 WAREHOUSE( ,                           
 WORKSHOP( ,                            
 GAMES( ,                               
 OPTIONS( ,                             
                                        
 CREATE MENU$(                          
 WAREHOUSE$ ,                           
 WORKSHOP$ ,                            
 GAMES$ ,                               
 OPTIONS$ ,                             
                                        
                                        
════════════════════════════════════════   SCREEN 081
( WHICH.MENU SHOW.MENU)                 
: WHICH.MENU ( ---MENU# OR 0)           
  0 ( LEAVE FALSE ON STACK)             
  4 0 DO                                
    I 2* MENU.X( + DUP                  
    C@ SWAP 1+ C@ ( MENU X BOUNDS)      
    0 0 BUT.XY@                         
    PT.IN.RECT                          
    IF DROP I 1+ LEAVE THEN             
  LOOP  ;                               
 : SHOW.MENU ( MENU#---)                
  ( DRAWS CORRECT MENU AND SETS VARS)   
  DUP THIS.MENU !    ( MEN#)            
  DUP 1- 2* MENU.ARRAY( + @ ( MENU ADR) 
  MENU( !            ( MEN#)            
  DUP 1- 2* MENU$( + @ MEN$.ADDR !      
  MENU( @ DUP C@ DUP MEN.X !            
  OVER 1+ C@ DUP  MEN.WD !              
  +  MENU.RIGHT !                       
  2+ C@ MEN.HI !  0 THIS.ITEM !         
  CASE                                  
    1 OF WH.MENU. ;;                    
    2 OF WS.MENU. ;;                    
    3 OF GM.MENU. ;;                    
════════════════════════════════════════   SCREEN 082
 ( NEW.ITEM)                            
                                        
 : NEW.ITEM ( ITEM#---)                 
 ( HILIGHT NEW ITEM OR NONE IF 0)       
 ( OR DISABLED)                         
 THIS.ITEM @ DUP 0>                     
 IF BLACK SWAP ( BLACK NOT SELECTED)    
   1- HILIGHT.ITEM                      
 ELSE DROP THEN ( NONE SELECTED)        
 DUP 2+ MENU( @ + C@ ( DISABLED)        
 IF DROP 0 THEN                         
 DUP DUP 0>                             
 IF WHITE SWAP ( WHITE SELECTED)        
   1- HILIGHT.ITEM                      
 ELSE DROP THEN                         
 THIS.ITEM ! ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 083
( TRACK.CURSOR)                         
                                        
: TRACK.CURSOR ( ---)                   
  ( FOLLOW CURSOR AND HILIGHT)          
  ( ITEM SELECTIONS)                    
  MEN.X @ MENU.RIGHT @                  
  1 MEN.HI @                            
  BUT.XY@                               
  PT.IN.RECT  ( IN THE MENU)            
  IF                                    
    BUTTON.Y @  50 - 8 / ( ITEM #)      
    DUP MEN.HI @ > IF DROP 0 THEN       
  ELSE                                  
     0   ( NO ITEM)                     
  THEN                                  
  DUP THIS.ITEM @ =                     
  IF DROP  ( SAME ITEM)                 
  ELSE                                  
    NEW.ITEM                            
  THEN ;                                
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 084
( DO.MENU.EVENTS)                       
                                        
: DO.MENU.EVENTS ( ---FLAG)             
   BUTTON.DOWN @                        
   IF  IN.MENU.BAR?                     
     IF WHICH.MENU                      
       DUP IF                           
         SAVE.SCREEN                    
         SHOW.MENU                      
         BEGIN                          
           TRACK.CURSOR                 
           BUTTON.DOWN @ NOT UNTIL      
           THIS.ITEM @ DUP 0=           
           IF DROP                      
           ELSE  ( FLASH)               
           3 0 DO 0 NEW.ITEM            
             DUP NEW.ITEM               
           LOOP DROP                    
         THEN RESTORE.SCREEN            
       THIS.ITEM @                      
       ( TRUE IF ITEM CHOSEN)           
       THEN  ( LEAVE 0)                 
     ELSE 0 THEN                        
   ELSE 0 THEN  ;                       
════════════════════════════════════════   SCREEN 085
( MENU.TEST)                            
                                        
: MENU.TEST ( ---) S1 DRAW.MENU.BAR     
  ON S-ENABLE                           
  BEGIN                                 
    DO.MENU.EVENTS                      
    IF 0 24 D-POSITION ." MENU:"        
       THIS.MENU @ .                    
       ."   ITEM:"                      
       THIS.ITEM @ . ."  "              
       ."   DEPTH:" DEPTH .             
       ."   "                           
    THEN                                
  AGAIN ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 090
 ( FRAME)                               
                                        
 CODE FRAME                             
  ( WAITS FOR RASTER TO REACH 240)      
   242 # LDA, ( BOTTOM OF SPRITE Y)     
   BEGIN,                               
     53266 CMP,  ( THERE YET?)          
   0= UNTIL,                            
   NEXT JMP,                            
 END-CODE                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 091
 ( FTEST)                               
                                        
 : FTEST                                
    1000 0 DO                           
      FRAME                             
      GREEN 53281 C!                    
      RED 53281 C!                      
    LOOP ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 109
 ( MACHINE LANG VARS)                   
                                        
CREATE ROOM.DATA(  80 ALLOT             
VARIABLE WALL.COVERS                    
                                        
VARIABLE ROBOT.ORIENTATION              
VARIABLE ROBOT.SQUARE                   
                                        
12 CONSTANT WALL@                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 110
(  BLOCK.)                              
                                        
CODE BLOCK. ( XT/YT/BLOCK/CWD/CHT)      
( PRINT A BLOCK AT XT YT)               
  3 #   LDA,  XSAVE STX,                
  SETUPN JSR,  ( MOVE 3 STACK TO N)     
  XSAVE LDX, INX, INX,                  
  XSAVE STX, 0 # LDY,                   
  N 4 + ),Y LDA, ( GET COLOR BYTE)      
  N 1 -  STA,   ( STORE AT N-1)         
  SEC 2 + LDY,     ( YTAB)  CLC,        
  0 # LDA,  0 # LDX, ( INIT CHAR^ CALC) 
  BEGIN,  CLC,                          
    40 # ADC, CS IF, INX, THEN,         
    DEY, 0=  ( DEC YTAB INDEX)          
  UNTIL, N 6 + STX, XSAVE LDX,          
  CLC, SEC 4 + ADC, N 6 + LDX, ( XTAB)  
  CS IF, INX,  THEN,                    
  N 6 +  STA,  ( LO SCREEN START)       
  N 2 +  STA,  ( LO COLOR START)        
  TXA,  CLC, ( HI^ INTO A  )            
  'SCREEN 8 RSHIFT # ADC, ( HI SCREEN)  
  N 7 +  STA, ( STORE HI) TXA, CLC,     
  COLOR-MEM 8 RSHIFT # ADC, ( HI COL)   
════════════════════════════════════════   SCREEN 111
  ( BLOCK. CONT'D)  CLC,                
  N 4 + INC,  ( POINT TO 1ST CHAR)      
  0= IF, N 5 + INC, THEN,               
  BEGIN,   ( Y  DRAW LOOP)              
    N 1+ LDY,  ( HT INDEX)              
    XSAVE LDX, BOT LDA,  ( WD COUNTER)  
    BOT 1+ STA,  ( STORE IT)            
    BEGIN,  ( X DRAW LOOP)              
      N 1 - LDA,  ( GET COLOR)          
      N 2 + ),Y  STA,  ( STORE IT)      
      TYA, PHA, 0 # LDY, ( SAVE SCR^)   
      N 4 + ),Y LDA,  ( GET CHAR)       
      TAX, PLA, TAY, ( RECOVER SCR^)    
      TXA,  XSAVE LDX, CLC,             
      N 6 + ),Y STA, ( STORE CHAR)      
      N 4 + INC,  ( NEXT CHAR)          
      0= IF, N 5 + INC, THEN,           
      INY, BOT 1 + DEC,  ( WD INDEX)    
    0=  UNTIL,  ( LAST IN ROW?)         
    N 1+ LDA, CLC, ( GET HT INDEX)      
    40 # ADC, N 1+ STA, ( NEXT ROW^)    
    N DEC,  ( HEIGHT COUNTER DEC)       
  0= UNTIL,                             
  XSAVE LDX, INX, INX, INX, INX,        
════════════════════════════════════════   SCREEN 112
( CHECK.COVER )                         
ASSEMBLER                               
CREATE  <CHECK.COVER>                   
 ( SQ#--FLAG^WALL BELOW SQUARE?  )      
   BOT LDA,  8 # ADC, ( SQUARE DOWN)    
   TAY,                                 
   ' ROOM.DATA( ,Y LDA, ( SQARE.OBJECT) 
   WALL@ # CMP, 0=                      
   IF,  TYA,    ' WALL.COVERS STA,      
        1 # LDA,                        
        BOT STA,  ( 1 FLAG ON STACK)    
   ELSE,                                
        0 # LDA,                        
        BOT STA,  ( NO ON STACK)        
   THEN, RTS,                           
                                        
 CODE CHECK.COVER ( SQ--FLAG)           
   <CHECK.COVER> JSR,                   
   NEXT JMP, END-CODE                   
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 113
( ROB.OR.SQ@)                           
                                        
CODE ROB.OR.SQ@ ( ---ORIENT/SQRE)       
  ' ROBOT.ORIENTATION LDA,              
  DEX, DEX,                             
  BOT STA,                              
  0 # LDA,                              
  BOT 1+ STA,                           
  ' ROBOT.SQUARE LDA, PHA,              
  0 # LDA,                              
 PUSH JMP,                              
END-CODE                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 114
( SQUARE.OBJECT)                        
                                        
CODE SQUARE.OBJECT ( SQ#--OBJ#)         
  ' ROOM.DATA( 255 AND # LDA,           
  N STA,                                
  ' ROOM.DATA( 8 RSHIFT # LDA,          
  N 1+ STA,                             
  BOT LDY,                              
  N ),Y LDA,  ( GRAB OBJECT#)           
  BOT STA,    ( ON STACK)               
  NEXT JMP,                             
END-CODE                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 120
( P.IN.RECT TESTER)                     
                                        
: PTEST CR                              
  0. SETTIM                             
  1000 0 DO                             
   5 IRND 40 IRND 5 IRND 24 IRND        
   300 IRND 250 IRND                    
   DROP DROP DROP DROP DROP DROP        
  LOOP                                  
  RDTIM DROP 6 / .  CR                  
  0. SETTIM 1000 0 DO                   
   5 IRND 40 IRND 5 IRND 24 IRND        
   300 IRND 250 IRND                    
   PT.IN.RECT DROP                      
  LOOP                                  
  RDTIM DROP 6 / .                      
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 130
 ( DUMMY PROGRAM MAKER )                
 : P.STUFF ( OP/FLOW/ARG/FLOW/CH#--)    
  CURRENT.INSTRUCTION !                 
  + ROT ROT + SWAP !CHIP ;              
                                        
 : BLANK.PANEL ( PAN#--)                
   CURRENT.PANEL !                      
   CHIP.COUNT@ 0 DO                     
    SOCKET@ RIGHT.F@ 0 0 I P.STUFF      
   LOOP                                 
   GO.MARKER@ RIGHT.F@ 0 0 0 P.STUFF ;  
 : BLANK.ALL  10 0 DO I BLANK.PANEL     
       LOOP 0 CURRENT.PANEL ! ;         
 : SAVE.NEW.CW ( #---)                  
   BLANK.ALL                            
   CW.SAVE ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 131
 ( DUMMY PROGRAM <<<<<<)                
   BLANK.ALL                            
   FEEL.FOR@ RIGHT.F@                   
    FLOOR@ DOWN.F@ 1 P.STUFF            
   MOVE@ RIGHT.F@                       
    FORWARD@ 0    2 P.STUFF             
   GOTO.GO@ 0                           
    0 0 3 P.STUFF                       
   FLIP.COIN@ RIGHT.F@                  
    0 DOWN.F@  9 P.STUFF                
   MOVE@ DOWN.F@                        
    TURN.RIGHT@ 0 10 P.STUFF            
   MOVE@ RIGHT.F@                       
    TURN.LEFT@ 0  17 P.STUFF            
   GOTO.GO@ 0 0 0 18 P.STUFF            
                                        
                                        
 1 CW.SAVE                              
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 132
(  CW2)                                 
  BLANK.ALL                             
  FEEL.FOR@ RIGHT.F@                    
   DISK@ DOWN.F@ 1 P.STUFF              
  PICK.UP@ RIGHT.F@                     
   0 0             2 P.STUFF            
  SING@  RIGHT.F@                       
   RANGE.REG@ 0    3 P.STUFF            
  GOTO.GO@ 0 0 0   4 P.STUFF            
  LOOK.FOR@ RIGHT.F@                    
   CREEP@ DOWN.F@  9 P.STUFF            
  QRAY@     RIGHT.F@                    
   0 0             10 P.STUFF           
  FEEL.FOR@ RIGHT.F@                    
   FLOOR@ DOWN.F@ 17 P.STUFF            
  MOVE@    RIGHT.F@                     
   FORWARD@ 0     18 P.STUFF            
  GOTO.GO@ 0 0 0  19 P.STUFF            
  FLIP.COIN@  RIGHT.F@                  
   0 DOWN.F@         25 P.STUFF         
MOVE@ RIGHT.F@ TURN.LEFT@ 0 26 P.STUFF  
MOVE@ RIGHT.F@ TURN.RIGHT@ 0 33 P.STUFF 
MOVE@ RIGHT.F@ TURN.RIGHT@ 0 34 P.STUFF 
GOTO.GO@ 0 0 0 35 P.STUFF               
════════════════════════════════════════   SCREEN 133
(  CW3)                                 
BLANK.ALL                               
FEEL.FOR@ RIGHT.F@ DISK@ DOWN.F@ 1      
P.STUFF                                 
PICK.UP@ RIGHT.F@ 0 0 2 P.STUFF         
FEEL.FOR@ RIGHT.F@                      
   COFFEE@ DOWN.F@ 9 P.STUFF            
WIRE@ UP.F@  0 0  10 P.STUFF            
FEEL.FOR@ RIGHT.F@                      
   OIL@ DOWN.F@ 17 P.STUFF              
WIRE@ UP.F@  0 0  18 P.STUFF            
  LOOK.FOR@ RIGHT.F@                    
   CREEP@ DOWN.F@ 25 P.STUFF            
  QRAY@  RIGHT.F@  0 0 26 P.STUFF       
  FEEL.FOR@ LEFT.F@                     
   FLOOR@ RIGHT.F@ 33 P.STUFF           
  MOVE@ UP.F@ FORWARD@ 0 32 P.STUFF     
  GOTO.GO@ 0 0 0  24 P.STUFF            
WIRE@ RIGHT.F@ 0 0 34 P.STUFF           
WIRE@ RIGHT.F@ 0 0 35 P.STUFF           
FLIP.COIN@ RIGHT.F@ 0 UP.F@ 36 P.STUFF  
MOVE@ RIGHT.F@ TURN.LEFT@ 0 37 P.STUFF  
MOVE@ RIGHT.F@ TURN.RIGHT@ 0 28 P.STUFF 
MOVE@ RIGHT.F@ TURN.LEFT@ 0 38 P.STUFF  