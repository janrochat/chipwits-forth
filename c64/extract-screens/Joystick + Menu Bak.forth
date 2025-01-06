( Input file: ../disks/Joystick + Menu Bak/Joystick + Menu Bak.d64 )
( LINEWIDTH: 40 )
( ----------- Screen 0/170 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 1/171 ----------- :)
( JOYSTICK MENU LOAD SCREEN)            
( START FORTH INTERRUPT)                
                                        
172 175 THRU ( VARS & SPRITE)           
                                        
 G.M.I (  CHAR.COPY)                    
                                        
                                        
 180 189 THRU  ( JOYSTICK STUFF)        
                                        
 200 207 THRU  ( MENU STUFF)            
                                        
 250 254 THRU ( MENU TEST)              
                                        
 260 LOAD     ( FRAME)                  
 279 284 THRU ( MACHINE LANG PROGS)     
 FORTH   A-REMOVE                       
 : IT ;                                 
                                        
 ( 320 329 GAME & WORKSHOP SCREENS)     
 ( 310 -311 ARE SCENARIO SAVERS)        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 2/172 ----------- :)
( CURSOR VARS)                          
                                        
VARIABLE B.D  0 B.D ! ( BUTTON.DOWN)    
                                        
VARIABLE B.X  ( BUTTON DOWN POS)        
VARIABLE B.Y                            
0 B.Y ! 0 B.X !                         
EXIT                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
   , LaCI   ( q   @ o G 

( ----------- Screen 3/173 ----------- :)
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
DECIMAL                                 
                        

( ----------- Screen 4/174 ----------- :)
( GRAPH.MEM.INITGRAPH.LOAD,SET M.BAK1,2)
                                        
 : G.M.I ( ---^GRAPH.MEM.INIT)          
   3 BANK 3 SCREEN                      
   3 16 * 4 + 53272 C! ( OUT TO 0 SCR)  
   204 648 C!  ( SCR 192 * 256)         
   147 EMIT ( CLEAR SCREEN)             
   7 CHARBASE ;                         
                                        
 : GR.LD  ( ---^GRAPH.LOAD)             
   63488 96 8 * -  " CW.CHR" LR         
   57344 " CW.SPR" LR ;                 
                                        
 : M.BAK1  ( COLOR---^SET MULTI CLR1)   
   53282 C! ;                           
                                        
 : M.BAK2  ( COLOR---)                  
   53283 C! ;                           
 EXIT                                   
 : CHAR.COPY ( ---)                     
   56334 C@ 254 AND 56334 C!            
   1 C@ 251 AND 1 C!                    
   53248 61440 4096 CMOVE               
   1 C@ 4 OR 1 C!                       
   56334 C@ 1 OR 56334 C! ;             
                        

( ----------- Screen 5/175 ----------- :)
 ( CHAR.COLOR COLOR ASSIGNMENTS)        
                                        
 : CHAR.COLOR  ( COLOR---)              
 ( SWITCHES CHARACTER COLORS)           
 CASE B%    OF ."  " ;;                 
 W%    OF ."  " ;; R%  OF ."  " ;;      
 C%   OF ."  " ;; P%     OF ."  " ;;    
 G%    OF ."  " ;; BL%  OF ."  " ;;     
 Y%     OF ."  " ;;                     
 O%     OF ."  " ;; BR%   OF ."  " ;;   
 LR%    OF ."  " ;; DG%     OF ."  " ;; 
 MG%      OF ."  " ;;                   
 LG%      OF ."  " ;;                   
 LB%     OF ."  " ;;                    
 GL%     OF ."  " ;;                    
 ENDCASE ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 6/176 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 7/177 ----------- :)
( CODE TEST FOR JS OR KOALA) DECIMAL    
 DP @ 1024 DP !   0 C,                  
 HEX  CREATE <T> ASSEMBLER              
  PA@ STA, ( TRIGGER PADDLE)            
  80 # LDY, ( WAIT)                     
  BEGIN, NOP, DEY, 0= UNTIL,  DECIMAL   
  SID@ 25 + LDX, INX,                   
  0= NOT IF,                            
   SID@ 26 + LDX, INX, HEX              
   0= NOT IF, 400  STA,                 
   THEN, THEN, RTS,                     
 CREATE  <J?> XSAVE STX,                
  PHP, SEI, ( DISABLE INTERRUPTS)       
  PA@ LDA, PHA, CA@ LDA, PHA,           
     ( SAVE POR VALUES FOR KBD)         
  C0 # LDA, CA@ STA, ( DDR FOR PADDLE)  
  0 # LDA, 400  STA, ( CLEAR FLAG)      
  80 # LDA, ' <T> JSR, ( PORT ONE?)     
  40 # LDA, ' <T> JSR,                  
  PLA, CA@ STA, PLA, PA@ STA, ( PORT)   
  PLP, XSAVE LDX,                       
  RTS,  DECIMAL  HERE DUP . ." END" CR  
 DP !  ' <J?> . ." ' <J?> " 0 SAVENAME  
 C! SAVENAME " @0:JS" $CONCAT           
 1024 SWAP SAVE                         
                        

( ----------- Screen 8/178 ----------- :)
( <B.D> BUTTON DOWN SUB)                
 HEX                                    
 CREATE <B.D> ASSEMBLER                 
    1 #   LDA,                          
    B.D STA, ( TURN ON VAR)             
    D001 LDA,        ( SPR0 Y)          
    B.Y    STA,                         
    D000 LDA,        ( SPR0 X LO)       
    B.X    STA,                         
    D010 LDA,        ( SPR0 X HI)       
    B.X 1+ STA,                         
 RTS,                                   
 DECIMAL FORTH                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 9/179 ----------- :)
 ( SV.SP R.SP 1OFF)                     
                                        
                                        
 VARIABLE SP^                           
                                        
 : SV.SP ( ---^ SAVE SPRITES)           
  53269 C@ SP^ C! ;                     
                                        
 : R.SP ( ---^RESTORE SPRITES)          
   SP^ C@ 53269 C! ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 10/180 ----------- :)
( PT.IN.RECT)                           
: PT.RCT                                
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
 ELSE R> DROP DDROP                     
 0 THEN ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 11/181 ----------- :)
( JOY.READ VARS)                        
                                        
 51 CONSTANT J.T ( JOY TOP)             
 235 CONSTANT J.B ( BOT)                
 25 CONSTANT J.L  ( LEFT)               
 329 CONSTANT J.R ( RIGHT)              
 J.R 256 - CONSTANT J.LO ( LOW BYTE)    
                                        
 CREATE PD 1 ALLOT ( 0=JST 40,80 KOALA) 
                                        
                                        
 HEX                                    
 DC00 CONSTANT PA@ ( PORTA)             
 DC02 CONSTANT CA@ ( CIDDRA)            
 D400 CONSTANT SID@ DECIMAL             
                                        
                                        
EXIT                                    
 FILE " JS" IS LOADED INTO RAM AT 1024  
 AND THE J? WORD WILL JUMP TO IT        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 12/182 ----------- :)
( J?  <KOAL>)                           
DECIMAL                                 
CODE J?                                 
 ( LOADS IN PADDLE CHECKER CODE)        
 1067 JSR,                              
 1024 LDA, PD STA,   NEXT JMP,          
END-CODE                                
HEX CREATE TP 1 ALLOT                   
CREATE <KOAL> ASSEMBLER                 
 ( PHP, SEI, ( DISABLE INTERRUPTS)      
 PA@ LDA, PHA, CA@ LDA, PHA,            
  ( SAVE KEYBOARD)                      
 C0 # LDA, CA@ STA, ( DDR)              
 PD LDA, PA@ STA, ( TRIGGER RIGHT PAD)  
 80 # LDY,  ( WAIT)                     
 BEGIN, NOP, DEY, 0= UNTIL,             
 SID@ 19 + LDA,  ( X VALUE)             
 TP STA,                                
 .A LSR, .A LSR,                        
 CLC, TP ADC,                           
  ( MULTI BY 1.25)                      
 D000 STA,  ( SET X.LO)                 
 0 # LDA, .A ROL, TP STA, D010 LDA,     
 FE # AND, TP ORA, D010 STA,            
   ( SET X HI)                          
                        

( ----------- Screen 13/183 ----------- :)
( <KOAL> CONT)                          
HEX                                     
SID@ 1A + LDA,  ( GET Y)                
D001 STA,                               
PA@ LDA,                                
PA@ 1+ AND,  ( READ BOTH BUTTONS)       
                                        
0C # AND,   ( BITS 3,4)                 
C # CMP,                                
0= NOT IF, ' <B.D> JSR, THEN,           
( CARRY WILL INDICATE BUTTON ON)        
PLA, CA@ STA, PLA, PA@ STA,             
 RTS,                                   
                                        
FORTH DECIMAL                           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 14/184 ----------- :)
( MACHINE LANG READ.JOY)   HEX          
CODE   R.JOY                            
  D019     LDA,  ( GET INTERRUPT FLAGS) 
 1 # AND, 0=  ( RASTER INTERRUPT?)      
 IF, ' I-SYSTEM  JMP,  ( EXIT TO SYS)   
 ELSE,  ( MY INTERRUPT)                 
  D019     STA,  ( CLEAR IT)            
  0 # LDX,  B.D STX, ( CLEAR)           
  PD LDA, 0 # CMP, 0= NOT IF,           
    ' <KOAL> JSR,                       
  ELSE, DC00    LDA,                    
   7F #      CMP, ( 7F = NO JOY)        
    0= NOT IF,     ( JOY ACTIVE)        
     .A    LSR,   ( UP TEST)            
     CS NOT IF,      ( UP BUTTON)       
      D001 LDY,  ( GRAB SPR0 Y)         
      J.T #  CPY, ( AT TOP?)            
      0= NOT IF, DEY, DEY, THEN, ( NO)  
      D001 STY,  ( NEW SPR0 Y) THEN,    
     .A    LSR,   ( DOWN TEST)          
     CS NOT IF,   ( DOWN THROWN)        
      D001 LDY,  ( GET SPR0 Y)          
      J.B # CPY,  ( AT BOT?)            
      0= NOT IF, INY, INY, THEN, ( NO)  
      D001 STY,  THEN,                  
                        

( ----------- Screen 15/185 ----------- :)
( MACHINE READ.JOY  CONT.D)             
   .A   LSR,  ( LEFT.TEST)              
   CS  NOT   IF,                        
     D010 LDX, D000 LDY, ( SPR0 X H/L)  
     1 # CPX, 0= NOT IF, ( SPR0<255)    
       J.L # CPY,  ( LEFT EDGE?)        
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
       J.LO # CPY,  ( RT EDGE?)         
       0= IF, DEY, DEY, THEN, ( BACK)   
     THEN,                              
     INY, INY, 1 # CPY, ( MOVE RIGHT)   
     0= IF, D010 INC, THEN, ( SPR0 HI)  
        ( IF 1 THEN INC HI BIT)         
     D000 STY,                          
   THEN,                                
                        

( ----------- Screen 16/186 ----------- :)
( MACHINE READ.JOY END)                 
     .A    LSR,                         
   CS NOT   ( FIRE BUTTON PUSHED?)      
   IF,                                  
    ' <B.D> JSR,                        
   THEN,                                
  THEN,  ( JOY STICK ACTIVE)            
  THEN, ( BACK FROM KOALA?)             
 THEN,                                  
 ' BNC# LDA, 0= NOT IF, ( YES BOUNCER)  
   ' GAME.STATUS LDA, 0= IF, ( NO DBG)  
     A2 LDA,  ( READ JIFFY TIMER)       
      6 # CMP, CS IF,  ( 1/2 SECOND)    
       ' <SPIN.B> JSR,                  
     0 # LDA, A2 STA,  THEN,            
   THEN, THEN,                          
 ' I-USER  JMP, ( NO SYS INTERRUPT)     
 END-CODE  DECIMAL                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 17/187 ----------- :)
( MACHINE JOY.TEST) EXIT <<<            
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
                                        
                                        
                                        
                        

( ----------- Screen 18/188 ----------- :)
 ( I-JOY)                               
 : I-T  ( ---^RESTORE INTERRUPT)        
 251 53266 C! ( RASTER INT LO BYTE)     
 56334 C@ 254 AND 56334 C!              
 ' R.JOY 6 I-SET                        
 53274 0 MASK SBIT ( ENABLE RAST INT)   
 56334 C@ 1 OR 56334 C!                 
 53265 7 MASK CBIT ( CLEAR HI BIT) ;    
 : I-JOY  ( ---)                        
 ( SET UP CURSOR JOYSTICK INTERRUPT)    
 788 @ 59953 = IF I-INIT THEN           
  ( FORTH IRQ ROTUINE SETUP)            
( -12352 CURS.SPR  ( PUT CURSOR GR)     
 S1 184 S-PT ON S-ML                    
 J.L J.T S-POSITION                     
 DG%     S-C W%    1 S-M                
 ON S-ENABLE                            
 I-T  ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 19/189 ----------- :)
( BUT.XY@)                              
                                        
CODE BUT.XY@ ( ---BUTX/BUTY)            
  ' B.X LDA,                            
  DEX, DEX,                             
  BOT STA,                              
  ' B.X 1+ LDA,                         
  BOT 1+ STA,                           
  ' B.Y LDA, PHA,                       
  0 # LDA,                              
 PUSH JMP,                              
END-CODE                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 20/190 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 21/191 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 22/192 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

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
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 28/198 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 29/199 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 30/200 ----------- :)
( M.BAR  ( DRAW.MENU.BAR)               
  : M.BAR ( ---)                        
    0 0 D-POSITION ."   WAREHOUSE "     
    ."  WORKSHOP "                      
    ."  GAMES "                         
    ."  OPTIONS    "  ;                 
 CREATE M.X(                            
 ( X BOUNDS OF EACH MENU HEADING)       
 1 C, 9  C,     ( WAREHOUSE)            
 12 C, 19 C,   ( WORKSHOP)              
 22 C, 26 C,   ( GAMES)                 
 29 C, 35 C,   ( OPTIONS)               
                                        
 1024 CONSTANT CL.B(                    
CREATE SC.B( 800 ALLOT ( SCREEN.BUFF()  
 : S.SC ( ---)                          
   COLOR-MEM  CL.B( 800 CMOVE           
   'SCREEN SC.B( 800 CMOVE ;            
 : R.SC ( ---^RESTORE.SCREEN)           
   0 19 DO                              
     SC.B( I 40 * +                     
     'SCREEN I 40 * + 40 CMOVE          
     CL.B( I 40 * +                     
     COLOR-MEM I 40 * + 40 CMOVE        
   -1 +LOOP ;                           
                        

( ----------- Screen 31/201 ----------- :)
( DISP.ITEM HILIGHT.ITEM)               
VARIABLE M.WD  ( WIDTH OF ITEM $)       
VARIABLE M.HI  ( # OF ITEMS)            
VARIABLE M.X   ( LEFT EDGE OF MENU)     
VARIABLE M$.ADDR                        
VARIABLE MENU(                          
: D.IT ( COLOR/ITEM#---)                
  M.X @ 1- OVER 1+ D-POSITION           
  ."  '"  SWAP CHAR.COLOR               
  DUP M.WD @ * ( INDEX INTO MEN$)       
  M$.ADDR @ + 1+  ( ADDR$)              
  M.WD @  TYPE   ( COUNT)               
  ."  )" DROP ;                         
                                        
: BOT ( ---^BOTTOM SHADOW OF MENU)      
  M.X @ 1- M.HI @ 1+ D-POSITION         
  B%    CHAR.COLOR  45 EMIT ( LEFT)     
  M.WD @ 0 DO 38 EMIT LOOP              
  44 EMIT  ( RT SHADOW)  ;              
                                        
: H.IT ( COLOR/ITEM#---)                
  1+ 40 * M.X @ +  COLOR-MEM +          
  M.WD @ ROT FILL ;                     
                                        
                                        
                        

( ----------- Screen 32/202 ----------- :)
( SHOW.MENU DISABLED, MEN$, ITEM.OFF)   
VARIABLE ARR^ ( MENU ARRAY)             
: SH.M ( STRING ADDR/ARR ADRR--)        
  DUP C@ M.X ! DUP 1+ C@ M.WD !         
  DUP 2+ C@ M.HI !                      
  ARR^ ! M$.ADDR !                      
  M.HI @ 0 DO                           
   ARR^ @ 3 + I + C@ ( COLOR?)          
   I D.IT  LOOP                         
  BOT ;                                 
                                        
: D,  ( ---)                            
( COMPILE 16 0'S FOR ITEM ENABLED       
  ARRAY)                                
0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 
0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 0 C, 
;                                       
: M$, ( STRING ADDR---)                 
  M$.ADDR @ SWAP $+ ;                   
: IT- ( ITEM#/COLOR---)                 
  SWAP 2+ MENU( @ +  C! ;               
                                        
: IT+  ( ITEM#/FLAG/MENUAD---)          
 MENU( ! 0 = IF R%  ELSE B%    THEN     
 IT-      ;                             
                        

( ----------- Screen 33/203 ----------- :)
( WAREHOUSE)                            
CREATE WH(  1 C, ( LEFT EDGE)           
 11 C,  ( WIDTH)  16 C, ( HEIGHT)       
 D,                                     
16 11 * $V WH$                          
0 WH$  C!                               
16 M.WD ! WH$ M$.ADDR !                 
"  GREEDY    " M$,                      
"  MISTER CW " M$,                      
"  3         " M$,                      
"  4         " M$,                      
"  5         " M$,                      
"  6         " M$,                      
"  7         " M$,                      
"  8         " M$,                      
"  9         " M$,                      
"  10        " M$,                      
"  11        " M$,                      
"  12        " M$,                      
"  13        " M$,                      
"  14        " M$,                      
"  15        " M$,                      
"  16        " M$,                      
: WH.M.                                 
WH$ WH( SH.M ;                          
                        

( ----------- Screen 34/204 ----------- :)
( WORKSHOP)                             
CREATE WS(  12 C, ( LEFT EDGE)          
 12 C,  ( WIDTH)  8 C, ( HEIGHT)        
 D,                                     
8 12 * $V WS$                           
0 WS$ C! WS( MENU( !                    
16 M.WD ! WS$ M$.ADDR !                 
" ENTER       " M$,                     
" ............" M$, 2 R% IT-            
" SAVE CHIPWIT" M$,                     
" ............" M$, 4 R%  IT-           
" CUT PANEL   " M$,                     
" COPY PANEL  " M$,                     
" PASTE PANEL " M$,                     
" CLEAR PANEL " M$,                     
                                        
: WS.M.                                 
 WS$ WS( SH.M ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 35/205 ----------- :)
( GAMES)                                
CREATE GAMES(  22 C, ( LEFT EDGE)       
 15 C,  ( WIDTH)  11 C, ( HEIGHT)       
 D, GAMES( MENU( !                      
11 15 * $V GAMES$                       
0 GAMES$ C!                             
16 M.WD ! GAMES$ M$.ADDR !              
"  START GAME    " M$,                  
"  SERIES        " M$,                  
"  .............." M$, 3 R% IT-         
"  GREEDVILLE    " M$,                  
"  CHIPWIT CAVES " M$,                  
"  DOOM ROOMS    " M$,                  
"  PEACE PATHS   " M$,                  
"  MEMORY LANES  " M$,                  
"  OCTOPUS GARDEN" M$,                  
"  MYSTERY MATRIX" M$,                  
"  BOOMTOWN      " M$,                  
: GM.M.                                 
GAMES$ GAMES( SH.M ;                    
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 36/206 ----------- :)
( OPTIONS)                              
CREATE OP(  29 C, ( LEFT EDGE)          
 9 C,  ( WIDTH)  6 C, ( HEIGHT)         
 D,                                     
6 9 * $V OP$                            
0 OP$ C! OP( MENU( !                    
16 M.WD ! OP$ M$.ADDR !                 
" DEBUG ON " M$,                        
" SEE ROBOT" M$,                        
" SLOW     " M$,                        
" STEP     " M$,                        
" ........." M$, 5 R%  IT-              
" QUIT     " M$,                        
                                        
: OP.M.                                 
 OP$ OP( SH.M ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 37/207 ----------- :)
 ( SET.ITEM$)                           
                                        
: S.IT$ ( ITEM#/STRADDR/MEN$/MEN(--)    
 1 + C@  >R  ( WIDTH)                   
 1+ M$.ADDR !                           
 SWAP 1- R@ *  M$.ADDR @ + ( STR/IT$)   
 ( START ADDRESS OF ITEM$)              
 DUP R> 32 FILL  ( ERASE OLD)           
 SWAP COUNT    ( IT$/STR$/CNT)          
 SWAP            ( IT$/CNT/STR$)        
 ROT ROT CMOVE  ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

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
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 41/211 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 42/212 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 43/213 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 44/214 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 45/215 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 46/216 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 47/217 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 48/218 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 49/219 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 50/220 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 51/221 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 52/222 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 53/223 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 54/224 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 55/225 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 56/226 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

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
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 61/231 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 62/232 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 63/233 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 64/234 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 65/235 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 66/236 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 67/237 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 68/238 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 69/239 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 70/240 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 71/241 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 72/242 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 73/243 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 74/244 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 75/245 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 76/246 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 77/247 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 78/248 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 79/249 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 80/250 ----------- :)
( IN.MENU.BAR?)                         
                                        
VARIABLE T.M                            
VARIABLE T.I                            
VARIABLE M.RT                           
VARIABLE I#                             
 : BAR? ( ---FLAG)                      
 0 39 0 0  ( X/X/Y/Y)                   
 BUT.XY@                                
 PT.RCT ;                               
                                        
 CREATE M(                              
 WH( ,                                  
 WS( ,                                  
 GAMES( ,                               
 OP( ,                                  
                                        
 CREATE MENU$(                          
 WH$ ,                                  
 WS$ ,                                  
 GAMES$ ,                               
 OP$ ,                                  
                                        
                                        
                                        
                        

( ----------- Screen 81/251 ----------- :)
( WHICH.MENU SHOW.MENU)                 
: M# ( ---MENU# OR 0)                   
  0 ( LEAVE FALSE ON STACK)             
  4 0 DO                                
    I 2* M.X( + DUP                     
    C@ SWAP 1+ C@ ( MENU X BOUNDS)      
    0 0 BUT.XY@                         
    PT.RCT                              
    IF DROP I 1+ LEAVE THEN             
  LOOP  ;                               
 : SHOW.MENU ( MENU#---)                
  ( DRAWS CORRECT MENU AND SETS VARS)   
  DUP T.M !    ( MEN#)                  
  DUP 1- 2* M( + @ ( MENU ADR)          
  MENU( !            ( MEN#)            
  DUP 1- 2* MENU$( + @ M$.ADDR !        
  MENU( @ DUP C@ DUP M.X !              
  OVER 1+ C@ DUP  M.WD !                
  +  M.RT !                             
  2+ C@ M.HI !  0 T.I !                 
  CASE                                  
    1 OF WH.M. ;;                       
    2 OF WS.M. ;;                       
    3 OF GM.M. ;;                       
    4 OF OP.M. ;; ENDCASE ;             
                        

( ----------- Screen 82/252 ----------- :)
 ( NEW.ITEM)                            
                                        
 : NEW.I ( ITEM#---)                    
 ( HILIGHT NEW ITEM OR NONE IF 0)       
 ( OR DISABLED)                         
 T.I @ DUP 0>                           
 IF DUP 2+ MENU( @ + C@ ( BLACK,BLUE?)  
 SWAP ( DESELECTED)                     
   1- H.IT                              
 ELSE DROP THEN ( NONE SELECTED)        
 DUP 2+ MENU( @ + C@ ( DISABLED)        
 IF DROP 0 THEN                         
 DUP DUP 0>                             
 IF W%    SWAP ( WHITE SELECTED)        
   1- H.IT                              
 ELSE DROP THEN                         
 T.I ! ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 83/253 ----------- :)
( TRACK.CURSOR)                         
                                        
: TR.C ( ---)                           
  ( FOLLOW CURSOR AND HILIGHT)          
  ( ITEM SELECTIONS)                    
  M.X @ M.RT @                          
  1 M.HI @                              
  BUT.XY@                               
  PT.RCT  ( IN THE MENU)                
  IF                                    
    B.Y @  50 - 8 / ( ITEM #)           
    DUP M.HI @ > IF DROP 0 THEN         
  ELSE                                  
     0   ( NO ITEM)                     
  THEN                                  
  DUP T.I @ =                           
  IF DROP  ( SAME ITEM)                 
  ELSE                                  
    NEW.I                               
  THEN ;                                
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 84/254 ----------- :)
( DO.MENU.EVENTS)                       
                                        
: M.EV ( ---FLAG^DO.MENU.EVENTS)        
   B.D @                                
   IF  BAR?                             
     IF M#                              
       DUP IF                           
         S.SC                           
         SHOW.MENU                      
         BEGIN                          
           TR.C                         
           B.D @ NOT UNTIL              
           T.I @ DUP 0=                 
           IF DROP                      
           ELSE  ( FLASH)               
           3 0 DO 0 NEW.I               
             DUP NEW.I                  
           LOOP DROP                    
         THEN R.SC                      
       T.I @                            
       ( TRUE IF ITEM CHOSEN)           
       THEN  ( LEAVE 0)                 
     ELSE 0 THEN                        
   ELSE 0 THEN  ;                       
                                        
                        

( ----------- Screen 85/255 ----------- :)
( MENU.TEST)                            
                                        
: MENU.TEST ( ---) S1 M.BAR             
  ON S-ENABLE                           
  BEGIN                                 
    M.EV                                
    IF 0 24 D-POSITION ." MENU:"        
       T.M @ .                          
       ."   ITEM:"                      
       T.I @ . ."  "                    
       ."   DEPTH:" DEPTH .             
       ."   "                           
    THEN                                
  AGAIN ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 86/256 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 90/260 ----------- :)
 ( FRAME)                               
                                        
 CODE FRAME                             
  ( WAITS FOR RASTER TO REACH 240)      
   242 # LDA, ( BOTTOM OF SPRITE Y)     
   BEGIN,                               
     53266 CMP,  ( THERE YET?)          
   0= UNTIL,                            
   NEXT JMP,                            
 END-CODE                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 91/261 ----------- :)
 ( FTEST)                               
                                        
 : FTEST                                
    1000 0 DO                           
      FRAME                             
      GREEN 53281 C!                    
      RED 53281 C!                      
    LOOP ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 92/262 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 93/263 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 94/264 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 95/265 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 96/266 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 97/267 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 98/268 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 99/269 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 100/270 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 101/271 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 102/272 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 103/273 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 104/274 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 105/275 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 106/276 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 107/277 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 108/278 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 109/279 ----------- :)
 ( MACHINE LANG VARS)                   
                                        
CREATE ROOM.DATA(  80 ALLOT             
VARIABLE WALL.COVERS                    
                                        
VARIABLE ROBOT.ORIENTATION              
VARIABLE ROBOT.SQUARE                   
                                        
12 CONSTANT WALL@                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 110/280 ----------- :)
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
  N 3 + STA,    ( STORE COLOR HI)       
                        

( ----------- Screen 111/281 ----------- :)
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
POPTWO JMP,  END-CODE                   
                        

( ----------- Screen 112/282 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 113/283 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 114/284 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 115/285 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 116/286 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 117/287 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 118/288 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 119/289 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 120/290 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 121/291 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 122/292 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 123/293 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 124/294 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 125/295 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 126/296 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 127/297 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 128/298 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 129/299 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 130/300 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 131/301 ----------- :)
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 132/302 ----------- :)
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
 2 CW.SAVE                              
                        

( ----------- Screen 133/303 ----------- :)
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
3 CW.SAVE                               
                        

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
( SCENARIO CHOPPER)                     
128 157 C!  ( SHOW MESSAGES)            
CREATE CHOP(  5000 ALLOT                
 311 LOAD ( FIX.PP)                     
: SAVE$ ( STR$---)                      
 0 SAVENAME C!                          
 SAVENAME SWAP $CONCAT ;                
                                        
: CHOP.SAVE ( #ROOMS---)                
  CHOP( 78 + DUP ROT 80 * + .S SAVE ;   
CHOP( " GREEDVILLE" LOADRAM             
" @:A1" SAVE$  4 CHOP.SAVE              
CHOP( " CW CAVES" LOADRAM               
" @:A2" SAVE$  8 CHOP.SAVE              
CHOP( " DOOM ROOMS" LOADRAM             
" @:A3" SAVE$  13 CHOP.SAVE             
CHOP( " PEACE PATHS" LOADRAM            
" @:A4" FIX.PP SAVE$ 50 CHOP.SAVE       
" @:A7" SAVE$ 50 CHOP.SAVE ( TEMP)      
CHOP( " MEMORY LANES" LOADRAM           
" @:A5" SAVE$ 10 CHOP.SAVE              
CHOP( " OCTO GARDENS" LOADRAM           
" @:A6" SAVE$ 44 CHOP.SAVE              
CHOP( " BOOMTOWN" LOADRAM               
" @:A8" SAVE$ 9 CHOP.SAVE               
                        

( ----------- Screen 141/311 ----------- :)
( FIX.PP)                               
                                        
: FIX.PP  ( FIT PEACE PATHS IN 4K)      
  CHOP( 78 +  ( BASE)                   
  49 OVER 67 + C!                       
  49 OVER 68 + C!                       
  49 OVER 69 + C!  ( CONECT 1 TO 49)    
  32 OVER 75 + C! 40 OVER 76 + C!       
  48 OVER 77 + C!                       
  DUP 80 46 * + ( ROOM 47)              
  12 OVER 31 + C! ( CLOSE DOOR)         
  49 OVER 68 + C!                       
  49 OVER 69 + C!                       
  49 OVER 70 + C!  ( SLIDE OVER PTRS)   
  1 OVER  76 + C!                       
  2 OVER 77 + C!                        
  3 OVER 78 + C!  ( DOOR PTRS) DROP     
  80 48 * +        ( ROOM 49)           
  1 OVER 67 + C!                        
  1 OVER 68 + C!                        
  1 OVER 69 + C!  ( POINT TO 1)         
  23 OVER 75 + C! 31 OVER 76 + C!       
  39 OVER 77 + C! ( RIGHT DOORS)        
  57 + 12 SWAP C! ( CLOSE BTM DOOR) ;   
                                        
                        

( ----------- Screen 142/312 ----------- :)
K                                       
                                        
                                        
                                        
                                        
                                        
                K                       
                                        
                                        
                                        
                                        
                                        
                                K       
                                        
                                        
                                        
                                        
                                        
                                        
        K                               
                                        
                                        
                                        
                                        
                                        
                        

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
 ( SHADOW SHADOW.BLOCK)                 
 : SHADOW  ( L/B/R/T---)                
   4 PICK 1- 2 PICK 1- D-POSITION       
   GM.BORD.COL@ 8 + CHAR.COLOR          
   64 EMIT SWAP 4 ROLL ( B/T/R/L)       
   - DUP >R  ( WIDTH)                   
   0 DO 91 EMIT LOOP  ( TOP MARGIN)     
   92 EMIT ."   "  ( TOP RT EDGE)       
   - DUP 0 DO ( HEIGHT)                 
    93 EMIT ."   "  LOOP ( RT SHAD)     
   95 EMIT   ( LOWER RT SHADOW)         
   ."   "                               
   R> 0 DO 47 EMIT ."   " LOOP          
   174 EMIT  ( BOTTOM LEFT )            
   0 DO ."   " 175 EMIT LOOP            
   ( LEFT SHADW)                        
   ;                                    
                                        
 : SHADOW.BLOCK ( L/T/R/B/COLOR---)     
   5 PICK 3 PICK 1+                     
   5 PICK 1+ 7 PICK SHADOW              
   COLOR.BLOCK ;                        
                                        
                                        
                                        
                        

( ----------- Screen 151/321 ----------- :)
( GAME.TITLE)                           
CREATE CW.TITLE( BLACK C,               
100 C, 101 C, 102 C, 103 C, 104 C,      
105 C, 106 C, 107 C, 108 C,             
32 C, 32 C, 109 C, 32 C, 32 C, 32 C,    
32 C, 32 C, 32 C,                       
                                        
: GAME.TITLE  ( ---)                    
  8 4 CW.TITLE(                         
  9 2 BLOCK. ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 152/322 ----------- :)
( SETUP.GAME.SCREEN)                    
: SETUP.GAME.SCREEN ( ---)              
 BLACK DUP  BORDER BKGND                
 0 0 D-POSITION ."  " 1 MULTI-COLOR     
 0 0 39 24 GM.BORD.COL@ COLOR.BLOCK     
 1 2 24 23 BAK.C SHADOW.BLOCK ."  "     
 1 2 D-POSITION 24 0 DO 94 EMIT LOOP    
 DRAW.MENU.BAR                          
 27 2 38 22 BAK.C SHADOW.BLOCK          
 27 2 38 23 BAK.C COLOR.BLOCK           
    ( STAT MEM WINDOW)                  
 26 23 D-POSITION 175 EMIT              
26 24 D-POSITION 174 EMIT GM.BORD.COL@  
 8 + CHAR.COLOR 12 0 DO 47 EMIT LOOP    
31 'SCREEN 999 + C! GM.BORD.COL@ 8 + DUP
 COLOR-MEM 999 + DUP >R C! R>  40 - C!  
 29  'SCREEN 959 + C!                   
 BLACK CHAR.COLOR  GAME.TITLE           
( 8  3 D-POSITION ." GREEDY  IN"        
 8  4 D-POSITION ." GREEDVILLE" )       
 2  4 D-POSITION ." SCORE"              
 18 4 D-POSITION ." CYCLES"             
 27 2 D-POSITION ." ^^ STATUS ^^"       
 27 12 D-POSITION ." ^^ MEMORY ^^"      
 BAK.C BKGND GM.BORD.COL@ BORDER ;      
                        

( ----------- Screen 153/323 ----------- :)
( REGISTER.DRAW)                        
: B ."      " ;                         
: REG.OUTLN  ( HEIGHT/COLOR/X/Y---)     
  D-POSITION CHAR.COLOR  34 EMIT        
 34 EMIT ."  " 38 EMIT 38 EMIT 35 EMIT  
B 0 DO 41 EMIT I 2 = NOT IF ."   "      
  ELSE ." .." THEN 39 EMIT B  LOOP      
  37 EMIT 40 EMIT 40 EMIT 36 EMIT ;     
: REGISTER.DRAW ( ---)                  
  27 3 D-POSITION                       
  ." PNL CHIP KEY"                      
  27 4 D-POSITION                       
  5 NC@ 27 5 REG.OUTLN                  
  28 6 DAMAGE.REG@ O.D.                 
  5 NC@ 31 5 REG.OUTLN                  
  32 6 FUEL.REG@ O.D.                   
  5 NC@ 35 5 REG.OUTLN                  
  36 6 RANGE.REG@ O.D.                  
  9 NC@ 27 13 REG.OUTLN                 
  28 14 NUM.STACK@ O.D.                 
  9 OC@ 31 13 REG.OUTLN                 
  32 14 OBJ.STACK@ O.D.                 
  9 MC@ 35 13 REG.OUTLN                 
                                        
  36 14 MOV.STACK@ O.D. ;               
                        

( ----------- Screen 154/324 ----------- :)
( VERT.NUM)                             
                                        
: VERT.NUM ( ---)                       
 ( NUMBER PANEL VERTICALLY)             
 0 3 D-POSITION                         
 5 0 DO                                 
   ."   " I . ."      0  " LOOP ;       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 155/325 ----------- :)
 ( SETUP.WORK.SCREEN)                   
                                        
: SETUP.WORK.SCREEN ( ---)              
  0 MULTI-COLOR                         
0 0 D-POSITION                          
  ."  "  DRAW.MENU.BAR WS.CHAR          
  0 1 39 1 WS.BORD.COL@ COLOR.BLOCK     
( 2 5 25 24 WS.BACK.COL@ COLOR.BLOCK)   
  BLACK CHAR.COLOR                      
 26 2 D-POSITION ." ^^^^ IBOL ^^^^"     
 26 3 D-POSITION ." ^^ OPERATORS ^"     
  26 4 39 17 AC@ COLOR.BLOCK            
( 26 18 39 18 WHITE COLOR.BLOCK )       
 26 17 D-POSITION ." ^^ ARGUMENTS ^"    
( 26 19 39 24 TC@ COLOR.BLOCK )         
  WS.BACK.COL@ CHAR.COLOR               
  3 24 D-POSITION                       
  ." 0  1  2  3  4  5  6  7"            
  VERT.NUM   LT.GRAY BKGND   ;          
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 156/326 ----------- :)
( WS.ACTION,THING.ICONS)                
                                        
: WS.ACTION.ICONS ( ---)                
  ACTION.COUNT@ 1- GOTO.GO@ DO          
    I OP.W.DRAW                         
  LOOP                                  
  26 6 39 6 AC@ COLOR.BLOCK             
  26 8 32 9 AC@ COLOR.BLOCK             
  OBJECT=@ OP.W.DRAW MOVE=@ OP.W.DRAW   
  NUMBER<@ OP.W.DRAW NUMBER=@ OP.W.DRAW 
  SUBPANEL@ OP.W.DRAW WIRE@ OP.W.DRAW   
  KEYPRESS@ OP.W.DRAW                   
  26 8 32 8 AC@ COLOR.BLOCK             
  35 8 39 8 AC@ COLOR.BLOCK             
  26 10 39 10 AC@ COLOR.BLOCK           
  33 11 33 11 AC@ COLOR.BLOCK           
  29 7 29 7 AC@ COLOR.BLOCK             
  32 7 32 7 AC@ COLOR.BLOCK             
  35 7 35 7 AC@ COLOR.BLOCK ;           
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 157/327 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 158/328 ----------- :)
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        

( ----------- Screen 159/329 ----------- :)
  ( SAVE.SCREENS)                       
                                        
 : SAVE.SCREENS  0 157 C! ( NO MSG)     
   GAME.ON@ PROG.STATUS !               
   GRAPH.MEM.INIT                       
   GRAPH.LOAD                           
   SETUP.GAME.SCREEN                    
   GAME.TITLE                           
   REGISTER.DRAW                        
   'SCREEN FIRST 1000 CMOVE             
   COLOR-MEM FIRST 1000 + 1000 CMOVE    
   WORKSHOP.ON@ PROG.STATUS !           
   SETUP.WORK.SCREEN                    
   WS.ACTION.ICONS                      
   15 CW.LOAD                           
   0 PANEL.DRAW                         
   'SCREEN FIRST 2000 + 1000 CMOVE      
   COLOR-MEM FIRST 3000 + 1000 CMOVE    
   0 SAVENAME C!                        
  SAVENAME  " @0:CW.SCR" $CONCAT        
   FIRST FIRST 4000 + SAVE              
  EMPTY-BUFFERS ;                       
                                        
                                        
                                        
                        

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
                                        
                                        
                                        
                                        
                                        
                        
