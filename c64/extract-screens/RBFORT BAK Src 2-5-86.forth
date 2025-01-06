( Input file: ../disks/RBFORT BAK Src 2-5-86/RBFORT BAK Src 2-5-86.d64 )
( LINEWIDTH: 64 )
( ----------- Screen 0/170 ----------- :)
    (  QM$               RM$        P          STEP v           
\  <       #"$       SP           &        ROB        PN     EX 
CHIP#     SQ   8R= "   ,k2   ,  '    "       "!  ,k2 8R= , #    
 CALC.NEXT.INSTRUCTIO (    T     Q  V) S  "$        X SQ  /T   S
   RM$        C   (  RM$               RM$        M            |
 ]   KEYPRES     yQ   T   "@  #       TyQ2      ]   UPDATE.KE   
     "` (      "         "@   V) "Z ( "$       T "@    "@    "% 
 ,k2   T      `  !   "  v        "@     yQ2    FLIP.COI     I m]
                                                                
                                                                
                                                                
                                                                
           ,  P       P                  ACT.ON.WORL !   TRM$   
         < `RM$        +   * HRM$        +     9RM$         ]k  
        FEEL.FO     VM  '     ` *9): 5): 52: 5): 5 8 5FW   ,    
   8 5   5WL    G  0  jT         "       "     5 K2: 5   "  &;|M

( ----------- Screen 1/171 ----------- :)
( SUPER-FORTH SYSTEM LOADER BLOCK )                             
    3 ." THRU "           LOAD CR                               
    4 ." C64 UTILITIES "  LOAD CR                               
 5  6 ." KERNAL WORDS "   THRU CR                               
 7 12 ." STRINGS "        THRU CR                               
( 13 17 ." FILE-MODE "      THRU CR )                           
18 21 ." GRAPHICS "       THRU CR                               
22 23 ." SOUND "          THRU CR                               
24 26  ." UTILITIES "      THRU CR                              
33 34 ." SUPPLEMENTALS "  THRU CR                               
 105 112 THRU                                                   
( 42 45 ." EDITOR "           THRU CR                           
( 46 49 ." DECOMPILER UTIL. " THRU CR   )                       
122 LOAD  ( CHEAP FORGET)                                       
( 123 LOAD  ( NEW SAVE)                                         
                                                                

( ----------- Screen 2/172 ----------- :)
( DISK DIRECTORY/LOADER )                                       
( 50 51 ." TRIG ROUTINES "    THRU CR )                         
( 52 53 ." SQUARE ROOT "      THRU CR)                          
( 54 61 ." FLOATING POINT "   THRU CR)                          
62 66 ." C64 DATA/CONST. "  THRU CR                             
67 72 ." GRAPHICS "         THRU CR                             
73 75 ." I/O EXTENSIONS "   THRU CR                             
76 LOAD  79 ." UTILITIES "   LOAD      CR                       
80 LOAD   ( MUSIC)                                              
121 LOAD ( CUSTOM)                                              
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 3/173 ----------- :)
( UTILITIES: THRU )                                             
FORTH DEFINITIONS                                               
                                                                
: THRU  1+ SWAP                                                 
    DO I U. I LOAD                                              
     ?TERMINAL IF LEAVE THEN LOOP ;                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 4/174 ----------- :)
( C64 UTILITIES: SYSCALL RECURSE -TEXT )                        
                                                                
: SY  ( A X Y ADDR --- )                                        
   SYS DDROP DDROP ;                                            
EXIT <<<<<<<<<<<                                                
( IMPLEMENT RECURSIVE DEFINITIONS )                             
: RECURSE  ( IMPLEMENT RECURSIVE PROCEDURES )                   
   LATEST  PFA  CFA  , ;  IMMEDIATE                             
                                                                
: -TEXT   ( ADR1 C ADR2 --- FLAG )                              
   DDUP + SWAP                                                  
   DO DROP 1+ DUP 1- C@ I C@ - DUP                              
    IF 1 SWAP +- LEAVE THEN                                     
   LOOP SWAP DROP ;                                             
                                                                
                                                                

( ----------- Screen 5/175 ----------- :)
( KERNAL & I/O: SETLFS SETNAM OPEN CLOSE CLRCHN )               
HEX                                                             
: SETLFS ( LFN DEV CMD --- )                                    
   FFBA SY ;                                                    
                                                                
: SETNAM ( STRINGADDR --- )                                     
   COUNT SWAP SPLIT FFBD SY ;                                   
                                                                
: OPEN  ( LFN DEV CMD ADDR --- )                                
   SETNAM   SETLFS                                              
   FFC0 GO ;                                                    
                                                                
: CLOSE  ( LFN --- )                                            
   0 0 FFC3 SY ;                                                
                                                                
: CLRCHN  ( --- )  FFCC GO ; DECIMAL                            

( ----------- Screen 6/176 ----------- :)
( KERNAL INTERFACE: LOADRAM DOS ST )                            
HEX                                                             
: LR ( LOADADDR FILEADDR --- )                                  
   SETNAM                                                       
   >R FF SYSDEV @ R@ 0=  SETLFS                                 
   0 R> SPLIT FFD5 SY ;                                         
                                                                
                                                                
: DOS  ( STRINGADDR --- )                                       
   >R F SYSDEV @ F R> OPEN                                      
   F CLOSE ;                                                    
                                                                
: ST  ( --- STATUS ) 0090 C@ ;                                  
DECIMAL                                                         
                                                                
                                                                

( ----------- Screen 7/177 ----------- :)
( STRINGS: $VARIABLE $CONSTANT <$CONCAT> )                      
: $V                                                            
   CREATE  ( # --- )                                            
    0 C, ALLOT ;                                                
                                                                
: $C                                                            
   CREATE  ( --- )                                              
    HERE 1+  34 TEXT  PAD COUNT                                 
    DUP C,  DUP ALLOT  CMOVE ;                                  
                                                                
( CONCATENATION PRIMITIVE- CONCAT C2 CHARS FROM A2 ONTO END S1 )
: <$+>  ( S1 A2 C2 --- )                                        
   >R OVER COUNT +                                              
   R@ CMOVE DUP C@ R> +                                         
   SWAP C! ;                                                    
                                                                

( ----------- Screen 8/178 ----------- :)
( STRINGS: $CONCAT $LEFT $MID $RIGHT )                          
( CONCAT S2 ONTO END OF S1 )                                    
: $+  ( S1 S2 ---  )                                            
   COUNT <$+> ;                                                 
 EXIT <<<<<<<<<<<                                               
( CONCAT N LEFTMOST CHARS OF S2 TO S1 )                         
: $LEFT  ( S1 S2 NUM --- )                                      
   SWAP 1+ SWAP <$CONCAT> ;                                     
                                                                
( CONCAT N CHARS STARTING FROM S IN S2 TO S1 )                  
: $MID   ( S1 S2 S N --- )                                      
   >R + R> <$CONCAT> ;                                          
                                                                
( CONCAT N RIGHTMOST CHARS OF S2 TO S1 )                        
: $RIGHT ( S1 S2 NUM --- )                                      
   >R COUNT + R@ - R> <$CONCAT> ;                               

( ----------- Screen 9/179 ----------- :)
( STRINGS: $VAL  $LEN  $.  $CLR )                               
( CONVERT STRING S1 INTO 16 BIT # )                             
EXIT <<<  : $VAL    ( S1 --- N )                                
   NUMBER DROP ;                                                
                                                                
( GET LENGTH OF STRING S1 )                                     
: $LEN    ( S1 --- N )                                          
   C@ ;                                                         
                                                                
( PRINT A STRING )                                              
: $.     ( S1 --- )                                             
   COUNT TYPE ;                                                 
                                                                
( CLEAR A STRING )                                              
: $CLR   ( S1 --- )                                             
   0 SWAP C! ;                                                  

( ----------- Screen 10/180 ----------- :)
( STRINGS: <$"> " )                                             
( RUN-TIME ROUTINE FOR " )                                      
: <">  ( --- S1 )                                               
   0 PAD C! PAD                                                 
   R@ COUNT DUP 1+ R> + >R                                      
   <$+> PAD ;                                                   
                                                                
( ENTER A STRING INTO THE PAD )                                 
: "   ( --- S1 )                                                
   34 STATE @  ( CHECK FOR COMPILE)                             
   IF COMPILE <">  ( COMPILE ADDR OF RUN-TIME ROUTINE )         
    WORD C@ 1+ ALLOT                                            
   ELSE TEXT PAD                                                
   THEN ; IMMEDIATE                                             
                                                                
                                                                

( ----------- Screen 11/181 ----------- :)
( STRINGS: $CMP $< )                                            
( COMPARE TWO STRINGS- RESULTS:                                 
   0: S1=S2;  1: S1>S2;  2: S1<S2 )                             
EXIT <<<<<<<                                                    
: $CMP  ( S1 A2 C2 --- FLAG )                                   
   ROT COUNT ROT DDUP - >R R@                                   
   0> IF SWAP THEN                                              
   DROP ROT -TEXT                                               
    ?DUP IF  R> DROP                                            
     ELSE R> DUP IF 1 SWAP +- THEN                              
     THEN ;                                                     
                                                                
( CHECK IF S1 < S2 )                                            
: $<   ( S1 S2 --- F )                                          
   COUNT $CMP 0< ;                                              
                                                                

( ----------- Screen 12/182 ----------- :)
( STRINGS: $> $= $FIND ) EXIT <<<                               
( CHECK IF S1 < S2 )                                            
( CHECK IF S1 > S2 )                                            
: $>   ( S1 S2 --- F )                                          
   COUNT $CMP 0> ;                                              
                                                                
( CHECK IF S1 = S2 )                                            
: $=   ( S1 S2 --- F )                                          
   COUNT $CMP 0= ;                                              
                                                                
( FIND OCCURENCE OF S1 IN STRING )                              
: $FIND ( S1 A2 C2 --- [ADDR] FLAG)                             
   OVER + SWAP                                                  
    DO DUP COUNT I -TEXT DUP 0=                                 
     IF SWAP DROP I SWAP LEAVE ELSE DROP THEN                   
    LOOP NOT ;                                                  

( ----------- Screen 13/183 ----------- :)
( FILE MODE: FNAME FOPEN FILE-MODE )                            
23 $VARIABLE FNAME                                              
                                                                
( OPEN A FILE )                                                 
: F-OPEN  ( --- )                                               
   9 SYSDEV @ 9 FNAME OPEN ;                                    
( DUMMY R/W ROUTINE )                                           
: FR/W  DDROP DROP ;                                            
( SET UP FILE-MODE )                                            
: FILE-MODE  ( "FILENAME" --- )                                 
   DR0  1 MODE !  ' FR/W CFA 'R/W !                             
   34 TEXT PAD $LEN                                             
    IF FNAME $CLR FNAME PAD $CONCAT                             
    THEN ;                                                      
                                                                
: F-EXIT 0 MODE !   ' <R/W> CFA 'R/W ! ;                        

( ----------- Screen 14/184 ----------- :)
( FILE-MODE: READB WRITEB )                                     
( READ A BLOCK FROM AN OPENED FILE INTO A BUFFER )              
: READB  ( ADDR --- )                                           
   9 INPLFN !                                                   
   1024 0 DO                                                    
     KEY OVER I + C!                                            
    LOOP                                                        
   2 INPLFN !  DROP ;                                           
                                                                
( WRITE A BLOCK FROM A BUFFER INTO AN OPENED FILE )             
: WRITEB  ( ADDR --- )                                          
   9 OUTLFN !                                                   
   1024 0 DO                                                    
     DUP I + C@ EMIT                                            
    LOOP                                                        
   3 OUTLFN ! DROP ;                                            

( ----------- Screen 15/185 ----------- :)
( FILE-MODE: F-INIT F-NEW F-APPEND )                            
( INITIALIZE TO EDIT A FILE )                                   
: F-NEW   ( [FILENAME] )                                        
   EMPTY-BUFFERS  FILE-MODE                                     
   LIMIT 1028 - PREV !  FIRST USE !                             
   0 FLAST !  1 SCR ! ;                                         
                                                                
( APPEND FILE TO BUFFERS )                                      
: F-APPEND  ( [FILENAME] )                                      
   FILE-MODE  F-OPEN                                            
   #BUFF 1+ FLAST @ 1+ DUP SCR ! DO                             
    I BLOCK READB ST                                            
     IF I FLAST ! LEAVE THEN                                    
    LOOP                                                        
   9 CLOSE ;                                                    
                                                                

( ----------- Screen 16/186 ----------- :)
( FILE-MODE: F-EDIT F-SAVE )                                    
( INIT SYSTEM & READ IN FILE )                                  
: F-EDIT  ( [FILENAME] )                                        
   F-NEW  F-APPEND ;                                            
                                                                
HEX                                                             
( SAVE BUFFERS TO A FILE )                                      
: F-SAVE  ( [FILENAME] )                                        
   FILE-MODE F-OPEN                                             
   LIMIT 1- FIRST DO                                            
    I @ 7FFF AND 7FFF XOR                                       
     IF I 2+ WRITEB THEN                                        
    404 /LOOP                                                   
   9 CLOSE ;                                                    
DECIMAL                                                         
                                                                

( ----------- Screen 17/187 ----------- :)
( FILE MODE: F-LOAD F-NUMBER )                                  
: F-LOAD  ( [FILENAME] ; --- )                                  
   F-NEW  F-OPEN                                                
   1 BLOCK  ( LOAD INTO BLOCK 1 )                               
   170 0 DO                                                     
    DUP READB ST                                                
    1 LOAD                                                      
    IF LEAVE THEN  ( CHECK STATUS FOR EOF )                     
   LOOP   9 CLOSE ;   HEX                                       
: F-NUMBER  ( START --- )                                       
   DEPTH 0=   IF 1 THEN                                         
   8000 OR  LIMIT 1- FIRST DO                                   
     I @ 7FFF = NOT                                             
      IF DUP I ! 1+ THEN                                        
   404 /LOOP DROP ;                                             
DECIMAL                                                         

( ----------- Screen 18/188 ----------- :)
( GRAPHICS: S-M M-C S-S-COLLISION S-B-COLLISION)                
HEX                                                             
: S-M ( COLOR NUM --- )                                         
   D025 + C! ;                                                  
                                                                
: M-C   ( F --- )                                               
   D016 10 FBIT ;                                               
 DECIMAL EXIT <<<<<                                             
: S-S-COLLISION   ( --- VALUE )                                 
   D01E C@ ;                                                    
                                                                
: S-B-COLLISION   ( --- VALUE )                                 
   D01F C@ ;                                                    
DECIMAL   EXIT                                                  
                                                                
                                                                

( ----------- Screen 19/189 ----------- :)
( GRAPHICS: B-GRAPHICS B-FILL B-COLOR B-COL-FILL )              
 EXIT <<<<    HEX                                               
: B-GRAPHICS   ( FLAG --- )                                     
   D011 20 FBIT ;                                               
                                                                
: B-FILL   ( CHAR --- )                                         
   'BITMAP 1F40 ROT FILL ;                                      
                                                                
: B-COLOR    ( POS HCOL LCOL --- )                              
   CATNIB SWAP 'SCREEN + C! ;                                   
                                                                
: B-COLOR-FILL   ( HCOL LCOL --- )                              
   CATNIB 'SCREEN 3E8 ROT FILL ;                                
DECIMAL                                                         
                                                                
                                                                

( ----------- Screen 20/190 ----------- :)
( GRAPHICS: S-F S-ENABLE S-XEXP S-YEXP )                        
HEX                                                             
: S-F   ( FLAG ADDR --- )                                       
   SPRITE @ MASK FBIT ;                                         
                                                                
: S-ENABLE   ( FLAG --- )                                       
   D015 S-F ;                                                   
                                                                
: S-XEXP   ( FLAG --- )                                         
   D01D S-F ;                                                   
                                                                
: S-YEXP    ( FLAG --- )                                        
   D017 S-F ;                                                   
DECIMAL  EXIT                                                   
                                                                
                                                                

( ----------- Screen 21/191 ----------- :)
( GRAPHICS: S-P S-ML S-PT S-C )                                 
HEX                                                             
: S-P   ( FLAG --- )                                            
       D01B S-F ;                                               
                                                                
: S-ML   ( FLAG --- )                                           
   D01C S-F ;                                                   
                                                                
: S-PT   ( SPR# --- )                                           
   'SCREEN 3F8 + SPRITE @ + C! ;                                
                                                                
: S-C   ( COLOR --- )                                           
   D027 SPRITE @ + C! ;                                         
DECIMAL EXIT                                                    
                                                                
                                                                

( ----------- Screen 22/192 ----------- :)
( SOUND- V-F V-PW V-AD V-SR )                                   
( SET FREQUENCY OF VOICE )                                      
: V-F  ( VALUE --- )                                            
   SPLIT  1  V!  0  V! ;                                        
                                                                
( SET PULSE WIDTH OF VOICE )                                    
: V-PW  ( VALUE12 --- )                                         
   SPLIT  3  V!  2  V! ;                                        
                                                                
( SET ATTACK & DECAY OF VOICE )                                 
: V-AD  ( ATTACK4 DECAY4 --- )                                  
   CATNIB  5  V! ;                                              
                                                                
( SET SUSTAIN & RELEASE OF VOICE )                              
: V-SR  ( SUST4 REL4 --- )                                      
   CATNIB  6  V! ;                                              

( ----------- Screen 23/193 ----------- :)
( SOUND- V-CTRL RF MV )                                         
( SET CONTROL VALUES OF VOICE )                                 
: V-CTRL  ( VALUE --- )                                         
   4  V! ;                                                      
                                                                
( SET FILTER FREQUENCY )                                        
( SET RESONANCE & FILTER SWITCHES )                             
: RF  ( RES FSWS --- )                                          
   CATNIB 23 SID! ;                                             
                                                                
( SET FILTER MODE & SID VOLUME )                                
: MV   ( MODE VOLUME --- )                                      
   CATNIB 24 SID! ;                                             
                                                                
                                                                
                                                                

( ----------- Screen 24/194 ----------- :)
( UTILITIES: .S .SL .SR .SS .INDEX <ROT )  EXIT <<              
-1 CONSTANT .SS                                                 
: .SL 0 ' .SS ! ;                                               
: .SR -1 ' .SS  ! ;                                             
: .S CR DEPTH                                                   
    IF .SS  IF SP@ S0 2-                                        
     ELSE SP@ S0 SWAP THEN                                      
     DO I @ 0 D. 2 .SS +- +LOOP                                 
    ELSE ." EMPTY STACK " THEN CR ;                             
: <ROT ROT ROT ;                                                
: .INDEX                                                        
  DUP PAD 1 ROT T&SCALC 1 RWTS DROP                             
  CR OFFSET @ - 4 .R                                            
  2 SPACES PAD C/L -TRAILING TYPE ;                             
                                                                
                                                                

( ----------- Screen 25/195 ----------- :)
( UTILITIES:MAX-BUFFS BMOVE COPY SCOPY DSWAP D- D0= )           
: DSWAP 4 ROLL 4 ROLL ;                                         
: D- DNEGATE D+ ;                                               
: D0= OR 0= ;                                                   
: COPY OFFSET @ + SWAP BLOCK 2- ! UPDATE ; EXIT <<<<            
: MAX-BUFFS  ( --- )                                            
   LIMIT HERE - 0 1028 U/MOD                                    
   ' #BUFF ! DROP CHANGE ;                                      
                                                                
: BMOVE <ROT DDUP U<                                            
   IF ROT <CMOVE                                                
   ELSE ROT CMOVE THEN ;                                        
                                                                
: SCOPY ( FSTART FEND TSTART --- )                              
   <ROT 1+ SWAP   DO I OVER COPY 1+ LOOP DROP ;                 
                                                                

( ----------- Screen 26/196 ----------- :)
( UTILITIES: D= D> D@ DCONSTANT DMAX DMIN DOVER DU< DV )        
: D= D- D0= ;                                                   
: D> DSWAP D< ;                                                 
: D@ DUP 2+ @ SWAP @ ;                                          
( : DCONSTANT CREATE SWAP , ,                                   
   DOES> DUP @ SWAP 2+ @ ; )                                    
: DOVER 4 PICK 4 PICK ;                                         
: DV CREATE 4 ALLOT ; EXIT <<<                                  
: DMAX DOVER DOVER D< IF DSWAP THEN DDROP ;                     
: DMIN DOVER DOVER D< NOT IF DSWAP THEN DDROP ;                 
: DU< >R >R 32768 +                                             
     R> R> 32768 + D< ;                                         
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 27/197 ----------- :)
( UTILITIES:  PAUSE  )                                          
HEX                                                             
: PAUSE  ?TERMINAL                                              
   IF 1000 0 DO LOOP                                            
     BEGIN ?TERMINAL UNTIL                                      
     1000 0 DO LOOP                                             
   THEN ;                                                       
DECIMAL                                                         
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 28/198 ----------- :)
( UTILITIES: INDEX ?LOADING --> )                               
 EXIT                                                           
: ?LOADING                                                      
  BLK @ NOT ABORT" LOADING ONLY " ;                             
                                                                
: -->  ( --- )                                                  
   ?LOADING 0 >IN ! 1 BLK +! ;                                  
IMMEDIATE                                                       
: INDEX     ( FROM TO --- , )                                   
  CR OFFSET @ DUP ROT + 1+ ROT ROT +                            
  OVER MAX-BLKS 1+ >                                            
  ABORT" BLK NO. ERROR"                                         
  DO I .INDEX PAUSE ?TERMINAL                                   
    IF LEAVE THEN                                               
  LOOP ;                                                        
                                                                

( ----------- Screen 29/199 ----------- :)
( UTILITIES: DUMP )                                             
HEX   ( ADDR N --- )                                            
: DUMP 0 BASE @ >R HEX                                          
  DO CR DUP I + DUP 0 6                                         
   D.R 2 SPACES DUP 8 0                                         
    DO DUP I + C@ 3 .R LOOP                                     
   DROP SPACE DUP 8 + 8 0                                       
    DO DUP I + C@ 3 .R LOOP                                     
   DROP 3 SPACES 10 0                                           
    DO DUP I + C@ DUP 20 < OVER 7E > OR                         
     IF DROP 2E THEN EMIT                                       
   LOOP DROP 10                                                 
  PAUSE ?TERMINAL IF LEAVE THEN                                 
 /LOOP                                                          
 DROP CR R> BASE ! ;                                            
DECIMAL                                                         

( ----------- Screen 30/200 ----------- :)
( UTILITIES: 'TITLE TITLE TRIAD )                               
VARIABLE 'TITLE                                                 
: TITLE  CR 11 SPACES                                           
   ." ROBOT C-64 DEVELOPMENT" CR ;                              
                                                                
' TITLE CFA 'TITLE !                                            
                                                                
: TRIAD 0 2 U/MOD SWAP DROP                                     
   2 * 2 OVER + SWAP                                            
   DO CR I LIST ?TERMINAL                                       
    IF LEAVE THEN  1  /LOOP                                     
   'TITLE @ EXECUTE                                             
   12 EMIT ;                                                    
                                                                
: SHOW ( ST/END---) SWAP 2 +                                    
 SWAP  DO I TRIAD 2 +LOOP ;                                     

( ----------- Screen 31/201 ----------- :)
( UTILITIES:  <7>  ID.  )                                       
HEX                                                             
                                                                
: <7>  7F AND <EMIT> ;                                          
                                                                
( ID. : PRINT NAME FROM NFA )                                   
: ID.   ( ADDR --- )                                            
   ' <7> CFA 'EMIT !                                            
   COUNT 1F AND TYPE                                            
   ' <EMIT> CFA 'EMIT ! ;                                       
                                                                
DECIMAL                                                         
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 32/202 ----------- :)
( UTILITIES: VL VT VLIST ) DECIMAL                              
VARIABLE VL     40 VL !                                         
VARIABLE VT     13 VT !                                         
                                                                
: VLIST 32767 OUT !  CONTEXT @ @                                
   BEGIN VL @ 1- OUT @ - OVER C@ 31 AND                         
    < IF CR 0 OUT ! THEN                                        
    DUP ID.                                                     
    VT @ OUT @ OVER MOD - SPACES                                
    PFA LFA @ DUP                                               
    0= PAUSE ?TERMINAL OR                                       
   UNTIL DROP ;                                                 
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 33/203 ----------- :)
( SUPPLEMENTALS:  'S "2" DOUBLE NUMBER SET )                    
                                                                
: 'S SP@ ;                                                      
  EXIT                                                          
: 2! D! ;                                                       
: 2@ D@ ;                                                       
: 2CONSTANT DCONSTANT ;                                         
: 2DROP DDROP ;                                                 
: 2DUP DDUP ;                                                   
: 2OVER DOVER ;                                                 
: 2SWAP DSWAP ;                                                 
: 2VARIABLE DVARIABLE ;                                         
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 34/204 ----------- :)
( SUPPLEMENTALS: >BINARY ERASE FLUSH H U.R ['] )                
( : >BINARY CONVERT ;  )                                        
                                                                
( : EMPTY INIT-FORTH @ ' FORTH 2+ !                             
   INIT-USER UP @ 6 + 48 CMOVE ; )                              
                                                                
( : ERASE 0 FILL ; )                                            
                                                                
: FLUSH SAVE-BUFFERS ;                                          
EXIT <<<                                                        
: H DP ;                                                        
                                                                
: U.R 0 SWAP D.R ;                                              
                                                                
: ['] ?COMP [COMPILE] ' ; IMMEDIATE                             
                                                                

( ----------- Screen 35/205 ----------- :)
( ASSEMBLER: CONSTANTS INDEX )                                  
VOCABULARY ASSEMBLER IMMEDIATE                                  
HEX ASSEMBLER DEFINITIONS                                       
( REGISTER ASSIGNMENTS SPECIFIC TO THIS IMPLEMENTATION )        
83 CONSTANT XSAVE   81 CONSTANT W                               
FB CONSTANT IP      87 CONSTANT N                               
                                                                
( NUCLEUS LOCATIONS SPECIFIC TO THIS IMPLEMENTATION)            
0884 CONSTANT POP    0882 CONSTANT POPTWO                       
088B CONSTANT PUT    0889 CONSTANT PUSH                         
0890 CONSTANT NEXT   0871 CONSTANT SETUPN                       
                                                                
VARIABLE INDEX -2  ALLOT                                        
0909 , 1505 , 0115 , 8011 , 8009 , 1D0D , 8019 , 8080 ,         
0080 , 1404 , 8014 , 8080 , 8080 , 1C0C , 801C , 2C80 , DECIMAL 
                                                                

( ----------- Screen 36/206 ----------- :)
( ASSEMBLER: MODE ADDRESSING MODES BOT SEC RP> UPMODE )         
HEX                                                             
VARIABLE MODE 2 MODE !                                          
: .A 0 MODE ! ; : # 1 MODE ! ;  : MEM 2 MODE ! ;                
: ,X 3 MODE ! ; : ,Y 4 MODE ! ; : ,X) 5 MODE ! ;                
: ),Y 6 MODE ! ; : ) F MODE ! ;                                 
                                                                
: BOT ,X 0 ;     ( ADDRESS THE BOTTOM OF DATA STACK )           
: SEC ,X 2 ;     ( ADDRESS SECOND ITEM ON DATA STACK )          
: RP> ,X 101   ; ( ADDRESS BOTTOM OF RETURN STACK )             
                                                                
: UPMODE IF MODE @   8 AND 0= IF 8 MODE +! THEN THEN            
   1 MODE @ 0F AND ?DUP  IF 0 DO DUP + LOOP THEN                
   OVER 1+ @ AND 0= ;                                           
                                                                
DECIMAL                                                         

( ----------- Screen 37/207 ----------- :)
( ASSEMBLER: CPU )                                              
                                                                
HEX                                                             
: CPU CREATE C, DOES>  C@ C, MEM ;                              
    00 CPU BRK,    18 CPU CLC,    DE CPU CLD,    58 CPU CLI,    
    B8 CPU CLV,    CA CPU DEX,    88 CPU DEY,    E8 CPU INX,    
    C8 CPU INY,    EA CPU NOP,    48 CPU PHA,    08 CPU PHP,    
    68 CPU PLA,    28 CPU PLP,    40 CPU RTI,    60 CPU RTS,    
    38 CPU SEC,    F8 CPU SED,    78 CPU SEI,    AA CPU TAX,    
    A8 CPU TAY,    BA CPU TSX,    8A CPU TXA,    9A CPU TXS,    
    98 CPU TYA,                                                 
                                                                
DECIMAL                                                         
                                                                
                                                                
                                                                

( ----------- Screen 38/208 ----------- :)
( ASSEMBLER: M/CPU )                                            
HEX                                                             
: M/CPU CREATE C, , DOES>                                       
   DUP 1+ @ 80 AND IF 10 MODE +! THEN OVER                      
   FF00 AND UPMODE UPMODE IF MEM CR LATEST ID.                  
   ABORT" INCORRECT ADDRESSING" THEN C@ MODE C@                 
   INDEX + C@ + C, MODE C@ 7 AND IF MODE C@                     
   0F AND 7 < IF C, ELSE , THEN THEN MEM ;                      
1C6E 60 M/CPU ADC, 1C6E 20 M/CPU AND, 1C6E C0 M/CPU CMP,        
1C6E 40 M/CPU EOR, 1C6E A0 M/CPU LDA, 1C6E  0 M/CPU ORA,        
1C6E E0 M/CPU SBC, 1C6C 80 M/CPU STA, 0D0D  1 M/CPU ASL,        
0C0C C1 M/CPU DEC, 0C0C E1 M/CPU INC, 0D0D 41 M/CPU LSR,        
0D0D 21 M/CPU ROL, 0D0D 61 M/CPU ROR, 0414 81 M/CPU STX,        
0486 E0 M/CPU CPX, 0486 C0 M/CPU CPY, 1496 A2 M/CPU LDX,        
0C8E A0 M/CPU LDY, 048C 80 M/CPU STY, 0480 14 M/CPU JSR,        
8480 40 M/CPU JMP, 0484 20 M/CPU BIT, DECIMAL                   

( ----------- Screen 39/209 ----------- :)
( ASSEMBLER: BEGIN, UNTIL, IF, THEN, ELSE, NOT BRANCHES )       
: BEGIN, HERE 1 ;                                               
: UNTIL,  >R 1 ?PAIRS R> C, HERE 1+ - C, ;                      
: IF, C, HERE 0 C, 2 ;                                          
: THEN,  2 ?PAIRS HERE OVER C@                                  
   IF SWAP !  ELSE OVER 1+ - SWAP C! THEN ;                     
: ELSE, 2 ?PAIRS HERE 1+ 1 JMP,                                 
   SWAP HERE OVER 1+ - SWAP C! 2 ;                              
 HEX                                                            
: NOT  20 + ;   ( REVERSE ASSEMBLY TEST )                       
90 CONSTANT CS  ( ASSEMBLE TEST FOR CARRY SET )                 
D0 CONSTANT 0=  ( ASSEMBLER TEST FOR EQUAL ZERO )               
10 CONSTANT 0<  ( ASSEMBLE TEST FOR LESS THAN OR EQUAL ZERO )   
90 CONSTANT >=  ( ASSEMBLE TEST FOR GREATER OR EQUAL ZERO )     
( .= IS ONLY CORRECT AFTER SUB, OR CMP, )                       
50 CONSTANT VS  DECIMAL                                         

( ----------- Screen 40/210 ----------- :)
( ASSEMBLER:  AGAIN, WHILE, REPEAT )                            
                                                                
: AGAIN, 1 ?PAIRS JMP, ;                                        
                                                                
: WHILE, >R DUP 1 ?PAIRS R> IF, 2+ ;                            
                                                                
: REPEAT, >R >R 1 ?PAIRS JMP, R> R> 2 - THEN, ;                 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 41/211 ----------- :)
( ASSEMBLER: END-CODE ENTERCODE ;CODE CODE )                    
: END-CODE   CURRENT @ CONTEXT ! SP@ 2+ =                       
   IF SMUDGE                                                    
   ELSE ." CODE ERROR, STACK DEPTH CHANGE"                      
   THEN ;                                                       
FORTH DEFINITIONS                                               
: ENTERCODE [COMPILE] ASSEMBLER SP@ ;                           
: CODE CREATE SMUDGE HERE DUP 2- !                              
   ASSEMBLER MEM ENTERCODE ;   IMMEDIATE                        
: ;CODE ?CSP COMPILE <;CODE> [COMPILE]  [ ENTERCODE ; IMMEDIATE 
    EXIT                                                        
                                                                
                                                                
                                                                
( THIS 6510 FORTH ASSEMBLER WAS WRITTEN BY WILLIAM F. RAGSDALE )
( IT WAS PUBLISHED IN "FORTH DIMENSIONS", VOL. III # 5         )

( ----------- Screen 42/212 ----------- :)
( EDITOR: CHKLIN LINE PP C )   HEX                              
: CHKLIN    ( LINE# --- )                                       
   DUP C/L * 1023 > ABORT" OFF SCREEN" ;                        
                                                                
: LINE ( LINE# --- BUF-ADDR COUNT )                             
   CHKLIN DUP R# ! SCR @ <LINE> UPDATE ;                        
                                                                
: PP   ( LINE# --- )                                            
   PAD 1+ SWAP LINE 1 TEXT CMOVE ;                              
                                                                
                                                                
                                                                
                                                                
: C    ( FROM# TO# --- )                                        
   SWAP LINE DROP SWAP LINE CMOVE ;                             
DECIMAL                                                         

( ----------- Screen 43/213 ----------- :)
( EDITOR: SCREEN COMMANDS )                                     
: SE DUP R# ! PP QUIT ;                                         
:  0) 0 SE ;    :  1)  1 SE ;                                   
:  2) 2 SE ;    :  3)  3 SE ;                                   
:  4) 4 SE ;    :  5)  5 SE ;                                   
:  6) 6 SE ;    :  7)  7 SE ;                                   
:  8) 8 SE ;    :  9)  9 SE ;                                   
: 10) 10 SE ;   : 11) 11 SE ;                                   
: 12) 12 SE ;   : 13) 13 SE ;                                   
: 14) 14 SE ;   : 15) 15 SE ;                                   
      ( EXT. FOR > 15 LINES/SCR )                               
: 16) 16 SE ;   : 17) 17 SE ;                                   
: 18) 18 SE ;   : 19) 19 SE ;                                   
: 20) 20 SE ;   : 21) 21 SE ;                                   
: 22) 22 SE ;   : 23) 23 SE ;                                   
: 24) 24 SE ;   : 25) 25 SE ;                                   

( ----------- Screen 44/214 ----------- :)
( EDITOR: K X O M )                                             
( KILL - REPLACE LINE WITH BLANKS )                             
: K      ( LINE# --- )                                          
   LINE BLANK ;                                                 
                                                                
( X-TRACT A LINE FROM SCREEN )                                  
: X      ( LINE# --- )                                          
   24 SWAP DO I 1+ I C LOOP 24 K ;                              
                                                                
( OPEN A LINE FOR INPUT )                                       
: O      ( LINE# --- )                                          
   DUP 23 DO I I 1+ C -1 +LOOP K ;                              
( MOVE LINE )                                                   
: M      ( FROM TO --- )                                        
   OVER SWAP C X ;                                              
                                                                

( ----------- Screen 45/215 ----------- :)
( EDITOR: F L W N P SC SM LIST )                                
: F  SCR @ DUP BLOCK DUP 2- @ 0<                                
   IF DDUP 2- ! SWAP 0 R/W ELSE DDROP THEN ;                    
: L  ( [SCR] --- ) DEPTH IF F ELSE SCR @ THEN LIST ;            
: W   SCR @ BLOCK 1024 BL FILL L UPDATE ;                       
: N   F  1 SCR +! ;                                             
: P   F -1 SCR +! ;                                             
( COPY LINE FROM DIFF SCREEN )                                  
: SC   ( FR-SCR FR-LINE --- )                                   
   CHKLIN SWAP <LINE> DROP                                      
   R# @  DUP O LINE CMOVE ;                                     
( MOVE LINE FROM DIFF SCREEN )                                  
: SM   ( FR-SCR FR-LINE --- )                                   
   >R >R   SCR @   R# @   R@ I' SC                              
   R> SCR !   R> X  R# !   SCR ! ;                              
                                                                

( ----------- Screen 46/216 ----------- :)
( DECOMPILER: GIN  GIN+  DIN )                                  
VARIABLE GIN  ( # TO INDENT )                                   
: GIN+ CR GIN @ 2+ DUP GIN ! SPACES ;                           
: DIN CR GIN @ SPACES ;                                         
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 47/217 ----------- :)
( DECOMPILER: GCHK )                                            
: GCHK  DUP @ 2+ ' COMPILE =                                    
   IF  2+ DUP @ 2+ NFA ID. 2+                                   
   ELSE DUP @ 2+ DUP ' <LIT> =                                  
        OVER ' BRANCH = OR                                      
        OVER ' 0BRANCH = OR                                     
        OVER ' <LOOP> = OR                                      
        OVER ' </LOOP> = OR                                     
        SWAP ' <+LOOP> = OR                                     
     IF 2+ DUP @ SPACE . 2+                                     
     ELSE DUP @ 2+ DUP ' <."> = SWAP ' <ABORT"> = OR            
       IF SPACE 2+ DUP COUNT TYPE DUP C@ 1+  +                  
       ELSE 2+ THEN                                             
     THEN                                                       
   THEN -2 GIN +! ;                                             
( HANDLE SPECIAL CASES )                                        

( ----------- Screen 48/218 ----------- :)
( DECOMPILER: <DECOM>  )                                        
: <DECOM>  ( PFA --- )                                          
   DUP CFA @ ' : CFA @ =                                        
  IF ( COLON DEF. )                                             
    BEGIN DUP @ DUP ' EXIT CFA =                                
      OVER ' <;CODE> CFA = OR 0=                                
    WHILE ( HIGH LEVEL & NOT END OF COLON DEF )                 
      2+ DUP GIN+ NFA ID. KEY DUP 81 =                          
     IF ( 'Q' ) SP! QUIT                                        
     ELSE 13 =  ( RETURN )                                      
       IF RECURSE ( GO DOWN ONE LEVEL )                         
       ELSE  DROP                                               
       THEN                                                     
     THEN  GCHK  REPEAT ( SHOW LAST WORD )                      
   2+ DIN NFA ID.                                               
  THEN DROP ;                                                   

( ----------- Screen 49/219 ----------- :)
( DECOMPILER: DECOMPILE )                                       
: DECOMPILE -FIND IF DROP 0 GIN !                               
  <DECOM> ELSE ." NOT FOUND" THEN ;                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 50/220 ----------- :)
( TRIG: SIN/COS VALUES TABLE )                                  
CREATE SINTABLE                                                 
 0000 , 0175 , 0349 , 0523 , 0698 , 0872 , 1045 , 1219 , 1392 , 
 1564 , 1736 , 1908 , 2079 , 2250 , 2419 , 2588 , 2756 , 2924 , 
 3090 , 3256 , 3420 , 3584 , 3746 , 3907 , 4067 , 4226 , 4384 , 
 4540 , 4695 , 4848 , 5000 , 5150 , 5299 , 5446 , 5592 , 5736 , 
 5878 , 6018 , 6157 , 6293 , 6428 , 6561 , 6691 , 6820 , 6947 , 
 7071 , 7193 , 7314 , 7431 , 7547 , 7660 , 7771 , 7880 , 7986 , 
 8090 , 8192 , 8290 , 8387 , 8480 , 8572 , 8660 , 8746 , 8829 , 
                                                                
 8910 , 8988 , 9063 , 9135 , 9205 , 9272 , 9336 , 9397 , 9455 , 
 9511 , 9563 , 9613 , 9659 , 9703 , 9744 , 9781 , 9816 , 9848 , 
 9877 , 9903 , 9925 , 9945 , 9962 , 9976 , 9986 , 9994 , 9998 , 
10000 ,                                                         
                                                                
                                                                

( ----------- Screen 51/221 ----------- :)
( TRIG: QSIN QCOS SIN COS )                                     
CODE <SIN> BOT ASL, BOT LDY, SINTABLE ,Y LDA,                   
 BOT STA, SINTABLE 1+ ,Y LDA, BOT 1+ STA,                       
 NEXT JMP, END-CODE                                             
: S180 DUP 90 >  IF 180 SWAP - THEN                             
   <SIN> ;                                                      
: QSIN  DUP 180 > IF ( 181-359 DEG)                             
   180 - S180 NEGATE ELSE S180 THEN ;                           
: SIN ( DEGREES --- SINE*10000 )                                
   DUP ABS 359 >                                                
    IF 360 MOD THEN ( DOESN'T CHANGE SIN VALUE )                
   DUP 0< IF 360 + THEN ( HANDLE NEGATIVE ARGUMENT )            
   QSIN ;                                                       
: QCOS  DUP 270 > IF 270 - ELSE 90 + THEN QSIN ;                
: COS ( DEGREES --- COSINE*10000 )                              
   90 + SIN ;                                                   

( ----------- Screen 52/222 ----------- :)
( MATH: SQUARE ROOT  ROUTINES )                                 
CODE D2* SEC ASL, SEC 1+ ROL,                                   
  BOT ROL, BOT 1+ ROL, NEXT JMP, END-CODE                       
: EASY-BITS ( DREM1 PARTIALROOT1 COUNT --- DREM2 PARTIALROOT2 ) 
   0 DO                                                         
    >R D2* D2*             ( SHIFT DREM TWICE )                 
    R@ - DUP               ( SUBR. PARTIAL ROOT )               
    0< IF R@ +   R> 2* 1-  ( RESTORE DREM & SET 0 )             
      ELSE  R> 2* 3 +        ( OR SET 1 )                       
      THEN ( PROOT SHIFTED FOR NEXT GO-ROUND ) LOOP ;           
: 2'S-BIT  ( DREM2 PROOT2 --- DREM3 PROOT3 ; GET PENULT. BIT )  
   >R D2*  DUP 0< IF    D2* R@ -    R> 1+                       
                  ELSE  D2* R@ DDUP                             
                        U< IF DROP R> 1-    ( SET 0 )           
                           ELSE - R>  1+    ( SET 1 )           
                  THEN THEN ;                                   

( ----------- Screen 53/223 ----------- :)
( MATH: SQUARE ROOT ROUTINES )                                  
: 1'S-BIT  ( DREM3 PROOT3 --- FULLROOT ; REMAINDER LOST )       
   >R DUP 0< IF  DDROP R> 1+                                    
             ELSE D2* 32768 R@ DU< 0= R> + THEN ;               
                                                                
: SQRT ( UD1 --- U2 ; 32-BIT UNSIGNED RADICAND--> 16-BIT ROOT)  
   0 1 8 EASY-BITS  ROT DROP 6 EASY-BITS                        
   2'S-BIT  1'S-BIT ;                                           
EXIT                                                            
                                                                
( THIS WAS WRITTEN BY KLAXON SURALIS AND PUBLISHED IN           
  FORTH DIMENSIONS VOL. IV NO. 1 )                              
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 54/224 ----------- :)
( F.P. MATH: FPSW FRESET FER FZE FNE FOV )                      
CREATE FPSW 0 C,        ( FLOATING POINT STATUS WORD )          
CREATE FBASE 10 C,      ( BASE )                                
: FRESET ( --- )        ( CLEAR CONDITION CODES )               
   0 FPSW C! ;                                                  
                                                                
: FER ( --- N )         ( RETURNS SUM OF CONDITION CODES )      
   FPSW C@ ;                                                    
: FZE ( --- N )         ( TRUE IF LAST F# WAS ZERO )            
   FER 1 AND 0= NOT ;                                           
: FNE ( --- N )         ( TRUE IF LAST F# WAS < ZERO )          
   FER 2 AND 0= NOT ;                                           
: FOV ( --- N )         ( TRUE IF LAST OPERATION OVERFLOWED )   
   FER 4 AND 0= NOT ;                                           
                                                                
                                                                

( ----------- Screen 55/225 ----------- :)
( F.P. MATH: SFZ SFN E@ )                                       
( CC'S 8, 16, 32, 64 AND 128 ARE AVAILABLE FOR USE )            
HEX                                                             
: SFZ  ( F# --- F# ; Z )   ( SETS Z ACCORDING TO F# )           
   FER FFFE AND FPSW C!    ( RESET Z )                          
   DDUP 00FF AND D0= FER OR FPSW C! ;                           
: SFN  ( F# --- F# ; N )   ( SETS N ACCORDING TO F# )           
   FER FFFD AND FPSW C!    ( RESET N )                          
   DUP 0080 AND 40 / FER OR FPSW C! ;                           
: E@    ( F# --- M E ; Z N )  ( REMOVE EXPONENT )               
                                                                
   FRESET  SFZ  SFN        ( SET FLAGS )                        
   DUP  FF00 AND 100 /  >R  ( OBTAIN EXPONENT )                 
   FNE IF FF00 OR          ( SIGN EXTEND MANTISSA )             
       ELSE 00FF AND THEN   R> ;                                
DECIMAL                                                         

( ----------- Screen 56/226 ----------- :)
( F.P. MATH: E! E. )                                            
HEX                                                             
                                                                
: E! ( M E --- F# ; V Z N )  (  RESTORE EXPONENT )              
   DUP 100 *  DUP 100 / ROT = NOT                               
    IF 4 FPSW C! THEN        ( EXPONENT OVERFLOW )              
   SWAP DUP FF00 AND DUP                                        
    IF DUP FF00 = NOT                                           
     IF 4 FPSW C! THEN       ( MANTISSA OVERFLOW )              
    THEN                                                        
   DROP 00FF AND  OR  SFZ SFN ;                                 
                                                                
: E.   ( F# --- ; Z N )                                         
   E@  <ROT D. ." . E" . ;                                      
                                                                
DECIMAL                                                         

( ----------- Screen 57/227 ----------- :)
( F.P. MATH: F. F* F/ )                                         
: F.  ( F# --- ; Z N )                                          
   E@ >R   SWAP OVER DABS                                       
   <#  R@   0<                                                  
    IF I ABS 0 DO  #  LOOP  46 HOLD                             
    ELSE 46 HOLD  R@                                            
      IF  R@ 0 DO 48 HOLD LOOP THEN                             
    THEN  R> DROP  #S ROT SIGN #> TYPE SPACE ;                  
                                                                
: F*  ( F#1 F#2 --- F# ; N Z V )  ( MULTIPLY )                  
   DSWAP E@ >R   DSWAP E@  >R                                   
   DROP 1 M*/ R>  R> +  E! ;                                    
                                                                
: F/  ( F#1 F#2 --- F# ; N Z V )  ( DIVIDE )                    
   DSWAP E@ >R   DSWAP E@ >R                                    
   DROP 1 SWAP M*/ R> R> SWAP - E! ;                            

( ----------- Screen 58/228 ----------- :)
( F.P. MATH: ALIGN F+ F- )                                      
: ALIGN ( M1 E1  M2 E2 --- M1 M2 E )                            
   4 ROLL                                                       
   BEGIN   DDUP = NOT                                           
   WHILE  DDUP >  ( E2 > E1? )                                  
    IF >R >R FBASE C@ 1 M*/ R> 1- R>                            
    ELSE >R >R DSWAP FBASE C@ 1 M*/ DSWAP R> R> 1- THEN         
   REPEAT DROP ;                                                
                                                                
: F+  ( F#1 F#2 --- FSUM ; N V Z )                              
   E@  >R  DSWAP R> <ROT E@                                     
   ALIGN  >R  D+  R>  E! ;                                      
                                                                
: F-  ( F#1 F#2 --- FDIFF ; N V Z )                             
   DSWAP E@  >R  DSWAP R> <ROT E@                               
   ALIGN >R  D-  R>  E! ;                                       

( ----------- Screen 59/229 ----------- :)
( F.P. MATH: RSCALE LSCALE DFIX )                               
: RSCALE  ( F# --- F# ; N Z V )                                 
   E@  1- <ROT   FBASE C@ 1 M*/ ROT   E! ;                      
                                                                
: LSCALE  ( F# --- F# ; N Z V )                                 
   E@  1+ <ROT   1 FBASE C@ M*/ ROT   E! ;                      
                                                                
: DFIX  ( F# --- D ; V Z N )                                    
   E@                                                           
    BEGIN ?DUP                                                  
    WHILE  DUP 0>                                               
     IF 1- <ROT FBASE C@ 1 M*/                                  
     ELSE 1+ <ROT  1 FBASE C@ M*/ DDUP D0=                      
      IF 5 FPSW C! ROT DROP 0 <ROT THEN ( UNDERFLOW )           
     THEN ROT                                                   
    REPEAT ;                                                    

( ----------- Screen 60/230 ----------- :)
( F.P. MATH: FIX DFLOAT FLOAT FSIN FCOS FSQRT FINIT FEXIT )     
: FIX  ( F# --- N )  DFIX DROP ;                                
: DFLOAT ( D --- F# ) 0 E! ;                                    
: FLOAT  ( N --- F# ) S->D DFLOAT ;                             
: FSIN  ( FDEG --- FSINE )                                      
   FIX SIN S->D -4 E! ;                                         
: FCOS  ( FDEG --- FCOSINE )                                    
   FIX COS S->D -4 E! ;                                         
: FSQRT ( F# --- FSQRT )                                        
   FIX 10000 U* SQRT S->D -2 E! ;                               
: <FNUM> ( ADDR --- D )                                         
   <NUMBER> DPL @ NEGATE E! ;                                   
: FINIT  ( --- )                                                
   FRESET BASE @ FBASE C!                                       
   ' <FNUM> CFA 'NUMBER ! ;                                     
: FEXIT  ( --- )  ' <NUMBER> CFA 'NUMBER ! ;                    

( ----------- Screen 61/231 ----------- :)
( F.P. MATH: FABS FNEGATE FMIN F> FMAX )                        
: FABS  ( F# --- ABS[F#] : N Z V )                              
   E@   <ROT DABS ROT E! ;                                      
: FNEGATE  ( F# --- -F# : N Z V )                               
   E@  <ROT  DNEGATE  ROT  E! ;                                 
: FMIN   ( F#1 F#2 --- MIN[F#S] ; N Z V )                       
   DSWAP  E@  >R   DSWAP R> <ROT E@                             
   ALIGN >R DMIN R> E! ;                                        
: F>  ( F#1 F#2 --- B ; N Z V )                                 
   F- DDROP FNE ;                                               
: FMAX ( F#1 F#2 --- MAX[F#S] ; N Z V )                         
   DOVER DOVER FMIN F- F+ ;                                     
                                                                
( THESE ROUTINES WERE ADAPTED FROM THE ARTICLE BY MICHAEL JESCH 
  PUBLISHED IN FORTH DIMENSIONS, VOL. IV NO. 1 )                
                                                                

( ----------- Screen 62/232 ----------- :)
( C64 DATA: COLORS SPRITE-DEFS )                                
0 CONSTANT B%      1 CONSTANT W%        2 CONSTANT R%           
3 CONSTANT C%      4 CONSTANT P%        5 CONSTANT G%           
6 CONSTANT BL%     7 CONSTANT Y%        8 CONSTANT O%           
9 CONSTANT BR%    10 CONSTANT LR%      11 CONSTANT DG%          
12 CONSTANT MG%      13 CONSTANT LG%                            
14 CONSTANT LB%      15 CONSTANT GL%                            
                                                                
CODE S1 SPRITE STY, NEXT JMP, END-CODE                          
CODE S2 INY, ' S1 JMP, END-CODE                                 
CODE S3 2 # LDY, ' S1 JMP, END-CODE                             
CODE S4 3 # LDY, ' S1 JMP, END-CODE                             
CODE S5 4 # LDY, ' S1 JMP, END-CODE                             
CODE S6 5 # LDY, ' S1 JMP, END-CODE                             
CODE S7 6 # LDY, ' S1 JMP, END-CODE                             
CODE S8 7 # LDY, ' S1 JMP, END-CODE                             

( ----------- Screen 63/233 ----------- :)
( C64 DATA: SOUND )                                             
( CTRL REG CONSTANTS )    HEX                                   
11 CONSTANT T#                                                  
21 CONSTANT S#                                                  
41 CONSTANT P#                                                  
81 CONSTANT N#                                                  
( 15 CONSTANT RING                                              
   8 CONSTANT RESET                                             
 3 CONSTANT SYNC  )                                             
    DECIMAL                                                     
( FILTER CONSTANTS )                                            
 1 CONSTANT F1 ( 2 CONSTANT FILT2                               
 4 CONSTANT FILT3  8 CONSTANT FILTEX)                           
 1 CONSTANT LP 2 CONSTANT BP                                    
 4 CONSTANT HP                                                  
( LOWPASS HIGHPASS OR CONSTANT NOTCH)                           

( ----------- Screen 64/234 ----------- :)
( C64 DATA: SOUND MISC I/O )                                    
CREATE N-V 34334 , 36376 , 38539 , 40830 , 43258 ,              
45830 , 48556 , 51443 , 54502 , 57743 , 61176 , 64814 ,         
: NOTE@ ( # --- FREQ ) 2* N-V + @ ;                             
                                                                
8 CONSTANT 3OFF                                                 
   HEX                                                          
CODE V1 VOICE STY, NEXT JMP, END-CODE                           
CODE V2 INY, ' V1 JMP, END-CODE                                 
CODE V3 2 # LDY, ' V1 JMP, END-CODE                             
                                                                
0 CONSTANT OFF     1 CONSTANT ON                                
(          DC01 CONSTANT JOY1                                   
DC00 CONSTANT JOY2  )                                           
( DD01 CONSTANT UPORT )                                         
D800 CONSTANT COLOR-MEM     DECIMAL                             

( ----------- Screen 65/235 ----------- :)
( DATA STRUCTURES: S-DEF )                                      
( COMPILE: ALLOCATES ROOM & READS SPRITE DATA FROM INPUT STREAM)
( EXEC: MOVES SPRITE DATA TO ADDR ON STACK )                    
: S-DEF                                                         
   CREATE   ( [63 BYTE VALUES IN INPUT STREAM] ; --- )          
    63 0 DO                                                     
     BL TEXT PAD NUMBER DROP C,                                 
    LOOP                                                        
   DOES>    ( ADDR --- )                                        
    SWAP 63 CMOVE ;                                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 66/236 ----------- :)
( DATA STRUCTURES: 1ARRAY 2ARRAY ) EXIT <<<                     
( CREATES & GETS ELEMENT FROM 16-BIT 1 DIMENSIONAL ARRAY )      
: 1ARRAY                                                        
   CREATE    ( #ELEM --- )                                      
    2* ALLOT                                                    
   DOES>     ( ELEMENT --- ADDR )                               
    SWAP 2* + ;                                                 
                                                                
( CREATES & GETS ELEMENT FROM 16-BIT 2 DIMENSIONAL ARRAY )      
: 2ARRAY                                                        
   CREATE    ( #Y-ELEM #X-ELEM --- )                            
    DUP , * 2* ALLOT                                            
   DOES>     ( Y-ELEM X-ELEM --- ADDR )                         
    >R R@ @ ROT * + ( GET X-MAX * Y + X )                       
    2* R> + 2+      ( MAKE 2 BYTE & ADD ARRAY BASE )            
 ;                                                              

( ----------- Screen 67/237 ----------- :)
( GRAPHICS: M-X M-Y S.DIST L.DIST B-MFLAG BORDER BKGND )        
 EXIT <<<<<                                                     
( MIRROR CENTER COORDINATES )                                   
0 CONSTANT M-X                                                  
0 CONSTANT M-Y                                                  
                                                                
( MIRROR FLAG )                                                 
VARIABLE B-MFLAG  0 B-MFLAG !                                   
                                                                
( LINE VARIABLES )                                              
VARIABLE S.DIST    VARIABLE L.DIST                              
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 68/238 ----------- :)
( GRAPHICS: BD BK M-ORIGIN )                                    
( CHANGE BORDER COLOR )                                         
: BD ( C --- ) 53280 C! ;                                       
                                                                
( CHANGE A BACKGROUND REGISTER )                                
: BK ( C --- )                                                  
   53281 C!                                                     
     ;                                                          
 EXIT <<<<<<                                                    
CODE M-ORIGIN  ( X Y --- )                                      
 SEC LDA,  ' M-X STA,                                           
 SEC 1- LDA, ' M-X 1+ STA,                                      
 BOT LDA,  ' M-Y STA,                                           
 POPTWO JMP,                                                    
END-CODE                                                        
                                                                

( ----------- Screen 69/239 ----------- :)
( GRAPHICS: R-PLOT )  EXIT <<<<                                 
( PLOT A POINT X,Y RELATIVE TO M-X,M-Y )                        
CODE R-PLOT ( X Y --- )                                         
 CLC,                                                           
 ' M-X LDA,  SEC ADC,  SEC STA,                                 
 ' M-X 1+ LDA,  SEC 1+ ADC,  SEC 1+ STA,                        
 CLC,                                                           
 ' M-Y LDA,  BOT ADC,  BOT STA,                                 
 ' M-Y 1+ LDA,  BOT 1+ ADC,  BOT 1+ STA,                        
 ' B-PLOT JMP,                                                  
END-CODE                                                        
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 70/240 ----------- :)
( GRAPHICS: M-PLOT )  EXIT <<<<                                 
( M-PLOT 4 POINTS AROUND M-X,M-Y )                              
: M-PLOT  ( X Y --- )                                           
   B-MFLAG @ IF                                                 
    DDUP NEGATE R-PLOT (  X -Y )                                
    OVER NEGATE OVER DDUP R-PLOT ( -X Y )                       
    NEGATE R-PLOT ( -X -Y )                                     
    R-PLOT ( X Y )                                              
   ELSE                                                         
    R-PLOT                                                      
   THEN ;                                                       
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 71/241 ----------- :)
( GRAPHICS: B-LINE )   EXIT <<<                                 
: B-LINE  ( X Y --- )                                           
   B-Y - ( DY )  1 OVER +- ( SIGN OF DY )                       
   >R  ABS SWAP                                                 
   B-X - ( DX )  1 OVER +- ( SIGN OF DX )  >R ABS               
   DDUP MIN S.DIST !  DDUP MAX L.DIST !  > ( DY > DX? )         
   R> R> DDUP 5 ROLL                                            
   IF   SWAP DROP 0 SWAP B-Y                                    
   ELSE DROP 0 B-X THEN                                         
   L.DIST @ MOD L.DIST @ -                                      
   L.DIST @ 0 DO                                                
     S.DIST @  + >R R@                                          
     0< IF DDUP R>                                              
     ELSE DOVER R> L.DIST @ - THEN                              
     ROT B-X + ROT B-Y + B-PLOT                                 
   LOOP DDROP DDROP DROP ;                                      

( ----------- Screen 72/242 ----------- :)
( GRAPHICS: ARC ELLIPSE CIRCLE ) EXIT <<<<                      
: ARC ( HR VR STRT END --- )                                    
   >R >R DDUP MAX 360 SWAP /                                    
   R> 2* 2* R> 1+ 2* 2* SWAP ROT >R                             
   DO                                                           
    OVER I 2 RSHIFT QCOS 10005 */                               
    OVER I 2 RSHIFT QSIN 10005 */                               
    M-PLOT                                                      
   J +LOOP                                                      
  R> DDROP DROP ;                                               
                                                                
: ELLIPSE ( X Y HR VR --- )                                     
   DSWAP  M-ORIGIN   ON B-MFLAG ! 0 90 ARC                      
   OFF B-MFLAG ! ;                                              
                                                                
: CIRCLE ( X Y R --- ) DUP 3 4 */ ELLIPSE ;                     

( ----------- Screen 73/243 ----------- :)
( I/O EXTENSIONS: CMD CMDI INPUT INPUT# PRINT# $INPUT PRT )     
: CMD   ( LFN --- ) OUTLFN ! ;                                  
: CMDI  ( LFN --- ) INPLFN ! ;                                  
                                                                
( : INPUT ( --- N )                                             
(  QUERY 1 WORD NUMBER DROP ;                                   
( : INPUT# ( LFN --- N )                                        
(  CMDI INPUT ;   )                                             
( : PRINT#   ( N LFN --- )                                      
(  CMD .  ;   )                                                 
(  : $INPUT  ( --- ADDR )                                       
(  QUERY 1 TEXT PAD ;  )                                        
                                                                
: PRT ( FLAG --- )                                              
   IF 127 4 0 " @" OPEN   127 CMD                               
   ELSE 127 CLOSE   0 CMD THEN ;                                

( ----------- Screen 74/244 ----------- :)
( I/O EXTENSIONS: GET# PUT# RS232 FRE RDTIM )                   
( : GET#  ( LFN --- N ) ( CMDI ?TERMINAL ; )                    
( : PUT#  ( N LFN --- ) ( CMD EMIT ; )                          
( : RS232  ( LFN ADDR --- )                                     
(  2 0 ROT OPEN ;  )                                            
                                                                
: FRE  ( --- N )                                                
   FIRST HERE - U. ;                                            
EXIT <<<<                                                       
CODE RDTIM  ( --- D )                                           
 DEX, DEX, SEI,                                                 
 162 LDA,  BOT STA,                                             
 161 LDA,  BOT 1+ STA,                                          
 160 LDA,  PHA,  TYA,                                           
 CLI,  PUSH JMP,                                                
END-CODE                                                        

( ----------- Screen 75/245 ----------- :)
( I/O EXTENSIONS: SETTIM WAIT )                                 
( SET THE 60 CYCLE CLOCK VALUE )                                
( CODE SETTIM ( D --- )                                         
( SEI,  BOT LDA,   160 STA,                                     
 SEC 1+ LDA, 161 STA,                                           
 SEC LDA,   162 STA,                                            
 CLI,  POPTWO JMP, )                                            
(  END-CODE  )                                                  
 EXIT <<<<                                                      
( WAIT N TICKS [1/60 SECONDS] )                                 
: WAIT  ( N --- )                                               
   S->D RDTIM D+                                                
   BEGIN                                                        
    DDUP RDTIM                                                  
    D> NOT                                                      
   UNTIL DDROP ;                                                

( ----------- Screen 76/246 ----------- :)
( UTILITIES: CASE OF ;; ENDCASE )                               
( EXECUTE CODE BASED ON STACK VALUE )                           
: CASE ?COMP CSP @ SP@ CSP ! 4 ;                                
IMMEDIATE                                                       
                                                                
: OF                                                            
   4 ?PAIRS COMPILE OVER COMPILE                                
   = COMPILE 0BRANCH HERE 0 ,                                   
   COMPILE DROP 5 ; IMMEDIATE                                   
                                                                
: ;;                                                            
   5 ?PAIRS  COMPILE BRANCH  HERE 0 ,                           
   SWAP 2 [COMPILE] THEN 4 ; IMMEDIATE                          
: ENDCASE 4 ?PAIRS COMPILE DROP                                 
   BEGIN SP@ CSP @ = 0=                                         
   WHILE 2 [COMPILE] THEN REPEAT CSP ! ; IMMEDIATE              

( ----------- Screen 77/247 ----------- :)
( UTILITIES: DIR )  EXIT <<<                                    
: DIR ( --- )                                                   
   PAD " $" LOADRAM   CR  PAD 2+                                
( MAIN LOOP - PRINT ENTRY )                                     
 BEGIN                                                          
  DUP @ . 2+  ( PRINT #PAGES )                                  
  BEGIN       ( PRINT TEXT )                                    
   DUP C@ ?DUP                                                  
    WHILE EMIT 1+                                               
  REPEAT   1+ CR                                                
( CHECK FOR USER INTERVENTION )                                 
  PAUSE ?TERMINAL IF QUIT THEN                                  
( MORE TO DO? )                                                 
  DUP 2+ SWAP @                                                 
  NOT UNTIL  DROP ;                                             
                                                                

( ----------- Screen 78/248 ----------- :)
( UTILITIES: PATCH )                                            
: PATCH  ( PATCH-ADDR --- NEXT-PATCH-ADDR )                     
   CR QUERY             ( GET PATCH INPUT LINE )                
   BEGIN                                                        
    DUP BL WORD         ( GET AN ENTRY )                        
    DUP COUNT SWAP DROP ( ENTRY NOT NULL? )                     
     WHILE NUMBER DROP  ( CONVERT TO 16 BIT NUMBER )            
      SWAP C! 1+        ( PUT AT PATCH ADDR & UPDATE ADDR )     
   REPEAT  DDROP ;                                              
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 79/249 ----------- :)
( UTILITIES: H@ HC@ H! HC! )                                    
( HI-RAM ACCESS ROUTINES )                                      
: H@  ( --- N )                                                 
   SWAPOUT @ SWAPIN ;                                           
                                                                
: HC@ ( --- N )                                                 
   SWAPOUT C@ SWAPIN ;                                          
                                                                
: H!  ( N --- )                                                 
   SWAPOUT ! SWAPIN ;                                           
                                                                
: HC! ( N --- )                                                 
   SWAPOUT C! SWAPIN ;                                          
                                                                
                                                                
                                                                

( ----------- Screen 80/250 ----------- :)
( MUSIC EDIT: WV P.N V-D S.I )                                  
VARIABLE WV                                                     
: P.N ( NOTE# --- )                                             
   12 /MOD    ( DETERMINE OCTAVE & NOTE )                       
   7 XOR     ( GET VALUE TO DIVIDE BY )                         
   SWAP NOTE@ ( GET NOTE VALUE )                                
   SWAP RSHIFT ( DIVIDE FOR OCTAVE)                             
   V-F     ( SET FREQUENCY )                                    
   OFF V-CTRL ( CLEAR PREVIOUS NOTE )                           
   WV @ V-CTRL ; ( PLAY NEW NOTE )                              
                                                                
: V-D  ( --- )                                                  
   8 V-CTRL  9 12 V-AD  S# WV ! ;                               
: S.I ( --- )                                                   
   SID @ 25 0 FILL  ( CLEAR SID )                               
   V3 V-D  V2 V-D  V1 V-D 0 15 MV ;                             

( ----------- Screen 81/251 ----------- :)
( MUSIC EDIT: T@ T! )                                           
0 CONSTANT T@                                                   
                                                                
CODE T!                                                         
 BOT LDA, ' T@ STA, POP JMP,                                    
END-CODE                                                        
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 82/252 ----------- :)
( MUSIC EDIT: O@ O! OX )                                        
( RETURN OCTAVE VALUE )                                         
0 CONSTANT O@                                                   
                                                                
CODE O!                                                         
 BOT LDA, ' O@ STA, POP JMP,                                    
END-CODE                                                        
                                                                
: O0 0 O! ;  : O1 12 O! ;                                       
: O2 24 O! ;  : O3 36 O! ;                                      
: O4 48 O! ;  : O5 60 O! ;                                      
: O6 72 O! ;  : O7 84 O! ;                                      
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 83/253 ----------- :)
( MUSIC EDIT: TEMPO DURATION TIMINGS )                          
VARIABLE TEMPO   VARIABLE DURATION                              
( DURATIONS BASED ON 64TH NOTE RESOLUTION - 4/4 TIME ASSUMED )  
: WHOLE 192 DURATION ! ;                                        
: .1/2 144 DURATION ! ;                                         
: 1/2 96 DURATION ! ;                                           
: .1/4 72 DURATION ! ;                                          
: 1/4 48 DURATION ! ;                                           
: .1/8 36 DURATION ! ;                                          
: 1/8 24 DURATION ! ;                                           
: .1/16 18 DURATION ! ;                                         
: 1/16 12 DURATION ! ;                                          
: 1/32 6 DURATION ! ;                                           
: 1/64 3 DURATION ! ;                                           
: TRIPLET DURATION @ 2* 3 / DURATION ! ;                        
60 TEMPO ! 1/4                                                  

( ----------- Screen 84/254 ----------- :)
         (2064)    LA LJ       x          ,A BuI   ( q   @ o G  
   5         M U1:09 0 35 13 \I0 \B-P 09 0 \ #                  
    `    L      h                i       L   V2.0.0:MARCH 11, 19
84                                                              
                                                                
NDEF NEXT.NOTE                                                  
                                                                
: READY ( --- FLAG )                                            
   NEXT.NOTE D@  RDTIM D< ;                                     
                                                                
( CALCULATE TICKS TILL NEXT NOTE )                              
: NCALC DURATION @ 75 TEMPO @ */ 0                              
   NEXT.NOTE D@ D+ NEXT.NOTE D! ;                               
                                                                
: SONG.INIT  RDTIM DDUP DDUP                                    
   V3 NEXT.NOTE D! V2 NEXT.NOTE D! V1 NEXT.NOTE D! ;            

( ----------- Screen 85/255 ----------- :)
( MUSIC EDIT: PLAY.WAIT )                                       
                                                                
: PLAY.WAIT  ( VALUE --- )                                      
   BEGIN READY UNTIL                                            
   O@ +        ( GET OCTAVE )                                   
   T@ +        ( ADD TRANSPOSE )                                
   PLAY.NOTE                                                    
   NCALC ;                                                      
                                                                
EXIT                                                            
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 86/256 ----------- :)
( MUSIC EDIT: NOTE DEFS )                                       
: C  0 PLAY.WAIT ;                                              
: C# 1 PLAY.WAIT ;  : D\  C#  ;                                 
: D  2 PLAY.WAIT ;                                              
: D# 3 PLAY.WAIT ;  : E\  D#  ;                                 
: E  4 PLAY.WAIT ;                                              
: F  5 PLAY.WAIT ;                                              
: F# 6 PLAY.WAIT ;  : G\  F#  ;                                 
: G  7 PLAY.WAIT ;                                              
: G# 8 PLAY.WAIT ;  : A\  G#  ;                                 
: A  9 PLAY.WAIT ;                                              
: A# 10 PLAY.WAIT ; : B\  A#  ;                                 
: B  11 PLAY.WAIT ;                                             
: R BEGIN READY UNTIL OFF V-CTRL NCALC ;                        
: TIE NCALC ;                                                   
FORTH DEFINITIONS                                               

( ----------- Screen 87/257 ----------- :)
( S-EDITOR: S-EDITOR )                                          
: S-EDITOR ( --- )                                              
   CREATE 63 ALLOT PAGE                                         
    ( DRAW SPRITE EASEL )                                       
     21 0 DO SPACE SPACE                                        
      24 0 DO 209 EMIT LOOP CR                                  
     LOOP                                                       
     26 0 DO 184 EMIT LOOP                                      
    ( CLEAR SPRITE AREA #13 )                                   
     832 63 0 FILL                                              
    ( ACTIVATE S1 AT AREA #13 )                                 
     S1  ON S-ENABLE  13 S-POINTER BLUE S-COLOR                 
     270 130 S-POSITION ON S-XEXP ON S-YEXP                     
    CHARIN DROP ( SIGNAL END OF INPUT )                         
    0 22 D-POSITION                                             
      -->                                                       

( ----------- Screen 88/258 ----------- :)
( S-EDITOR:  )                                                  
   832  ( SPRITE AREA # 13 )                                    
   21 0 DO  ( ROWS )                                            
    24 0 DO I J  ( ADDR COL ROW )                               
     40 * 2+ + 'SCREEN +                                        
     8 0 DO  ( BIT# )                                           
      DUP C@  81 = NOT                                          
      3 PICK I 7 XOR MASK FBIT                                  
     1+ LOOP                                                    
     DROP 1+                                                    
    8 +LOOP                                                     
   LOOP DROP                                                    
   832 LATEST PFA 63 CMOVE                                      
                                                                
   DOES> SWAP 63 CMOVE ;                                        
                                                                

( ----------- Screen 89/259 ----------- :)
( TRACE COLON WORDS )                                           
FORTH DEFINITIONS                                               
CREATE TFLAG 1 ,                                                
: TRACE TFLAG ! ;                                               
                                                                
: <TRACE>                                                       
   TFLAG @ IF                                                   
    CR R@ 2- NFA  ID. .S KEY DROP                               
   THEN ;                                                       
: : SP@ CSP ! CURRENT @ CONTEXT ! CREATE TFLAG @ IF             
  ' <TRACE> CFA DUP @ HERE 2- ! , THEN SMUDGE ]                 
  ;CODE                                                         
   IP 1+ LDA, PHA, IP LDA, PHA, CLC, W LDA, 2 # ADC,            
   IP STA, TYA, W 1+ ADC, IP 1+ STA,                            
   NEXT JMP,                                                    
  END-CODE                                                      

( ----------- Screen 90/260 ----------- :)
( CURVES: CONSTANTS DIRECTIONS )                                
                                                                
4 CONSTANT +90DEG                                               
+90DEG NEGATE CONSTANT -90DEG                                   
                                                                
( DIRECTIONS: TABLE OF 2 CELL RECORDS- XDIR*XLEN , YDIR*YLEN )  
(  EACH RECORD DESCRIBES A 90 DEG CHANGE IN DIR FROM LAST REC ) 
                                                                
CREATE DIRECTIONS                                               
   0 , -1 ,  (   0 DEG )                                        
   1 ,  0 ,  (  90 )                                            
   0 ,  1 ,  ( 180 )                                            
  -1 ,  0 ,  ( 270 )                                            
                                                                
                                                                
                                                                

( ----------- Screen 91/261 ----------- :)
( CURVES: DRAGON1 )  HEX                                        
S-DEF DRAGON1                                                   
01  01  00      00  81  80                                      
00  C1  C0      00  E1  C0                                      
00  F1  E0      00  F9  80                                      
00  FF  00      00  FF  FF                                      
00  7F  FE      00  3F  F8                                      
00  3F  E0      00  3F  80                                      
00  3C  00      00  78  00                                      
00  F0  00      01  E0  00                                      
06  60  00      1C  70  00                                      
38  38  00      70  1C  00                                      
A8  2A  00                                                      
DECIMAL                                                         
                                                                
                                                                

( ----------- Screen 92/262 ----------- :)
( CURVES: DRAGON2 )    HEX                                      
S-DEF DRAGON2                                                   
00  01  00    00  01  80                                        
00  01  C0    00  01  C0                                        
00  01  E0    00  01  80                                        
03  FF  80    07  FF  E0                                        
0F  FF  F0    0F  FF  F8                                        
0F  FF  FC    0E  7D  FE                                        
0C  F8  7E    09  F0  3E                                        
03  E0  1E    07  60  1E                                        
0E  60  00    1C  70  00                                        
38  70  00    54  70  00                                        
00  A8  00                                                      
DECIMAL                                                         
                                                                
                                                                

( ----------- Screen 93/263 ----------- :)
( CURVES: VARIABLES  NOTE NEXT-POINTER MOVE-SPRITE )            
VARIABLE LENGTH                                                 
VARIABLE DIR-INDX                                               
                                                                
  lc AL             V     Gd   #    c    INIT.CHIPWIT      @ C g
 F   "  v !@ F @ FYFwBUo2  "   "  v  d$d2  A-@96&A @96 A-@96 A[@
962A!@96>A!@96PJ) yc  Vhjc         ,wB R Q "  wB R Q   STAT.POIN
T        TOO.BA [    d$d2 i    ENDGAM m   $d   d   #     d$d2 i 
   J A7                              A5                         
     A6                              A8                         
     CB                              CWED                     ; 
     CWWRK                           SE                         
   J A7                              A5                         
     A6                              A8                         
     CB                              CWED                     ; 
     CWWRK                           SE                         

( ----------- Screen 94/264 ----------- :)
 ( IBOL & OBJ   CHAR DEFS)              256 102 - CONSTANT ARG.S
T@              VARIABLE OP.CHAR ARG.ST@ 81 - OP.CHAR ! : OP.STU
FF ( BYTES../STARTCHAR---)        2 1 OP.CHAR @ DUP 2 +    OP.CH
AR !      C.STUFF ;                             : OP.B.STUFF ( B
YTES  )                   2 3 OP.CHAR @ DUP 6 + OP.CHAR !       
  C.STUFF ;                             : ARG.STUFF ( BYTES../AR
G#--)             2 2 ROT 4 * ARG.ST@ + C.STUFF ;               
                                ARG.ST@ 256 + 90 - OP.CHAR !    
        : OBJ.STUFF ( BYTES--)                    3 2 OP.CHAR @ 
DUP 6 + OP.CHAR !         C.STUFF ;                             
                                        : DYE ( COLOR----) COLOR
-MEM             256 ROT FILL ;                                 
                                : TEST ."  " 256 0 DO I 'SCREEN 
I + HC!   LOOP 10 10 D-POSITION ;                 BLACK DYE TEST
                                                                
                                                                

( ----------- Screen 95/265 ----------- :)
( CURVES: C-DRAW )                                              
: C-DRAW  ( LEVEL --- )                                         
   DUP 0=                                                       
   IF DRAW                                                      
   ELSE                                                         
     DUP 1- RECURSE                                             
     +90DEG MOVE-DIRECTION                                      
     DUP 1- RECURSE                                             
     -90DEG MOVE-DIRECTION                                      
   THEN DROP ;                                                  
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 96/266 ----------- :)
( CURVES: SPRITES-INIT  HI-RES-INIT ) HEX                       
( MOVE SPRITE-DATA TO 0 & 1 SPRITES IN BANK 2 )                 
: SPRITES-INIT  S1   ( SET SPRITE 1 AS ACTIVE SPRITE )          
   C000 DRAGON1   ( MOVE DATA TO SPRITE AREAS )                 
   C040 DRAGON2   ( 2 POSITIONS OF DRAGON FOR ANIMATION )       
   0 S-POINTER    ( SET POINTER TO SPRITE AREA 0 )              
   RED S-COLOR    ( SET SPRITE COLOR TO RED )                   
   ON S-ENABLE    ( TURN ON SPRITE )                            
   ON S-XEXP ;    ( EXPAND IN X DIRECTION )                     
                                                                
: HI-RES-INIT                                                   
   7 BITMAP  ON B-GRAPHICS  ( SET BITMAP AREA )                 
   0 B-FILL       ( CLEAR BITMAP AREA )                         
   YELLOW BLACK B-COLOR-FILL  ( SET BITMAP COLOR SCHEME )       
   B-DRAW  A0 90 B-PLOT ; ( SPECIFY PEN DOWN & PLOT START PT )  
DECIMAL                                                         

( ----------- Screen 97/267 ----------- :)
( CURVES: DIRECTIONS-INIT )                                     
: DIRECTIONS-INIT                                               
   LENGTH @                                                     
   DIRECTIONS DUP 16 + SWAP                                     
    DO I @ IF DUP 1 I @ +-   *  I ! THEN                        
    2 /LOOP DROP ;                                              
                                                                
: CSOUND-INIT                                                   
   SOUND.INIT             ( INIT SOUND SYSTEM )                 
   2048 V-PW              ( SQUARE WAVE )                       
   0 0 V-AD   15 0 V-SR   ( SET ENVELOPE )                      
                                                                
   PULSE V-CTRL           ( SET OSC 1 TO PULSE WAVEFORM )       
   0 15 MODEVOL ;                                               
                                                                
                                                                

( ----------- Screen 98/268 ----------- :)
( CURVES: CURVE-INIT  C-CURVE )                                 
                                                                
: CURVE-INIT  ( LEVELS LENGTH DIR --- )                         
   DIR-INDX !                                                   
   LENGTH !                                                     
   DIRECTIONS-INIT                                              
   HI-RES-INIT                                                  
   SPRITES-INIT                                                 
   CSOUND-INIT ;                                                
                                                                
: C-CURVE ( LEVELS LENGTH --- )                                 
   0 CURVE-INIT                                                 
   C-DRAW ;                                                     
                                                                
                                                                
                                                                

( ----------- Screen 99/269 ----------- :)
( CURVES: CALL-RDRAGON  LDRAGON )                               
                                                                
( ADDRESS OF RDRAGON GETS STUFFED INTO HERE ENABLING )          
(   LDRAGON TO CALL RDRAGON BY CALLING THIS WORD )              
: CALL-RDRAGON  0 ;                                             
                                                                
( MAKE A -90 DEGREE TURN )                                      
: LDRAGON  ( LEVEL --- )                                        
   DUP 0=                                                       
   IF DRAW                                                      
   ELSE                                                         
     DUP 1- RECURSE                                             
     -90DEG MOVE-DIRECTION                                      
     DUP 1- CALL-RDRAGON                                        
   THEN DROP ;                                                  
                                                                

( ----------- Screen 100/270 ----------- :)
( CURVES: RDRAGON )                                             
                                                                
( MAKE A +90 DEGREE TURN )                                      
: RDRAGON  ( LEVEL --- )                                        
   DUP 0=                                                       
   IF DRAW                                                      
     ELSE                                                       
       DUP 1- LDRAGON                                           
       +90DEG MOVE-DIRECTION                                    
       DUP 1- RECURSE                                           
     THEN DROP ;                                                
                                                                
( SET UP SO LDRAGON CAN CALL RDRAGON )                          
' RDRAGON CFA ' CALL-RDRAGON !                                  
                                                                
                                                                

( ----------- Screen 101/271 ----------- :)
( CURVES: D-CURVE WAIT-5-SEC DEMO )                             
: D-CURVE ( LEVELS LENGTH --- )                                 
   +90DEG 2* CURVE-INIT                                         
   LDRAGON ;                                                    
                                                                
: DEMO ( --- )                                                  
  24 D-SPLIT PAGE 3 24 D-POSITION                               
  ."  ***  RACTALS BY      -      64 *** "                      
   BEGIN                                                        
    7 1 DO                                                      
     I 2* I 7 XOR MASK D-CURVE                                  
     SOUND.INIT 120 WAIT LOOP                                   
    6 1 DO                                                      
     I 2* I 7 XOR 1- MASK C-CURVE                               
     SOUND.INIT 120 WAIT LOOP                                   
   AGAIN ;                                                      

( ----------- Screen 102/272 ----------- :)
( BACKUP: DUAL DRIVE BUFFER COPY )                              
( COPY BUFFERS FROM DR0 TO DR1 )                                
: COPYBUF ( FLAG END START --- )                                
   ( READ SOURCE SCREENS)                                       
   DO I . I I BPDRV + COPY LOOP                                 
   DUP IF 53248 1 0 20 17 3 RWTS THEN                           
   SAVE-BUFFERS CR                                              
   IF 53248 0 1 20 17 3 RWTS THEN ;                             
                                                                
 104 LOAD                                                       
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 103/273 ----------- :)
( BACKUP: COPYBUF )                                             
( SINGLE DRIVE BUFFER COPY )                                    
: COPYBUF ( FLAG END START --- )                                
   CR ." INSERT SOURCE-HIT KEY " KEY DROP                       
   ( READ SOURCE SCREENS)                                       
    DO I . I BLOCK UPDATE DROP LOOP                             
   DUP IF 53248 1 0 20 17 3 RWTS DROP THEN                      
   CR ." INSERT DEST-HIT KEY " KEY DROP  SAVE-BUFFERS CR        
   IF 53248 0 0 20 17 3 RWTS DROP THEN ;                        
  -->                                                           
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 104/274 ----------- :)
( BACKUP: PCOPY BACKUP SOURCE-BACKUP )                          
( PERFORM A PARTIAL BACKUP COPY )                               
: PCOPY  ( FLAG START END --- )                                 
   EMPTY-BUFFERS 1+ DDUP SWAP -                                 
   #BUFF /MOD DROP OVER SWAP -                                  
   DUP 1- 4 ROLL ( E+1 E+1-R E-R S --- )                        
   DDUP > IF ( CHECK IF SCREENS <= #BUFF )                      
    DO 0 I #BUFF + I COPYBUF                                    
     #BUFF +LOOP ELSE DDROP THEN                                
   COPYBUF ;                                                    
                                                                
: BACKUP  ( --- )                                               
   1 0 169 PCOPY ;                                              
                                                                
: SOURCE-BACKUP  ( --- )                                        
   0 0 112 PCOPY ;                                              

( ----------- Screen 105/275 ----------- :)
( ASSEMBLER: CONSTANTS INDEX )                                  
  LATEST HERE 30000 DP !  ( SET UP FOR ASSEMBLER REMOVAL )      
VOCABULARY ASSEMBLER IMMEDIATE                                  
HEX ASSEMBLER DEFINITIONS                                       
( REGISTER ASSIGNMENTS SPECIFIC TO THIS IMPLEMENTATION )        
83 CONSTANT XSAVE   81 CONSTANT W                               
FB CONSTANT IP      87 CONSTANT N                               
                                                                
( NUCLEUS LOCATIONS SPECIFIC TO THIS IMPLEMENTATION)            
0884 CONSTANT POP    0882 CONSTANT POPTWO                       
088B CONSTANT PUT    0889 CONSTANT PUSH                         
0890 CONSTANT NEXT   0871 CONSTANT SETUPN                       
                                                                
VARIABLE INDEX -2  ALLOT                                        
0909 , 1505 , 0115 , 8011 , 8009 , 1D0D , 8019 , 8080 ,         
0080 , 1404 , 8014 , 8080 , 8080 , 1C0C , 801C , 2C80 , DECIMAL 

( ----------- Screen 106/276 ----------- :)
( ASSEMBLER: MODE ADDRESSING MODES BOT SEC RP> UPMODE )         
HEX                                                             
VARIABLE MODE 2 MODE !                                          
: .A 0 MODE ! ; : # 1 MODE ! ;  : MEM 2 MODE ! ;                
: ,X 3 MODE ! ; : ,Y 4 MODE ! ; : ,X) 5 MODE ! ;                
: ),Y 6 MODE ! ; : ) F MODE ! ;                                 
                                                                
: BOT ,X 0 ;     ( ADDRESS THE BOTTOM OF DATA STACK )           
: SEC ,X 2 ;     ( ADDRESS SECOND ITEM ON DATA STACK )          
: RP> ,X 101   ; ( ADDRESS BOTTOM OF RETURN STACK )             
                                                                
: UPMODE IF MODE @   8 AND 0= IF 8 MODE +! THEN THEN            
   1 MODE @ 0F AND ?DUP  IF 0 DO DUP + LOOP THEN                
   OVER 1+ @ AND 0= ;                                           
                                                                
DECIMAL                                                         

( ----------- Screen 107/277 ----------- :)
( ASSEMBLER: CPU )                                              
                                                                
HEX                                                             
: CPU CREATE C, DOES>  C@ C, MEM ;                              
    00 CPU BRK,    18 CPU CLC,    DE CPU CLD,    58 CPU CLI,    
    B8 CPU CLV,    CA CPU DEX,    88 CPU DEY,    E8 CPU INX,    
    C8 CPU INY,    EA CPU NOP,    48 CPU PHA,    08 CPU PHP,    
    68 CPU PLA,    28 CPU PLP,    40 CPU RTI,    60 CPU RTS,    
    38 CPU SEC,    F8 CPU SED,    78 CPU SEI,    AA CPU TAX,    
    A8 CPU TAY,    BA CPU TSX,    8A CPU TXA,    9A CPU TXS,    
    98 CPU TYA,                                                 
                                                                
DECIMAL                                                         
                                                                
                                                                
                                                                

( ----------- Screen 108/278 ----------- :)
( ASSEMBLER: M/CPU )                                            
HEX                                                             
: M/CPU CREATE C, , DOES>                                       
   DUP 1+ @ 80 AND IF 10 MODE +! THEN OVER                      
   FF00 AND UPMODE UPMODE IF MEM CR ( LATEST ID.)               
   ABORT" INCORRECT ADDRESSING" THEN C@ MODE C@                 
   INDEX + C@ + C, MODE C@ 7 AND IF MODE C@                     
   0F AND 7 < IF C, ELSE , THEN THEN MEM ;                      
1C6E 60 M/CPU ADC, 1C6E 20 M/CPU AND, 1C6E C0 M/CPU CMP,        
1C6E 40 M/CPU EOR, 1C6E A0 M/CPU LDA, 1C6E  0 M/CPU ORA,        
1C6E E0 M/CPU SBC, 1C6C 80 M/CPU STA, 0D0D  1 M/CPU ASL,        
0C0C C1 M/CPU DEC, 0C0C E1 M/CPU INC, 0D0D 41 M/CPU LSR,        
0D0D 21 M/CPU ROL, 0D0D 61 M/CPU ROR, 0414 81 M/CPU STX,        
0486 E0 M/CPU CPX, 0486 C0 M/CPU CPY, 1496 A2 M/CPU LDX,        
0C8E A0 M/CPU LDY, 048C 80 M/CPU STY, 0480 14 M/CPU JSR,        
8480 40 M/CPU JMP, 0484 20 M/CPU BIT, DECIMAL                   

( ----------- Screen 109/279 ----------- :)
( ASSEMBLER: BEGIN, UNTIL, IF, THEN, ELSE, NOT BRANCHES )       
: BEGIN, HERE 1 ;                                               
: UNTIL,  >R 1 ?PAIRS R> C, HERE 1+ - C, ;                      
: IF, C, HERE 0 C, 2 ;                                          
: THEN,  2 ?PAIRS HERE OVER C@                                  
   IF SWAP !  ELSE OVER 1+ - SWAP C! THEN ;                     
: ELSE, 2 ?PAIRS HERE 1+ 1 JMP,                                 
   SWAP HERE OVER 1+ - SWAP C! 2 ;                              
 HEX                                                            
: NOT  20 + ;   ( REVERSE ASSEMBLY TEST )                       
90 CONSTANT CS  ( ASSEMBLE TEST FOR CARRY SET )                 
D0 CONSTANT 0=  ( ASSEMBLER TEST FOR EQUAL ZERO )               
10 CONSTANT 0<  ( ASSEMBLE TEST FOR LESS THAN OR EQUAL ZERO )   
90 CONSTANT >=  ( ASSEMBLE TEST FOR GREATER OR EQUAL ZERO )     
( .= IS ONLY CORRECT AFTER SUB, OR CMP, )                       
50 CONSTANT VS  DECIMAL                                         

( ----------- Screen 110/280 ----------- :)
( ASSEMBLER:  AGAIN, WHILE, REPEAT )                            
                                                                
: AGAIN, 1 ?PAIRS JMP, ;                                        
                                                                
: WHILE, >R DUP 1 ?PAIRS R> IF, 2+ ;                            
                                                                
: REPEAT, >R >R 1 ?PAIRS JMP, R> R> 2 - THEN, ;                 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 111/281 ----------- :)
( ASSEMBLER: END-CODE ENTERCODE ;CODE CODE )                    
: END-CODE   CURRENT @ CONTEXT ! SP@ 2+ =                       
   IF SMUDGE                                                    
   ELSE ." CODE ERROR, STACK DEPTH CHANGE"                      
   THEN ;                                                       
FORTH DEFINITIONS                                               
: ENTERCODE [COMPILE] ASSEMBLER SP@ ;                           
: CODE CREATE SMUDGE HERE DUP 2- !                              
   ASSEMBLER MEM ENTERCODE ;   IMMEDIATE                        
: ;CODE ?CSP COMPILE <;CODE> [COMPILE]  [ ENTERCODE ; IMMEDIATE 
    EXIT                                                        
                                                                
                                                                
                                                                
( THIS 6510 FORTH ASSEMBLER WAS WRITTEN BY WILLIAM F. RAGSDALE )
( IT WAS PUBLISHED IN "FORTH DIMENSIONS", VOL. III # 5         )

( ----------- Screen 112/282 ----------- :)
( ASSEMBLER: A-REMOVE )                                         
  DP ! ( RESET DP TO PRE-ASSEMBLER AREA )                       
: A-REMOVE ( CAUSES REMOVAL OF ASSEMBLER FROM DICTIONARY )      
   LITERAL [ 0 LATEST PFA LFA ]                                 
   LITERAL ! ; DROP                                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 113/283 ----------- :)
( 4040 PATCH )                                                  
HERE     ( PRESERVE DICT. POINTER )                             
HEX ASSEMBLER  ( INVOKE ASSEMBLER )                             
3049 08C9 !  5C0D 08CB !                                        
08CD DP !                                                       
 30 # LDA,  0852 STA,                                           
 6 ,X LDA,   1 # CMP,                                           
  0= IF,                                                        
   31 # LDA,  0852 STA, 0 # LDA,                                
  THEN,                                                         
 CLC,  26E0 JMP,                                                
DP ! FORTH  ( RESTORE DICT PTR )                                
                                                                
 C9A2 27A9 !                                                    
 CD4C 26DD !  08 26DF C!                                        
DECIMAL                                                         

( ----------- Screen 114/284 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 115/285 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 116/286 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 117/287 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 118/288 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 119/289 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 120/290 ----------- :)
( SHOW)                                                         
                                                                
: SHOW ( BEGIN END---)                                          
  1+ SWAP DO                                                    
    I TRIAD                                                     
  2 +LOOP ;                                                     
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 121/291 ----------- :)
( 40 C/L IT)                                                    
                                                                
40 ' C/L !                                                      
                                                                
: IT ;                                                          
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 122/292 ----------- :)
( CHEAP FORGET)                                                 
                                                                
: FORGET                                                        
  [COMPILE] '                                                   
  DUP NFA SWAP LFA @                                            
  CURRENT @ !                                                   
  DP ! ;                                                        
                                                                
                                                                
 ( REMARK)                                                      
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 123/293 ----------- :)
( NEW SAVE)                                                     
 HEX                                                            
: SAVE ( START END ---)                                         
15 8 15 SETLFS                                                  
SAVENAME SETNAM                                                 
SWAP 14  !  ( SAVE START ADDR AT 4)                             
14 SWAP SPLIT  FFD8 SY  ;                                       
( START PT ENDLOT ENDHI SAVE ADDR)                              
                                                                
DECIMAL                                                         
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

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
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 161/331 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 162/332 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 163/333 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 164/334 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 165/335 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 166/336 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 167/337 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                

( ----------- Screen 168/338 ----------- :)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
