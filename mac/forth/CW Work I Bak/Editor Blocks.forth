════════════════════════════════════════════════════════════════   SCREEN 000
( File: "Editor Blocks" )                         ( 072384 DFC) 
                                                                
The MacFORTH Level 2 editor has been enhanced to hilight the    
"Edit" menu more appropriately to the standard Mac interface.   
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 001
( Editor Load Block )                             ( 041684 DFC) 
decimal         FORTH DEFINITIONS                               
                                                                
CR ." Loading Editor Routines..."                               
                                                                
: DATE  ( --- | keeps track of the stamp )                      
   ."  ( MMDDYY XXX) "   ;                                      
  4096 MINIMUM.OBJECT                                           
  730 VOCABULARY EDITOR                                         
                                                                
  EDITOR DEFINITIONS                                            
 2 22 THRU                                                      
                                                                
FORTH DEFINITIONS                                               
   ' EDITOR @ PURGABLE  ?HEAP.SIZE DROP  ( purge the vocab )    
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( Edit Window Creation )  DECIMAL                 ( 072384 DFC) 
FORTH DEFINITIONS                                               
                                                                
NEW.WINDOW EDIT.WINDOW                                          
   " Editor Window "     EDIT.WINDOW W.TITLE                    
  39 10  OVER  256 + OVER   454 17 +  +                         
              EDIT.WINDOW  W.BOUNDS                             
   SYS.WINDOW EDIT.WINDOW W.BEHIND                              
   CLOSE.BOX  SCROLL.UP/DOWN  +   TEXT.RECORD +                 
              EDIT.WINDOW W.ATTRIBUTES                          
      EDIT.WINDOW ADD.WINDOW                                    
                                                                
EDITOR DEFINITIONS                                              
CREATE EDIT-FLAG 0 ,       4 CONSTANT <EDIT.MENU>               
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( @TE.PTRS SCAN.CR  LINE>PAD ) HEX                ( 030884 DFC) 
: @TE.PTRS  ( -- addr\cnt | returns the $ addr of the text )    
    EDIT.WINDOW  TERECORD  DUP 3E + @@  SWAP 3C + W@  ;         
: SCAN.CR  ( addr\cnt -- offset to cr or eol )                  
    SWAP OVER  0                                                
     DO    DUP I+ C@  0D =                                      
            IF  SWAP DROP I SWAP  LEAVE  THEN                   
     LOOP  DROP  ;    DECIMAL                                   
                                                                
: LINE>PAD  ( addr\cnt -- addr'\cnt' )     DUP 0>               
     IF    0 PAD C!  2DUP  C/L MIN  PAD 1+ SWAP  CMOVE          
           2DUP  SCAN.CR  1+                                    
           DUP>R  -  ( cnt )  SWAP R@ + SWAP  ( addr )          
           R>  DUP C/L >                                        
             IF   DROP C/L   ELSE  1-  THEN   PAD C!            
      THEN  ;                                                   
════════════════════════════════════════════════════════════════   SCREEN 004
( LINE>BLOCK  LINES>BLOCK )                       ( 072384 DFC) 
                                                                
: LINE>BLOCK  ( addr\cnt\line# -- addr'\cnt' | transfer one )   
              ( line of text to the block buffer            )   
   C/L *  SCR @  BLOCK +  >R                                    
   LINE>PAD    PAD COUNT  R> SWAP CMOVE   ;                     
                                                                
: LINES>BLOCK  ( --- | transfer text to the block buffer )      
    SCR @  BLOCK  B/BUF BLANKS  @TE.PTRS  16 0                  
     DO    DUP 0>   IF   I LINE>BLOCK   ELSE LEAVE  THEN        
     LOOP  DROP DROP  UPDATE   ;                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
(   (DONE  TEXT.UPDATE )                          ( 072384 DFC) 
                                                                
: (DONE)   ( --- | save text to block buffer and write to disc) 
    BLOCK-FILE @  ?OPEN   NOT  ERROR"  File Not Opened!!"       
    GET.WINDOW  EDIT.WINDOW =  NOT                              
        ERROR"  Use From Editor Only!!"                         
    LINES>BLOCK  SAVE-BUFFERS   ;                               
                                                                
: TEXT.UPDATE ( --- | updates the visible region of window *)   
     GET.WINDOW TERECORD +TVISRECT TEUPDATE   ;                 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 006
(  Text Edit Window Title Manipulation )          ( 072384 DFC) 
CREATE BTITLE$                                                  
       ," Blk#      of     ; File=                          "   
                                                                
6 FIELD +BLK#    14 FIELD +TOT.BLKS   25 FIELD +FILE$           
                                                                
: SCR#>$   ( --- | move the screen number to the title string ) 
    BTITLE$ +BLK# 4 BLANKS                                      
    SCR @ <# #S #>  BTITLE$ +BLK#  SWAP    4 MIN    CMOVE  ;    
                                                                
: TOT#>$   ( --- | move total # of blks to title string )       
    BTITLE$ +TOT.BLKS 4 BLANKS                                  
    BLOCK-FILE @  GET.EOF B/BUF / 1-   0 MAX   <# #S #>         
    BTITLE$ +TOT.BLKS   SWAP      4 MIN     CMOVE  ;            
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
(  Text Edit Window Title Manipulation )          ( 072384 DFC) 
: FILE.NAME>$  ( --- | move file name to title string )         
    BTITLE$ +FILE$ 25 BLANKS                                    
    BLOCK-FILE @  @FILE.NAME                                    
    COUNT  BTITLE$ +FILE$  SWAP  25 MIN CMOVE   ;               
                                                                
: SET.BTITLE$  ( --- | set edit window title to title string )  
    SCR#>$  TOT#>$  FILE.NAME>$                                 
    BTITLE$ EDIT.WINDOW  SET.WTITLE  ;                          
                                                                
: MAX.BLK#  ( -- max blk# )                                     
     BLOCK-FILE @ GET.EOF B/BUF /  1-  0 MAX ( for scr 0 )  ;   
HEX                                                             
: (REVERT)  ( --- )     7FFFFFFF SCR @  BLOCK 4- !   ;          
DECIMAL                                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( ,TEXT BLOCK>PAD  (EDIT   )  DECIMAL             ( 072384 DFC) 
                                                                
: ,TEXT  ( addr\cnt -- | move specified string to PAD )         
    DUP>R   PAD 2+  PAD W@ +  SWAP CMOVE  R> PAD W@ +  PAD W! ; 
                                                                
: ((BLOCK>LINES))  ( block# -- | MUST BE IN EDIT.WINDOW!!!!! )  
                   ( copies contents of a block to a TE record )
    0 PAD W!  BLOCK 16 0                                        
     DO  DUP I C/L * +  C/L ,TEXT  CRLF 1 ,TEXT  LOOP  DROP     
    PAD 2+  PAD W@  TESET.TEXT                                  
    R# @ 0 MAX 1023 MIN  DUP C/L /  +  DUP   TESET.SELECT  ;    
                                                                
: (EDIT)  ( block# -- | sets up for editing the specified block)
    0 MAX  MAX.BLK# MIN  SCR !   SET.BTITLE$                    
    SCR @ ((BLOCK>LINES))   TEXT.UPDATE    0 HILITE.MENU  ;     
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( TEUNDO +/-UNDO (CLEAN STAMP )                   ( 061484 DFC) 
                                                                
: TEUNDO  ( --- )  SCR @ ((BLOCK>LINES)) TEXT.UPDATE  ;         
                                                                
: -UNDO  ( --- )  1  0 <EDIT.MENU>  ITEM.ENABLE  ;              
: +UNDO  ( --- )  1 -1 <EDIT.MENU>  ITEM.ENABLE  ;              
                                                                
: (CLEAN)  ( --- )  SCR @ BLOCK  B/BUF BLANKS  UPDATE TEUNDO  ; 
                                                                
: (STAMP)  ( --- )                                              
    INITIALS ' DATE 13 + DUP>R  3 CMOVE                         
    R@    C@  126 MIN 32 MAX  R@ C!   ( make SURE the initials )
    R@ 1+ C@  126 MIN 32 MAX  R@ 1+ C!  (  are valide ASCII    )
    R@ 2+ C@  126 MIN 32 MAX  R> 2+ C!  (  characters          )
    @CLOCK ?DAYS 0 FMT.DATE$  ' DATE 6+ SWAP  CMOVE             
    ' DATE 3+  SCR @ BLOCK  49 +  15 CMOVE UPDATE  ;            
════════════════════════════════════════════════════════════════   SCREEN 010
( EDIT.ITEMS  +/-EDIT.ITEMS  DO.EDIT ENTER EDIT ) ( 072384 DFC) 
HEX                                                             
CREATE EDIT.ITEMS  0307090A ,  0E000000 ,                       
DECIMAL                                                         
: +EDIT.ITEMS  ( --- )  EDIT.ITEMS COUNT  0                     
     DO   DUP I+ C@  -1  <EDIT.MENU>  ITEM.ENABLE  LOOP  DROP ; 
: -EDIT.ITEMS  ( --- )  EDIT.ITEMS COUNT  0                     
     DO   DUP I+ C@   0  <EDIT.MENU>  ITEM.ENABLE  LOOP  DROP ; 
                                                                
: DO.EDIT  ( --- )   EDIT-FLAG ON   +EDIT.ITEMS  -UNDO          
    12 " Exit Edit" <EDIT.MENU> SET.ITEM$  SCR @  (EDIT)  ;     
                                                                
: ENTER.EDIT  ( --- )  OBJECT.ROOM  1200 <                      
    ABORT"  Not Enough Room For Editor!"   DO.EDIT   ;          
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 011
( "Sys" Edit Menu )                               ( 072384 DFC) 
FORTH DEFINITIONS                                               
: EDIT  ( block# -- )                                           
    SCR ! EDITOR  EDIT.WINDOW  SELECT.WINDOW  EVENT.LOOP  ;     
                                                                
: SYS.EDIT.MENU  ( --- )  EDITOR  -EDIT.ITEMS   +UNDO           
 12 " Enter Edit" <EDIT.MENU> SET.ITEM$                         
  <EDIT.MENU> MENU.SELECTION:                                   
    CASE 1 OF   3 SYSTEM.EDIT DROP           ENDOF              
         3 OF   0 SYSTEM.EDIT DROP           ENDOF              
         4 OF   1 SYSTEM.EDIT DROP           ENDOF              
         5 OF   2 SYSTEM.EDIT DROP           ENDOF              
        12 OF   SCR @ 0 MAX  MAX.BLK#  MIN                      
                DUP SCR !  EDIT              ENDOF              
    ENDCASE  0 HILITE.MENU  ;                                   
EDITOR DEFINITIONS                                              
════════════════════════════════════════════════════════════════   SCREEN 012
( TE Scrap Copy to Desk Scrap )                   ( 072384 DFC) 
 HEX    AB0 CONSTANT TESCRAP.LEN                                
        AB4 CONSTANT TESCRAP.HANDLE                             
: PUT.TESCRAP  ( --- | if desk text scrap is availble, it is )  
               ( copied to the TE scrap )                       
     TESCRAP.LEN W@  ( check if scrap is available )            
       IF    ZERO.SCRAP  DROP TESCRAP.HANDLE @@ TESCRAP.LEN W@  
             "TEXT  PUT.SCRAP   DUP IO-RESULT !                 
               IF  ?FILE.ERROR  THEN                            
       THEN   ;                                                 
                                                                
: EXIT.EDIT  ( --- )   PUT.TESCRAP OBJECT.ROOM  4B0 < NOT       
    IF    EDIT-FLAG OFF    SYS.EDIT.MENU                        
          LINES>BLOCK SAVE-BUFFERS  BLOCK-FILE @ FLUSH.FILE     
          TEDEACTIVATE     0 HILITE.MENU                        
    THEN    ;                        DECIMAL                    
════════════════════════════════════════════════════════════════   SCREEN 013
( TEXT SCRAP I/O )                                              
hex                                                             
                                                                
: GET.TESCRAP  ( --- | if desk text scrap is availble, it is )  
               ( copied to the TE scrap )                       
     SCRAP.LEN @  0>                                            
     IF TESCRAP.HANDLE @ 0 RESIZE.HANDLE DROP TESCRAP.LEN OFF   
        0   "TEXT   GET.SCRAP  DUP 0>                           
        IF  DROP TESCRAP.HANDLE  @ "TEXT    GET.SCRAP           
            TESCRAP.LEN W!                                      
          ELSE DUP IO-RESULT ! FFFFFF9A -                       
             IF ?FILE.ERROR THEN                                
         THEN                                                   
      THEN   ;                                                  
DECIMAL                                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 014
( EDIT MENU )                                     ( 071984 DFC) 
FORTH DEFINITIONS                                               
                                                                
: EDIT.MENU  ( --- )   EDITOR                                   
    <EDIT.MENU> DELETE.MENU                                     
    <EDIT.MENU> 1+  " Edit"  <EDIT.MENU> NEW.MENU               
    " Undo/Z;-("                <EDIT.MENU> APPEND.ITEMS        
    " Cut/X;Copy/C;Paste/V;-("  <EDIT.MENU> APPEND.ITEMS        
    " Stamp/S;-("               <EDIT.MENU> APPEND.ITEMS        
    " Clean;Revert;-("          <EDIT.MENU> APPEND.ITEMS        
    " Enter Edit/E;"            <EDIT.MENU> APPEND.ITEMS        
    ( " -(;Load/L;"             <EDIT.MENU> APPEND.ITEMS )      
    DRAW.MENU.BAR   ;                                           
                                                                
 EDITOR DEFINITIONS                                             
EDIT.MENU                                                       
════════════════════════════════════════════════════════════════   SCREEN 015
( DO.EDIT.MENU )                                  ( 071784 DFC) 
: DO.EDIT.MENU  ( --- )    -UNDO +EDIT.ITEMS                    
 <EDIT.MENU> MENU.SELECTION:                                    
    CASE 1 OF               TEUNDO   -UNDO          ENDOF       
         3 OF  LINES>BLOCK  TECUT    +UNDO          ENDOF       
         4 OF  LINES>BLOCK  TECOPY   -UNDO          ENDOF       
         5 OF  LINES>BLOCK  TEPASTE  +UNDO          ENDOF       
         7 OF  (DONE) (STAMP) SCR @ (EDIT)          ENDOF       
         9 OF  LINES>BLOCK  (CLEAN)  -UNDO          ENDOF       
        10 OF  (REVERT) SCR @ (EDIT) -UNDO          ENDOF       
        12 OF  EXIT.EDIT  0 HILITE.MENU ABORT       ENDOF       
     {   14 OF  EXIT.EDIT  0 HILITE.MENU  SCR @ LOAD            
               GET.WINDOW EDIT.WINDOW =                         
                 IF   SYS.WINDOW SELECT.WINDOW THEN ENDOF  }    
    ENDCASE  0 HILITE.MENU  ;                                   
-UNDO   -EDIT.ITEMS                                             
════════════════════════════════════════════════════════════════   SCREEN 016
( @VPOS !VPOS SHOW.BLOCK )                        ( 070484 DFC) 
                                                                
: @VPOS ( -- current pos | returns current control value )      
    GET.WINDOW +VBAR @  GET.CONTROL  ;                          
                                                                
: !VPOS ( pos -- | sets the control value )                     
    GET.WINDOW +VBAR @  SWAP  SET.CONTROL                       
    GET.WINDOW SHOW.CONTROLS ;                                  
                                                                
: SHOW.BLOCK ( --- | display current block )                    
    (DONE)  @VPOS (EDIT)   -UNDO  ;                             
                                                                
EXIT ******                                                     
We use the value of the control as the current block for editing
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 017
( +BLOCK DO.CTRL )                                ( 070484 DFC) 
                                                                
: +BLOCK  ( increment -- | increments the control )             
    @VPOS +  !VPOS     ( set the control value )                
    THIS.CONTROL @  THIS.PART @  HILITE.CONTROL  ( hilite part )
     EDIT.WINDOW SHOW.CONTROLS    SHOW.BLOCK  ( display block ) 
    THIS.CONTROL @ 0 HILITE.CONTROL   ( un-hilite part )        
     EDIT.WINDOW SHOW.CONTROLS    ;                             
                                                                
: DO.CTRL  ( increment -- | bump control & update scroll bar )  
    BEGIN  MOUSE.BUTTON                                         
     WHILE   ( while the button is down )   DUP  +BLOCK         
    REPEAT  DROP  ;                                             
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 018
( DO.EDIT.CONTROL )                               ( 070484 DFC) 
: DO.THUMB  ( --- | track the thumb )                           
    THIS.CONTROL @  @MOUSE  TRACK.CONTROL  DROP                 
    EDIT.WINDOW SHOW.CONTROLS  SHOW.BLOCK  ;                    
                                                                
: DO.EDIT.CONTROL  ( --- | handle controls for the edit window )
   @MOUSE.DN  GET.WINDOW  FIND.CONTROL  ?DUP                    
     IF   SWAP DROP  ( control handle )                         
           CASE  IN.THUMB     OF  DO.THUMB     ENDOF            
                 UP.BUTTON    OF  -1 DO.CTRL   ENDOF            
                 DOWN.BUTTON  OF   1 DO.CTRL   ENDOF            
                 PAGE.UP      OF  -3 DO.CTRL   ENDOF            
                 PAGE.DOWN    OF   3 DO.CTRL   ENDOF            
           ENDCASE                                              
     THEN   ;                                                   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 019
( DO.EDIT.MOUSE SET.EDIT.CONTROLS )               ( 070484 DFC) 
                                                                
: DO.EDIT.MOUSE  ( --- | handle the mouse in the edit window )  
   ?IN.CONTROL  IF  DO.EDIT.CONTROL  ELSE  TEXT.CLICK  THEN ;   
                                                                
: SET.EDIT.CONTROLS  ( --- | setup the control bar )            
    EDIT.WINDOW +VBAR @               ( control handle )        
      0                               ( minimum blk# )          
      BLOCK-FILE @ >R  R@ GET.EOF B/BUF /  1- 0 MAX             
      DUP  R> >FCB  +MAX.BLK# !       ( update max blk# )       
      DUP 1 <                                                   
        IF  EXIT.EDIT  1  ABORT"  No Blocks Allocated!"  THEN   
      SET.CONTROL.RANGE                                         
    SCR @ !VPOS   ;                                             
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 020
( ADJUST.CURSOR EDIT.BLOCK )                      ( 061484 DFC) 
: ADJUST.CURSOR  ( --- | adjust cursor for ibeam w/in editor )  
     @MOUSE GET.WINDOW +WCBOUNDS PTINRECT                       
       IF  IBEAM SET.CURSOR   ELSE  INIT.CURSOR THEN  ;         
: EDIT.BLOCK  ( --- )                                           
    GET.TESCRAP  SET.EDIT.CONTROLS DO.EDIT.MENU                 
    DISCARD.UPDATES    TEACTIVATE                               
    BEGIN  ADJUST.CURSOR  TEIDLE  DO.EVENTS                     
     CASE  MOUSE.DOWN   OF  DO.EDIT.MOUSE     ENDOF             
            ?KEYSTROKE                                          
              IF   DUP 9 =  OVER 3 = OR                         
                      IF  ( Tab or Enter ) DROP BL THEN         
                   TEKEY                                        
              THEN                                              
     ENDCASE                                                    
    AGAIN   ;                                                   
════════════════════════════════════════════════════════════════   SCREEN 021
( TEXT.ACTIVATE  TEXT.EDIT )                      ( 090984 DRC) 
                                                                
: TEXT.ACTIVATE  ( flag -- | flag from window activation )      
    IF    EDIT.WINDOW SHOW.WINDOW   BLOCK-FILE @  ?OPEN NOT     
            ABORT"  File Closed!! "                             
          ENTER.EDIT  EDIT.BLOCK                                
    ELSE  EXIT.EDIT                                             
    THEN  ;                                                     
FORTH DEFINITIONS                                               
: TEXT.EDIT  ( edit field -- | edits until done )  EDITOR       
    DUP @ SWAP 4+ @ SWAP OVER +WREFCON !                        
    DUP ON.ACTIVATE TEXT.ACTIVATE  DUP ON.UPDATE  TEXT.UPDATE   
    DUP  TERECORD   -1 OVER 72 + W!    4 SWAP 74 + W!           
     ( CR only  &   monaco text font )                          
    GET.WINDOW >R WINDOW CRLF 1 TEINSERT R> WINDOW ;            
                                                                
════════════════════════════════════════════════════════════════   SCREEN 022
( Create ED.TEXT )                                ( 061784 DRC) 
                                                                
EDITOR DEFINITIONS                                              
                                                                
 SYS.EDIT.MENU               ( use "sys" version of menu )      
                                                                
 4 EDIT.WINDOW +WCBOUNDS +!  ( move visible rect over 4 pixels )
                                                                
EDIT.WINDOW +WCBOUNDS DUP EDIT.WINDOW  TEXT.FIELD ED.TEXT       
                                                                
ED.TEXT  TEXT.EDIT                                              
                                                                
SYS.WINDOW SELECT.WINDOW                                        
                                                                
                                                                
                                                                
