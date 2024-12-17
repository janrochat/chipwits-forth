════════════════════════════════════════════════════════════════   SCREEN 000
( "FORTH Blocks" Comments )                       ( 062084 DFC) 
                                                                
This file contains the "standard" MacFORTH utilities, and is    
automatically loaded when MacFORTH itself is loaded.            
                                                                
You can modify block 1 of this file in order to load any files  
or other routines you like.                                     
                                                                
If you do modify block 1, remember to include the ABORT at the  
end of the block if you want to start the MacFORTH interpreter. 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 001
( MacFORTH System Load Block )                    ( 073184 ass) 
 CR ." Boot me up, Daddy..."   DECIMAL                          
  here 1+ ," dws" initials 3 cmove  -4 allot                    
  14200 resize.vocab                                            
  21300 resize.OBJECT    ( establish mimimum object & Vocab )   
   OPTIONS.MENU          ( display the apple and options menu)  
   12 load                 ( Custom stuff)                      
: it ;                                                          
 INCLUDE" EDITOR BLOCKS" ( load the editor file )               
13 16 thru  ( vars & consts) : it ;                             
  (  CR ." Loading Dump Utility..."  2 LOAD        )            
 ( cr ." Loading Xferblocks" 6 load)                            
 ( cr ." Loading Copy.blocks ( 1st/last/target---}" 4 load)     
ABORT  ( start interpreting from console )                      
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
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
     (RANGE)  DO  I  C@  DUP  31  >  IF  [ DROP ] DUP 128  <    
      IF  EMIT  ELSE  [ ROT 2 ]  THEN DROP BL EMIT THEN LOOP ;  
-->                                                             
════════════════════════════════════════════════════════════════   SCREEN 003
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
════════════════════════════════════════════════════════════════   SCREEN 004
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
════════════════════════════════════════════════════════════════   SCREEN 005
(    Multiple Screen COPY Utility )               ( 041084 DFC) 
                                                                
: CLEAR.BLOCKS ( first\last -- | clears specified blocks )      
    1+ SWAP  CR                                                 
    DO 13 EMIT  I . ." Cleared "  I BLOCK 1024 BLANKS UPDATE    
    LOOP  SAVE-BUFFERS  ;                                       
                                                                
: COPY.BLOCKS  ( first\last\target -- | "normal copy" )         
    SWAP 3 PICK - 1+     ( convert to first\target\count )      
    >R  OVER OVER <  R> SWAP                                    
      IF  <<COPY   ELSE  >>COPY  THEN   ;                       
                                                                
 DECIMAL                                                        
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 006
( Block Transfer Routines )                       ( 041184 DFC) 
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
════════════════════════════════════════════════════════════════   SCREEN 007
(    Block Transfer Routines, Continued )         ( 041184 DFC) 
                                                                
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
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
(    Block Transfer Routines, Continued )         ( 041184 DFC) 
                                                                
: VERIFY.BLOCK.NUMBERS  ( --- )                                 
 CR CR ."  Copying blocks "  SRC-START @ .                      
       ." thru "  SRC-END @  .  ." in "                         
        34 EMIT   SRC-FILE @   @FILE.NAME COUNT TYPE   34 EMIT  
    CR ."  To blocks "   DEST-START @  DUP .                    
       ." thru "  SRC-END @  SRC-START @ -  +  .                
        34 EMIT  DEST-FILE @   @FILE.NAME COUNT TYPE   34 EMIT  
    CR ." Press Return to begin copying, space bar to abort."   
    KEY  ABORT"  Block Transfer Aborted!"   ;                   
                                                                
: XFER.BLOCKS  ( --- )                                          
    ?BLOCK.NUMBERS  VERIFY.BLOCK.NUMBERS   (XFER.BLOCKS)    ;   
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( Axe words)    : x axe ;                         ( 072884 dws) 
x !sr  x "blks x "data  x "m4th x #files x #find x 'interpret   
x (!on.activate) x (!on.update) x ((error)) x (abort")          
x (error")  x (get.file) x (menu.selection:) x (track.control)  
x +cartesian x +on.activate x +max.blk# x +on.update x +printer 
x +w.attributes x +w.behind x +wbounds x +wcbounds x +wfile.ptr 
x +wline.height x +wrefcon x +xybias x +xyoffset x +xypivot     
x +xypos x +xyscale x -keyboard x -latest x .file.error         
x 12hours x >sys.window x ?align x ?blocks.file                 
x ?in.control x ?loading x ?punct x ?room x @file.name          
x append  x compiling x configure.printer x context             
x cursor.char x default.activate x definitions x device.control 
x device.status x dflt.window.tail x discard.updates            
x dispose.control x draw.controls x empty-buffers x external    
x file.error.msgs x find.control x follower x get.textfont      
x get.textmode x get.textsize x get.textstyle x get.xypivot     
════════════════════════════════════════════════════════════════   SCREEN 010
( axe)                                            ( 072884 dws) 
x global>local x handle.size x  immediate   x invalid.rect      
x kill.controls x l>func>l x local>global x load.scrap          
x lock.handle x lower.case x mac.console x make.token           
x minimum.object x minimum.vocab x network.event x new.token    
x non.purgable x notpatbic x notpatcopy x notpator              
x notpatxor x notsrcor x notsrcbic x notsrccopy x notsrcxor     
x null.event x object.handle x off.control x on.control         
x open.device x open.printer x open.sound x otherwise           
x page.down x post.event x purgable x put.scrap x radio.button  
x real.font? x recover.handle x reg.set x resize.handle         
x save-buffers x scrap.counter x scrap.handle x scroll.up/down  
x scroll.left/right x set.control x set.control.max             
x set.control.min x set.control.range x set.fence               
x set.file.info x setup.serial x sound.fcb x stack.error        
x start.flag x sysparms x tab.stops x teactivate                
════════════════════════════════════════════════════════════════   SCREEN 011
( axe)                                            ( 072884 dws) 
x tecaltext x teclick x tecopy x tecut x tedeactivate           
x tedelete x tedispose x teidle x teinsert x tekey x tenew      
x tepaste x terecord x tescroll x teset.just x teset.select     
x teset.text x test.control x teupdate x text.box x text.click  
x text.field x text.record x this.control x this.part           
x toggle.control x token.for x token>addr x trace.token         
x track.control x unload.scrap x unlock.handle x vbar.bounds    
x version x vocabulary x w.linkage x w>func>l x wait.mouse.up   
x wconstant x xlate x xyaxis x xyoffset x xypivot x xyscale     
x zero.scrap x [compile]                                        
forget x                                                        
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 012
( Custom Stuff)                                   ( 072784 dws) 
                                                                
: FB use" Forth BLocks" ;                                       
: SB use" Scenario Blocks" ;                                    
: eb use" Editor blocks" ;                                      
: ed  eb include" editor blocks" ;                              
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 013
 ( Robot Vars & Consts)                           ( 073184 dws) 
: var variable ; : is constant ;                                
10 is Chips.wide@ 6 is Chips.High@                              
Chips.wide@ Chips.high@ *  is Chip.count@                       
8 Chip.count@ 2 * * is prog.size@                               
( 8 panels X Chip.count@ instructions X 2 bytes)                
create Robot.Program prog.size@ allot                           
var Current.Instruction^ ( 0-63  instruction to execute)        
var Current.Panel^       ( 0-7 )                                
var Key.pressed          ( Latest key pressed)                  
var Damage.Reg ( 0-10000)    var Range.reg ( 0-8)               
var Energy.Reg         ( 0-10000)                               
var Number.var  var Object.var  var  Move.var                   
var Robot.Orientation                                           
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 014
( Argument Constants)                             ( 073184 dws) 
( Order indexes into graphic rect arrays)                       
0 is Turn.Right@   1 is Turn.Left@                              
2 is Forward@      3 is Reverse@   ( Move Arguments)            
                                                                
4 is pie@ 5 is coffee@  6 is Key@ 7 is Bottle@ 8 is Oil@        
9 is Banana@ 10 is Floor@ 11 is Bomb@ 12 is Bouncer@            
13 is Creep@  14 is Wall@  15 is door@ 16 is Pit@  17 is Lock@  
                                                                
18 is Damage.reg@ 19 is Fuel.reg@ 20 is Range.reg@              
                                                                
21 is Mov.var@  22 is Num.var@  23 is Obj.var@                  
24 is Num0@  25 is Num1@  26 is Num2@  27 is Num3@  28 is Num4@ 
29 is Num5@  30 is Num6@  31 is Num7@                           
32 is Thing.count@                                              
                                                                
════════════════════════════════════════════════════════════════   SCREEN 015
( Gameboard Data)                                 ( 052284 dws) 
8 is squares.wide@ 8 is squares.high@ ( Gameboard squares)      
squares.wide@ squares.high@ * is square.count@                  
Square.count@ 16 + is Room.size@                                
create Room.Data(  Room.size@ allot                             
    ( array of room squares)                                    
    ( 8 outdoor words point to next room#, next in-sq#)         
                                                                
var This.Room@                                                  
                                                                
40 IS GAME.WIDTH@  30 IS GAME.HEIGHT@  ( SIZE OF GAME SQUARE)   
6 IS GAME.X@ 92 IS GAME.Y@          ( ORIGIN OF GAME WINDOW)    
                                                                
var wall.covers  ( wall hides part of animation)                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 016
( FIle stuff, Menu Consts)                        ( 081284 dws) 
                                                                
6 is CW.file    CW.file remove                                  
" CW" CW.file assign  ?file.error                               
prog.size@ CW.file set.rec.len   ?file.error                    
                                                                
                                                                
8 is Doom.file    doom.file remove                              
" Doom pit rooms" doom.file assign  ?file.error                 
Room.size@ Doom.file set.rec.len   ?file.error                  
                                                                
5 is O.menu 6 is W.menu  7 is CW.menu 8 is G.menu               
                                                                
                                                                
                                                                
                                                                
