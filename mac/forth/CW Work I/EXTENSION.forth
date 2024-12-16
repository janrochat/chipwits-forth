════════════════════════════════════════════════════════════════   SCREEN 001
( System extensions)                              ( 102384 dws) 
  CR ." Loading Kernel Extensions..."                           
                                                                
 forth definitions                                              
 1 2 +THRU  ( VOCAB RESIZING )                                  
                                                                
  2048 MINIMUM.VOCAB   ( MAKE SPACE FOR EXTENSIONS )            
                                                                
 4 load   ( 5,6 words)     ( ADD IN  THE REMAINING EXTENSIONS)  
( 8 12 thru  )                                                  
 14 25 thru    decimal                                          
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( VOCAB MANAGEMENT )  HEX                          ( 061284 DRC)
                                                                
: COPY.VOCAB  ( BASE.ADDR\SIZE  -- RESIZES VOCAB )              
    SWAP >R    ( TSIZE )     4 I+@ -   ( DELTA SIZE )           
    4 I+@  I+ I@ I+ -   OVER           (  DSIZE\CSIZE\DSIZE)    
    I@ I+ +  I@ I+ SWAP                ( DSIZE\CSIZE\STRT\DST ) 
    2DUP >    IF   ROT CMOVE     ELSE    ROT CMOVE>    THEN     
   ( DSIZE)   DUP DUP I +!  ( ADJ PTR, SIZE, FENCE )            
       4 I+ +! R> 8+ +! ;                                       
                                                                
: RESIZE.VOCAB (  SIZE -- RESIZES VOCABULARY )                  
   8+ ( adjust up !! )                                          
   CONTEXT @   2DUP @   DUP 4+ @   SWAP @ - <                   
   ERROR"  Vocabulary won't fit"  OVER RESIZE.HANDLE            
   ERROR"  Unable to resize vocabulary  ! "                     
   context @@ swap copy.vocab  ;    DECIMAL                     
════════════════════════════════════════════════════════════════   SCREEN 003
( MINIMUM.VOCAB )                                               
                                                                
: MINIMUM.VOCAB  ( SIZE -- )   CURRENT @@ @ - DUP 0>            
   IF    CURRENT @ HANDLE.SIZE + RESIZE.VOCAB                   
   ELSE  DROP                                                   
   THEN  ;                                                      
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
( HEAP MANAGEMENT )  HEX                          ( 052784 DRC) 
                                                                
: RESIZE.OBJECT (  SIZE -- RESIZES VOCABULARY )                 
     OBJECT.HANDLE @ swap over      HERE swap @                 
     FFFFFF AND -  OVER >                                       
     ERROR"  Object won't fit"   RESIZE.HANDLE                  
     ERROR"  Unable to resize Object ! "  ;                     
                                                                
: MINIMUM.OBJECT  ( SIZE -- )  OBJECT.ROOM - DUP 0>             
   IF    OBJECT.HANDLE @  HANDLE.SIZE + RESIZE.OBJECT           
   ELSE  DROP                                                   
   THEN  ;                                                      
                                                                
  DECIMAL                                                       
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
( Text Formatting)                               ( 082384 DFC)  
: ?CR   ( N  --  CR if n+x>max.x )             ( +)             
    COL @  +     GET.WINDOW +WCBOUNDS 6+ W@                     
    GET.WINDOW +WLINE.HEIGHT @ 7- W/       >                    
        IF CR  THEN  ;                                          
                                                                
: >COL  ( MODULO -- ) COL @  OVER  WMOD 1+  -  DUP ?CR  ( +)    
         COL @   IF  SPACES  ELSE  DROP  THEN ;         ( +)    
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 006
(  WORDS )                                                      
                                                                
: WORDS   CONTEXT @ ?DUP                                        
     IF  @ ?DUP                                                 
        IF DUP @ +  BEGIN  DUP DUP 1+ C@ SWAP C@ OR             
                      WHILE 2+ COUNT 31 AND 2DUP                
                        16 >COL  DUP 2+ ?CR                     
                        TYPE 2 SPACES +                         
                    REPEAT   DROP                               
         THEN                                                   
    THEN   ;                                                    
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
( ROOM, VERSION#  )                               ( 082384 DFC) 
: ROOM  (  ---  PRINT AMOUNT OF MEMORY REMAINING )              
    BASE @ >R                                                   
    CR DECIMAL  OBJECT.HANDLE  @ handle.size   OBJECT.ROOM      
    6 .R  ."  of " 6 .R   ."  Object Bytes Available"           
    CR CURRENT @@ DUP  @                                        
    6 .R  ."  of " 4+ @ 8- 6 .R      ( %)                       
    ."  Current Vocabulary Bytes Available"               ( %)  
    CR ?HEAP.SIZE  10 SPACES 6 .R ."  Heap Bytes Available "    
    R> BASE !     ;                                             
exit <<<<<<<<<<<<<<<<<<<<<<<<<<<                                
                                                                
: ?ROOM  ( L1.1 DOC ERROR )  ROOM  ;                            
: VERSION  ( OUTPUT VERSION# )                                  
    CR ." MacFORTH Version 2.0 "  CR   ;                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( BEHEAD  REMOVE NAME FROM VOCABULARY )           ( 080584 DRC) 
 exit <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                         
: BEHEAD  ( TOKEN --  REMOVE TOKEN FROM CURRENT VOCABULARY )    
    ?DUP                                                        
    IF  NFA  DUP  C@ 31 AND                                     
       3+  >R  2- LATEST 2- -  ( LEN )                          
        LATEST 2- DUP I+ ROT CMOVE>  ( RECLAIM SPACE )          
     R> CURRENT @@ +!                                           
    THEN  ;                                                     
                                                                
                                                                
: AXE                                                           
       FIND DUP  -FOUND  BEHEAD  ;                              
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( Date and Time Primitives )                      ( 082484 DRC) 
exit <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<    HEX           
CREATE MONTHS  1F1C1F1E , 1F1E1F1F , 1E1F1E1F ,                 
DECIMAL                                                         
                                                                
: @CLOCK  ( -- #seconds since 12:00:00 a.m. 01/01/04 *)  524 @ ;
                                                                
60 60 *       DUP CONSTANT 1HOUR                                
1HOUR 12 *    DUP CONSTANT 12HOURS                              
12HOURS 2*    DUP CONSTANT 1DAY                                 
                                                                
: ?DAYS  ( #seconds -- # of days | convert seconds to days *)   
   1 NEEDED  0  1DAY  M/MOD  SWAP DROP   ;                      
                                                                
: ?SECONDS  ( #seconds -- # of seconds since midnight  *)       
  1 NEEDED  0  1DAY  M/MOD  DROP  ;                             
════════════════════════════════════════════════════════════════   SCREEN 011
(     Time Conversion Words )                     ( 053084 DRC) 
exit <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                             
: (:00)  ( n -- | set up for time output *)                     
       #  6 BASE !  #  DECIMAL  58 HOLD  ;                      
: FMT.TIME$  ( #seconds -- addr\cnt *)                          
     BASE @ >R  DECIMAL                                         
     <#  77 HOLD  ( "M" )   DUP 12HOURS < NOT                   
        IF    80 HOLD  ( "P" )                                  
              12HOURS DUP 1HOUR + 1- RANGE  NOT                 
                IF   12HOURS -  THEN                            
        ELSE  65 HOLD ( "A" )                                   
        THEN  BL HOLD  (:00)   (:00)   # # #>    R> BASE !  ;   
: .TIME$  ( --- )  @CLOCK ?SECONDS  FMT.TIME$  TYPE  ;          
: GET.TIME$  ( addr -- | time string is 11 chars long *)        
    @CLOCK ?SECONDS FMT.TIME$  ROT SWAP CMOVE  ;                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 013
(  PROGRAM  DOCUMENTATION ) HEX                   ( 101584 dws) 
                                                                
: >LIST<  ( --- )   PAUSE ( patchable )                         
    10 SPACES  22 EMIT  BLOCK-FILE @ @FILE.NAME COUNT TYPE ( %) 
    22 EMIT  5 SPACES ( .DATE$  5 SPACES .TIME$ )  ;       ( %) 
                                                                
                                                                
:  LIST  ( scr# -- | list scr#  *)                              
     DECIMAL  CR  DUP  SCR !    ." SCR # "  .  >LIST<           
       10 0                                                     
       DO CR I 3  .R  SPACE  I SCR @                            
          >R  C/L  B/BUF  */MOD  R>    +                        
          BLOCK  +  C/L   -TRAILING  TYPE                       
       LOOP  CR  ;                                              
                                                                
                                      decimal                   
════════════════════════════════════════════════════════════════   SCREEN 014
(  PROGRAM  DOCUMENTATION ) exit <<<<<<<<<<<<<<<<<     HEX      
                                                                
: PAGE  ( CLEAR SCREEN, EJECT PAGE  CLEAR LINE#  *)             
       0C EMIT  LINE# OFF  ;                                    
                                                                
: INDEX     ( PRINT FIRST LINE OF EACH SCREEN FROM-2, TO-1  *)  
       CR  >LIST<   CR  1+  SWAP                                
        DO  CR  I  3  .R  SPACE   I  BLOCK C/L TYPE  LOOP  ;    
                                                                
: TRIAD   ( PRINT 3 SCREENS ON PAGE, CONTAINING # ON STACK  *)  
       PAGE  3 / 3  *  3  OVER  +  SWAP                         
        DO   I  LIST   LOOP                                     
       cr ." Copyright 1984, DISCOURSE, Inc." cr ;              
                                                                
: SHOW  ( PRINT A SEQUENCE OF SCREENS FROM-2 TO-1       *)      
     OVER 3 MOD  + 1+  SWAP DO I TRIAD  3 +LOOP  ;  DECIMAL     
════════════════════════════════════════════════════════════════   SCREEN 015
( TRACE DEFINITION )                              ( 082384 DFC) 
exit                                                            
: (TRACE)    ( INLINE TRACE FUNCTION)                           
        DEBUG.ONLY                                              
        GET.WINDOW >R SYS.WINDOW   WINDOW   ( USE SYS.WINDOW )  
        10 >COL    (.S)  CR                                     
        R> R@   W@  NFA ID.  WINDOW    ;                        
                                                                
 token.for (TRACE)  ' TRACE.TOKEN !                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 016
(   ?FILES   <-FILES>  )                                        
: <-FILES>  ( --- | purge assignments above HERE )  #FILES 0    
      DO  HERE I @FILE.NAME  <  IF  I REMOVE  THEN  LOOP ;      
  exit <<<<<<<<<<<<<<<<                                         
: ?FILES  ( --- )                                               
    CR  ." File Assignments:"  #FILES  0                        
     DO    CR  5 SPACES  ." ("  I 2 .R  ." )"                   
           I ?OPEN  IF  79  ELSE BL  THEN    EMIT               
           I ?BLOCKS.FILE                                       
             IF    98  I BLOCK-FILE @ =  32 * +                 
             ELSE  BL                                           
             THEN  EMIT  ." ="                                  
           I @FILE.NAME  ?DUP                                   
             IF   34 EMIT  COUNT TYPE  34 EMIT  THEN            
     LOOP  ;                                                    
                                                                
════════════════════════════════════════════════════════════════   SCREEN 017
( dictionary maintenenance )    decimal                         
                                                                
: CLIP>OBJECT  ( ADDR  -- ADDR  )                               
      MASK.HANDLE  OBJECT.HANDLE @@ MASK.HANDLE MAX  ;          
                                                                
: DEALLOT  ( TOKEN -- DEALLOTS OBJECT SPACE ABOVE TOKEN ADDR )  
     ?DUP                                                       
     IF DUP  32768 >  (  NEED TO RECLAIM TABLE SPACE )          
          IF DUP 4+ LAST.TOKEN 2+ W! ( NEXT TOKEN IN TABLE) THEN
          DUP TOKEN>ADDR  SWAP NFA C@ 64 AND  ( HANDLE? )       
          IF DUP 2+ @ TO.HEAP  THEN  ( RELEASE HANDLE )         
          CLIP>OBJECT   DP !                                    
      THEN  ;                                                   
: -LATEST  (  --  REMOVES LATEST TOKEN FROM OBJECT, DICT )      
     LATEST DUP C@  31 AND  3+ SWAP  2-  >W@<  DEALLOT          
     CURRENT @ @ +!  ;                                          
════════════════════════════════════════════════════════════════   SCREEN 018
( dictionary maintenenance )                                    
: FENCE ( -- ADDR  ADDRESS OF FENCE FOR VOCAB)  CURRENT @@ 8+ ; 
: SET.FENCE ( --  SETS VOCAB FENCE )   CURRENT @@ @ FENCE !  ;  
: NO.FENCE ( -- RESETS VOCAB FENCE )   FENCE  4- @  FENCE !  ;  
                                                                
: (FORGET)  ( TOKEN --  FORGETS THRU TOKEN  )                   
    ?DUP IF  DUP  NFA >R   TOKEN>ADDR   CLIP>OBJECT   DUP       
          PURGE.MENU.BAR  PURGE.WINDOWS                         
          BEGIN  LATEST  DUP   FENCE @  CURRENT @@ + <          
                 SWAP R@  > NOT   AND                           
          WHILE  -LATEST                                        
          REPEAT  R>DROP   <-FILES>                             
     THEN ;                                                     
                                                                
: FORGET   FIND DUP  -FOUND  -NULL  (FORGET)   ;   exit         
: EMPTY   FENCE @  CURRENT @@ +   >W@<   (FORGET)  ;            
════════════════════════════════════════════════════════════════   SCREEN 019
( DIRECTORY OPERATIONS )      exit                ( 101484 dws) 
: .DAY  ( #DAYS -- TYPE DATE CODE ) ?DAYS  -1 FMT.DATE$ TYPE ;  
 HEX A007 OS.TRAP (GET.VOL.INFO)  A00C OS.TRAP (GET.FILE.INFO)  
 DECIMAL                                                        
: .FILE  ( VOL#\FILE.INDEX\FCB --  DISPLAYS FILE ATTRIB)        
    >R   I 80 ERASE    28 I+W!    22 I+W!                       
    HERE 32 BLANKS  HERE 18 I+!  ( FOR NAME )                   
    I (GET.FILE.INFO)  ?FILE.ERROR                              
    CR 18 I+@  ?DUP  IF COUNT 19 MIN TYPE  THEN                 
    20 >COL  30 I+ C@ DUP 1 AND         ( LOCKED )              
     IF 76 ELSE 45 THEN  EMIT  128 AND  ( IN USE )              
     IF 85 ELSE 45 THEN  EMIT                                   
      4 SPACES 32 I+  4 TYPE   ( file type )                    
   31 >COL  58 I+@ 68 I+@ +  B/BUF  W/MOD  SWAP IF 1+ THEN      
     5 .R  ." k"  ( SIZE)                                       
    2 SPACES  72 I+@ .DAY  3 SPACES 76 R> + @ .DAY   ;          
════════════════════════════════════════════════════════════════   SCREEN 020
( DIR COMMAND )                                   ( 061684 DFC) 
 exit <<<<<<<<<<<<<<<<<<<<<<<                                   
: DIR  ( [drive# 1 or 2] or [volume refnum] -- | display dir *) 
  1 NEEDED  BASE @ >R  DECIMAL  SYS.FILE >FCB DUP>R  80 ERASE   
    DUP 22 I+W!  HERE  18 I+!               ( name )            
    I (GET.VOL.INFO)  IO-RESULT @    ERROR"  Illegal Volume"    
CR ." Volume Name:" 18 I+@ COUNT 20 MIN  34 EMIT  TYPE  34 EMIT 
CR 3 SPACES   40 I+W@  DUP    .  ." Files,  Approximately "     
      62 I+W@ ( 2/ )  3 .R ." k Bytes Available"                
CR  30 I+ 2@  ."    Created: " .DAY  ."  Last Changed: "  .DAY  
CR                                                              
." Name" 13 SPACES ." Attrib  Type  Size   Created:  Modified:" 
CR                                                              
." ====" 13 SPACES ." ======  ====  ====   ========  =========" 
       1+ 1 DO  DUP I J .FILE  LOOP  DROP                       
      CR  R>  80 ERASE  R> BASE !  ;                            
════════════════════════════════════════════════════════════════   SCREEN 021
(  ADD.BLOCKS )              exit                 ( 101684 dws) 
: ADD.BLOCKS  ( #blocks\file# -- *)                             
    >R  FLUSH                                                   
    FIRST 4+ B/BUF BLANKS  ( use disc buffer as a blank area )  
    I >FCB  +MAX.BLK# @  DUP 0= NOT                             
      IF  ( skip over last block )   1+  THEN                   
    DUP  ROT +  SWAP                                            
     DO    FIRST 4+  I J WRITE.FIXED  IO-RESULT @  -34 =        
            IF    CR ." Warning: Disk Full at Block# " I . LEAVE
            ELSE  ?FILE.ERROR  I 1+ B/BUF *  J SET.EOF          
                  I J >FCB  +MAX.BLK# !                         
            THEN                                                
     LOOP  EMPTY-BUFFERS  R>DROP  ;                             
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 022
(    DELETE.BLOCKS  APPEND.BLOCKS )               ( 082284 DFC) 
exit <<<<<<<<<<<<<<<<<<<                                        
: DELETE.BLOCKS  ( #blocks\file# -- *)                          
    >R  B/BUF *  R@ GET.EOF  +  0 MAX                           
    DUP B/BUF /  R@ >FCB +MAX.BLK# !     R> SET.EOF  ;          
                                                                
: APPEND.BLOCKS  ( #blocks\file# -- | + adds, - shrinks *)      
   2 NEEDED    OVER   ( don't do anything on #blocks = 0 %)     
    IF   >R  I SELECT  WATCH SET.CURSOR                         
         I GET.FILE.INFO  DUP 0>                                
           IF    I  ADD.BLOCKS                                  
           ELSE  I  DELETE.BLOCKS                               
           THEN  I  FLUSH.FILE    I FLUSH.VOL   I CLOSE         
         R>  OPEN    INIT.CURSOR                                
    THEN ;                                                      
                                                                
════════════════════════════════════════════════════════════════   SCREEN 023
( PRINTER CONFIGURATION)                          ( 082284 DFC) 
DECIMAL                                                         
 exit <<<<<<<<<<<<<<<<<<<<<<                                    
: SETUP.SERIAL  ( sb\parity\#bits\baud.rate\fcb.addr -- )       
    5 NEEDED                                                    
    >R   115200 SWAP / 2-                 ( BAUD RATE)          
    624 ROT 5- 2* SCALE 3072 AND  OR     ( #BITS)               
    SWAP 3 AND 12 SCALE OR               ( PARITY)              
    SWAP 3 AND 14 SCALE OR               ( STOP BITS)           
    16 SCALE                             ( HIGH ORDER WORD)     
    0 SWAP 8 R> DEVICE.CONTROL  ;                               
                                                                
: CONFIGURE.PRINTER  ( sb\parity\#bits\baud.rate  -- )          
   " .BOUT"  NEXT.FCB  >FCB  DUP>R  OPEN.DEVICE                 
   R@ SETUP.SERIAL  R> 50 ERASE  ;                              
                                                                
════════════════════════════════════════════════════════════════   SCREEN 024
( coordinate modes )                              ( 040684 DFC) 
exit                                                            
: xyaxis  ( displays xyaxis )                                   
    @penstate                                                   
    1 1 (pensize)   black penpat     0 0 2dup 100 0 vector      
    103 0  109 0 vector 106 3 106 -3 vector   ( +)              
     2dup 0 100 vector                                          
    0 103 0 109 vector  -3 106  3 106 vector  ( + )             
     2dup -100 0 vector    -109 0 -106 0 vector    ( - )        
         0  -100 vector   -3 -103 3 -103 vector    ( - )        
    !penstate  ;                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 025
( binary controls )                               ( 082484 DRC) 
                                                                
                                                                
: BINARY.CONTROL  ( wptr\x\y\title$\visible\type -- handle)     
    6 NEEDED                                                    
     >R >R DUP>R STRINGWIDTH 4 ROLL  >R >R    ( x\y)            
     2DUP 20 + SWAP R> + 20 + SWAP MAKE.RECT  ( rxy\rxy)        
     0 R> ROT  R> R> 0 0 1 R> HERE                              
     ( rxy2\rxy1\0\wptr\rect.addr\title$\visible\min\val\max)   
     ( \button.type\refcon)                                     
      ADD.CONTROL  >R  2DROP  R> ;                              
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 026
( binary controls )                               ( 101184    ) 
 exit                                                           
                                                                
                                                                
: CHECK.BOX ( wptr\x\y\title$\visible -- )                      
     1 BINARY.CONTROL CONSTANT IN.HEAP ;                        
: PUSH.BUTTON ( wptr\x\y\title$\visible -- )                    
     0 BINARY.CONTROL CONSTANT IN.HEAP  ;                       
 : RADIO.BUTTON ( wptr\x\y\title$\visible -- )                  
     2 BINARY.CONTROL CONSTANT IN.HEAP ;                        
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 027
(   File I/O Errors ) exit CREATE FILE.ERROR.MSGS ( 101184    ) 
( 33) ," Directory Full"         ," Disc Full"                  
( 35) ," No Such Volume"         ," Disc I/O Error"             
( 37) ," Bad File Name"          ," File Not Open"              
( 39) ," End of File"            ," Position Error"             
( 41) ," Memory Full"            ," Too Many Files Open"        
( 43) ," File Not Found"         ," Disc Write Protected"       
( 45) ," File Locked"            ," Volume Locked"              
( 47) ," One or More Files Open" ," Duplicate File Name"        
( 49) ," Already Open"           ," No Drive #"                 
( 51) ," No File Assigned"       ,"  "                          
( 53) ," Volume Not On-Line"     ," Volume Locked"              
( 55) ," Volume Already On-Line" ," Illegal Drive #"            
( 57) ," Invalid Disc Directory" ," Can't Recognize Volume"     
( 59) ," Rename Problem"         ," Bad Directory Block"        
( 61) ," Writing Not Allowed"                                   
════════════════════════════════════════════════════════════════   SCREEN 028
(   .FILE.ERROR ?FILE.ERROR   RENAME  )           ( 082484 DRC) 
exit                                                            
: >.FILE.ERROR<  ( error# -- )                                  
      RETRY @ IF DROP RECOVER THEN                              
      NEGATE  33 61 RANGE                                       
      IF    FILE.ERROR.MSGS  SWAP  33 -  ?DUP                   
              IF  0 DO COUNT + =CELLS   LOOP  THEN              
            COUNT CR TYPE ." !"                                 
      ELSE  NEGATE ." File Error # " .                          
      THEN  IO-RESULT OFF   7 SYSBEEP   ABORT  ;                
                                                                
   token.for >.FILE.ERROR<     ' .FILE.ERROR   W!               
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 029
(   Apple Menu )                                  ( 080584 DRC) 
       HEX                                                      
CREATE APPLE.TITLE  0114 W,                                     
  44525652 CONSTANT  'DRVR'                                     
  A8F6  MT  DRAW.PICTURE ( HANDLE\RECT)                         
DECIMAL                                                         
: ABOUT.MACFORTH... ( --- )                                     
   >SYS.WINDOW  100 GET.PICTURE  ?DUP                           
    IF   >R PAGE SYS.WINDOW +WCBOUNDS @RECT                     
         376 MIN ( x )  SWAP   216 MIN ( y )   MAKE.RECT        
         R@ SWAP DRAW.PICTURE 2DROP   R> PURGABLE               
    THEN 0 HILITE.MENU                                          
   BEGIN  DO.EVENTS  MOUSE.DOWN =                               
             ?KEYSTROKE OR IF  PAGE SP! QUIT  THEN              
   AGAIN   ;                                                    
   axe draw.picture                                             
════════════════════════════════════════════════════════════════   SCREEN 030
(   Apple Menu )                                  ( 082184 DRC) 
HEX                                                             
                                                                
: APPLE.MENU   ( --- | sets up apple menu *)                    
   1 DELETE.MENU   -1  APPLE.TITLE  1  NEW.MENU                 
   " About MacForth...;-(" 1 append.items  'DRVR' 1 ADD.RES.MENU
    DRAW.MENU.BAR   64 GET.PICTURE DROP                         
    1 MENU.SELECTION:  dup  1-                                  
    IF   1 MENU.HANDLE   14 ITEM$ C!   SWAP ITEM$ GET.ITEM      
         GET.WINDOW >R      SYS.WINDOW WINDOW                   
         ITEM$  OPEN.DA  DROP   0 HILITE.MENU    R> WINDOW      
    ELSE DROP  ( ABOUT.MACFORTH...  )  ( %)                     
    THEN   ;                                                    
                                                                
DECIMAL                                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 031
(   Options Menu )                                ( 082384 DFC) 
: OPTIONS.MENU  ( --- )                                         
    3 DELETE.MENU   4 " Options " 3 NEW.MENU                    
    " Abort/A;Trace/T;Debug/D;Printer/P;-(;MacFORTH Window;-("  
       3 APPEND.ITEMS    " Exit MacFORTH"  3 APPEND.ITEMS       
    DRAW.MENU.BAR                                               
                                                                
3 MENU.SELECTION:                                               
CASE 1 OF 0 HILITE.MENU  1 ERROR"  Aborted!"              ENDOF 
     2 OF TRACE @   NOT DUP TRACE !   2 SWAP 3 ITEM.CHECK ENDOF 
     3 OF DEBUG @   NOT DUP DEBUG !   3 SWAP 3 ITEM.CHECK ENDOF 
     4 OF PRINTER @ NOT DUP PRINTER ! 4 SWAP 3 ITEM.CHECK ENDOF 
     6 OF 0 HILITE.MENU  SYS.WINDOW SHOW.WINDOW           ENDOF 
     8 OF  BYE                                            ENDOF 
ENDCASE  0 HILITE.MENU  ;                                       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 032
(    COPY  @INIT )                                ( 100384 drc) 
exit <<<<<<<<<<                                                 
: COPY  ( From\to  -- COPY 1 BLOCK )                            
    BLOCK-FILE @ SELECT   ( Verify open Blocks file)            
    FLUSH  OFFSET @ + -2147483648  + SWAP  BLOCK 4- !           
    SAVE-BUFFERS  ;                                             
exit                                                            
: @INIT  ( --- )                                                
    CR  3 SYSBEEP  ." Enter Your Initials [XXX] ->"             
    PAD 3  2DUP BLANKS EXPECT    PAD INITIALS 3 CMOVE  CR  ;    
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 033
(   INPUT.NUMBER  INPUT.STRING )                  ( 041284 DFC) 
exit <<<<<<<<<                                                  
: INPUT.NUMBER  ( width -- [n\true] or [false] *)               
    1 NEEDED    PAD 20 BLANKS                                   
    PAD SWAP EXPECT  CNT @  0=                                  
      IF    0                                                   
      ELSE  0  PAD 1-  DUP 1+ C@  45 =  DUP>R  IF 1+ THEN       
            CONVERT  DROP  R>   IF  NEGATE  THEN   -1           
      THEN  ;                                                   
                                                                
: INPUT.STRING  ( addr\cnt -- *)                                
    2 NEEDED   255 MIN  OVER  >R  SWAP 1+ SWAP  EXPECT          
    CNT @  R>  C!  ;                                            
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 034
( double click test )    DECIMAL                  ( 082484 DRC) 
exit                                                            
                                                                
: ?DOUBLE.CLICK ( -- flag   true if current mouse.down is a )   
                 (           double click)                      
    MOUSE.DOWN.RECORD DUP OFF                                   
    8+ @ 521 C@ 15 AND 4* + ( from control panel)               
    BEGIN  TICKCOUNT OVER <   ( wait delay or md )              
      MOUSE.DOWN.RECORD 2+ 2 @EVENT  NOT AND                    
      WHILE PAUSE                                               
    REPEAT                                                      
   MOUSE.DOWN.RECORD @                                          
   ( Any Mouse Down events within double click time)            
   IF MOUSE.DOWN.RECORD  8+ @ >  ELSE NOT THEN  ;               
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 036
( Load for room)                                                
    CR DECIMAL  OBJECT.HANDLE  @ handle.size   OBJECT.ROOM      
    6 .R  ."  of " 6 .R   ."  Object Bytes Available"           
    CR CURRENT @@ DUP  @                                        
    6 .R  ."  of " 4+ @ 8- 6 .R      ( %)                       
    ."  Current Vocabulary Bytes Available"               ( %)  
    CR ?HEAP.SIZE  10 SPACES 6 .R ."  Heap Bytes Available "    
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
