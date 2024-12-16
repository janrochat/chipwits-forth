════════════════════════════════════════════════════════════════   SCREEN 001
                                                                
( Editor Load Block )                             ( 041684 DFC) 
                                                                
CR ." Loading Editor Routines..."                               
                                                                
: DATE  ."  ( MMDDYY XXX) "   ;                                 
                                                                
  730 VOCABULARY EDITOR                                         
  EDITOR DEFINITIONS                                            
( room )                                                        
 2 22 THRU                                                      
( room )                                                        
                                                                
FORTH DEFINITIONS  ( room )                                     
   ' EDITOR @ PURGABLE  ?HEAP.SIZE DROP                         
: it ;                                                          
════════════════════════════════════════════════════════════════   SCREEN 002
( Edit Window Creation )  DECIMAL                 ( 040484 DFC) 
                                                                
FORTH DEFINITIONS                                               
NEW.WINDOW EDIT.WINDOW                                          
   " Editor Window "     EDIT.WINDOW W.TITLE                    
  39 10  OVER  260  + OVER   454 17 +  +                        
              EDIT.WINDOW  W.BOUNDS                             
   SYS.WINDOW EDIT.WINDOW W.BEHIND                              
   CLOSE.BOX  SCROLL.UP/DOWN  +   TEXT.RECORD +                 
              EDIT.WINDOW W.ATTRIBUTES                          
                                                                
EDIT.WINDOW ADD.WINDOW                                          
                                                                
EDITOR DEFINITIONS                                              
CREATE EDIT-FLAG 0 ,       4 CONSTANT <EDIT.MENU>               
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( @TE.PTRS SCAN.CR  LINE>PAD ) HEX                ( 030884 DFC) 
: @TE.PTRS  ( -- addr\cnt *)                                    
    EDIT.WINDOW  TERECORD  DUP 3E + @@  SWAP 3C + W@  ;         
: SCAN.CR  ( addr\cnt -- offset to cr or eol *)                 
    SWAP OVER  0                                                
     DO    DUP I+ C@  0D =                                      
            IF  SWAP DROP I SWAP  LEAVE  THEN                   
     LOOP  DROP  ;    DECIMAL                                   
                                                                
: LINE>PAD  ( addr\cnt -- addr'\cnt' *)     DUP 0>              
     IF    0 PAD C!  2DUP  C/L MIN  PAD 1+ SWAP  CMOVE          
           2DUP  SCAN.CR  1+                                    
           DUP>R  -  ( cnt )  SWAP R@ + SWAP  ( addr )          
           R>  DUP C/L >                                        
             IF   DROP C/L   ELSE  1-  THEN   PAD C!            
      THEN  ;                                                   
════════════════════════════════════════════════════════════════   SCREEN 004
( LINE>BLOCK  (DONE )                              ( 031384 DFC)
                                                                
: LINE>BLOCK  ( addr\cnt\line# -- addr'\cnt' )                  
   C/L *  SCR @  BLOCK +  >R                                    
   LINE>PAD    PAD COUNT  R> SWAP CMOVE   ;                     
                                                                
: LINES>BLOCK  ( --- )                                          
    SCR @  BLOCK  B/BUF BLANKS  @TE.PTRS  16 0                  
     DO    DUP 0>   IF   I LINE>BLOCK   ELSE LEAVE  THEN        
     LOOP  DROP DROP  UPDATE   ;                                
                                                                
: (DONE)   ( --- )                                              
    BLOCK-FILE @  ?OPEN   NOT  ERROR"  File Not Opened!!"       
    GET.WINDOW  EDIT.WINDOW =  NOT                              
        ERROR"  Use From Editor Only!!"                         
    LINES>BLOCK  SAVE-BUFFERS   ;                               
════════════════════════════════════════════════════════════════   SCREEN 005
( TEXT.UPDATE )                                   ( 031184 DFC) 
                                                                
: TEXT.UPDATE ( --- | updates the visible region of window *)   
     GET.WINDOW TERECORD +TVISRECT TEUPDATE   ;                 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 006
( Text Edit Window Title Manipulation )           ( 061684 DFC) 
CREATE BTITLE$                                                  
," Blk#      of     ; File=                          "          
                                                                
6 FIELD +BLK#    14 FIELD +TOT.BLKS   25 FIELD +FILE$           
                                                                
: SCR#>$   ( --- )  BTITLE$ +BLK# 4 BLANKS                      
    SCR @ <# #S #>  BTITLE$ +BLK#  SWAP    4 MIN    CMOVE  ;    
                                                                
: TOT#>$   ( --- )  BTITLE$ +TOT.BLKS 4 BLANKS                  
    BLOCK-FILE @  GET.EOF B/BUF / 1-   0 MAX   <# #S #>         
    BTITLE$ +TOT.BLKS   SWAP      4 MIN     CMOVE  ;            
                                                                
: FILE.NAME>$  ( --- )   BTITLE$ +FILE$ 25 BLANKS               
    BLOCK-FILE @  @FILE.NAME                                    
    COUNT  BTITLE$ +FILE$  SWAP  25 MIN CMOVE   ;               
════════════════════════════════════════════════════════════════   SCREEN 007
( SET.BTITLE$  MAX.BLK# (REVERT  )                ( 040184 DFC) 
                                                                
: SET.BTITLE$  ( --- )                                          
    SCR#>$  TOT#>$  FILE.NAME>$                                 
    BTITLE$ EDIT.WINDOW  SET.WTITLE  ;                          
                                                                
: MAX.BLK#  ( -- max blk# *)                                    
     BLOCK-FILE @ GET.EOF B/BUF /  1-  0 MAX ( for scr 0 )  ;   
                                                                
HEX                                                             
: (REVERT)  ( --- )     7FFFFFFF SCR @  BLOCK 4- !   ;          
DECIMAL                                                         
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( ,TEXT BLOCK>PAD  (EDIT   )  DECIMAL             ( 061484 DFC) 
                                                                
: ,TEXT  ( addr\cnt -- )                                        
    DUP>R   PAD 2+  PAD W@ +  SWAP CMOVE  R> PAD W@ +  PAD W! ; 
                                                                
: ((BLOCK>LINES))  ( block# -- | MUST BE IN EDIT.WINDOW!!!!! *) 
    0 PAD W!  BLOCK 16 0                                        
     DO  DUP I C/L * +  C/L ,TEXT  CRLF 1 ,TEXT  LOOP  DROP     
    PAD 2+  PAD W@  TESET.TEXT                                  
    R# @ 0 MAX 1023 MIN  DUP C/L /  +  DUP   TESET.SELECT  ;    
                                                                
: (EDIT)  ( block# -- *)                                        
    0 MAX  MAX.BLK# MIN  SCR !                                  
    SET.BTITLE$   SCR @ ((BLOCK>LINES))                         
    TEXT.UPDATE  ;                                              
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( TEUNDO +/-UNDO (CLEAN STAMP )                   ( 061484 DFC) 
                                                                
: TEUNDO  ( --- )  SCR @ ((BLOCK>LINES)) TEXT.UPDATE  ;         
                                                                
: -UNDO  ( --- )  1  0 <EDIT.MENU>  ITEM.ENABLE  ;              
: +UNDO  ( --- )  1 -1 <EDIT.MENU>  ITEM.ENABLE  ;              
                                                                
: (CLEAN)  ( --- )  SCR @ BLOCK  B/BUF BLANKS  UPDATE TEUNDO  ; 
                                                                
: (STAMP)  ( --- )                                              
    INITIALS ' DATE 13 + DUP>R  3 CMOVE                         
    R@    C@  126 MIN 32 MAX  R@ C!                             
    R@ 1+ C@  126 MIN 32 MAX  R@ 1+ C!                          
    R@ 2+ C@  126 MIN 32 MAX  R> 2+ C!                          
    @CLOCK ?DAYS 0 FMT.DATE$  ' DATE 6+ SWAP  CMOVE             
    ' DATE 3+  SCR @ BLOCK  49 +  15 CMOVE UPDATE  ;            
════════════════════════════════════════════════════════════════   SCREEN 010
( EDIT.ITEMS  +/-EDIT.ITEMS  DO.EDIT ENTER EDIT )               
HEX                                                             
CREATE EDIT.ITEMS  06030405 ,  07090A00 ,                       
DECIMAL                                                         
: +EDIT.ITEMS  ( --- )                                          
    EDIT.ITEMS COUNT  0                                         
     DO   DUP I+ C@  -1  <EDIT.MENU>  ITEM.ENABLE  LOOP  DROP ; 
: -EDIT.ITEMS  ( --- )                                          
    EDIT.ITEMS COUNT  3                                         
     DO   DUP I+ C@   0  <EDIT.MENU>  ITEM.ENABLE  LOOP  DROP ; 
                                                                
: DO.EDIT  ( --- )   EDIT-FLAG ON   +EDIT.ITEMS  -UNDO          
    12 " Exit Edit" <EDIT.MENU> SET.ITEM$   SCR @  (EDIT)  ;    
                                                                
: ENTER.EDIT  ( --- )  OBJECT.ROOM  1200 <                      
    ABORT"  Not Enough Room For Editor!"   DO.EDIT   ;          
════════════════════════════════════════════════════════════════   SCREEN 011
( SYS EDIT MENU  )                                ( 062284 DFC) 
FORTH DEFINITIONS                                               
: EDIT  ( block# -- )                                           
    SCR !   EDITOR  EDIT.WINDOW  SELECT.WINDOW  EVENT.LOOP  ;   
                                                                
EDITOR DEFINITIONS                                              
: SYS.EDIT.MENU  ( --- )   -EDIT.ITEMS   +UNDO                  
 12 " Enter Edit" <EDIT.MENU> SET.ITEM$                         
  <EDIT.MENU> MENU.SELECTION:  0 HILITE.MENU                    
    CASE 1 OF   0 SYSTEM.EDIT DROP    ENDOF                     
         3 OF   2 SYSTEM.EDIT DROP    ENDOF                     
         4 OF   3 SYSTEM.EDIT DROP    ENDOF                     
         5 OF   4 SYSTEM.EDIT DROP    ENDOF                     
        12 OF   SCR @ EDIT            ENDOF                     
          1 sysbeep                                             
         ENDCASE  ;                                             
════════════════════════════════════════════════════════════════   SCREEN 012
( TE SCRAP COPT TO DESK SCRAP )                   ( 062084 DFC) 
 HEX    AB0 CONSTANT TESCRAP.LEN                                
        AB4 CONSTANT TESCRAP.HANDLE                             
: PUT.TESCRAP  ( --- | if desk scrap is available, it is )      
               ( copied to the te scrap )                       
     TESCRAP.LEN W@  ( scrap available? )                       
     IF    ZERO.SCRAP  DROP TESCRAP.HANDLE @@ TESCRAP.LEN W@    
          "TEXT  PUT.SCRAP  IO-RESULT !  ?FILE.ERROR            
     THEN   ;                                                   
                                                                
: EXIT.EDIT  ( --- )   PUT.TESCRAP OBJECT.ROOM  4B0 < NOT       
    IF    EDIT-FLAG OFF    SYS.EDIT.MENU                        
          LINES>BLOCK SAVE-BUFFERS  BLOCK-FILE @ FLUSH.FILE     
          TEDEACTIVATE                                          
    THEN    ;                                                   
DECIMAL                                                         
════════════════════════════════════════════════════════════════   SCREEN 013
( TEXT SCRAP I/O )                                              
hex                                                             
                                                                
: GET.TESCRAP   ( --- | if desk scrap is available, it is )     
                ( copied to the te scrap )                      
     SCRAP.LEN @  0>                                            
     IF   TESCRAP.HANDLE @ 0 RESIZE.HANDLE DROP TESCRAP.LEN OFF 
          0   "TEXT   GET.SCRAP  DUP 0>                         
          IF   DROP TESCRAP.HANDLE  @ "TEXT    GET.SCRAP        
               TESCRAP.LEN W!                                   
          ELSE DUP IO-RESULT ! FFFFFF9A -                       
                IF   ?FILE.ERROR  THEN                          
         THEN                                                   
      THEN   ;                                                  
DECIMAL                                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 014
( EDIT MENU )                                     ( 033184 DFC) 
                                                                
: EDIT.MENU  ( --- )                                            
    <EDIT.MENU> DELETE.MENU                                     
    <EDIT.MENU> 1+  " Edit"   <EDIT.MENU> NEW.MENU              
    " Undo/Z;-("                <EDIT.MENU> APPEND.ITEMS        
    " Cut/X;Copy/C;Paste/V;-("  <EDIT.MENU> APPEND.ITEMS        
    " Stamp/S;-("               <EDIT.MENU> APPEND.ITEMS        
    " Clean;Revert;-("          <EDIT.MENU> APPEND.ITEMS        
    " Enter Edit/E;"            <EDIT.MENU> APPEND.ITEMS        
    DRAW.MENU.BAR   ;                                           
                                                                
                                                                
EDIT.MENU                                                       
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 015
( DO.EDIT.MENU )                                  ( 062084 DFC) 
                                                                
: DO.EDIT.MENU  ( --- )    -UNDO +EDIT.ITEMS                    
 <EDIT.MENU> MENU.SELECTION:  0 HILITE.MENU                     
    CASE 1 OF               TEUNDO   -UNDO ENDOF                
         3 OF  LINES>BLOCK  TECUT    +UNDO ENDOF                
         4 OF  LINES>BLOCK  TECOPY   -UNDO ENDOF                
         5 OF  LINES>BLOCK  TEPASTE  +UNDO ENDOF                
         7 OF  (DONE) (STAMP) SCR @ (EDIT) ENDOF                
         9 OF  LINES>BLOCK  (CLEAN)  -UNDO ENDOF                
        10 OF  (REVERT) SCR @ (EDIT) -UNDO ENDOF                
        12 OF  EXIT.EDIT   ABORT           ENDOF                
    ENDCASE  ;                                                  
                                                                
     -UNDO   -EDIT.ITEMS                                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 016
( ?VPOS SHOW.BLOCK +CONTROL )                     ( 040484 DFC) 
                                                                
: @VPOS ( -- current pos )   GET.WINDOW +VBAR @  GET.CONTROL  ; 
                                                                
: !VPOS ( pos -- )                                              
    GET.WINDOW +VBAR @  SWAP  SET.CONTROL                       
    GET.WINDOW SHOW.CONTROLS ;                                  
                                                                
: SHOW.BLOCK ( --- | display current block )                    
    (DONE)  @VPOS (EDIT)   -UNDO  ;                             
                                                                
: +BLOCK  ( c handle\increment -- | bumps control )             
    SWAP GET.CONTROL +  !VPOS   SHOW.BLOCK    ;                 
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 017
( UP.BLOCK DOWN.BLOCK  UP.PAGE DOWN.PAGE )        ( 041684 DFC) 
                                                                
: UP.BLOCK  ( c handle -- | track up button )                   
    BEGIN  MOUSE.BUTTON  WHILE  DUP  -1 +BLOCK  REPEAT  DROP  ; 
                                                                
: DOWN.BLOCK  ( c handle -- | track down button  )              
    BEGIN  MOUSE.BUTTON  WHILE  DUP   1 +BLOCK  REPEAT  DROP  ; 
                                                                
: UP.PAGE  ( c handle -- | track up page  )                     
    BEGIN  MOUSE.BUTTON  WHILE  DUP  -3 +BLOCK  REPEAT  DROP  ; 
                                                                
: DOWN.PAGE  ( c handle -- | track down page  )                 
    BEGIN  MOUSE.BUTTON  WHILE  DUP   3 +BLOCK  REPEAT  DROP  ; 
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 018
( DO.EDIT.CONTROL )                               ( 040484 DFC) 
: FOLLOW.CONTROL  ( chandle -- part code )                      
    GET.WINDOW  NO.CLIP  @MOUSE  TRACK.CONTROL                  
    GET.WINDOW CLIP>CONTENT ;                                   
: DO.EDIT.CONTROL  ( --- )                                      
   @MOUSE.DN  GET.WINDOW  FIND.CONTROL  ?DUP                    
     IF    CASE  IN.THUMB     OF  FOLLOW.CONTROL                
                                  GET.WINDOW SHOW.CONTROLS      
                                  SHOW.BLOCK          ENDOF     
                 UP.BUTTON    OF  UP.BLOCK            ENDOF     
                 DOWN.BUTTON  OF  DOWN.BLOCK          ENDOF     
                 PAGE.UP      OF  UP.PAGE             ENDOF     
                 PAGE.DOWN    OF  DOWN.PAGE           ENDOF     
             DROP   ( control handle )                          
           ENDCASE                                              
     THEN   ;                                                   
════════════════════════════════════════════════════════════════   SCREEN 019
( DO.EDIT.MOUSE SET.EDIT.CONTROLS )               ( 061684 DFC) 
: DO.EDIT.MOUSE  ( --- )                                        
    @MOUSE  GET.WINDOW +WCBOUNDS  PTINRECT                      
      IF    TEXT.CLICK                                          
      ELSE  DO.EDIT.CONTROL                                     
      THEN  ;                                                   
                                                                
: SET.EDIT.CONTROLS  ( --- )                                    
    EDIT.WINDOW +VBAR @               ( control handle )        
      0                               ( minimum blk# )          
      BLOCK-FILE @ >R  R@ GET.EOF B/BUF /  1- 0 MAX             
      DUP  R> >FCB  +MAX.BLK# !       ( update max blk# )       
      DUP 1 <                                                   
          IF  EXIT.EDIT  1  ABORT"  No Blocks Allocated!"  THEN 
      SET.CONTROL.RANGE                                         
    SCR @ !VPOS   ;                                             
════════════════════════════════════════════════════════════════   SCREEN 020
  ( EDIT.BLOCK )                                  ( 061484 DFC) 
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
( TEXT.ACTIVATE  TEXT.EDIT )                      ( 062084 DFC) 
                                                                
: TEXT.ACTIVATE  ( flag -- | flag from window activation *)     
    IF    EDIT.WINDOW SHOW.WINDOW   BLOCK-FILE @  ?OPEN NOT     
            ABORT"  File Closed!! "                             
          ENTER.EDIT  EDIT.BLOCK                                
    ELSE  EXIT.EDIT                                             
    THEN  ;                                                     
                                                                
: TEXT.EDIT  ( edit field -- | edits until done *)              
    DUP @ SWAP 4+ @ SWAP OVER +WREFCON !                        
    DUP ON.ACTIVATE TEXT.ACTIVATE  DUP ON.UPDATE  TEXT.UPDATE   
    DUP  TERECORD   -1 OVER 72 + W!    4 SWAP 74 + W!           
         ( CR only & monaco text font )                         
    GET.WINDOW >R WINDOW CRLF 1 TEINSERT R> WINDOW ;            
                                                                
════════════════════════════════════════════════════════════════   SCREEN 022
( Create ED.TEXT )                                ( 061784 DRC) 
                                                                
 SYS.EDIT.MENU               ( PUT UP SYS VERSION OF MENU )     
                                                                
 4 EDIT.WINDOW +WCBOUNDS +!  ( MOVE VISRECT IN 4 PIXELS)        
                                                                
EDIT.WINDOW +WCBOUNDS DUP EDIT.WINDOW  TEXT.FIELD ED.TEXT       
                                                                
ED.TEXT  TEXT.EDIT                                              
                                                                
SYS.WINDOW SELECT.WINDOW                                        
                                                                
                                                                
                                                                
                                                                
                                                                
