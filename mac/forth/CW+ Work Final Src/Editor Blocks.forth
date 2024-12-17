════════════════════════════════════════════════════════════════   SCREEN 000
Editor Blocks                      ( 072384 DFC)  ( 080885 drc) 
This Blocks file editor is based upon the origional MacFORTH    
implementation, but has been completely re-worked By            
David Sibley. The following Features have been added:           
                                                                
  Improved Block Title Maintenence                              
  Write only occurs if needed.                                  
  Stamp Automatically made on changed blocks if 1st Char of     
    initials is non-blank.                                      
  Advanced "Digital Thumb" implemented                          
  Search Automatically finds, highlights selected string.       
                                                                
Copyright for portions of the Source code contained in this     
file is owned either by  Creative Solutions or David Sibley.    
All rights reserved. Permission is hereby granted for           
personal use by registered MacFORTH Licensees.                  
════════════════════════════════════════════════════════════════   SCREEN 001
( Editor blocks )                                 ( 083085 drc) 
                                                                
DECIMAL                                                         
                                                                
8192 MINIMUM.OBJECT  4000 MINIMUM.VOCAB                         
                                                                
2000  VOCABULARY EDITOR     EDITOR DEFINITIONS                  
                                                                
    2 35 THRU                                                   
                                                                
 FORTH DEFINITIONS                                              
                                                                
                                                                
  ' EDITOR @ TO.HEAP  ' EDITOR OFF  ( purge the vocab )         
                                                                
2048 MINIMUM.OBJECT                                             
════════════════════════════════════════════════════════════════   SCREEN 002
( Edit Window )  DECIMAL FORTH DEFINITIONS        ( 090685 DRC) 
: DATE   ."  ( MMDDYY XXX) " ;  ( set when Editor runs )        
NEW.WINDOW EDIT.WINDOW                                          
   " Editor Window "            EDIT.WINDOW  W.TITLE            
   39  1  295 471               EDIT.WINDOW  W.BOUNDS           
   SYS.WINDOW                   EDIT.WINDOW  W.BEHIND           
   CLOSE.BOX SCROLL.UP/DOWN  +  EDIT.WINDOW  W.ATTRIBUTES       
EDIT.WINDOW ADD.WINDOW                                          
                                                                
4 CONSTANT <EDIT.MENU>                                          
: EDIT@  ( block# -- )   1 NEEDED                               
    SCR !  EDIT.WINDOW  SELECT.WINDOW  EVENT.LOOP ;             
: EDIT  ( block# -- )  R# OFF  EDIT@ ;                          
: >EDIT  BLK @ 0> IF SCR @ EDIT@  THEN  ;                       
: -EDIT  EDIT.TOKEN @ OFF  ;  ON.FORGET -EDIT                   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( TE misc )                        ( 122884 DFC)  ( 072985 DAS) 
                                                                
EDITOR DEFINITIONS                                              
EDIT.WINDOW +WCBOUNDS DUP EDIT.WINDOW  TEXT.FIELD ED.TEXT       
                                                                
: @TE.PTRS  ( -- addr\cnt | returns the $ addr of the text )    
    EDIT.WINDOW  TERECORD  DUP 62 + @@  SWAP 60 + W@  ;         
                                                                
: TEXT.UPDATE ( --- | updates the visible region of window *)   
     GET.WINDOW TERECORD +TVISRECT TEUPDATE   ;                 
                                                                
: SCAN.CR  ( addr\cnt -- offset to cr or eol )                  
    DUP  0  DO                                                  
        OVER I+ C@  13 = IF  DROP I LEAVE  THEN                 
    LOOP  SWAP DROP  ;                                          
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
( stamp )                                         ( 083085 DRC) 
                                                                
: >PRINTABLE  ( char -- [char] or [blank]  )                    
    32 126 RANGE NOT IF DROP BL THEN ;                          
: MAKE.DATE  ( -- | set up string in DATE )                     
    BASE @  DECIMAL                             ( swap base )   
    INITIALS ' DATE 13 + DUP>R  3 CMOVE         ( get initials )
    R> DUP 3+ SWAP DO  IC@ >PRINTABLE IC!  LOOP ( fix initials )
    @CLOCK ?DAYS 0 FMT.DATE$                    ( get date )    
    ' DATE 6+ SWAP CMOVE                        ( save it )     
    BASE ! ;                                    ( restore base )
: ((STAMP))  ( -- | stamp in block buffer )                     
    ' DATE 2+ COUNT  SCR @ BLOCK 49 +  SWAP CMOVE ;             
: STAMP?   INITIALS C@ BL >   PREV @@ 0<  AND   ( modified? )   
    IF ((STAMP)) THEN ;                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
( line manipulations )                            ( 122884 DFC) 
                                                                
: LINE>PAD  ( addr\cnt -- addr'\cnt' )     DUP 0>               
    IF  2DUP  C/L MIN  PAD 1+ SWAP  CMOVE    ( text to PAD )    
        2DUP  SCAN.CR  1+ >R                 ( #chars to skip ) 
        R@ -  SWAP R@ +  SWAP                ( make addr'\cnt' )
        R@ C/L > IF  C/L  ELSE  R@ 1-  THEN  ( count byte )     
        PAD C!   R>DROP                                         
    THEN  ;                                                     
                                                                
: LINE>BLOCK  ( addr\cnt\line# -- addr'\cnt' | transfer one )   
              ( line of text to the block buffer            )   
   C/L *  SCR @  BLOCK +  >R                                    
   LINE>PAD    PAD COUNT  R> SWAP CMOVE   ;                     
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 006
( line manipulations )                            ( 122884 DFC) 
                                                                
: LINES>BLOCK  ( --- | transfer text to the block buffer )      
    SCR @  BLOCK  B/BUF BLANKS              ( clear buffer )    
    @TE.PTRS  16 0 DO                       ( addr\count )      
        DUP 0>   IF   I LINE>BLOCK   ELSE LEAVE  THEN           
    LOOP  2DROP ;                                               
                                                                
: (DONE)   ( --- | save text to block buffer and write to disk) 
    BLOCK-FILE @  ?OPEN   NOT  ERROR"  File Not Opened!!"       
    GET.WINDOW  EDIT.WINDOW =  NOT                              
        ERROR"  Use From Editor Only!!"                         
    LINES>BLOCK  STAMP?  SAVE-BUFFERS   ;                       
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
( line manipulations )                            ( 013A65 DRC) 
: ,TEXT  ( addr\cnt -- | append string to PAD )                 
    DUP>R   PAD 2+  PAD W@ +  SWAP CMOVE    ( append text )     
    R> PAD W@ +  PAD W! ;                   ( update count )    
                                                                
: ADJ.RANGE   SWAP 0MAX 1023 MIN  DUP C/L W/  +  ( ADD CR'S ) ; 
                                                                
: ((BLOCK>LINES))  ( block# -- | MUST BE IN EDIT.WINDOW!!!!! )  
                   ( copies contents of a block to TE record )  
    PAD OFF  BLOCK 16 0 DO               ( move block to PAD )  
        DUP I C/L * +  C/L ,TEXT   CRLF 1 ,TEXT                 
    LOOP  DROP                                                  
    PAD 2+  PAD W@  TESET.TEXT               ( the text )       
    R# @POINT OVER MAX                       ( sanity check )   
    ADJ.RANGE ADJ.RANGE  TESET.SELECT ( sel range lohi ) ;      
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( traps  clip regions )                           ( 121085 drc) 
                                                                
HEX   ( some region handling traps )                            
( A8D9 MT DISPOSE.RGN       ( rgn handle -- )                   
( A879 MT SET.CLIP          ( rgn handle -- )                   
( A87A MT GET.CLIP          ( rgn handle -- )                   
A910 MT GET.WMGR.PORT     ( addr -- )                           
DECIMAL                                                         
                                                                
CREATE BLOCK#.CLIP 8 ALLOT   ( rectangle )                      
: MAKE.CLIP  ( -- | set up BLOCK#.CLIP )                        
    MAX.X 16 + -1 XY>POINT LOCAL>GLOBAL  POINT>XY SWAP          
    OVER 16 -  OVER 83 -  2SWAP  BLOCK#.CLIP   !RECT ;          
: MAX.BLK#  ( -- max blk# )                                     
    BLOCK-FILE @ GET.EOF B/BUF /  1-  0MAX ( for scr 0 )  ;     
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( SHOW.BLOCK# )                                   ( 121085 drc) 
: SHOW.BLOCK#  ( block# -- | display in title bar )             
    GET.WINDOW >R   MAKE.CLIP                                   
    0 SP@ GET.WMGR.PORT (WINDOW)                   ( swap port )
    NEW.RGN DUP>R GET.CLIP                         ( save clip )
    BLOCK#.CLIP CLIP.RECT                          ( make clip )
    BLOCK#.CLIP ERASE.RECT                         ( clean )    
    BLOCK#.CLIP @ POINT>XY  5 12 +POINT (MOVE.TO)               
    PRINTER @ SWAP PRINTER OFF                   ( Don't print) 
   ( block# ) 3 .R ."  of " MAX.BLK# .            ( print it )  
    PRINTER !                                                   
    R@ SET.CLIP  R> DISPOSE.REGION   R> WINDOW ;   ( restore )  
                                                                
: MAKE.CONTROL  ( n -- | Sets control value to n. Fixes max )   
    GET.WINDOW +VBAR @ DUP                                      
        MAX.BLK# SET.CONTROL.MAX   SWAP SET.CONTROL ;           
════════════════════════════════════════════════════════════════   SCREEN 010
( window title )                                  ( 072485 DAS) 
                                                                
: SET.WTITLE?  ( title\wptr -- | sets title if new )            
    2DUP 134 + @@  -STRING                ( new title? )        
    IF  SET.WTITLE  ELSE  2DROP  THEN ;                         
                                                                
: SET.BTITLE$  ( -- | set title, display block# )               
    BLOCK-FILE @ @FILE.NAME EDIT.WINDOW  SET.WTITLE?            
    SCR @ SHOW.BLOCK# ;                                         
                                                                
: (EDIT)  ( block# -- | sets up for editing the specified block)
    0MAX  MAX.BLK# MIN  SCR !   SET.BTITLE$                     
    SCR @ ((BLOCK>LINES))   TEXT.UPDATE    0 HILITE.MENU  ;     
                                                                
: (STAMP)  (DONE) ((STAMP)) SCR @ (EDIT) ;                      
                                                                
════════════════════════════════════════════════════════════════   SCREEN 011
( TE Scrap to Desk Scrap, wtitle ) ( 072384 DFC)  ( 083085 DRC) 
                                                                
: FULL.WTITLE  ( -- | wtitle with block number info )           
    PAD OFF  BLOCK-FILE @ @FILE.NAME COUNT ,TEXT                
    "     "  COUNT ,TEXT  SCR @ <# #S #> ,TEXT                  
    "  of "  COUNT ,TEXT  MAX.BLK# <# #S #> ,TEXT               
    PAD 1+ EDIT.WINDOW SET.WTITLE ;                             
                                                                
HEX   AB0 CONSTANT TESCRAP.LEN                                  
      AB4 CONSTANT TESCRAP.HANDLE    DECIMAL                    
: PUT.TESCRAP  ( --- | copy TE scrap, if any, to clipboard )    
    TESCRAP.LEN W@  IF     ( scrap available? )                 
        ZERO.SCRAP  DROP   ( empty the clipboard )              
        TESCRAP.HANDLE @@ TESCRAP.LEN W@  "TEXT  PUT.SCRAP      
        DUP IO-RESULT !  IF  ?FILE.ERROR  THEN                  
    THEN  ;                                                     
════════════════════════════════════════════════════════════════   SCREEN 012
( TEXT SCRAP I/O )                                ( 073185 DAS) 
                                                                
: GET.TESCRAP  ( -- | copy clipboard, if any, to TE scrap )     
    SCRAP.LEN @  0>  IF                                         
        TESCRAP.HANDLE @ 0 RESIZE.HANDLE DROP                   
        TESCRAP.LEN OFF                                         
        0 "TEXT GET.SCRAP  DUP 0>  IF                           
            DROP TESCRAP.HANDLE  @ "TEXT GET.SCRAP              
            TESCRAP.LEN W!                                      
        ELSE DUP IO-RESULT ! 102 +  IF ?FILE.ERROR THEN         
        THEN                                                    
    THEN  ;                                                     
                                                                
: ?PT  ( -- flag | is selection range a point? )                
    GET.WINDOW TERECORD DUP 32 + W@  SWAP 34 + W@  =  ;         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 013
( revert  undo  clean )                           ( 080284 DFC) 
HEX                                                             
: (REVERT)  ( -- )  7FFFFFFF SCR @  BLOCK 4- !  R# OFF ;        
DECIMAL                                                         
                                                                
:  UNDO  ( -- )  SCR @ ((BLOCK>LINES)) TEXT.UPDATE  ;           
: -UNDO  ( -- )  1  FALSE <EDIT.MENU>  ITEM.ENABLE  ;           
: +UNDO  ( -- )  1  TRUE  <EDIT.MENU>  ITEM.ENABLE  ;           
                                                                
: BLANKS>PAD  ( -- | move a blank screen into PAD )             
    PAD DUP C/L 1+ 16* DUP>R BLANKS              ( blanks )     
    R> 1+ PAD + C/L 1+ PAD + DO                                 
        13 IC! C/L 1+ +LOOP ;                    ( add CR's )   
: (CLEAN)  ( -- | clear current block )                         
    BLANKS>PAD  PAD C/L 1+ 16* TESET.TEXT                       
    R# OFF  0 0 TESET.SELECT  TEXT.UPDATE ;                     
════════════════════════════════════════════════════════════════   SCREEN 014
( insert )                                        ( 082785 DRC) 
                                                                
: BLOCK.INSERT  ( -- | insert chosen from menu )                
    EVENTS OFF   ( no events while block fiddling )             
    (DONE)  R# OFF   SCR @ >R                                   
    I  MAX.BLK# SWAP -                          ( # to move )   
    1 BLOCK-FILE @ APPEND.BLOCKS                ( make room )   
    ?DUP IF    WATCH SET.CURSOR                 ( any to move? )
        0 DO  MAX.BLK# I- DUP 1- SWAP COPY  LOOP ( move 'em)    
    THEN   R> 1+  BLOCK  B/BUF BLANKS  UPDATE    ( clear block )
    SAVE-BUFFERS INIT.CURSOR                     ( tidy )       
    SCR @ 1+ DUP MAKE.CONTROL  (EDIT)                           
    EVENTS ON  ;  ( fix control )                               
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 015
( delete )                                        ( 082785 DRC) 
                                                                
: BLOCK.DELETE  ( -- | delete chosen from menu )                
    EVENTS OFF   ( no events while block fiddling )             
    (DONE)  SCR @ (EDIT)    R# OFF          ( organize screen ) 
    0 32000 TESET.SELECT  TECUT               ( save in scrap ) 
    SCR @ DUP>R   MAX.BLK# SWAP -             ( # to move )     
    ?DUP IF    WATCH SET.CURSOR               ( any to move? )  
        0 DO  J I+ DUP 1+ SWAP COPY  LOOP     ( move 'em)       
    THEN   R>DROP  SAVE-BUFFERS                                 
    -1 BLOCK-FILE @ APPEND.BLOCKS             ( close up )      
    SCR @ 1- 0MAX DUP MAKE.CONTROL  (EDIT)                      
    EVENTS ON  ;  ( fix control )                               
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 016
( EDIT.ITEMS  TECUT? TECOPY? )                    ( 073185 DAS) 
HEX                                                             
CREATE EDIT.ITEMS     09010304 ,  05060809 , 0A0B0000 ,         
CREATE DA.EDIT.ITEMS  04030405 ,  06000000 ,                    
DECIMAL                                                         
: -EDIT.ITEMS  ( --- )  EDITOR   EDIT.ITEMS COUNT  0            
     DO   DUP I+ C@   0 <EDIT.MENU>  ITEM.ENABLE  LOOP  DROP ;  
: +EDIT.ITEMS  ( --- )  -UNDO  EDIT.ITEMS COUNT  0              
     DO   DUP I+ C@  -1 <EDIT.MENU>  ITEM.ENABLE  LOOP  DROP ;  
: +DA.EDIT.ITEMS  ( -- )  -EDIT.ITEMS  DA.EDIT.ITEMS COUNT 0    
     DO   DUP I+ C@  -1 <EDIT.MENU>  ITEM.ENABLE  LOOP  DROP ;  
                                                                
: TECUT?  ( -- )  ?PT IF 1 SYSBEEP                              
    ELSE LINES>BLOCK  TECUT  +UNDO  UPDATE THEN ;               
: TECOPY?  ( -- )  ?PT IF 1 SYSBEEP                             
    ELSE LINES>BLOCK  TECOPY -UNDO THEN ;                       
════════════════════════════════════════════════════════════════   SCREEN 017
( DA edit menu selections )                       ( 083085 DRC) 
                                                                
: DA.MENU.SELECTIONS                                            
    13 " Enter Edit" <EDIT.MENU> SET.ITEM$                      
    <EDIT.MENU> MENU.SELECTION:                                 
    CASE 1 OF   0 SYSTEM.EDIT DROP           ENDOF              
         3 OF   TECUT                        ENDOF              
         4 OF   TECOPY                       ENDOF              
         5 OF   TEPASTE                      ENDOF              
         6 OF   5 SYSTEM.EDIT DROP           ENDOF              
        13 OF   SCR @ 0 MAX  MAX.BLK#  MIN                      
                DUP SCR !  EDIT@             ENDOF              
    ENDCASE  0 HILITE.MENU  ;                                   
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 018
( DO.EDIT.MENU )                                  ( 073185 DAS) 
: DO.EDIT.MENU  ( --- )    +EDIT.ITEMS  -UNDO                   
    13 " Exit Edit" <EDIT.MENU> SET.ITEM$                       
    <EDIT.MENU> MENU.SELECTION:                                 
    CASE 1 OF  UNDO                  -UNDO  UPDATE  ENDOF       
         3 OF  TECUT?                               ENDOF       
         4 OF  TECOPY?                              ENDOF       
         5 OF  LINES>BLOCK  TEPASTE  +UNDO  UPDATE  ENDOF       
         6 OF  LINES>BLOCK  (CLEAN)  -UNDO  UPDATE  ENDOF       
         8 OF  (REVERT) SCR @ (EDIT) -UNDO          ENDOF       
         9 OF  (STAMP)               -UNDO  UPDATE  ENDOF       
        10 OF  BLOCK.DELETE          -UNDO          ENDOF       
        11 OF  BLOCK.INSERT          -UNDO          ENDOF       
        13 OF  SYS.WINDOW DUP SHOW.WINDOW SELECT.WINDOW         
               INIT.CURSOR   EVENT.LOOP             ENDOF       
    ENDCASE  0 HILITE.MENU  ;                                   
════════════════════════════════════════════════════════════════   SCREEN 019
( EDIT MENU )                                     ( 083085 DFC) 
                                                                
: EDIT.MENU  ( -- )                                             
    <EDIT.MENU> DELETE.MENU                                     
    3  " Edit"                        <EDIT.MENU> NEW.MENU      
    " Undo/Z;-(;Cut/X;Copy/C"         <EDIT.MENU> APPEND.ITEMS  
    " Paste/V;Clear;-("               <EDIT.MENU> APPEND.ITEMS  
    " Revert;Stamp/S;Block Delete"    <EDIT.MENU> APPEND.ITEMS  
    " Block Insert;-(;Enter Edit/E;"  <EDIT.MENU> APPEND.ITEMS  
    DRAW.MENU.BAR   ;                                           
                                                                
FORTH DEFINITIONS    ( DA tokens )                              
: -EDIT.MENU    EDITOR  -EDIT.ITEMS DA.MENU.SELECTIONS ;        
: DA.EDIT.MENU  ( -- | mode for desk accessories, etc. )        
    EDITOR   +DA.EDIT.ITEMS   +UNDO  DA.MENU.SELECTIONS         
    INIT.CURSOR  ;                                              
════════════════════════════════════════════════════════════════   SCREEN 020
( @VPOS !VPOS SHOW.BLOCK ) EDITOR DEFINITIONS     ( 070484 DFC) 
                                                                
: @VPOS ( -- current pos | returns current control value )      
    GET.WINDOW +VBAR @  GET.CONTROL  ;                          
                                                                
: !VPOS ( pos -- | sets the control value )                     
    GET.WINDOW +VBAR @  SWAP  SET.CONTROL                       
    GET.WINDOW SHOW.CONTROLS ;                                  
                                                                
: SHOW.BLOCK ( --- | display current block )                    
    (DONE)  @VPOS (EDIT)   -UNDO  ;                             
                                                                
EXIT ******                                                     
We use the value of the control as the current block for editing
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 021
( misc. )                                         ( 040185 DAS) 
                                                                
: THUMB.RECT  ( -- rect addr | bounds of current thumb )        
    THIS.CONTROL @@ 28 + @@ 2+ ;                                
: SHAFT.RECT  ( -- rect addr | bounds of shaft )                
    THIS.CONTROL @@ 8+ ;                                        
: SHAFT.HT  ( -- vertical distance thumb can move )             
    SHAFT.RECT 4+ W@ 47 - ;                                     
: SLOP.RANGE  ( -- lo\hi | approximate left to right slop )     
    SHAFT.RECT 2+ W@ DUP 23 - SWAP 39 + ;                       
                                                                
: .THUMB  ( n -- | display value if new )                       
    SCR @ OVER - IF                                             
        DUP SCR !  SHOW.BLOCK#                                  
    ELSE DROP THEN ;                                            
                                                                
════════════════════════════════════════════════════════════════   SCREEN 022
( THUMB#; THUMB.ACTION )                          ( 040185 DAS) 
                                                                
: THUMB# ( original Y\current Y -- predicted new value )        
    SWAP -  THUMB.RECT W@ +  15 -  MAX.BLK#  *                  
    SHAFT.HT DUP>R 2/ +  R> /    ( round correctly )            
    0 MAX  MAX.BLK# MIN ;                                       
                                                                
HEX                                                             
CREATE SAVED.REGS 10 ALLOT                                      
CREATE SAVE.REGS  -2 ALLOT      ( save A6, A5, A4, D7 )         
  41FA W, SAVED.REGS HERE - W,  { SAVED.REGS PCI) A0 LONG LEA, }
  48D07080 ,                    { A0 () TO 7080 LONG MOVEM, }   
  4ED4 W,                       { NEXT }                        
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 023
                                                  ( 091385 DRC) 
: THUMB.ACTION    ( control action proc  DO NOT EXECUTE! )      
  [ -2 ALLOT  48E7FFFE ,           { SP -) TO FFFE LONG MOVEM, }
    4CFA7080 , SAVED.REGS HERE - W, { SAVED.REGS PCI) FROM      
                                        7080 LONG MOVEM,  }     
    4E56FFC0 ,  47FA0004 , 4ED4 W, { -40 A6 LINK, >FORTH }  ]   
                                                                
        @MOUSE.DN  POINT>XY SWAP DROP  @MOUSE POINT>XY SWAP     
        SLOP.RANGE RANGE       ( check current x-coordinate )   
        IF DROP THUMB#         ( predicted value )              
        ELSE DROP 2DROP @VPOS  ( original value )               
        THEN .THUMB            ( display it )                   
                                                                
  [ HERE 2+  MAKE.TOKEN W, 4E5E W,  { >CODE  A6 UNLK, }         
    4CDF7FFF , 4E75 W, { SP )+ FROM 7FFF LONG MOVEM,  RTS, } ] ;
  DECIMAL                                                       
════════════════════════════════════════════════════════════════   SCREEN 024
( primitive thumb routine )                       ( 040485 DAS) 
                                                                
: DO.THUMB  ( -- )                                              
    SCR @ >R                                   ( temp variable )
    SAVE.REGS  GET.WINDOW NO.CLIP              ( need for vbar )
    THIS.CONTROL @ @MOUSE.DN ' THUMB.ACTION 2-                  
        (TRACK.CONTROL) DROP                   ( follow mouse ) 
    SCR @ !VPOS  R> SCR !                                       
    GET.WINDOW CLIP>CONTENT                    ( restore )      
    EDIT.WINDOW SHOW.CONTROLS  SHOW.BLOCK  ;                    
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 025
( +BLOCK DO.CTRL )                                ( 073085 DAS) 
                                                                
: +BLOCK  ( increment -- | increments the control )             
    @VPOS +  !VPOS                     ( set the control value )
    THIS.CONTROL @  THIS.PART @  HILITE.CONTROL  ( hilite part )
    EDIT.WINDOW SHOW.CONTROLS    SHOW.BLOCK   ( display block ) 
    THIS.CONTROL @ 0 HILITE.CONTROL           ( un-hilite part )
    EDIT.WINDOW SHOW.CONTROLS    ;                              
                                                                
: DO.CTRL  ( increment -- | bump control & update scroll bar )  
    BEGIN  STILL.DOWN                                           
    WHILE   ( while the button is down )   DUP  +BLOCK          
    REPEAT  DROP  ;                                             
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 026
( DO.EDIT.CONTROL )                               ( 070484 DFC) 
                                                                
: DO.EDIT.CONTROL  ( --- | handle controls for the edit window )
   @MOUSE.DN  GET.WINDOW  FIND.CONTROL  ?DUP                    
     IF  SWAP DROP  ( control handle )  R# OFF                  
         CASE  IN.THUMB     OF   DO.THUMB    ENDOF              
               UP.BUTTON    OF  -1 DO.CTRL   ENDOF              
               DOWN.BUTTON  OF   1 DO.CTRL   ENDOF              
               PAGE.UP      OF  -3 DO.CTRL   ENDOF              
               PAGE.DOWN    OF   3 DO.CTRL   ENDOF              
         ENDCASE                                                
     THEN   ;                                                   
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 027
( DO.EDIT.MOUSE SET.EDIT.CONTROLS )               ( 073085 DAS) 
                                                                
: DO.EDIT.MOUSE  ( --- | handle the mouse in the edit window )  
   ?IN.CONTROL  IF  DO.EDIT.CONTROL                             
    ELSE  LINES>BLOCK -UNDO TEXT.CLICK  THEN ;                  
                                                                
: SET.EDIT.CONTROLS  ( --- | setup the control bar )            
    EDIT.WINDOW +VBAR @               ( control handle )        
      0                                ( minimum blk# )         
      BLOCK-FILE @ >R  R@ GET.EOF B/BUF /  1- 0 MAX             
      DUP  R> >FCB  +MAX.BLK# !        ( update max blk# )      
      DUP 1 <                                                   
        IF  1  ABORT"  No Blocks Allocated!"  THEN              
      SET.CONTROL.RANGE                                         
    SCR @ !VPOS   ;                                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 028
( ADJUST.CURSOR EDIT.BLOCK )                      ( 082985 DRC) 
                                                                
: ADJUST.CURSOR  ( --- | adjust cursor for ibeam w/in editor )  
    @MOUSE GET.WINDOW +WCBOUNDS PTINRECT                        
       IF  IBEAM SET.CURSOR   ELSE  INIT.CURSOR THEN  ;         
                                                                
: EDIT.BLOCK  ( --- )   EVENTS ON                               
    BEGIN  ADJUST.CURSOR  TEIDLE                                
        DO.EVENTS  MOUSE.DOWN = IF  DO.EDIT.MOUSE  THEN         
        ?KEYSTROKE  IF                                          
            DUP 9 =  OVER 3 = OR ( Tab or Enter key? )          
            IF  3 0 DO BL TEKEY LOOP  DROP BL  THEN             
            TEKEY  UPDATE +UNDO                                 
        THEN                                                    
        UPDATE.STATUS @EXECUTE                                  
    AGAIN   ;                                                   
════════════════════════════════════════════════════════════════   SCREEN 029
                                                  ( 083085 DRC) 
                                                                
: ENTER.EDIT  ( --- )   EVENTS OFF                              
    OBJECT.ROOM  1300 <  ABORT"  Not Enough Room For Editor!"   
    SCR @ (EDIT)   TEACTIVATE  GET.TESCRAP                      
    DO.EDIT.MENU     MAKE.DATE                                  
    SET.EDIT.CONTROLS   DISCARD.UPDATES   EDIT.BLOCK ;          
                                                                
: EXIT.EDIT  ( --- )                                            
    PUT.TESCRAP  TEDEACTIVATE  0 HILITE.MENU  FULL.WTITLE       
    FRONT.WINDOW 108 + <W@ 0<                 ( system window? )
        IF DA.EDIT.MENU ELSE -EDIT.MENU THEN                    
    OBJECT.ROOM  1300 < NOT IF                                  
        (DONE)  SCR @ ((BLOCK>LINES)) TEXT.UPDATE               
        BLOCK-FILE @ FLUSH.FILE                                 
    THEN  ;                                                     
════════════════════════════════════════════════════════════════   SCREEN 030
( TEXT.ACTIVATE  TEXT.EDIT )                      ( 073084 DFC) 
                                                                
: TEXT.ACTIVATE  ( flag -- | flag from window activation )      
    IF    BLOCK-FILE @  ?OPEN NOT ABORT"  File Closed!! "       
          EDIT.WINDOW SHOW.WINDOW   ENTER.EDIT                  
    ELSE  EXIT.EDIT  THEN  ;                                    
                                                                
: TEXT.EDIT  ( edit field -- | TE set up )                      
    DUP @ SWAP 4+ @ SWAP OVER +WREFCON !  >R  ( wptr )          
    R@ ON.ACTIVATE TEXT.ACTIVATE              ( tokens )        
    R@ ON.UPDATE TEXT.UPDATE                                    
    R@ TERECORD   -1 OVER 72 + W!             ( CR only )       
                   4 SWAP 74 + W!             ( Monaco )        
    GET.WINDOW                                ( make non-null ) 
        R> WINDOW CRLF 1 TEINSERT                               
    WINDOW ;                                                    
════════════════════════════════════════════════════════════════   SCREEN 031
( Create ED.TEXT  RE.EDIT )  FORTH DEFINITIONS    ( 083085 DRC) 
                                                                
: RE.EDIT  ( wptr -- | re-install the editor from snapshot )    
    EDITOR  GET.WINDOW >R                ( save window )        
    EDITOR  4 OVER +WCBOUNDS +!          ( left margin )        
    DUP +WCBOUNDS DUP ROT WINDOW TENEW   ( new TE record )      
        GET.WINDOW  OVER ED.TEXT 2!      ( fix wptr )           
        ED.TEXT  TEXT.EDIT               ( set up TE )          
    EDIT.MENU  DO.EVENTS DROP            ( install menu )       
    -EDIT.MENU  DO.EVENTS DROP           ( system version )     
    TOKEN.FOR DA.EDIT.MENU BEFORE.DA !   ( DA tokens )          
    TOKEN.FOR -EDIT.MENU  AFTER.DA !                            
    TOKEN.FOR >EDIT EDIT.TOKEN !         ( Auto Edit token )    
    R> WINDOW   ;                        ( restore window )     
                                                                
EDIT.WINDOW RE.EDIT                                             
════════════════════════════════════════════════════════════════   SCREEN 032
( String Find for Editor )   EDITOR DEFINITIONS   ( 082985 DRC) 
                                                                
CREATE LOC$  66 ALLOT                                           
VARIABLE START.SCR                                              
VARIABLE STOP.SCR                                               
                                                                
: MAKE.HANDLE  ( src\count -- handle )                          
    DUP FROM.HEAP DUP>R @ SWAP CMOVE R> ;                       
                                                                
: SEARCH  ( buffer -- flag )                                    
    B/BUF MAKE.HANDLE  >R                   ( block to handle ) 
    I@  I HANDLE.SIZE 0MAX  UPPER           ( make upper case ) 
    I R# W@  LOC$ COUNT 0 0 MUNGER          ( search )          
    DUP  DUP LOC$ C@ + R# !POINT            ( set sel range )   
    0< NOT  R> TO.HEAP ;                                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 033
(    String Find )                                ( 100684 DAS) 
                                                                
: EMPTY?  ( -- | abort search for empty string )                
    LOC$ C@ 0=  LOC$ 1+ C@ 0= OR  ERROR"  Empty string!" ;      
: NOT.FOUND  ( -- )      CR LOC$ COUNT TYPE ."  not found." ;   
: >LOC$      ( str -- )  LOC$ OVER C@ 1+ 66 MIN CMOVE ;         
: GET.LOC$   ( -- )      5 WORD >LOC$  LOC$ COUNT UPPER ;       
                                                                
: (FIND.NEXT)  ( -- [block#\true] or [false] )                  
    EMPTY?                                                      
    0 STOP.SCR @ START.SCR @ DO                                 
        I BLOCK SEARCH IF                                       
            DROP I DUP START.SCR ! -1 LEAVE                     
        ELSE R# OFF THEN                                        
    LOOP ;                                                      
                                                                
════════════════════════════════════════════════════════════════   SCREEN 034
(    String Find )  FORTH DEFINITIONS             ( 100684 DAS) 
                                                                
: FN  ( -- )  EDITOR                                            
    WATCH SET.CURSOR                                            
    (FIND.NEXT) IF EDIT@  ELSE NOT.FOUND  THEN                  
    INIT.CURSOR ;                                               
                                                                
: F  ( first block# \ last block# -- )  EDITOR  2 NEEDED        
    1+ STOP.SCR ! START.SCR ! GET.LOC$  R# OFF  FN ;            
                                                                
: ALL  ( -- 0\MAX.BLK# )  EDITOR  0  MAX.BLK# ;                 
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 035
( since )     EDITOR DEFINITIONS                  ( 083085 DRC) 
: DATE>SEQ  ( MMDDYY -- sequential number )                     
    1 NEEDED   100 /MOD SWAP  10000 * + ;   ( move YY to front )
: NEW.TRIAD?  ( block#\seq date -- )                            
    ON.ERROR  LAST.ERROR @ 27 -           ( print if stamp bad )
        IF RETRY OFF ABORT ELSE LAST.ERROR OFF OVER TRIAD THEN  
    ELSE OVER DUP 3+ MAX.BLK# MIN SWAP DO                       
        I BLOCK 51 + NUMBER DATE>SEQ        ( date on stamp )   
        OVER > IF I TRIAD  LEAVE THEN       ( print it? )       
    LOOP  THEN 2DROP ;                                          
FORTH DEFINITIONS                                               
: SINCE  ( MMDDYY -- | prints triads stamped since date )       
    EDITOR  DECIMAL  DATE>SEQ  WATCH SET.CURSOR  ( set up )     
    MAX.BLK# 1+ 0 DO                             ( all blocks ) 
        I OVER NEW.TRIAD? 3 +LOOP                ( check 'em )  
    DROP  INIT.CURSOR ;                          ( tidy )       
