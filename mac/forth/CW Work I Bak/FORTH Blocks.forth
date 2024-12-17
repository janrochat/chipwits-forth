════════════════════════════════════════════════════════════════   SCREEN 001
( macforth system load up )                       ( 110184 dws) 
  ." Extending System..."                                       
  find resize.vocab not iftrue include" EXTENSION"              
 55 load ( custom stuff)  24 load 34 load IFEND                 
 SYS.WINDOW WINDOW  ( OPTIONS.MENU )                            
  ( SET.FENCE  )                                                
find options.menu iftrue options.menu ifend                     
here 1+ ," dws" initials 3 cmove -4 allot                       
  ( 4096 minimum.vocab )   ( 16384 minimum.object )             
 FIND EDIT.WINDOW         ( if editor has been snapshot, )      
   IFTRUE  2 LOAD    ( Just reconfigure Editor    )             
 ifend abort  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                   
 FIND EDIT.WINDOW         ( if editor has been snapshot, )      
   IFTRUE       2 LOAD    ( Just reconfigure Editor    )        
   OTHERWISE    INCLUDE" EDITOR BLOCKS"    IFEND                
ABORT ( go back to ok -- you MUST have this in your load block )
════════════════════════════════════════════════════════════════   SCREEN 002
( editor alternative load block)                                
                                                                
 FORTH DEFINITIONS                                              
                                                                
 cr  ." Reconfiguring Editor..."                                
 4096 minimum.object                                            
 edit.window add.window  ( add  EDITOR window )                 
                                                                
   ( and then create TEdit record )                             
                                                                
 edit.window +wcbounds dup edit.window text.field ed.text       
 ed.text text.edit                                              
                                                                
  edit.menu      do.events drop                                 
  sys.edit.menu  do.events drop                                 
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
                                                                
: DOUBLE.TEST  ( TESTS FOR DOUBLE CLICKS )                      
    BEGIN  DO.EVENTS MOUSE.DOWN  =  IF ?DOUBLE.CLICK CR . THEN  
     ?KEYSTROKE UNTIL  DROP ;                                   
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( Formatted DUMP of Memory )                      ( 030784 DFC) 
DECIMAL                                                         
  16 CONSTANT DUMP.WIDTH                                        
  VARIABLE  P-COUNT  ( count of 256 byte "pages"  )             
                                                                
: (RANGE) ( addr -- addr+dumpwidth\addr )                       
   DUMP.WIDTH  OVER  +  SWAP  ;                                 
                                                                
: HEADER  ( --- |  inserts header & pages as needed )           
    P-COUNT  @  1+  DUP  4  =  IF   0=  THEN  P-COUNT !         
    CR  5  SPACES  DUMP.WIDTH  0  DO  I  3  .R  LOOP  CR  ;     
                                                                
: ALPHA-FIELD ( addr --- | print all displayable  characters)   
     (RANGE)  DO  I  C@  DUP  31  <   IF DROP BL THEN EMIT      
              LOOP ;  -->                                       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
(    Formatted DUMP of Memory, Continued )        ( 061083 DFC) 
: HEX-FIELD   (RANGE)  DO  I  C@  3  .R  LOOP    ;              
                                                                
: 1-LINE   ( addr -- | dump 1 line, insert header if needed )   
    DUP   255  AND  0=  IF  HEADER  THEN                        
    DUP    5  .R                                                
    DUP  HEX-FIELD  SPACE  SPACE  ALPHA-FIELD    CR  ;          
                                                                
: DUMP   ( start\end -- | dump memory between start and end )   
    get.textsize >r 9 textsize                                  
     CR  3  P-COUNT  ! 1+  SWAP  DUP 255 AND                    
    IF HEADER THEN                                              
    BASE @ >R HEX DO I 1-LINE DUMP.WIDTH +LOOP R> BASE !        
    r> textsize ;                                               
: +DUMP   ( addr\cnt -- | dump cnt bytes starting at addr )     
    OVER +  DUMP  ;                                             
════════════════════════════════════════════════════════════════   SCREEN 010
( Block Copy Utilities )                                        
                                                                
: >>COPY  ( first\target\count -- | "forward copy" ) CR         
   0 DO GET.TEXTMODE >R  SRCCOPY TEXTMODE                       
         13 EMIT OVER . ." -> "  DUP .  R> TEXTMODE             
          OVER OVER   COPY    PAUSE  SWAP 1+ SWAP               
     1+ LOOP    DROP DROP  SAVE-BUFFERS  ;                      
                                                                
: <<COPY  ( first\target\count -- | "reverse copy" )  CR        
   DUP  >R +  SWAP  R>  DUP  >R  +  SWAP  R>  ( last scr's )    
   0 DO GET.TEXTMODE >R  SRCCOPY TEXTMODE                       
         13 EMIT SWAP 1- SWAP 1- OVER . ." ->"                  
         DUP .  R> TEXTMODE                                     
         OVER OVER    COPY PAUSE   SAVE-BUFFERS                 
      LOOP   DROP  DROP  ;                                      
1 +LOAD                                                         
════════════════════════════════════════════════════════════════   SCREEN 011
( ** Multiple Screen COPY Utility            ** ) ( 041084 DFC) 
                                                                
: CLEAR.BLOCKS ( first\last -- | clears specified blocks )      
    1+ SWAP  CR                                                 
    DO CR  I . ." Cleared "  I BLOCK 1024 BLANKS UPDATE         
    LOOP  SAVE-BUFFERS  ;                                       
                                                                
: COPY.BLOCKS  ( first\last\target -- | "normal copy" )         
    SWAP 3 PICK - 1+     ( convert to first\target\count )      
    >R  OVER OVER <  R> SWAP                                    
      IF  <<COPY   ELSE  >>COPY  THEN   ;                       
                                                                
 DECIMAL                                                        
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 012
( ** Block Transfer Routines ** )                 ( 041184 DFC) 
VARIABLE SRC-FILE        VARIABLE DEST-FILE                     
VARIABLE DEST-START                                             
VARIABLE SRC-START       VARIABLE SRC-END                       
                                                                
: ?ENTRY  ( addr -- )                                           
    5 INPUT.NUMBER  NOT  ABORT"  Block Transfer Aborted!!"      
    SWAP  ! ;                                                   
                                                                
: (XFER.BLOCKS)   ( --- )                                       
    FLUSH  SRC-END @ 1+  SRC-START @                            
     DO  FIRST  I SRC-FILE @  READ.FIXED  ?FILE.ERROR           
          CR  I .  ." ->"                                       
         FIRST DEST-START @ DEST-FILE @ WRITE.FIXED ?FILE.ERROR 
         DEST-START @ .   1 DEST-START +!                       
     LOOP  ;         1 2 +THRU                                  
════════════════════════════════════════════════════════════════   SCREEN 013
(   Block Transfer Primitives )                   ( 041184 DFC) 
                                                                
: ?BLOCK.NUMBERS  ( --- )                                       
    CR ." Block Transfer Routine: "  CR                         
    CR ."   Source File Number ? "       SRC-FILE  ?ENTRY       
  SRC-FILE @  ?OPEN NOT ABORT"  File Not Open!"                 
                                                                
  SRC-FILE @ >FCB 32 + @ "BLKS = NOT ABORT"  Non-Blocks File!"  
    CR ."   Destination File Number ? "  DEST-FILE ?ENTRY       
       DEST-FILE @ ?OPEN NOT ABORT"  File Not Open!"            
                                                                
  DEST-FILE @ >FCB 32 + @ "BLKS = NOT ABORT"  Non-Blocks File!" 
 CR CR ."    Source File Start Block ? " SRC-START ?ENTRY       
    CR ."    Source File End   Block ? " SRC-END   ?ENTRY       
 CR CR ."    Destination File Start Block ? "                   
        DEST-START ?ENTRY     ;                                 
════════════════════════════════════════════════════════════════   SCREEN 014
(    XFER.BLOCKS )                                ( 041284 DFC) 
: VERIFY.BLOCK.NUMBERS  ( --- )                                 
 CR CR ."  Copying blocks "  SRC-START @ .                      
       ." thru "  SRC-END @  .  ." in "                         
        34 EMIT   SRC-FILE @   @FILE.NAME COUNT TYPE   34 EMIT  
    CR ."  To blocks "   DEST-START @  DUP .                    
       ." thru "  SRC-END @  SRC-START @ -  +  .                
        34 EMIT  DEST-FILE @   @FILE.NAME COUNT TYPE   34 EMIT  
    CR ." Press Return to begin copying, space bar to abort."   
    KEY 13 - ABORT"  Block Transfer Aborted!"   ;               
                                                                
: XFER.BLOCKS  ( --- )                                          
    ?BLOCK.NUMBERS  VERIFY.BLOCK.NUMBERS   (XFER.BLOCKS)    ;   
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 021
( Resource access tools)        HEX               ( 090684 drc) 
    A994 FUNC>W CUR.RES.FILE     ( -- RESOURCE FILE REF# )      
    A9AF FUNC>W RES.ERROR        ( -- RESOURCE ERROR FLAG )     
    A999 W>MT UPDATE.RES.FILE    ( RESOURCE FILE REF# -- )      
    A9AB W>MT (ADD.RESOURCE)     ( handle\type\id.w\name$)      
    A9AA   MT CHANGED.RESOURCE   ( HANDLE -- Flag Change )      
    A9AD   MT REMOVE.RESOURCE    ( HANDLE -- Removes resource)  
DECIMAL                                                         
: UPDATE.RESOURCES  ( --    updates, clenses   resource file)   
    CUR.RES.FILE UPDATE.RES.FILE   ;                            
1 +load       DECIMAL                                           
exit <<<<<<<<<<<<<<                                             
hex                                                             
    A9A1   MT GET.NAMED.RESOURCE (  0\TYPE\$ADDR -- HANDLE )    
    A9C1   MT (UNIQUE.ID)       ( 0\RESTYPE --  RESID )         
decimal : UNIQUE.ID   0 SWAP (UNIQUE.ID) -16 SCALE  ;           
════════════════════════════════════════════════════════════════   SCREEN 022
( resource access tools )                         ( 080984 DRC) 
                                                                
 HEX                                                            
 A992 MT USE.RES.FILE    (  RESFILE# --  )                      
 A997 L>FUNC>W OPEN.RES.FILE  ( $ADDR -- RESFILE# )             
 434F4445 CONSTANT "CODE   ( Code RESOURCE TYPE           )     
 34434647 CONSTANT "4CFG   ( Configuration table RESOURCE TYPE) 
                                                                
: ADD.RESOURCE ( handle\type\id\name$ -- )                      
    update.resources                                            
    sp@ DUP @ swap 2+ ! (ADD.RESOURCE)   UPDATE.RESOURCES  ;    
                                                                
DECIMAL                                                         
exit <<<<<<<<<<<<<<<<<     hex                                  
 564F4342 CONSTANT "VOCB   ( Vocabulary RESOURCE TYPE     )     
 4F424A20 CONSTANT "OBJ    ( Object Overlay RESOURCE TYPE )     
════════════════════════════════════════════════════════════════   SCREEN 023
( token table resizing tool )  DECIMAL            ( 080984 DRC) 
                                                                
  find add.resource  not iftrue 21 load  ifend                  
                                                                
 0 "code 0 get.resource constant code.0  in.heap                
: tokens  ( #tokens --   sets # of tokens for next boot)        
   2+ 4* code.0 @  4+ !  code.0      changed.resource           
    update.resources  ;                                         
                                                                
exit                                                            
                                                                
  Note: Loading this code resizes the token table for the       
         next time MacFORTH is loaded                           
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 024
( object resource snapshot  tool )  DECIMAL       ( 092584 drc) 
 find "obj  not iftrue 21 load  ifend    hex                    
: ?snapok  A60 W@  ERROR" SNAP FAIL!"  ;                        
1 +LOAD  ( SNAPSHOT )  HEX                                      
: turnkey  ( --  token executed prior to boot)                  
      find dup not error"  ? no tok! "                          
                            ( if token found, set start token)  
      object.handle @@ mask.handle 0c + !                       
                             ( kill current vocabulary heads)   
     ' FORTH @  DUP  10 RESIZE.HANDLE    ( delete vocab)        
      @ MASK.HANDLE 10 ERASE                                    
     snapshot                                                   
      bye    ( No heads left, so launch finder  ) ;             
decimal                                                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 025
( LEVEL 2  OBJECT resource  SNAPSHOT TOOL )       ( 102384 dws) 
hex                                                             
: snapshot         (  patch.ghs )                               
    update.resources  ' forth @ changed.resource                
    update.resources                     ( force write now )    
    object.handle @@ mask.handle >r                             
    here I- 40 + resize.object             ( reduce object)     
    w.linkage @ 8 I+!                              (  wptr )    
    last.token @ negate  dup  minimum.object  ( for T Table)    
   here I-  I !                            ( object length)     
   dup    4 r> + !                               ( TT size )    
   last.token 4+  over - here rot cmove ( copy in token table)  
   object.handle @  changed.resource  ?snapok                   
   update.resources   ?snapok               ( write changes)    
  ( unpatch.ghs) ;        decimal                               
                                                                
════════════════════════════════════════════════════════════════   SCREEN 026
( Vocab resource tools )  DECIMAL                 ( 080984 DRC) 
 find "vocb  not iftrue 21 load  ifend                          
: GET.VOCAB  ( $ADDR -- handle   gets vocab resource )          
 ( eg. " ASSEMBLER"  get.vocab  DUP NONPURGABLE ' assembler ! ) 
        0 "VOCB ROT GET.NAMED.RESOURCE  ;                       
                                                                
: REMOVE.VOCAB  ( $ADDR --  deletes  named vocab resource )     
              ( eg. " FORTH VOCABULARY"  REMOVE.VOCAB )         
     GET.VOCAB ?DUP                                             
     IF  DUP PURGABLE REMOVE.RESOURCE THEN ;                    
                                                                
: INSTALL.VOCAB ( handle\STRING.ADDR  -- new vocab resource)    
            ( ' ASSEMBLER @ " ASSEMBLER" INSTALL.VOCAB   )      
            ( replaces existing version)                        
    DUP REMOVE.VOCAB  "VOCB DUP UNIQUE.ID ROT  ADD.RESOURCE  ;  
                                                                
════════════════════════════════════════════════════════════════   SCREEN 027
( ICON RESOURCE TOOLS )   DECIMAL                 ( 080984 DRC) 
                                                                
 find add.resource  not iftrue 21 load  ifend                   
                                                                
  49434F4E CONSTANT "ICON   ( ICON RESOURCE TYPE           )    
  128 CONSTANT ICON.SIZE                                        
  ICON.SIZE FROM.HEAP CONSTANT ICON.HANDLE  IN.HEAP             
                                                                
: INSTALL.ICON  ( ADDR\ICON.ID -- Installs ICON )               
    >R  ICON.HANDLE @ ICON.SIZE CMOVE  ( COPY TO HANDLE )       
    ICON.HANDLE   "ICON R> "  "   ADD.RESOURCE  ;               
                                                                
: REMOVE.ICON  ( ICON# --  deletes   icon resource )            
      0  "ICON ROT GET.RESOURCE  ?DUP                           
     IF  DUP PURGABLE REMOVE.RESOURCE THEN ;                    
                                                                
════════════════════════════════════════════════════════════════   SCREEN 028
( ICON LIST RESOURCE TOOLS )  DECIMAL             ( 080984 DRC) 
 find add.resource  not iftrue 21 load  ifend                   
                                                                
 49434E23 CONSTANT "ICN#   ( ICON  LIST RESOURCE TYPE     )     
  256 CONSTANT ICON.LIST.SIZE                                   
  ICON.LIST.SIZE FROM.HEAP CONSTANT ICN#.HANDLE  IN.HEAP        
                                                                
: INSTALL.ICN#  ( ADDR\ICON.ID -- INSTALLS ICON LIST )          
    >R  ICN#.HANDLE @ ICON.LIST.SIZE CMOVE  ( COPY TO HANDLE )  
    ICN#.HANDLE   "ICN# R> "  "   ADD.RESOURCE  ;               
                                                                
: REMOVE.ICN#  ( ICON# --  REMOVES ICON LIST )                  
      0  "ICN# ROT GET.RESOURCE  ?DUP                           
     IF  DUP PURGABLE REMOVE.RESOURCE THEN ;                    
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 029
( FREF RESOURCE TOOLS )   DECIMAL                 ( 080984 DRC) 
                                                                
 find add.resource  not iftrue 21 load  ifend                   
                                                                
  46524546 CONSTANT "FREF   ( FREF RESOURCE TYPE           )    
  8 CONSTANT FREF.SIZE                                          
  FREF.SIZE FROM.HEAP CONSTANT FREF.HANDLE  IN.HEAP             
                                                                
: INSTALL.FREF  ( ADDR\FREF.ID -- INSTALLS FREF )               
    >R  FREF.HANDLE @ FREF.SIZE CMOVE  ( COPY TO HANDLE )       
    FREF.HANDLE   "FREF R> "  "   ADD.RESOURCE  ;               
                                                                
: REMOVE.FREF ( FREF.ID --  deletes  named FREF resource )      
              ( eg.   )                                         
      0  "FREF ROT GET.RESOURCE  ?DUP                           
     IF  DUP PURGABLE REMOVE.RESOURCE THEN ;                    
════════════════════════════════════════════════════════════════   SCREEN 030
( BUNDLE RESOURCE TOOLS )  DECIMAL                ( 080984 DRC) 
                                                                
  find add.resource  not iftrue 21 load  ifend                  
                                                                
  424E444C CONSTANT "BNDL   ( BUNDLE RESOURCE TYPE         )    
  20 CONSTANT BNDL.SIZE                                         
  BNDL.SIZE FROM.HEAP CONSTANT BNDL.HANDLE  IN.HEAP             
                                                                
: INSTALL.BNDL  ( ADDR\BNDL.ID -- INSTALLS BNDL )               
    >R  BNDL.HANDLE @ BNDL.SIZE CMOVE  ( COPY TO HANDLE )       
    BNDL.HANDLE   "BNDL R> "  "   ADD.RESOURCE  ;               
                                                                
: REMOVE.BNDL  ( BNDL.ID --  deletes  named BUNDLE resource )   
      0  "BNDL ROT GET.RESOURCE  ?DUP                           
     IF  DUP PURGABLE REMOVE.RESOURCE THEN ;                    
                                                                
════════════════════════════════════════════════════════════════   SCREEN 031
( Configuration Table Maintenence )                             
find changed.resource  not iftrue 21 load  ifend                
 create config.table  ( MacFORTH Boot time Configuration Table) 
      here 32 +  (  Current size of table )                     
       40 w,     ( Number of Master Pointers)                   
       9 w,     ( Number of files to allocate+1 ** sysfile **)  
  ( 2)      2 w,     ( Number of Block Buffers)                 
    200    w,     ( Number of Return Stack Bytes )              
  ," Forth blocks"  here - allot                                
                                                                
: get.config  ( read configuration table )                      
    "4cfg 0 get.resource @ mask.handle config.table 32 cmove ;  
                                                                
: set.config  ( write out config table )                        
    config.table "4cfg  0 get.resource DUP CHANGED.RESOURCE     
    @ MASK.HANDLE 32 cmove  UPDATE.RESOURCES  ;                 
════════════════════════════════════════════════════════════════   SCREEN 032
( Macforth Picture Gallery Installation)          ( 080984 DRC) 
1  +load    EXIT                                                
This mini application allows the user to cut pictures from the  
scrapbook and hang them in the macforth picture gallery.        
STEP1: Create the desired pictures in MacPaint, and then        
       cut them to the scrapbook.                               
STEP2: Copy the Scrapbook From Your MacPaint disc to the        
       MacFORTH Disc. Be Prepared for large Bitmap images to    
       require a good deal of space !!.                         
STEP3: Load MacFORTH, Then this Code                            
STEP4: For each Picture, COPY it from the Scrapbook             
       using the EDIT Menu. Close the scrapbook.                
STEP5: Install Picture into Gallery with INSTALL.PICTURE        
       picture# INSTALL.PICTURE    ( Picture#  above 101 )      
STEP6: Exit MacFORTH to save changes, Reload                    
STEP6: To draw picture from Gallery, See screen  34             
════════════════════════════════════════════════════════════════   SCREEN 033
( PICTURE RESOURCE INSTALL,REMOVE TOOLS )         ( 101184 dws) 
find add.resource not iftrue 21 load  ifend                     
                                                                
: INSTALL.PICTURE ( RESID --  Adds picture to gallery)          
     >R SCRAP.LEN @ NOT  SCRAP.HANDLE @@ @ "PICT - OR           
    ERROR"  No Picture in Desk Scrap ! "   CR                   
    0 FROM.HEAP   "PICT 2DUP GET.SCRAP  DUP 0<                  
    ERROR"  Can't get picture fron scrap"                       
     ." Picture size is " . ."  bytes"    R@ "  " ADD.RESOURCE  
      R> GET.PICTURE drop                                       
     UPDATE.RESOURCES  ZERO.SCRAP   DROP ;                      
                                                                
: REMOVE.PICTURE ( PICTURE#  --  Deletes picture from gallery ) 
   GET.PICTURE DUP NOT ERROR"  Invalid Picture#"                
    REMOVE.RESOURCE  UPDATE.RESOURCES  ;                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 034
( Macforth Picture Gallery Access )               ( 110184 dws) 
HEX                                                             
A8F6 MT (DRAW.PICTURE)  ( HANDLE\RECTANGLE -- DRAWS PICTURE )   
A9A3 MT RELEASE.RESOURCE ( HANDLE -- RELEASES RESOURCE )        
DECIMAL                                                         
: pict.in.rect  (  X1\Y1\X2\Y2\PICTURE#  --  )                  
           ( FETCHES PICTURE FROM GALLERY AND DISPLAYS)         
           ( IT IN THE SUPPLIED RECTANGLE )                     
    GET.PICTURE   DUP DUP HANDLE.SIZE   0<   SWAP NOT OR        
    ERROR"   Picture not in Gallery !!"                         
     >R >RECT R@ SWAP 2dup (DRAW.PICTURE)  (draw.picture)       
     R> RELEASE.RESOURCE  2DROP  ;                              
EXIT                                                            
  Usage:    100 100 200 200  102 pict.in.rect                   
     To Draw picture# 102 within  specified rectangle           
                                                                
════════════════════════════════════════════════════════════════   SCREEN 035
( 0 buffer Configuration Table set.up )                         
find changed.resource  not iftrue 21 load  ifend                
 create config.table  ( MacFORTH Boot time Configuration Table) 
      here 32 +  (  Current size of table )                     
       63 w,     ( Number of Master Pointers)                   
       9 w,     ( Number of files to allocate+1 ** sysfile **)  
  ( 2)      0 w,     ( Number of Block Buffers)                 
    256    w,     ( Number of Return Stack Bytes )              
  ," Forth blocks"  here - allot                                
                                                                
: get.config  ( read configuration table )                      
    "4cfg 0 get.resource @ mask.handle config.table 32 cmove ;  
                                                                
: set.config  ( write out config table )                        
    config.table "4cfg  0 get.resource DUP CHANGED.RESOURCE     
    @ MASK.HANDLE 32 cmove  UPDATE.RESOURCES  ;                 
════════════════════════════════════════════════════════════════   SCREEN 036
( MacFORTH Sample TURNKEY Application)                          
                                                                
  24 load  ( load up snapshot, turnkey support)                 
  1 +load  ( sample application)                                
                                                                
  cr  ." WARNING: Be shure to make a copy of the boot file"     
  cr  ."          as the MacFORTH File is consumed by the"      
  cr  ."          snapshot  or turnkey process !!"              
  cr                                                            
  cr ."  execute TURNKEY STARTUP to turnkey sample Appl."       
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 037
( Sample Application w/ turnkey )                               
    2 +load  ( apple menu )                                     
    1 +load   ( your window)                                    
                                                                
: sys.activate if abort then  ;                                 
                                                                
: go  if sys.window on.activate sys.activate ( next time)       
      apple.menu OPTIONS.MENU                                   
       front.window drop   yours add.window                     
       yours select.window                                      
     then ;                                                     
                                                                
: startup   40 0 41 2 sys.window w.bounds                       
            2 sys.window w.type   0 sys.window w.attributes     
              sys.window on.activate go                         
      116 @ 112 ! (  override rst switch)   ;                   
════════════════════════════════════════════════════════════════   SCREEN 038
                                                                
: your.activate                                                 
   if ginit  begin cr ." Hello " again then  ;                  
                                                                
  new.window yours                                              
   ( 2 yours w.type   ) 30 0 300 500 yours w.bounds             
    yours add.window                                            
    yours on.activate your.activate                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 039
(  our own Apple Menu )    HEX                    ( 090584 drc) 
CREATE APPLE.TITLE  0114 W,                                     
  44525652 CONSTANT  'DRVR'                                     
  A8F6  MT  DRAW.PICTURE ( HANDLE\RECT)                         
DECIMAL                                                         
1 +load           exit  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<      
                                                                
: ABOUT.your.appl... ( --- )                                    
   >SYS.WINDOW  100  ( resource "PICT id #)  GET.PICTURE  ?DUP  
    IF   >R PAGE SYS.WINDOW +WCBOUNDS @RECT                     
         376 MIN ( x )  SWAP   216 MIN ( y )   MAKE.RECT        
         R@ SWAP DRAW.PICTURE 2DROP   R> PURGABLE               
    THEN 0 HILITE.MENU                                          
   BEGIN  DO.EVENTS  MOUSE.DOWN =                               
             ?KEYSTROKE OR IF  PAGE SP! THEN                    
   AGAIN   ;                                                    
════════════════════════════════════════════════════════════════   SCREEN 040
( Your own  Apple Menu )                          ( 090584 drc) 
HEX                                                             
                                                                
: APPLE.MENU   ( --- | sets up apple menu *)                    
   1 DELETE.MENU   -1  APPLE.TITLE  1  NEW.MENU                 
     " About Your Appl...;-(" 1 append.items                    
     'DRVR' 1 ADD.RES.MENU                                      
    DRAW.MENU.BAR   64 GET.PICTURE DROP                         
    1 MENU.SELECTION:   dup  1-                                 
    IF   1 MENU.HANDLE   14 ITEM$ C!   SWAP ITEM$ GET.ITEM      
         GET.WINDOW >R      SYS.WINDOW WINDOW                   
         ITEM$  OPEN.DA  DROP   0 HILITE.MENU    R> WINDOW      
    ELSE DROP  ( ABOUT.your.appl...)                            
    THEN   ;                                                    
                                                                
DECIMAL                                                         
════════════════════════════════════════════════════════════════   SCREEN 041
( Your own Options Menu )                         ( 090584 drc) 
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
                                                                
════════════════════════════════════════════════════════════════   SCREEN 043
( ICON LIST RESOURCE Example )  DECIMAL           ( 101284 dws) 
 find add.resource  not iftrue 21 load  ifend                   
                                                                
hex  49434E23 CONSTANT "ICN#   ( ICON  LIST RESOURCE TYPE     ) 
decimal   256 CONSTANT ICON.LIST.SIZE                           
  ICON.LIST.SIZE FROM.HEAP CONSTANT ICN#.HANDLE  IN.HEAP        
                                                                
: INSTALL.ICN#  ( ADDR\ICON.ID -- INSTALLS ICON LIST )          
    >R  ICN#.HANDLE @ ICON.LIST.SIZE CMOVE  ( COPY TO HANDLE )  
    ICN#.HANDLE   "ICN# R> "  "   ADD.RESOURCE  ;               
                                                                
: REMOVE.ICN#  ( ICON# --  REMOVES ICON LIST )                  
      0  "ICN# ROT GET.RESOURCE  ?DUP                           
     IF  DUP PURGABLE REMOVE.RESOURCE THEN ;                    
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 044
( Your Icon list  Example )                       ( 102684 dws) 
                                                                
 decimal                                                        
( Note: Create two Icons  <1 is a mask for the other>           
        using the Icon Editor from the Mac Suppliment)          
                                                                
create icon.list    256 allot                                   
                  (  Place names here ==v)                      
    next.fcb  constant 1st   open" Your icon"                   
    next.fcb  constant 2nd   open" Your mask icon"              
   128 remove.icn#                                              
   icon.list        128 0 1st read.virtual                      
   icon.list 128 +  128 0 2nd read.virtual                      
    icon.list 128  install.icn#                                 
   update.resources                                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 045
( MacForth Overlay Structure)                                   
 hex                                                            
                                                                
create overlay.file  64 ,   ( Overlay File number, Initially)   
                            ( illegal to force open on first )  
                            ( access )                          
                                                                
create overlay.file$  40 allot   ( To be built from boot file$) 
                                                                
create module.offset  0 ,  ( offset in file to current module ) 
                                                                
create >overlay.base 0 ,    ( Relative overlay base pointer)    
                                                                
decimal                                                         
                                                                
1 7 +thru                                                       
════════════════════════════════════════════════════════════════   SCREEN 046
( MacForth Overlay Structure)                                   
                                                                
: overlay.base  (  -- addr   returns current overlay base addr) 
    >overlay.base @   next.ptr + ( relocate)  ;                 
                                                                
: @overlay.name  ( Construct Overlay.file$ from boot file$ )    
   910  overlay.file$ over c@ 1+ cmove                          
   " (ovl)" count dup>r overlay.file$  count dup>r + swap       
   cmove  r> r> + overlay.file$ c!  ;                           
                                                                
: open.overlay.file   ( Open overlay file )                     
   overlay.file @ 64 = ( Not opened)                            
   if  @overlay.name   next.fcb  dup  overlay.file !            
     overlay.file$ over assign  open  io-result @               
         if overlay.file @  dup create.file open then           
   then ;     decimal                                           
════════════════════════════════════════════════════════════════   SCREEN 047
(  File overlay tool )  DECIMAL                                 
: SET.TASK ( Place marker token into dictionary to allow forget 
           ( to perform most of the cleanup )                   
     HERE MAKE.TOKEN " TSK" APPEND ;                            
                                                                
: BEGIN.OVERLAY  ( Mark stary of overlay base )                 
      SET.TASK HERE DUP>R NEXT.PTR -                            
      >OVERLAY.BASE !  I 32 DUP ALLOT ERASE                     
      I NEXT.PTR -  2 I+!     ( Relocatable Base Address)       
      last.token  @  r> 10 + w!  ;                              
                                                                
: END.OVERLAY  (  -- Update pointers to current overlay)        
      overlay.base   DUP NOT ABORT"  NO OVERLAY DEFINED"        
     >R last.token @   12 I+w!  ( last token)                   
      here I- 6  I+! R>DROP       ( OBJECT SIZE)  ;             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 048
( When Unloaded, When Loaded )                                  
                                                                
                                                                
: WHEN.LOADED  ( -- Specify token to execute when loaded)       
    FIND   OVERLAY.BASE  14 + W!  ;                             
                                                                
: WHEN.UNLOADED  ( -- Specify token to execute when unloaded)   
    FIND   OVERLAY.BASE  16 + W!  ;                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 049
( Save Overlay)                                                 
: >TT ( -- address\count of affected Token Table  Space )       
    overlay.base  12 + <w@ dup  last.token 4+ +                 
    overlay.base   10 + <w@ rot -  ;                            
                                                                
: WRITE.OVERLAY   ( writes out code segmentw/header)            
     overlay.base  dup 6+ @  module.offset @                    
     overlay.file @  write.virtual  ?file.error  ;              
                                                                
: WRITE.TT        ( write out token table segment)              
     >tt overlay.base  6+ @ module.offset @ +                   
      overlay.file @ write.virtual  ?file.error  ;              
                                                                
: SAVE.OVERLAY   ( Save away overlay file)                      
     open.overlay.file    write.overlay  write.tt   ;           
                                                                
════════════════════════════════════════════════════════════════   SCREEN 050
( Restore Overlay)                                              
: READ.OVERLAY   ( reads in code segmentw/header)               
     overlay.base  dup 6+ @  module.offset @                    
     overlay.file @  read.virtual  ?file.error  ;               
                                                                
: READ.TT        ( reads in token table segment)                
     >tt overlay.base  6+ @ module.offset @ +                   
      overlay.file @ read.virtual  ?file.error  ;               
                                                                
: READ.HEADER   ( reads overlay header  to overlay base )       
   PAD 32 module.offset @  overlay.file @                       
   read.virtual  ?file.error ;                                  
                                                                
: RESTORE.OVERLAY   ( Save away overlay file)                   
     open.overlay.file READ.HEADER PAD 2+ @ >OVERLAY.BASE !     
  PAD OVERLAY.BASE 32 CMOVE read.overlay  read.tt  ;            
════════════════════════════════════════════════════════════════   SCREEN 051
( OVERLAY" )                                                    
                                                                
                                                                
: OVERLAY" (    ---      Load Overlay Source code File)         
    BEGIN.OVERLAY [COMPILE] USE" 1 LOAD ;                       
                                                                
: MODULE.DP ( compute Modele Dictionary pointer)                
     NEXT.PTR OVERLAY.BASE DUP 2+ @ SWAP 6+ @ + +  ;            
                                                                
:  SET.DP MODULE.DP DP ! ;                                      
                                                                
 : set.offset  ( Module# -- file offset)                        
    10000 * (  simplistic approach, will be improved later)     
    module.offset !  ;                                          
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 052
( Module load and unload Operations )                           
: LOAD.MODULE  (  module#  --  loads requested module)          
    overlay.base   w@ over -    ( Differnt module?)             
   if    overlay.base  16+ w@ execute   ( Execute Unload token) 
       set.offset restore.overlay MODULE.DP HERE MAX DP !       
        overlay.base 14 + w@ execute   ( Execute Load Token)    
   else drop                                                    
   then  ;                                                      
                                                                
: SAVE.MODULE  (  module#  --  loads requested module)          
   dup overlay.base  w! set.offset  save.overlay ;              
                                                                
: LOAD.PRINT.MODULE ( MOD# -- ) 19 LOAD.MODULE LOAD.MODULE ;    
: LOAD.CLASS.MODULE ( MOD# -- ) 19 LOAD.MODULE                  
          26 LOAD.MODULE LOAD.MODULE ;                          
                                                                
════════════════════════════════════════════════════════════════   SCREEN 053
( Button test)                                    ( 101284 dws) 
0 constant box                                                  
: b.init                                                        
sys.window 200 100 " box" -1 1 binary.control ' box ! ;         
: c.test ( ---)                                                 
  ?in.control                                                   
   if this.control @ @mouse track.control                       
     if this.control @ dup toggle.control                       
        box = if 10 100 3000 tone then                          
     else                                                       
        3 100 700 tone then then ;                              
: test b.init get.window show.controls                          
   begin do.events case mouse.down of c.test endof              
                 endcase                                        
   again ;                                                      
                                                                
════════════════════════════════════════════════════════════════   SCREEN 054
( Custom stuff for CW.ed)                         ( 101284    ) 
                                                                
: fb use" macforth3:forth blocks" ;                             
: cw use" chipwits" ;                                           
: ex use" macforth3:extension" ;                                
( : ed include" macforth3:editor blocks" ;  )                   
( : cc use" macforth3:chipwit create" ;    )                    
( : eb use" macforth3:editor blocks" ;   )                      
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 055
( Custom stuff)                                   ( 102384 dws) 
                                                                
: fb use" forth blocks" ;                                       
: cw use" cw work:chipwits" ;                                   
: ex use" extension" ;                                          
exit <<<<<<<<<<<<<<<<<<<<<<<<<<                                 
: ed include" editor blocks" ;                                  
: cc use" chipwit create" ;                                     
: eb use" editor blocks" ;                                      
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
