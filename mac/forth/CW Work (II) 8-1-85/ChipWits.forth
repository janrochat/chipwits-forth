════════════════════════════════════════════════════════════════   SCREEN 001
 ( Robotnik loader)                               ( 040785 dws) 
1 delete.menu   29900 resize.object   16990 resize.vocab        
decimal                                                         
find is not iftrue   : it ; new.window gameboard.window         
    0 0 342 512 Gameboard.WINDOW W.BOUNDS                       
   2 24 thru ( Common Ed & Game )  76 83 thru  ( anima stuff)   
   86 95 thru ( Ibol graphics) sys.window select.window         
   gameboard.window ADD.WINDOW 160 177 thru ( Stat&name )       
   96 105 thru  ( debug) 150 159 thru  ( Stack,reg stuff)       
   106 137 thru ( Workshop)  178 179 thru ( voc.chop) 190 load  
 25  68 thru  ( game ) ifend gameboard.window select.window     
 69 71 thru 138 141 thru ( bads) 72 load ( Game)                
181 186 thru ( choose.chipwit)                                  
 142 149 thru ( menu)                                           
73 75 thru ( CHIPWITS master word) sys.window select.window     
 gameboard.window on.activate ChipWits 180 load ( startup)      
════════════════════════════════════════════════════════════════   SCREEN 002
 ( Robot Vars & Consts)                           ( 092784 dws) 
: var variable ; : is constant ;                                
var Robot.Square    ( where in room is it?)                     
var Robot.Orientation                                           
10 is Chips.wide@ 6 is Chips.High@                              
Chips.wide@ Chips.high@ *  is Chip.count@                       
8 Chip.count@ 2 * * is prog.size@                               
( 8 panels X Chip.count@ instructions X 2 bytes)                
create Robot.Program prog.size@ allot                           
16 is ChipWit.count@      ( number of the beasts)               
var Current.Instruction^ ( 0-63  instruction to execute)        
var Current.Panel^       ( 0-7 )                                
var Key.pressed          ( Latest key pressed)                  
var Damage.Reg ( 0-10000)    var Range.reg ( 0-8)               
var fuel.Reg         ( 0-10000)                                 
var copy.buff.full                                              
════════════════════════════════════════════════════════════════   SCREEN 003
( Operator constants, Cycles( )                    ( 101584 dws)
: Goto.range 0 4 ;  0 is Go.Marker@   1 is Goto.Go@             
2 is Subpanel@  3 is Boomerang@  4 is Wire@                     
: Act.on.World.range 5 8 ; 5 is Move@ 6 is Pick.up@  7 is QRAY@ 
    8 is sing@                                                  
: Detect.&.Branch.range 9 11 ;  9 is Feel.for@  10 is Look.for@ 
      11 is Smell.for@                                          
: Special.Range 12 13 ; 12 is Flip.coin@ 13 is Keypress@        
: Stack.range 14 23 ; 14 is Number=@  15 is Number<@            
  16 is Object=@ 17 is Move=@ 18 is On.number@ 19 is On.Object@ 
  20 is On.move@ 21 is drop.stack@  22 is Plus@ 23 is Minus@    
24 is Socket@ ( Nothing there) 25 is Action.count@              
                                                                
create Cycles( 0 c, 1 c, 1 c, 1 c, 0 c, 3 c, 1 c, 1 c, 2 c, 4 c,
               4 c, 4 c, 3 c, 3 c, 2 c, 2 c, 2 c, 2 c, 1 c, 1 c,
               1 c, 1 c, 1 c, 1 c, 1 c,                         
════════════════════════════════════════════════════════════════   SCREEN 004
( Argument, Coding, Orientation Consts, Fuel( )   ( 102384 dws) 
(  Flow Bits- flow from one instruction to next in Program Grid)
0 is Up.F@      64 is Down.F@                                   
128 is Left.F@  192 is Right.F@                                 
var Op.byte ( Operation)  var Arg.Byte  ( Argument)             
var Flow.code  ( 0-172 0-up 64-down 128-left 172-right)         
( Robot Orientations)                                           
7 is W  6 is SW  5 is S  4 is SE                                
3 is E  2 is NE  1 is N  0 is NW                                
( These don't index to graphics)                                
27 is No.key@   ( Keypress)                                     
1 is PanelA@ 2 is PanelB@ 3 is PanelC@ 4 is PanelD@             
5 is PanelE@ 6 is PanelF@ 7 is PanelG@   ( Subpanel)            
create Fuel( 0 c, 1 c, 1 c, 1 c, 0 c, 5 c, 5 c, 7 c, 2 c, 4 c,  
             2 c, 2 c, 1 c, 1 c, 1 c, 1 c, 1 c, 1 c, 1 c, 1 c,  
             1 c, 1 c, 1 c, 1 c, 1 c,                           
════════════════════════════════════════════════════════════════   SCREEN 005
( Argument Constants)                             ( 092384 dws) 
( Order indexes into graphic rect arrays)                       
0 is Turn.Right@   1 is Turn.Left@                              
2 is Forward@      3 is Reverse@   ( Move Arguments)            
4 is pie@ 5 is coffee@  6 is disk@ 7 is Oil@ 8 is Floor@        
9 is Bomb@ 10 is Bouncer@ 11 is Creep@  12 is Wall@ 13 is door@ 
14 is Damage.reg@ 15 is Fuel.reg@ 16 is Range.reg@              
                                                                
17 is Mov.stack@  18 is Num.stack@  19 is Obj.stack@            
20 is Mov.empty@  21 is Num.empty@  22 is Obj.empty@            
                                                                
23 is Num0@  24 is Num1@  25 is Num2@  26 is Num3@  27 is Num4@ 
28 is Num5@  29 is Num6@  30 is Num7@                           
31 is Thing.count@                                              
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 006
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
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
( Game Driver Data )                              ( 102384 dws) 
var Adventure  ( What number scenario) 1 adventure !            
var Points        var Cycle.ct ( pos for time limit, - for op)  
var Sound.on      var Debug.speed  var CW.num  ( Points to CW#) 
var Game.Status  1 is Debug.on@  2 is Stats.on@                 
                 3 is turn.debug.on@ 4 is turn.stats.on@        
var Prog.status  1 is Turn.game.on@    ( screen and init)       
  2 is Game.on@         ( play it)                              
  3 is Workshop.on@     ( go to it)                             
  4 is Workshop.off@    ( leave it)                             
  5 is Game.aborted@   ( Dead chipwit)                          
  6 is Turn.game.off@  ( from menu,endgame, or too.bad)         
  7 is Game.finished@  ( game is over)                          
  8 is game.off@       ( sit there)                             
  9 is quit@           ( byte bye) 10 is Series@ ( multi-game)  
var last.mission                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( Panel data, Window stuff,rects)                 ( 081684 dws) 
variable Panel.top  variable Panel.left                         
 ( to align panel or debug window)                              
332 is Btm.w.left@  186 is Btm.w.top@                           
                                                                
27 5 334 328 rect Window1.rect ( left)                          
0 0 0 0 rect window2.rect ( toprt)                              
133 332 334 507  rect window3.rect                              
0 0 0 0 rect Draw.rect  ( utility rect)                         
0 0 0 0 rect S.rect ( util)                                     
0 0 0 0 rect s1.rect ( util)                                    
0 0 0 0 rect square.rect  (  for drawing square-sized blocks)   
0 0 0 0 rect obj.rect    ( for drawing objects)                 
0 0 0 0  rect floor.rect ( points to lino in source, moves)     
0 0 0 0 rect whole.rect ( rect for whole anim.rect to screen)   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( FIle stuff, Menu Consts  menus.off,on)          ( 040785 dws) 
4 is Stat.file  6 is CW.file  8 is Doom.file 5 is IBOL.file     
: Files.name ( ---)                                             
Stat.file remove " CW" Stat.file assign ( ?file.error )         
IBOL.file remove " IBOL" IBOL.file assign ( ?file.error)        
 CW.file remove  " CW" CW.file assign  ( ?file.error)           
prog.size@ CW.file set.rec.len   ( ?file.error )                
doom.file remove " Greedville" doom.file assign  ( ?file.error) 
Room.size@ Doom.file set.rec.len   ( ?file.error)  ;            
                                                                
 5 is O.menu 6 is W.menu  7 is wh.menu 8 is G.menu              
: menus.off ( ---) 9 5 do false i menu.enable loop ;            
: menus.on ( ---)  9 5 do true i menu.enable loop ;             
: game.off ( ---) 12 4 do i 0 G.menu item.enable  loop     ;    
: game.on ( ---)  12 4 do i 1 G.menu item.enable  loop ;        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 010
( Scenarios)                                      ( 110884 dws) 
8 is adventure.count@  Create adventure$(                       
," Greedville     "  ( #1,food, goods, 1000cyc)                 
," ChipWit Caves  "  ( #2,food, creeps, goods 1300cyc)          
," Doom Rooms     "  ( #3,creeps,bouncers, some coffee 1500cyc) 
," Peace Paths    "  ( #4,creeps penalty,food, goods,2000cyc)   
," Memory Lanes   "  ( #5,bouncers, food,oil,there & back,open) 
," Octopus Garden "  ( #6,bads,food,pt to pt,open)              
," Mystery Matrix "  ( #7,mystery trail)                        
," Boomtown       "  ( #8,set levels #rooms, time)              
: -t adventure.count@ 0 do adventure$( i 16 * + 16 -trailing    
1- swap c! loop ; -t forget -t                                  
create cycle(  6000 , 10000 , 10000 , 16000 ,                   
               20000 , 20000 , 30000 , 12000 ,                  
create trip.count( 0 c, 6 c, 0 c, 20 c, 9 c, 32 c, 20 c, 3 c,   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 011
: d, 10 * c, ; create Scenario.play(              ( 110584 dws) 
( Scen:  Greed  CW C  Doom  Peace MemLn Oct  Myst  Boom)        
( crp.ct) 00 c, 08 c, 08 c, 04 c, 03 c, 03 c, 03 c, 03 c,       
( crp.pt) 00 d, 05 d, 10 d, 03 d, 03 d, 01 d, 02 d, 04 d,       
( bnc.ct) 00 c, 00 c, 02 c, 00 c, 02 c, 02 c, 02 c, 00 c,       
( bnc.pt) 00 d, 00 d, 25 d, 06 d, 06 d, 02 d, 04 d, 00 d,       
( oil.ct) 10 c, 06 c, 00 c, 04 c, 02 c, 00 c, 00 c, 00 c,       
( oil.pt) 05 d, 05 d, 00 d, 02 d, 03 d, 05 d, 15 d, 00 d,       
( dsk.ct) 03 c, 02 c, 00 c, 02 c, 00 c, 00 c, 00 c, 00 c,       
( dsk.pt) 10 d, 10 d, 00 d, 15 d, 25 d, 25 d, 25 d, 25 d,       
( cof.ct) 03 c, 04 c, 02 c, 03 c, 03 c, 01 c, 00 c, 00 c,       
( pie.ct) 03 c, 00 c, 02 c, 03 c, 02 c, 04 c, 00 c, 02 c,       
                                                                
create room.ct( 4 c, 8 c, 12 c, 54 c, 1 c, 1 c, 100 c,  9 c,    
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 012
( Stripe pats N$)                                 ( 100784 dws) 
( Used in Barber stripe WorkShop cursor)                        
2 base !                                                        
create stripe1                                                  
11001100100110010011001101100110 ,                              
11001100100110010011001101100110 ,                              
11001100100110010011001101100110 ,                              
11001100100110010011001101100110 ,                              
create stripe2                                                  
10011001001100110110011011001100 ,                              
10011001001100110110011011001100 ,                              
10011001001100110110011011001100 ,                              
10011001001100110110011011001100 ,                              
decimal                                                         
create n$ ,"                   " ( work string area)            
                                                                
════════════════════════════════════════════════════════════════   SCREEN 013
( CW.load CW.save Back.wipe Local.xy bye-bye timer ( 080185 dws)
: Local.xy ( screenx/screeny---locx/locy)                       
  XY>point Global>Local Point>xy ;                              
: Back.wipe ( ---|background wiper)                             
    0 0 512 342 gray  pattern rectangle  ( back) ;              
: CW.load  ( cw# -) cw.file dup ?open not if open else drop then
   robot.program swap CW.file read.fixed  cw.file close   ;     
: CW.save ( cw# -) cw.file dup ?open not if open else drop then 
  robot.program swap CW.file write.fixed cw.file close  ;       
 : bye-bye empty-buffers  ( Or it blows away on quitting) bye ; 
var clock ( timer var)                                          
 : timer ( event flag---\leave if no event for 5 min)           
   if tickcount clock !  ( reset)                               
   else  tickcount  clock @ - [ 60 60 5 * * ] literal >         
     if bye-bye then                                            
   then ;                                                       
════════════════════════════════════════════════════════════════   SCREEN 014
( Rect>rectangle Pseudo.window Clear.panel1)      ( 101484 dws) 
create stripes.pat 255 w, 255 w, 255 w, 255 w,                  
: rect>rectangle ( tlbr---xyxy)                                 
  swap 2swap swap 2swap ;     : @draw draw.rect @rect ;         
: Pseudo.window ( t<odd>/l/b/r/intpattern ---| draws a "window")
  >r draw.rect !rect ( store rect) patcopy penmode              
  @draw rect>rectangle 2 2 pensize frame  rectangle ( border)   
  @draw 4 roll 1+ 4 roll 1+ 4 roll 2- 4 roll 2-                 
  rect>rectangle clear rectangle                                
  @draw 4 roll 18 + 4 roll 1+ 4 roll 2- 4 roll 2-               
  rect>rectangle R> pattern  rectangle   ( wipe interior)       
  stripes.pat penpat 1 12 pensize                               
  @Draw >R drop 2+ swap 3+ R> 4- over vector ( drag)            
  black penpat 1 1 pensize @draw >r drop swap 18 +              
  R> 1- over vector  ginit ;                                    
: clear.panel1 6 48 326 332 clear rectangle  ;                  
════════════════════════════════════════════════════════════════   SCREEN 015
(  Gray.rect  Get.action This.chip @chip !chip)   ( 081084 dws) 
: Gray.rect ( t/l/b/r---)  patbic penmode gray penpat           
 rect>rectangle paint rectangle ginit ;                         
: This.chip ( ---abs chip#| returns current absolute chip#)     
  Current.panel^ @ chip.count@ * Current.instruction^ @ + ;     
: @chip ( ---op.byte/arg.byte)                                  
  this.chip 2* Robot.program + dup 1+ swap c@ ( op.byte)        
  swap  c@ ( arg.byte) ;                                        
: !chip ( op.byte/arg.byte---) >R >R                            
  this.chip 2* robot.program + dup   R> swap c! ( op.byte)      
  R> swap 1+ c!  ( arg-byte) ;                                  
: Get.Action ( ---Action.token)                                 
Robot.program  this.chip 2* + c@ ( Fetch op.byte)               
 dup 192 and Flow.code !   ( set flow.code)                     
 64 mod dup op.byte C! ( Strip Flow.bits from op.byte > op.code)
 ;                                                              
════════════════════════════════════════════════════════════════   SCREEN 016
( Get.arg false.flow get.arg.asc <sw> <gw> irnd within 3window) 
: irnd ( max- rnd) dup 0= if ( 0) else random swap mod then ;   
: Get.arg   ( ---)                                              
  Robot.program this.chip 2* + 1 + c@  Arg.byte c! ;            
: get.arg.asc  ( ---ascii of argument) arg.byte c@              
  64 mod ( strip flow) 64 + ( 1 is A) ;                         
: False.flow arg.byte c@ 192 and Flow.code ! ;                  
: <sw> sys.window window ;                                      
: <gw> gameboard.window window ;                                
: .ps <sw> printer @ .s printer ! <gw> ;                        
: within ( n/min/max---flag)                                    
  1+ 3 pick > rot rot 1- > and ;                                
: 3window                                                       
Window3.rect @rect white pseudo.window  ginit                   
382 136 456  150 clear rectangle  ;                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 017
( wt square.xy   square>rects    square>draw.rect adv.addr     )
: wt  ( n---) 1000 * 0 do loop ;                                
: square.xy    ( square# --- x y of top left sq )               
  dup squares.wide@ mod GAME.WIDTH@ * game.x@ + ( X)            
  swap squares.wide@ / GAME.HEIGHT@ * game.y@ + ( Y) ;          
                                                                
: square>rects ( square# ---|Sets draw,obj,square.rect to sq#)  
  square.xy 2dup swap over game.height@ + over game.width@ +    
  square.rect !rect   ( point to top left rectangle)            
  4+ swap 3+ over 22 + over 30 + obj.rect !rect                 
  ;                                                             
: square>draw.rect ( sq# ---)                                   
   square.xy swap over game.height@ + over game.width@ +        
   draw.rect !rect ;                                            
: adv.addr ( ---addr) adventure$( adventure @ 1- 16* +  ;       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 018
( Square.object Face.line)                        ( 080284 dws) 
                                                                
: square.object ( sq# --- object-code)                          
  room.data(  + c@ ;                                            
create Face.off ( face offset from topleft sq)                  
6 , -22 , ( NW) 20 , -32 , ( N) 34 , -22 , ( NE) 34 , -18 ,     
30 , -12 , ( SE)  22 , -11 , ( S) 19 , -9 , ( SW) 5 , -15 ,     
: Face.line ( targ sq# --- targx/targy/robx/roby)               
   ( calcs a line between face of robot & targ sq)              
 Square.xy game.height@ 2/ + swap game.width@ 2/ + swap         
  Local.xy                                                      
 Robot.square @ Square.xy                                       
  Robot.orientation @  8* Face.off + dup >R 4+ @ + swap         
  R> @ + swap      ( Face x)                                    
  local.xy                                                      
 ;                                                              
════════════════════════════════════════════════════════════════   SCREEN 019
(  Count.baddies, baddy vars)                     ( 110284 dws) 
var Creep.count  create Creeps( 12 allot ( 12 x sq#)            
var Bouncers ( 0or1)  var Bouncer.sq var Bouncer.state          
: Count.baddies ( ---)  creeps( 12 erase                        
0 Creep.count ! 0 Bouncers !                                    
square.count@ 0 do i square.object                              
  case creep@ of 1 creep.count +!                               
                 i creep.count @ 1- creeps( + c! endof          
       bouncer@ of 1 bouncers !                                 
                   i Bouncer.sq ! 3 irnd Bouncer.state ! endof  
endcase loop    ;                                               
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 020
( Put.object Furnish.room)                        ( 103084 dws) 
: put.objects  ( countlimit/obj.code ---) swap irnd  dup 0>     
 if 0 do begin square.count@ irnd dup square.object             
      floor@ =                                                  
      if over Swap Room.data(  + c! 1 else drop 0 then          
      until loop DROP                                           
 else 2drop then   ;                                            
: Furnish.room ( ---)                                           
 adventure @ 1- scenario.play( +                                
 dup      c@  creep@ put.objects                                
 dup adventure.count@ 2* +  c@  bouncer@ put.objects            
 dup adventure.count@ 4* + c@   oil@     put.objects            
 dup adventure.count@ 6 * + c@  disk@    put.objects            
 dup adventure.count@ 8* + c@   coffee@  put.objects            
     adventure.count@ 9 * + c@  pie@     put.objects ;          
                                                                
════════════════════════════════════════════════════════════════   SCREEN 021
( Room data clear.rooms)      decimal             ( 110784 dws) 
var rooms.visited   create room( 100 allot    ( max rooms)      
: clear.rooms( room( 100 erase 0 rooms.visited ! ;              
: chuck.goods ( ---|Erase good things from room)                
room.data( dup square.count@ + swap do                          
  ic@ case disk@ oil@ range.of floor@ ic! endof endcase loop ;  
: goods.check ( room#---)                                       
  adventure @ case 1 of 0 endof 2 of 1 endof 3 of 0 endof       
       4 7 range.of 1 endof 8 of 0 endof  endcase               
  if  1- dup  room( + c@ not ( not visited)                     
    if room( + 1 swap c! rooms.visited @ 1+                     
      dup trip.count( adventure @ 1- + c@ =                     
      if drop clear.rooms(                                      
      else rooms.visited ! then                                 
    else drop chuck.goods then ( been visited)                  
  else drop then ;                                              
════════════════════════════════════════════════════════════════   SCREEN 022
( Load.room)                                      ( 110584 dws) 
                                                                
 : Load.room  ( room# ---) ( .ps  )                             
 dup 3 mod case ( figure linoleum)                              
     0 of 96 320 126 360  endof 1 of 128 320 158 360 endof      
     2 of 160 320 190 360 endof   endcase                       
 floor.rect !rect                                               
 dup Room.data( swap Doom.file read.fixed                       
 dup adventure @ 4 = not swap 2 mod 0= or                       
 if Furnish.room then    ( room#)                               
 count.baddies                                                  
 goods.check   ;                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 023
( 4.play 4.aply See.sound Sound?)    exit         ( 101784 dws) 
create Sin( 256 allot                                           
: fill.sin  256  0 do i 141 100 */  sin 10000 + 78 /            
     i sin( + c! loop ; fill.sin forget fill.sin                
create chord 100 w, ( duration)                                 
4000000 , 125 ,  ( pitch/phase 1) 3900000 , 0 , 1900000 , 0 ,   
 500000 , 0 ,  sin( , sin( , sin( , sin( ,                      
create chord.data 6 w, ( length) 1 w, ( + int) chord ,          
: 4.aplay ( rate/r/r/r/wave/w/w/w/length---)                    
  chord >R R@ w! ( lenght)                                      
  R@ 46 + ! R@ 42 + ! R@ 38 + ! R@ 34 + ! ( waves)              
  R@ 26 + ! R@ 18 + ! R@ 10 + ! R> 2 + ! ( rates)               
  chord.data aplay ;                                            
: creep.sound ( ---)  Sound? if    2 100 20000 10000 irnd + tone
  1000000 irnd 10000000 + dup 4/                                
  dup 4/ dup 4/  sin( sin( sin( sin( 9 irnd 4.aplay then ;      
════════════════════════════════════════════════════════════════   SCREEN 024
( Sounds)                                         ( 110184 dws) 
: Sound? ( ---flag) Sound.on @ ( ?Lisa not and ) ;              
: See.sound ( --) Sound? if 4 0 do                              
    1 150 12000 1000 i * - tone loop then ;                     
: Move.sound ( ---)   Sound? if                                 
2  50 irnd 4000 500 irnd + tone then ;                          
: Zap.sound Sound?                                              
     if 8 0 do 2 100 800 200 i * + tone loop then ;             
 :  crunch ( ---|chew sound)                                    
  Sound? if 4 250 193 tone 1 250 500 tone then ;                
: creep.sound ( ---) Sound? if    2 100 20000 10000 irnd + tone 
  1 100 150 irnd + 10000 irnd 10000 + tone then ;               
: bump.sound ( ---) Sound? if 3 255 893 tone then ;             
: boop sound? if 2 200 17000 tone then ;                        
: boom.sound ( loudness---) sound? if 3 swap 30 *               
 600 400 irnd + tone else drop then ;                           
════════════════════════════════════════════════════════════════   SCREEN 026
(  Ad.title)                                      ( 110284 dws) 
create in$ ,"  in "                                             
: ad.title ( ---|Titles Window 1 during misssion)               
stripes.pat penpat 1 12 pensize  patcopy penmode                
window1.rect @rect >R drop 2+ swap 3+ R> 4- over vector ( drag) 
cw.num @ name>n$                                                
window1.rect @rect swap drop + 2/ swap drop >R ( midpt title)   
n$ stringwidth in$ stringwidth adv.addr stringwidth  + + ( wid) 
16 + 2/ dup R@ + swap R> swap - dup >R ( rt\lft clr rct)        
 29 rot 43 clear rectangle                                      
R> 8+ 40 move.to n$ count type in$ count type                   
adv.addr count type ginit ;                                     
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 027
( Setup.game.screen)                              ( 100484 dws) 
: Setup.game.screen    ( ---) Back.wipe                         
  WIndow1.rect @rect white pseudo.window Game.title  ad.title   
  27 332 128 507  Window2.rect !rect ( inside cw)               
  Window2.rect @rect white pseudo.window                        
  340 29 499 42 clear rectangle                                 
  345 40 move.to ."  Status          Memory"                    
  dam.yx damage.reg@ 0 Draw.reg fuel.yx fuel.reg@ 0 draw.reg    
  rng.yx range.reg@ 0 draw.reg                                  
  key.yx 2dup keypress@ 0 Draw.reg  ( draw.reg only for things) 
  keypress@ 8*  action.s.rect( + @rect                          
  6 roll 2+ 6 roll 6+ over 15 + over 15 + plop                  
  mov.yx mov.stack@ 1 draw.reg obj.yx obj.stack@ 1 draw.reg     
 num.yx num.stack@ 1 draw.reg                                   
  Window3.rect @rect white pseudo.window ;                      
                                                                
════════════════════════════════════════════════════════════════   SCREEN 028
( Draw.floor,door,obj.mask.draw  )           ( 10 ( 100984 dws) 
: draw.floor ( --)     source.bmap draw.bmap^ @ floor.rect      
square.rect srccopy 0  copybits ;                               
                                                                
: draw.door ( --)                                               
  source.bmap draw.bmap^ @ door.rect square.rect srccopy 0      
copybits ;                                                      
                                                                
: obj.mask.draw ( source rect ---) s.rect !rect                 
source.bmap draw.bmap^ @ s.rect obj.rect srcbic 0 copybits      
s.rect -32 0 offsetrect                                         
source.bmap draw.bmap^ @ s.rect obj.rect  srcor 0 copybits ;    
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 029
( Draw.wall)                                      ( 072784 dws) 
: Draw.wall  ( sq#---)   dup                                    
  squares.wide@ + square.object wall@ =                         
      ( square toward reader is wall)                           
  swap 56 < and  ( Not bottom row wall <<56 not calced>>)       
  if walltop.rect else wallside.rect then                       
  source.bmap draw.bmap^ @ 3 pick                               
   square.rect srccopy 0 copybits  drop                         
  ;                                                             
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 030
( Draw.obj)                                       ( 102384 dws) 
create mask.rects( 8 8* allot                                   
: mf ( t/l/b/r/index---) 8* mask.rects( + !rect ;               
185 225 207 255 0 mf ( pie)   209 225 231 255 1 mf ( coff)      
161 289 183 319 2 mf ( disk)  185 289 207 319 3 mf ( oil)       
( floor is out of order)                                        
161 225 183 255 5 mf ( bomb)  209 97 231 127  6 mf ( bncr)      
161 33 183 63   7 mf ( creep)                                   
forget mf                                                       
: Draw.obj  ( obj#---) draw.floor                               
4- 8* mask.rects( + @rect                                       
obj.mask.draw                                                   
;                                                               
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 031
(  Draw.thing)                                    ( 102384 dws) 
                                                                
: draw.thing ( sq# object# ---sq#) dup                          
 case                                                           
       wall@ of drop dup draw.wall endof                        
       door@ of drop draw.door endof                            
       pie@ creep@ range.of dup floor@ =                        
            if drop draw.floor                                  
            else draw.obj then endof                            
endcase ;                                                       
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 032
(  ttl.stuff)                                      ( 101484 dws)
: ttl.stuff ( ---|copys title in ttl.map)                       
 27 top.clip@ + 6 92 326 tfl.rect !rect                         
screen.bmap ttl.bmap tfl.rect ttl.rect srccopy 0 copybits ;     
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 033
( Fill.top)                                       ( 102184 dws) 
: Fill.top ( targ sq# ---)                                      
     square.xy                                                  
   game.height@ 2* [ game.y@ 27 top.clip@ +  - ] literal -      
   ( just the clipped top)                                      
   swap -  game.y@ +                                            
   swap game.width@  swap -  game.x@ +                          
   over  [ game.y@ 27 top.clip@ +  - ]  literal +               
   over 320 +                                                   
   tfl.rect !rect                                               
   ttl.bmap back.bmap ttl.rect tfl.rect srccopy 0 copybits ;    
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 034
( Draw.background)                                ( 101484 dws) 
: Draw.background ( targsq#---)  back.bmap draw.bmap^ !         
 dup squares.wide@ 2* < if dup fill.top then                    
0 0 game.height@ game.width@ square.rect !rect ( t lft rect)    
4 3 26 33 obj.rect !rect                                        
2 squares.wide@ * 1- + dup squares.wide@ 4* -  do ( vert loop)  
   3 0  do     ( horiz loop)                                    
     j i+ dup dup 0< not swap square.count@ < and               
     if dup room.data( + c@ draw.thing drop ( sq# for wall)     
     else drop then                                             
     square.rect game.width@ 0 Offsetrect                       
     obj.rect game.width@ 0 offsetrect                          
   loop   square.rect [ game.width@ -3 * ] literal              
   game.height@  offsetrect                                     
   obj.rect [ game.width@ -3 * ] literal game.height@ Offsetrect
 squares.wide@ +loop ;                                          
════════════════════════════════════════════════════════════════   SCREEN 035
( Front.wall CW.anim CW>anim.copy    )            ( 110284 dws) 
: front.wall ( ---|Draws wall in from of animated thing)        
   draw.rect @rect square.rect  !rect                           
   anim.bmap draw.bmap^ ! wall.covers @ draw.wall               
   screen.bmap draw.bmap^ !  ;                                  
:  CW>anim.copy  ( dh/dv ---)  2dup                             
CWanim.rect rot rot OffsetRect CWdraw.rect rot rot OffsetRect   
back.bmap anim.bmap cwanim.rect cwanim.rect srccopy 0 copybits  
source.bmap anim.bmap mask.rect CWanim.rect srcbic 0 copybits   
source.bmap anim.bmap cw.rect CWanim.rect srcor 0 copybits      
wall.covers @ if front.wall then            ;                   
                                                                
:  CW.anim  ( dh/dv ---)                                        
cw>anim.copy    anim.bmap                                       
 screen.bmap CWanim.rect CWdraw.rect srccopy 0 copybits ;       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 036
( CW.op.mouth)                                    ( 090984 dws) 
:  CW.op.mouth  ( ---)                                          
back.bmap anim.bmap cwanim.rect cwanim.rect srccopy 0 copybits  
      ( copy backgnd into anim.buffer)                          
source.bmap anim.bmap mask.rect CWanim.rect srcbic 0 copybits   
      ( white out mask in anim.buffer)                          
source.bmap anim.bmap cw.rect CWanim.rect srcor 0 copybits      
      ( Or source graphics into anim.buffer)                    
CWanim.rect @rect 2drop  swap 16+ swap ( offset down)           
   over 23 + over 39 + draw.rect !rect                          
source.bmap anim.bmap mm.rect draw.rect srcbic 0 copybits       
source.bmap anim.bmap mouth.rect draw.rect srcor 0 copybits     
    anim.bmap                                                   
 screen.bmap CWanim.rect CWdraw.rect srccopy 0 copybits ;       
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 037
( init.cw.graphics Draw.robot Erase.robot)        ( 101484 dws) 
: Init.CW.Graphics                                              
  robot.square @ dup square.xy [ 60 game.height@ - ] literal    
  - swap  over 55 + over 39 + CWdraw.rect !rect                 
                   ( start draw rect right)                     
 dup   square.xy game.height@ 2* - swap game.width@ -           
 over game.width@ 3 * + over game.height@ 4* + whole.rect !rect 
 draw.background     ;                                          
 : draw.robot ( --)                                             
  [ 3 game.height@ * 60 - ] literal game.width@                 
  over 55 + over 39 + CWanim.rect !rect ( center)               
  0 0 CW.anim  ;                                                
  : erase.robot ( ---)  robot.square @ draw.background          
  back.bmap screen.bmap cwanim.rect cwdraw.rect srccopy 0       
 copybits ;                                                     
                                                                
════════════════════════════════════════════════════════════════   SCREEN 038
( Draw.gameboard)                                 ( 100184 dws) 
: Draw.gameboard ( ---)  screen.bmap draw.bmap^ !               
  0 square>rects                                                
  0 ( counter)                                                  
  squares.wide@ 0 do     ( horiz loop)                          
   squares.high@ 0 do   ( vert loop)                            
     room.data( over +  c@   ( index into room.data()           
     draw.thing                                                 
     square.rect game.width@ 0 Offsetrect                       
     obj.rect game.width@ 0 Offsetrect 1+ ( cntr) loop          
[ game.width@ squares.wide@ * negate ] literal game.height@ 2dup
  square.rect rot rot OffsetRect                                
  obj.rect rot rot Offsetrect loop                              
 drop ( counter)                                                
 draw.robot    ;                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 039
( Back>anim.copy Anim>screen.copy)                ( 103084 dws) 
: Back>anim.copy ( ---)   ( copy backgnd into anim.buffer)      
back.bmap anim.bmap anim.rect anim.rect srccopy 0 copybits ;    
                                                                
: anim>screen.copy ( ---| Draw whole anim.bmap to screen)       
window1.rect @rect                                              
4 roll robot.square @ squares.wide@ < if top.clip@ + then       
( clip at the top of the screen)                                
4 roll 1+ 4 roll 2- 4 roll 2-                                   
s.rect !rect   s.rect clip.rect                                 
anim.bmap screen.bmap anim.rect whole.rect srccopy 0 copybits   
0 0 342 512 s.rect !rect s.rect clip.rect ;                     
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 040
( Check.cover Anim.shft Flash.cw)                 ( 110584 dws) 
                                                                
: Check.cover ( sq#--flag|Is wall below square?)                
  squares.wide@  + dup square.object wall@ =                    
   if Wall.covers ! 1 else drop 0 then  ;                       
                                                                
: Anim.shft ( ---| Shifts from gameboard to anim.bmap coords)   
   draw.rect game.x@ negate game.y@ negate offsetrect ;         
                                                                
: Flash.cw ( #flashes---)  0 do                                 
2 0 do                                                          
source.bmap screen.bmap mask.rect CWdraw.rect srcxor 0 copybits 
10 boom.sound 2 wt loop loop ;                                  
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 041
( Orient.xy CW.slide CW.back.slide)               ( 100984 dws) 
: Orient.xy ( orientation#---)                                  
 case N of 0 -3 endof NE of 4 -3 endof                          
      E of 4 0 endof  SE of 4 3 endof                           
      S of 0 3 endof  SW of -4 3 endof                          
      W of -4 0 endof NW of -4 -3 endof                         
 endcase  ;                                                     
: CW.slide ( --- | animate CW to next sq)                       
 robot.orientation @ orient.xy                                  
CW.anim move.sound  ;                                           
: CW.back.slide ( --- | animate CW in reverse to next sq)       
 robot.orientation @  4+ 8 mod  orient.xy                       
back>anim.copy cw>anim.copy anim>screen.copy move.sound         
 ;                                                              
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 042
( Next.square)                                    ( 081184 dws) 
: next.square  ( orient/ sq --- next-sq) swap 0 wall.covers !   
  case N of squares.wide@ - endof  E of 1+ endof                
       S of squares.wide@ + endof  W of 1- endof                
       NE of squares.wide@ 1- - dup Check.cover                 
             if 18 square>draw.rect Anim.shft then endof        
       SE of dup squares.wide@ 1+ + swap  Check.cover           
            if 25 square>draw.rect Anim.shft then endof         
       SW of dup squares.wide@ 1- + swap Check.cover            
            if 25 square>draw.rect Anim.shft then endof         
       NW of squares.wide@ 1+ - dup Check.cover                 
            if 16 square>draw.rect Anim.shft then endof         
  endcase ;                                                     
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 043
( Add.points count.cycle)                         ( 102684 dws) 
                                                                
: Add.points ( points ---)  Points @ + dup points !             
 24 68 74 80 clear rectangle   24 80 move.to  .  ;              
                                                                
 : count.cycle ( cycles ---)                                    
 cycle.ct @ + dup cycle.ct !                                    
 270 80 move.to                                                 
 dup 1 < if drop 0 game.finished@ prog.status ! then            
 270 68 315 81 clear rectangle                                  
 abs .  ;                                                       
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 044
( Calc.robot.move Boom ?boom)                     ( 040585 dws) 
: Calc.robot.Move ( --- next sq#)                               
  Robot.orientation @                                           
     arg.byte c@ 64 mod check.mov.st                            
     reverse@ = if 4+ 8 mod then                                
     robot.square @ next.square ;                               
var exploded  ( was there an explosion?)                        
: Boom ( ---|Hit a bomb; end game.)  menus.off erase.robot      
  game.x@ game.y@ over squares.wide@ game.width@ * +            
  over squares.high@ game.height@ * + draw.rect !rect           
  draw.rect @rect stripe1 pattern rectangle                     
  96 textsize 23 240 move.to ." BOOM"  12 textsize              
  30 0 do draw.rect @rect invert rectangle i boom.sound loop    
  2000 update.damage 1 exploded ! ;                             
: ?boom ( object---object) 0 exploded !                         
    dup bomb@ = if Boom then ;                                  
════════════════════════════════════════════════════════════════   SCREEN 045
( Goto.next.room)                                 ( 073084 dws) 
                                                                
: Goto.next.room  ( next sq#---next room sq#)                   
  erase.robot ( erase from last room)                           
  0 add.points 0 count.cycle                                    
  0 robot.square @ 0 do ( Count to this door)                   
      i square.object door@ = if 1 + then loop                  
  dup 8 +    (  next room^\ next sq^ pointers into room.data( ) 
  Room.data( square.count@ + + c@    robot.square !             
     ( get robot sq# from room.data( and store it)              
  Room.data( square.count@ + + c@    Load.room                  
     ( get next room# and load it)                              
  Init.CW.graphics                                              
  Draw.gameboard                                                
  drop Calc.robot.move  ;                                       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 046
( Check.for.next.room)                            ( 100784 dws) 
: Check.for.next.room ( next sq#--- next sq# )                  
  Robot.square @ square.object door@ =                          
  if robot.square @                                             
    case                                                        
     0 squares.wide@ 1- range.of dup 0<  endof   ( North)       
     squares.wide@                                              
     [ squares.wide@ squares.high@ 1- * 1- ] literal range.of   
       robot.square @ squares.wide@ mod 0=                      
       if dup squares.wide@ mod squares.wide@ 1- = ( West)      
       else dup squares.wide@ mod 0=  then endof  ( East)       
     [ squares.wide@ squares.high@ 1- * ] literal               
     square.count@ 1- range.of                                  
       dup square.count@ 1- > endof             ( South)        
   endcase                                                      
   if Goto.next.room then  then ;                               
════════════════════════════════════════════════════════════════   SCREEN 047
( Bump)                                           ( 110584 dws) 
0 constant scroll.rgn                                           
: Bump ( obj #moves---obj)  (new.region) ' scroll.rgn !         
  init.cw.graphics  gray backpat                                
  arg.byte c@ 64 mod check.mov.st forward@ =                    
  if  0 do cw.slide loop else  0 do cw.back.slide loop then     
  bump.sound                                                    
  dup dup bouncer@ = swap creep@ = or                           
  if 5 flash.cw 50 update.damage then                           
  window1.rect @rect 4 roll 3- 4 roll 3- 4 roll 5 + 4 roll 4+   
  s1.rect !rect                                                 
  s1.rect 2 2 scroll.rgn scroll s1.rect -2 -2 scroll.rgn scroll 
  init.cw.graphics                                              
  robot.square @ draw.background                                
  back>anim.copy draw.robot anim>screen.copy                    
  50 update.damage   white backpat scroll.rgn dispose.region ;  
════════════════════════════════════════════════════════════════   SCREEN 048
( Move)                                           ( 103084 dws) 
: Move ( ---)                                                   
     Calc.robot.move Check.for.next.room                        
     dup square.object dup floor@ = swap door@ = or             
     if  init.cw.graphics                                       
       arg.byte c@ 64 mod check.mov.st forward@ =               
      if 10 0 do Cw.slide loop else 10 0 do Cw.back.slide loop  
      then                                                      
      dup robot.square ! ( Walk on empty floor) draw.background 
     else ( Hit something) square.object dup wall@ =            
       if 1  Bump drop ( wall)                                  
       else  5 bump ?boom drop then ( obj)                      
     then  robot.square @ 19 <                                  
     if  0 add.points then ( in case erased) ;                  
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 049
( Move.robot)                                     ( 110384 dws) 
: Move.robot ( argcode ---)                                     
  arg.byte c@ 64 mod ( strip flow for now)                      
  check.mov.st dup mov.empty@ = not ( Stack value?)             
  if dup Forward@ <                                             
    if   ( Rotation argument )                                  
       Turn.RIGHT@ = if 1 else -1 then                          
       Robot.orientation @ + 8 mod                              
       move.sound cw.point move.sound                           
    else drop Move                                              
    then                                                        
    exploded @ not if draw.robot move.sound then                
 else drop then ;                                               
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 050
(  Sight.line destroy)                  ( 101484 dws)           
                                                                
: Sightline ( sq# ---)    patxor penmode                        
  dup robot.square @ squares.wide@ - = not ( not under head)    
  if   Face.line        ( targsqx/targsqy/robsqx/rosqy)         
    4 pick 4 pick 4 pick 4 pick vector                          
    10 wt  vector                                               
   else drop 10 wt then ginit ;                                 
                                                                
: Destroy  ( sq# ---) screen.bmap draw.bmap^ !                  
  dup room.data( + floor@ swap c!                               
  dup robot.square @ squares.wide@ - =  ( sq#/flag)             
  if init.cw.graphics draw.robot  drop ( square is under robot) 
  else  dup square>rects floor@ draw.thing drop then            
  ;  ( floor there now)                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 051
( Zapper)                                         ( 103084 dws) 
: Zapper ( ---)  move.sound                                     
   screen.bmap draw.bmap^ !                                     
   Robot.square @                                               
   Square.xy   >R                                               
   Robot.orientation @  4* arm.pt( +  @ point>xy >R             
   + 15 - R> R> + 20 - local.xy  swap   ( top of zapper)        
   over 22 +  over 30 + obj.rect !rect                          
   209 289 231 319 obj.mask.draw   16 wt ;                      
: retract.zapper ( ---)  0 wall.covers !                        
init.cw.graphics back>anim.copy  10 wt                          
  0 0 cw>anim.copy anim>screen.copy ( erase zapper)             
  move.sound ;                                                  
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 052
( Zap.ray)                                        ( 101484 dws) 
: Zap.ray ( targ sq# -)                                         
  dup robot.square @ squares.wide@ - = not ( not under head)    
  if patxor penmode  black penpat 3 3 pensize     ( sq#/sq/sq)  
    Square.xy Local.xy 2dup game.height@ 2/ +                   
    2dup swap game.width@ +  3- swap   >R >R >R >R              
        Robot.square @ Square.xy   >R                           
        Robot.orientation @  4* arm.pt( +  @ point>xy >R        
        + 2- R> R> + 16- local.xy     ( top of zapper)          
        2dup move.to R> R> draw.to R> R> move.to draw.to        
      over game.width@ + over game.height@ + invert oval        
  else drop  then                                               
  ginit   ;                                                     
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 053
( Eat.object Zap.object)                          ( 031185 dws) 
: Eat.it ( sq#---) dup square.object                            
 case pie@ coffee@ range.of 1200 update.fuel  endof             
  oil@ of Scenario.play( adventure.count@ 5 *  +                
              adventure @ 1- + c@ add.points endof              
  disk@ of Scenario.play( adventure.count@ 7 *  +               
         adventure @ 1- + c@ add.points endof endcase destroy ; 
: ?peace ( score-?neg score)  adventure @ 4 = if negate then ;  
: Zap.it ( sq# ---)  dup  square.object                         
  case creep@ of Scenario.play( adventure.count@ +              
              adventure @ 1- + c@ ?peace add.points endof       
    bouncer@ of Scenario.play( adventure.count@ 3 * +           
              adventure @ 1- + c@ ?peace add.points             
              0 bouncers ! endof                                
       bomb@ of retract.zapper boom endof                       
  endcase exploded @ not if destroy else drop then ;            
════════════════════════════════════════════════════════════════   SCREEN 054
( Zap)                                            ( 101484 dws) 
: zap  (  ---)   Robot.orientation @  Robot.square @            
  next.square  Check.for.next.room  drop                        
 Robot.square @           ( sq#)                                
8 0 do                                                          
  Robot.orientation @ swap next.square  ( targsq#)              
  dup square.object                  ( tsq# obj# )              
  dup floor@ =                        ( tsq# obj fl)            
    if   drop ( just floor@)         ( tsq# )                   
    else    zapper  ( tsq/obj)                                  
      over zap.ray Zap.sound begin ?sound not until             
      dup wall@ =  swap door@ = or ( Something seen)   ( sq#)   
      if dup zap.ray else  dup dup zap.ray  zap.it              
      then exploded @ not if retract.zapper then leave          
   then                                                         
loop   drop  ;                                                  
════════════════════════════════════════════════════════════════   SCREEN 055
( prep.arm hand arm.sound)                        ( 102284 dws) 
var facing  var arm.inc                                         
: prep.arm ( ---)  robot.orientation @ 4* arm.pt( + @ point>xy  
game.width@ game.height@ 2* 3 roll + rot rot + 1- swap xyoffset 
robot.orientation @  4* arm.rot( + @ xypivot                    
3 3 pensize patcopy penmode  black penpat                       
robot.orientation @ dup dup 2 < swap 4 > or                     
if -1 else 1 then dup facing ! (  arm direction -1=lft)         
swap dup e < if drop 1 ( diferent incs for arm orientations)    
        else dup se = swap sw = or                              
           if 3 else 2 then then arm.inc ! ;                    
: hand ( x/yoff/xypivotangle---)                                
 @pen xyoffset 0 xypivot  0 0 move.to                           
 4 5 rdraw  -8 0 rmove 4 -5 rdraw                               
 xypivot xyoffset ;                                             
: arm.sound sound? if 1 20 15000 tone then ;                    
════════════════════════════════════════════════════════════════   SCREEN 056
: Move.Arm ( --) prep.arm  0 wall.covers ! init.cw.graphics     
  robot.orientation @ dup dup SW = swap SE = or                 
  if drop 10 ( extend arm for down oblique)                     
  else dup NW = swap NE = or if -10 else -2 then ( short for up)
  then 30 + * 2 do  get.xyoffset get.xypivot ( for hand)        
     back>anim.copy arm.sound 0 0 cw>anim.copy                  
    anim.bmap setportbits 0 0 move.to robot.orientation @       
    dup N = if  drop -20 0 else  S = if 20 0                    
      else i i 3 * sin joint.len@ facing @ -10000 * */ then     
    then robot.orientation @ dup nw = swap ne = or if 2/ then   
     draw.to robot.orientation @ N = not                        
    if i 2* 0 draw.to  hand else drop drop drop then            
    screen.bmap setportbits anim>screen.copy                    
facing @ arm.inc @ * +loop ginit                                
init.cw.graphics back>anim.copy move.sound 0 0 cw>anim.copy     
anim>screen.copy ;  ( erase arm)                                
════════════════════════════════════════════════════════════════   SCREEN 057
( Sing)                                           ( 110384 dws) 
create scale( 5233 , 5873 , 6593 , 6985 , 7840 , 8800 ,         
              9878 , 10466 ,  ( C-C scale freq * 10)            
: Sing ( ---) get.arg                                           
arg.byte c@ 64 mod check.num.st num.empty@ = not                
if 0 wall.covers ! cw.op.mouth                                  
  Sound? if                                                     
   3 128        ( duration\volume)                              
   arg.byte c@ 64 mod check.num.st num0@ - ( note)              
   4* scale( + @ tone                                           
   then                                                         
   begin ?sound not until                                       
   0 0 cw.anim                                                  
then ;                                                          
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 058
( Pick.up Act.on.world)                           ( 110584 dws) 
: Pick.up ( ---) robot.orientation @ robot.square @ next.square 
  check.for.next.room 0 wall.covers ! cw.op.mouth  move.arm     
  dup square.object ?boom                                       
  dup dup wall@ = swap creep@ = or  swap bouncer@  = or         
   if square.object wall@ = if bump.sound 50 update.damage      
      else 5 flash.cw 150 update.damage then                    
   else  dup square.object                                      
     dup dup floor@ = swap door@ = or swap bomb@ = or           
       not if  eat.it 5 0 do  crunch 0 0 cw.anim                
         crunch cw.op.mouth loop  crunch 0 0 cw.anim            
         else drop then then ;                                  
: Act.on.world  ( opcode---)                                    
  case  Qray@ of Zap endof     Sing@ of Sing endof              
   Pick.up@ of Pick.up endof  Move@ of get.arg Move.Robot endof 
  endcase ;                                                     
════════════════════════════════════════════════════════════════   SCREEN 059
( Feel.for  )                                     ( 103184 dws) 
: feel.for  ( object ---)                                       
  robot.orientation @ robot.square @ next.square  ( obj\next sq)
   Check.for.next.room    dup square.xy >R >R                   
   Robot.square @ Square.xy   >R                                
   Robot.orientation @  4* arm.pt( +  @ point>xy >R             
   + R> R> +  local.xy  move.to   ( base of feeler)             
   3 3 pensize patcopy penmode 0 -6 rdraw  arm.sound            
   robot.orientation @ N = if R> R> 2drop                       
   else  R> 19 + R> 15 + 2 2 pensize draw.to                    
    -2 0 rdraw 4 0 rdraw then ( feeler)                         
  init.cw.graphics robot.square @ draw.background               
  back>anim.copy 0 0 cw>anim.copy  2 wt                         
   anim>screen.copy robot.square @ 12 < if 0 add.points then    
   square.object  ?boom ( objsought/obj felt)                   
  = not if False.flow   ( Don't feel it)  then  ginit ;         
════════════════════════════════════════════════════════════════   SCREEN 060
(  look.for)                                      ( 031185 dws) 
var seen                                                        
: look.for  ( object ---)  <gw> False seen !                    
  Robot.orientation @  Robot.square @ next.square               
  Check.for.next.room drop robot.orientation @  robot.square @  
  squares.wide@ 0 do    ( Search loop)                          
   2dup next.square swap drop dup square.object dup             
    ( searchobj orient sq# sqobj sqobj)                         
   floor@ = 5 pick floor@ = not and if  drop                    
    ( just floor and floor not searched for)                    
   else over sightline 4 pick =  ( Something , obj/orient/sq#/f)
    if True seen ! ( Search obj) i 1+ update.range ( range.reg) 
      black penpat patxor penmode   1 1 pensize                 
      dup Sightline  See.sound  then leave                      
 then loop            ( Search loop)                            
seen @ 0= if False.flow then  drop drop drop  ;                 
════════════════════════════════════════════════════════════════   SCREEN 061
( Smell.for Detect.&.branch)                      ( 110484 dws) 
: Smell.for   ( object---)  false.flow ( assume flase)          
square.count@ 0 do                                              
 dup i square.object =  ( compare search item w sq.item)        
 if this.chip 2* robot.program + c@ 192 and flow.code !         
    ( true.flow) leave then                                     
loop drop ;                                                     
                                                                
: Detect.&.branch ( opcode ---)                                 
  arg.byte c@ 64 mod check.obj.st dup obj.empty@ = not          
  if swap                                                       
    case feel.for@ of feel.for endof                            
     look.for@ of look.for endof                                
     smell.for@ of smell.for endof                              
    endcase                                                     
  else 2drop false.flow then ;                                  
════════════════════════════════════════════════════════════════   SCREEN 062
( Keypress  Update.key   )                        ( 102284 dws) 
 : Keypress  ( ---)                                             
  Key.pressed @  arg.byte c@ 64 mod    ( KP Arg)                
  =  ( compare)                                                 
  if ( match key)  ( ." Right key." )                           
     No.key@ Key.pressed !    ( Clear kbd)                      
  else False.flow ( ." Wrong key." )                            
  then ;                                                        
: Update.key ( asc---|Updates and displays key pressed)         
   key.yx 7 + swap 20 + swap over 15 + over 15 + draw.rect !rect
   dup 96 > ( lower case?) if 32 - then                         
   dup dup 64 < swap 90 > or                                    
   if drop No.key@ 64 + then  ( only alpha)  64 -               
   dup key.yx 10 + swap 31 + rot 64 + draw.letter               
    KEY.PRESSED ! ;                                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 063
( Special  Flip.coin)                           ( ( 092484 dws) 
                                                                
: Flip.coin                                                     
  2 irnd  0=                                                    
  sys.window window                                             
 if False.flow  then                                            
  ;                                                             
                                                                
: Special   ( opcode ---)                                       
 case                                                           
   Flip.coin@ of Flip.coin endof                                
   Keypress@ of Keypress endof                                  
 endcase ;                                                      
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 064
( Subpanel Boomerang )                            ( 031185 dws) 
: Fudge -1 Current.instruction^  ! ( Offset left)               
  Right.f@ flow.code ! ;  ( Flow right)                         
variable return^                                                
: Subpanel   ( ---) current.instruction^ @ return^ !            
  Arg.byte c@ 64 mod   ( Strip to panel #)                      
  Current.panel^ !      5 panel ! ( redraw 1/4 panle)           
  fudge ( 0 Current.Instruction^ ! )                            
;                                                               
: Boomerang  ( ---)                                             
  0 current.panel^ !    5 panel !                               
  return^ @ current.instruction^ !                              
  robot.program this.chip 2* + c@ 192 and flow.code !           
              ( newflow)                                        
  ;                                                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 065
( Goto)                                           ( 102284 dws) 
: Goto  ( opcode ----)                                          
  GET.ARG                                                       
  case                                                          
    Go.Marker@ of NO.KEY@ Update.key                            
              endof  ( Clear kbd)                               
    Subpanel@ of Subpanel  endof                                
    Boomerang@ of Boomerang  endof                              
  endcase                                                       
 ;                                                              
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 066
 ( Calc.next.instruction )                        ( 110884 dws) 
                                                                
: calc.next.instruction ( ---)                                  
  op.byte C@ dup goto.go@ = swap socket@ = or if 0  ( jump to 0)
  else                                                          
    current.instruction^ @                                      
    flow.code @                                                 
    case                                                        
       Up.F@ of Chips.wide@ - endof                             
     Down.F@ of Chips.wide@ + endof                             
     Left.F@ of 1 - endof                                       
    Right.F@ of 1 + endof                                       
    endcase                                                     
  then  ( <sw> dup cr ." Inst. #: " .   .s  ) <gw>              
  Current.instruction^ !  ;                                     
                                                                
════════════════════════════════════════════════════════════════   SCREEN 067
 ( Game.mouser)                                    ( 080185 dws)
: Game.mouser ( ---| used only for debug   control)             
  game.status @ debug.on@ =                                     
  if mouse.was.. Debug.c.rect ptinrect                          
     if mouse.was.. point>xy drop  ( x)                         
        case                                                    
         418 442 range.of 2147483647 endof                      
         443 466 range.of 500 endof                             
         467 491 range.of 2 endof                               
        endcase boop  debug.controls                            
     then                                                       
  then ;                                                        
: Game.events ( ---)                                            
     do.events dup  timer   flush.events                        
    case mouse.down of  Game.mouser endof endcase  ;            
                                                                
════════════════════════════════════════════════════════════════   SCREEN 068
( Execute.robot.instruction)                      ( 110184 dws) 
: Execute.robot.instruction  ( ---)   game.events               
  prog.status @ dup game.on@ = series@ = or                     
  if ?KEYSTROKE IF Update.key THEN                              
    Get.Action   game.events                                    
             dup Cycles( + c@ negate Count.cycle                
             dup Fuel( + c@ negate update.fuel                  
    dup case   Goto.range range.of Goto endof                   
     Act.on.World.range range.of Act.on.World endof             
    Detect.&.Branch.range range.of Get.arg Detect.&.Branch endof
          Special.range range.of Get.arg Special endof          
            Stack.range range.of Get.arg Stacker endof          
                      Socket@ of drop endof                     
   endcase  game.events Calc.Next.Instruction                   
 then ;                                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 069
( Init.game)                                      ( 040785 dws) 
: init.game  cw.init  0 points !  2 debug.speed !               
( 17 1 do i "  " wh.menu set.item$ loop 0 wh.menu menu.enable   
cw.num @ 0 wh.menu item.check   )                               
0 current.instruction^ !  0 current.panel^ !   0 exploded !     
0  damage.reg ! 6999 fuel.reg ! 0 update.range                  
 clear.stacks    clear.rooms(                                   
No.chip@ Inv.chip^ !   ( No inverted debug chip)                
cycle( adventure @ 1- 4* + @ cycle.ct !                         
5 panel !              ( This 1/4panel hasn't been drawn)       
game.status @ case  Debug.on@ of Debug.screen endof             
      Stats.on@ of Stats.screen endof endcase                   
 Adventure @ 1- room.ct( + c@ irnd 1+ Load.room                 
begin square.count@  irnd dup robot.square !                    
  square.object floor@ = until  8 irnd CW.point                 
  Init.CW.graphics 0 add.points   ;                             
════════════════════════════════════════════════════════════════   SCREEN 070
( Stop.game Leave.game Start.game)                ( 040585 dws) 
Create G.on$ ," Start Mission" Create G.off$ ," End Mission"    
create se$ ," Series" create lm$ ," Last Mission"               
: Stop.game ( ---)                                              
  prog.status @ series@ = not if Game.off@ Prog.status ! then ; 
: Leave.game ( ---)                                             
  doom.file dup ?open if close else drop then                   
  1  G.on$  G.menu set.item$                                    
  2 -1 g.menu item.enable                                       
 2 se$ g.menu set.item$ ;                                       
: Start.game ( ---)  1  G.off$  G.menu set.item$                
  doom.file dup ?open not if open else drop then                
  setup.game.screen   transient.allot  ttl.stuff                
  adventure @ new.interior  init.game                           
  Draw.gameboard  0 update.damage 0 update.fuel                 
  prog.status @ series@ = not if Game.on@ Prog.status ! then  ; 
════════════════════════════════════════════════════════════════   SCREEN 071
( Envir.menu routines)                            ( 101884 dws) 
Create D.on$ ," Debug On" Create D.off$ ," Show Stats"          
                                                                
: Start.stats ( ---)                                            
Stats.on@ Game.status ! 4 D.on$ o.menu set.item$                
stats.screen ;                                                  
: Start.debug ( ---)                                            
Debug.on@ Game.status ! 4 D.off$ o.menu set.item$               
5 panel !                                                       
debug.screen ;                                                  
: ?stats ( ---)                                                 
    game.status @ case turn.debug.on@ of start.debug endof      
                       turn.stats.on@ of start.stats endof      
                  endcase ;                                     
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 072
 ( ******** Game ************ )                   ( 080185 dws) 
: Game ( -) inc.missions game.status @ stats.on@ =              
   if stats.screen then menus.on 0 wh.menu menu.enable game.off 
 BEGIN                                                          
    move.baddies  ( game.events)                                
    Game.status @ debug.on@ =                                   
    if Show.debug  Execute.robot.instruction                    
      debug.speed @ 0 do do.events  dup timer                   
        case in.menubar of leave endof                          
          mouse.down of Game.mouser leave endof endcase loop    
    else execute.robot.instruction then                         
    ( game.events)                                              
    ?stats game.events                                          
  Prog.Status @ dup Game.on@ = swap series@ = or not Until      
  menus.off update.stats  stats.screen   transient.return       
  ?heap.size drop leave.game  game.on ;                         
════════════════════════════════════════════════════════════════   SCREEN 073
: Init.ChipWits ( ---)  back.wipe  voc.chop       ( 080185 dws) 
gameboard.window 2+ sys.bmap 14 cmove  ( save screen data)      
gameboard.window 2+ screen.bmap 14 cmove                        
 files.name  load.names  t.init  IBOL.file open                 
IBOL.buffer@ IBOL.len 0 5 Read.virtual  2 debug.speed !         
IBOL.file close ibol.file remove 7 remove                       
 " Source Graphics" 7 assign  7 open   0 0 1 1 108 pict.in.rect 
Source.buffer Source.len 0 7 Read.virtual 7 close  7 remove     
game.off@ prog.status !  true Sound.on !  0 copy.buff.full !    
read.last.cw&envir  fetch.name load.envirs  load.stats          
 wareh.menu WS.menu Envir.menu   Option.menu draw.menu.bar      
cw.num @    cw.load   adventure @  ad.m                         
 set.cw.menu.names  setup.game.screen  debug.on@ game.status !  
0 0 1 1 110 pict.in.rect 70 158 191 327 110 pict.in.rect        
ginit 140 150 move.to ." Ready when you are."                   
 start.debug  3 0 w.menu item.enable    ;                       
════════════════════════════════════════════════════════════════   SCREEN 074
  : Stat.points  ( too.bad endgame series)        ( 041185 dws) 
  window3.rect @ point>xy 40 + swap 15 + swap move.to ;         
: Too.bad ( ----|chipwit dies) turn.game.off@ prog.status !     
  stat.points fuel.reg @ 1 <                                    
   if ." Out of fuel."  else ." Completely damaged." then ;     
: Endgame ( ---|game over ) prog.status @ series@ = not if      
 TURN.game.off@ prog.status ! then stat.points ." Game over." ; 
: Series ( ---) menus.off start.game 0 last.mission ! GAME      
  menus.on                                                      
  prog.status @ dup dup dup workshop.on@ = swap game.off@ = or  
  swap turn.game.off@ = or swap quit@ = or not last.mission @   
  not and if series@ prog.status ! 1 G.off$  G.menu set.item$   
  2 lm$ g.menu set.item$ 2 0 g.menu item.enable                 
  8000 0 do do.events if leave then loop then prog.status @     
   series@ = not if leave.game then 2 -1 g.menu item.enable ;   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 075
 ( ******** ChipWits Master Program**** )         ( 080185 dws) 
: ChipWits ( ACT.FL--) IF gameboard.window window Init.ChipWits 
 turn.game.on@ prog.status ! 1 cw.load   1 ad.m                 
 BEGIN random drop DO.EVENTS timer Prog.status @                
  case game.off@ of ?stats endof ( Wait)                        
     turn.game.on@ of FLUSH.EVENTS menus.off start.game endof   
     Game.on@ of FLUSH.EVENTS 2 0 g.menu item.enable (  series) 
        Game set.cw.menu.names FLUSH.EVENTS endof               
     Series@ of Series set.cw.menu.names  flush.events endof    
     turn.game.off@ of stop.game flush.events menus.on  endof   
     game.aborted@ of Too.bad flush.events menus.on endof       
     game.finished@ of endgame flush.events menus.on endof      
     Workshop.on@ of flush.events Workshop flush.events endof   
     Workshop.off@ of menus.off w.leave setup.game.screen       
          stop.game menus.on endof                              
     quit@ of  bye-bye endof  endcase again ELSE THEN ;         
════════════════════════════════════════════════════════════════   SCREEN 076
( Copybits DrawPicture  Restore.window OffSetRect ( 102384 dws) 
( INMAC pp QD 60, 35, 13, TU 9 , MacForth p 11-17)              
( CopyBits ( srcbits,dstBits:Bitmap;srcrect,dstrect,:rect;      
             mode:Integer;maskRgn: RgnHandle)                   
hex A8EC w>mt  CopyBits decimal  ( stack parameters above ----) 
( SetPortBits( bm:Bitmap)  ( INMAC QD 37)                       
hex A875 mt SetPortBits ( bitmap ---) decimal                   
hex A8F6 mt DrawPicture  ( Pichandle/destrect ----)  decimal    
hex a87b mt Clip.rect ( rect---)  decimal                       
create sys.bmap 14 allot  ( for restoring sys.window)           
sys.window 2+ sys.bmap 14 cmove  ( save screen bmap data)       
hex A8A8 2w>mt OffSetRect  ( rectpointer/dx/dy ---- | QD46)     
a8d8 func>l (New.region)  ( ---rgn)                             
a8d9 mt dispose.region ( rgn---)                                
decimal                                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 077
( BackBuffers & bmaps)                            ( 092884 dws) 
game.width@ 3 * is back.wide@                                   
game.height@ 4 * is back.high@                                  
0 0 back.high@ back.wide@ rect anim.rect ( fr drawing to bkgnd) 
back.wide@ 8/ 1+ back.high@ * is back.len@                      
create screen.bmap sys.window 2+ @ ,  64 w, 0 w, 0 w, 342 w,    
512 w,                                                          
first is back.buffer ( scr 179 puts it in block buffer)         
                                                                
create back.bmap back.buffer ,                                  
   back.wide@ 8/ 1+ w, 0 w, 0 w, back.high@ w, back.wide@ w,    
                                                                
( : cbk back.bmap screen.bmap anim.rect anim.rect srccopy       
0 copybits ;  ( remove ----------------)                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 078
( Anim.buffer TTl.buffer and rects)               ( 102184 dws) 
 0 is anim.buffer ( sc 179)                                     
back.wide@ 8/ 1+ back.high@ * is anim.len@                      
create anim.bmap anim.buffer ,  back.wide@ 8/ 1+ w,             
0 w,  0 w, back.high@ w, back.wide@ w,                          
0 0 0 0 rect CWanim.rect     ( to draw CW in anim.buffer)       
0 0 0 0 rect CWdraw.rect     ( to draw CW to screen)            
variable draw.bmap^  ( points to where items are drawn)         
23 is top.clip@ ( Distance from top of window 1 to clip)        
326 6 - is ttl.wide@  92 27 top.clip@ + - is ttl.high@          
0 0 ttl.high@ ttl.wide@ rect ttl.rect ( fr drawing to bkgnd)    
0 0 0 0 rect tfl.rect ( for drawing into back.bmap)             
ttl.wide@ 8/ ttl.high@ * is ttl.len@                            
0 is ttl.buffer ( scr 179 puts it in heap)                      
create ttl.bmap ttl.buffer , ttl.wide@ 8/ w, 0 w,               
  0 w, ttl.high@ w, ttl.wide@ w,                                
════════════════════════════════════════════════════════════════   SCREEN 079
( Arm.pt( Mouth.pt(  Arm.rot( Arm consts)         ( 102684 dws) 
: p, xy>point , ;                                               
Create Arm.pt(  ( Rel xy of arm root)                           
16 -28 p, ( 0) 19 -28 p, ( 1) 22 -29 p, ( 2)  24 -26 p, ( 3)    
22 -23 p, ( 4) 18 -22 p, ( 5) 18 -23 p, ( 6)  12 -26 p, ( 7)    
                                                                
Create Arm.rot(   ( Angle from arm.pt to object)                
350 , ( NW) 90 , ( N) 10 , ( NE) 45 , ( E)                      
60 , ( SE) 270 , ( S) 300 , ( SW) 315 , ( W)                    
                                                                
64 is Arm.len@     Arm.len@ 2/ is Joint.len@                    
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 080
   exit                                                         
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 081
( Source.bmap)                                    ( 072984 dws) 
232 is source.height@ 368 is source.width@                      
source.width@ source.height@  8/ * constant Source.len          
                                                                
0 is Source.buffer  ( Source graphics)                          
create Source.bmap source.buffer , source.width@ 8/ w,          
0 w, 0 w, source.height@ w, source.width@ w,                    
0 0 source.height@ 1+ source.width@ 1+  rect src.rect           
                                                                
( 85 load ( Save new Clipboard)                                 
                                                                
  (                                                             
source.bmap sys.window 2+ src.rect src.rect srccopy 0 copybits  
    )                                                           
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 082
( Source.bmap rects)                              ( 092384 dws) 
1 1 56 40 rect cw.rect        57 1 112 40 rect mask.rect        
113 1 136 40 rect mouth.rect  137 1 160 40 rect mm.rect         
64 320 94 360 rect wallside.rect ( side of wall graphic)        
32 320 62 360 rect walltop.rect ( top of wall)                  
192 320 222 360 rect door.rect                                  
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 083
( CW.init Cw.point)                               ( 081284 dws) 
: cw.init ( ---)                                                
W robot.orientation !    ( to begin)                            
1 1 56 40 cw.rect  !rect ( ChipWits rect in source)             
57 1 112 40  mask.rect  !rect                                   
113 1 136 40 mouth.rect  !rect                                  
137 1 160 40 mm.rect    !rect ( mouth mask rect) ;              
:  Cw.point  ( cw rot 0-7 ----)                                 
( use offsetrect and change Robot.orientation)                  
dup Robot.orientation @ - -40 *                                 
  mask.rect over 0 OffsetRect                                   
  cw.rect over 0 OffsetRect                                     
  mouth.rect over 0 OffsetRect                                  
  mm.rect over 0 OffsetRect                                     
  drop robot.orientation !  ( Store new one)                    
;                                                               
════════════════════════════════════════════════════════════════   SCREEN 084
( Save new clipboard to "IBOL")                    ( 100184 dws)
create IBOL.buffer@ ibol.len allot                              
create IBOL.bmap IBOL.buffer@ , IBOL.width@ 8/ w,               
0 w, 0 w, IBOL.height@ w, IBOL.width@ w,                        
sys.window 2+ @ constant Pic.buffer   ( store clip in screen)   
5 remove " macforth3:Copy of Clipboard File" 5 assign           
?file.error 5 open                                              
Pic.buffer 5 get.eof 0 5 read.virtual ?file.error  5 close      
create Pic.handle pic.buffer 8+ ,    ." got here"               
IBOL.bmap setportbits    ( point to source bmap)                
pic.handle IBOL.rect DrawPicture   ( draw clip into source bmap)
sys.bmap SetPortBits  ." back"                                  
IBOL.bmap sys.window 2+ IBOL.rect IBOL.rect srccopy 0 copybits  
forget Pic.buffer 5 remove " macforth3:IBOL" 5 assign           
?file.error ( 5 create.file ( new)  5 open  IBOL.buffer@        
IBOL.len 0 5 write.virtual ?file.error  5 close                 
════════════════════════════════════════════════════════════════   SCREEN 085
( Save new clipboard to "Source Graphics")        ( 072284 dws) 
create Source.buffer source.len allot ( Source graphics)        
create Source.bmap source.buffer , source.width@ 8/ w,          
0 w, 0 w, source.height@ w, source.width@ w,                    
sys.window 2+ @ constant Pic.buffer   ( store clip in screen)   
7 remove " Macforth3:Clipboard File" 7 assign ?file.error 7 open
 Pic.buffer 7 get.eof 0 7 read.virtual ?file.error  7 close     
create Pic.handle pic.buffer 8+ ,    ." got here"               
source.bmap setportbits    ( point to source bmap)              
pic.handle src.rect DrawPicture   ( draw clip into source bmap) 
sys.bmap SetPortBits ." back"                                   
source.bmap sys.window 2+ src.rect src.rect srccopy 0 copybits  
forget Pic.buffer 8 remove " Macforth3:Source Graphics" 8 assign
  ?file.error ( 8 create.file ( new)                            
 8 open source.buffer source.len 0 8 write.virtual ?file.error  
8 close ." New Source File written."                            
════════════════════════════════════════════════════════════════   SCREEN 086
( ************ WorkShop data*************)        ( 102984 dws) 
variable Hot.chip  ( current chip in panel)                     
variable WS.op.byte variable WS.arg.byte                        
variable WS.true.flow variable WS.false.flow                    
var Puller.com var Inserter.com                                 
var Garbage.com    ( Switches for enabling commands)            
var Wire.selected   ( 0 none 1 true.flow 2 false.flow)          
var new.cw  ( has a new chipwit been loaded? 0 -1)              
62 is None@  ( Nothing indicator)                               
9999 is no.chip@  ( no chip inverted in debug)                  
36 132 77 157 rect CHIP.rect   ( 41highx25wide)                 
76 132 117 157 rect SOCKET.rect                                 
116 132 157 157 rect junct.rect                                 
0 0 0 0 rect cursor.rect                                        
var cursor.count 18 is cursor.rate@                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 087
( Rects)                                          ( 100284 dws) 
0 0 0 0 rect WS.chip.rect ( moves)                              
0 0 0 0 rect ws.wire.rect ( edit wires here) 0 0 0 0 rect Up.ws 
0 0 0 0 rect Down.ws 0 0 0 0 rect Left.ws 0 0 0 0 rect Right.ws 
27 134 45 294 rect panel.select.rect                            
49 335 97 502 rect command.rect                                 
53 341 87 377 rect Garbage.rect  50 387 90 496 rect Title.rect  
95 341 109 496 rect action.label.rect                           
116 341 228 496 rect Action.rect                                
237 341 252 496 rect thing.label.rect                           
259 341 322 496 rect Thing.rect 51 8 332 326 rect Panel.rect    
Create Wire.s.rect(  32 allot                                   
95 81 105 91  wire.s.rect( !rect ( ^)   ( Up wires)             
75 81 85 91  wire.s.rect( 8 + !rect  ( v)   ( Down )            
65 81 75 91  wire.s.rect( 16 + !rect ( <)   ( Left)             
85 81 95 91 wire.s.rect( 24 + !rect ( >)   ( right)             
════════════════════════════════════════════════════════════════   SCREEN 088
( IBOL.bmap   Plop)                               ( 100184 dws) 
160 is IBOL.height@ 160 is IBOL.width@                          
IBOL.width@ IBOL.height@  8/ * constant IBOL.len                
0 0 IBOL.height@ 1+ IBOL.width@ 1+  rect IBOL.rect              
                                                                
( 84 load ( Save new COPY of Clipboard)                         
                                                                
0 is IBOL.buffer@  ( point correctly in chop.vocab)             
create IBOL.bmap IBOL.buffer@ , IBOL.width@ 8/ w,               
0 w, 0 w, IBOL.height@ w, IBOL.width@ w,                        
( IBOL.bmap sys.window 2+ IBOL.rect IBOL.rect srccopy 0         
 copybits  )                                                    
: Plop ( tlbr source tlbr draw ---) Draw.rect !rect S.rect !rect
  Ibol.bmap screen.bmap s.rect draw.rect srccopy 0 copybits ;   
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 089
( Debug.screen )                                  ( 040885 dws) 
 155 418  172 491 rect Debug.c.rect  ( controls)                
: debug.controls ( speed---) 2 2 pensize patcopy penmode        
 black penpat 144 0 161 73 s.rect !rect                         
 Ibol.bmap screen.bmap s.rect debug.c.rect srccopy 0 copybits   
  417 154 491 173 frame rectangle dup                           
  case 2 of 467 489 endof 500 of 443 467 endof                  
   2147483647 of 419 442 endof  endcase hide.cursor             
  156 swap 171 invert rectangle   debug.speed ! show.cursor ;   
: Debug.screen ( ---)  <gw>                                     
 3window  397 146 move.to ." Debug"  2 2 pensize                
window3.rect @rect 2drop 2dup 10+ swap 21 + over 19 + over 19 + 
 frame rectangle                                                
 debug.speed @ debug.controls                                   
 40 + swap 21 + over 20 + over 19 +  frame rectangle            
 332 175 505 175 vector ginit ( Panel stuff) ;                  
════════════════════════════════════════════════════════════════   SCREEN 090
( Action.s( )                                     ( 092384 dws) 
: IR  ( xpos/ypos/size<1or2>---|IBOL.Source.rect( creator)  >R  
 16 * 1+ swap 16 * 1+  swap ( abs y/x)    over 15 +             
 over 16 +  R> 2 = if 16 + then ( Double ) make.rect drop  , , ;
 Create Action.s.rect(                                          
0 4 2 IR ( Go)   0 6 2 IR ( Goto.go)   1 4 2 IR ( Panel)        
1 6 2 IR ( Boomerang)   7 2 2 IR ( Wire)  ( 0-4)                
3 8 1 IR ( Move)  3 4 2 IR ( Pickup)  2 6 2 IR ( Qray)          
9 1 1 ir ( sing) ( 5-8)                                         
2 8 1 IR ( Feelfor)  0 8 1 IR ( Lookfor) 8 1 1 ir ( smellf 9-11)
 2 4 2 IR ( Flipcoin) 1 8 1 IR  ( Keypress)  ( 13-14)           
7 8 1 IR ( Num=)  7 7 1 IR ( Num<) 5 2 1 IR ( Obj=)             
4 6 1 IR ( Move=) 4 7 1 IR ( On.number) 6 7 1 IR ( On.object)   
 5 7 1 ir ( on.move) 7 9 1 ir ( drop.stack) ( 14-21)            
 4 4 2 IR ( Plus) 3 6 2 IR ( Minus) ( 22-23)                    
121 137 153 153 action.s.rect( wire@ 8* + !rect                 
════════════════════════════════════════════════════════════════   SCREEN 091
( Thing.s.rect( )                                 ( 100484 dws) 
action.s.rect( drop.stack@ 8* + dup  @rect swap 1- swap         
5 roll !rect  ( correct drop stack)                             
Create Thing.s.rect(                                            
2 0 1 IR ( RIT) 3 0 1 IR ( LFT) 0 0 1 IR ( FWD) 1 0 1 IR ( REV) 
( 0-3)                                                          
0 2 1 IR ( Pie) 1 2 1 IR ( Cof) 3 2 1 IR ( disk)                
4 2 1 IR ( OIL) 4 3 1 IR ( Floor)                               
0 3 1 IR ( Bomb) 1 3 1 IR ( Bouncer) 2 3 1 IR ( Creep)          
3 3 1 IR ( Wall) 6 3 1 IR ( Door) ( 4-13)                       
4 0 1 IR ( Damage) 5 0 1 IR ( Fuel) 6 0 1 IR ( Range) ( 15-17)  
8 0 1 IR ( Move st) 7 0 1 IR ( # st) 9 0 1 IR ( Obj st)         
2 2 1 ir ( mov emp) 2 2 1 ir ( # emp) 2 2 1 ir ( obj empty)     
( 18-22)                                                        
0 1 1 IR ( 0) 1 1 1 IR ( 1) 2 1 1 IR ( 2) 3 1 1 IR ( 3)         
4 1 1 IR ( 4) 5 1 1 IR ( 5) 6 1 1 IR ( 6) 7 1 1 IR ( 7) ( 23-30)
════════════════════════════════════════════════════════════════   SCREEN 092
( Action.type( )                                  ( 100184 dws) 
var this.act.type                                               
100 is ts@ 101 is ms@ 102 is st@ 103 is t@ 104 is te@           
105 is m@ 106 is me@ 107 is n@  108 is ne@ 109 is s@            
110 is l@ 111 is sb@ 112 is -@                                  
( thing-stack,mov-st,stack,thing,th-empty,move,move-empty)      
( number,number-empty,sing,letter,subpanel,nothing types)       
create Action.type( action.count@ allot                         
: AT ( Action/type ---) swap Action.type( + c! ;                
Go.marker@ -@ AT Goto.go@ -@ AT Subpanel@ sb@ AT                
Boomerang@ -@ at Wire@ -@ AT Move@ ms@ AT Pick.up@ -@ AT        
Qray@ -@ AT sing@ s@ at Feel.for@ ts@ AT Look.for@ ts@ AT       
Smell.for@ ts@ AT Flip.coin@ -@ AT Keypress@ l@ AT              
Number=@ ne@ AT Number<@ ne@ AT Object=@ te@ AT Move=@ me@ AT   
on.number@ n@ AT On.object@ t@ AT on.move@ m@ at drop.stack@ st@
 at Plus@ -@ AT  Minus@ -@ AT socket@ -@ at forget AT           
════════════════════════════════════════════════════════════════   SCREEN 093
( OK.actions( double.sized?)                      ( 090684 dws) 
create OK.actions( action.count@ allot                          
ok.actions( action.count@ true fill                             
: Action.ok? ( token ---flag)                                   
ok.actions( + c@ ;                                              
: Not.ok ( act.token---)  ok.actions( + false swap c! ;         
: Ok ( act.token ---) ok.actions( + true swap c! ;              
                                                                
: Double.sized? ( IBOL token ---Flag|Double sized icon function)
 dup action.type( + c@ -@ =                                     
 swap subpanel@ = or ;                                          
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 094
( Action.w.rect( Thing.w.rect( AF TF)             ( 100284 dws) 
create  Action.w.rect(   Action.count@ 8* allot                 
create  Thing.w.rect(  Thing.count@ 8* allot   var act          
: Blank.Thing.rects ( -) thing.w.rect( thing.count@ 8* 0 fill ; 
: ArFill    (  top/left/token/array^---|all purpose filler)     
  swap act @ if dup Double.sized? else 0 then                   
  rot rot                   ( t/l/doubleflag/arr^/tok)          
  8* +  >R ( index into array)  3 pick 16+ swap ( t/l/b/dflag)  
  if 16 + then                                                  
  over 15 + R>  !rect ( stuff rect into array) ;                
: TF false act ! ( top/left/token---|fills thing array)         
 >R thing.rect @ point>xy   ( yoff\xoff\rectx\recty)            
   4 roll + rot rot + R> thing.w.rect(  Arfill ;                
: AF  true act ! ( Topoff/leftoff/token---|fills action array)  
  >R action.rect @ point>xy   ( yoff\xoff\rectx\recty)          
   4 roll + rot rot + R> action.w.rect(  Arfill ;               
════════════════════════════════════════════════════════════════   SCREEN 095
( Action Work Rectangle Assignment)               ( 100984 dws) 
                                                                
6 9 Look.for@ AF 6 34 Feel.for@ AF 6 59 Smell.for@ AF           
6 84 Keypress@ AF 6 109 Move@ AF  6 134 sing@ af                
                                                                
29 9 on.move@  AF 29 34 on.object@ AF 29 59 on.number@ af       
29 84 drop.stack@ af                                            
    33 109 Plus@ AF  33 134 Minus@ AF                           
52 9 Move=@ AF 52 34 Object=@ af  52 59 Number=@ AF             
52 84 Number<@ af                                               
                                                                
75 9 Subpanel@ AF                                               
75 30 Goto.go@ AF  75 51 Boomerang@ AF 75 72 Wire@ AF           
75 93 Flip.coin@ AF  75 114 Qray@ AF                            
75 134 Pick.up@ AF          forget af                           
                                                                
════════════════════════════════════════════════════════════════   SCREEN 096
( SubP.ws.rect()                                  ( 100184 dws) 
create SubP.ws.rect( 7 8 * allot                                
: SF false act ! ( top/left/token---|fills thing array)         
 >R thing.rect @ point>xy   ( yoff\xoff\rectx\recty)            
   4 roll + rot rot + R> subp.ws.rect(  Arfill ;                
24 9 0 SF ( A) 24 30 1 SF ( B) 24 51 2 SF ( C) 24 72 3 SF ( D)  
24 93 4 SF ( E)  24 114 5  SF ( F) 24 135 6 SF ( G)             
forget SF                                                       
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 097
( t.fill,ts.fill,te.fill)                         ( 100184 dws) 
: t.fill ( ---) blank.thing.rects                               
11 6 Pie@ tf 11 26 Coffee@ tf 11 46 Creep@ tf 11 66 Bomb@ tf    
11 86 Bouncer@ tf ( Row 2) 37 6 oil@ tf 37 26 disk@ tf          
37 46 Wall@ tf 37 66 Door@ tf  37 86 Floor@ tf ;                
: ts.fill ( ---) t.fill                                         
 24 134 Obj.stack@ tf    ;                                      
: te.fill ( ---) t.fill                                         
24 109  Obj.empty@ tf  ;                                        
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 098
( m.fill,ms.fill,me.fill,st.fill)                 ( 100184 dws) 
: m.fill ( ---) blank.thing.rects                               
24 6 Forward@ tf  24 33 Reverse@ tf 24 60 Turn.right@ tf        
24 86 Turn.left@ tf ;                                           
: ms.fill ( ---) m.fill 24 134 Mov.stack@ tf  ;                 
: me.fill ( ---) m.fill  24 109 mov.empty@ tf ;                 
                                                                
: st.fill ( ---) blank.thing.rects                              
24 6 Mov.stack@ tf  24 70 Num.stack@ tf                         
24 134 Obj.stack@ tf  ;                                         
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 099
( n.fill ne.fill s.fill)                          ( 100184 dws) 
: n.fill ( ---) blank.thing.rects                               
5 6 Damage.reg@ tf 5 46 Fuel.reg@ tf 5 86 Range.reg@ tf         
25 6 Num0@ tf 25 33 Num1@ tf 25 59 Num2@ tf 25 86 Num3@ tf      
45 6 Num4@ tf 45 33 num5@ tf 45 59 Num6@ tf 45 86 Num7@ tf ;    
: ne.fill ( ---) n.fill                                         
24 109 num.empty@ tf ;                                          
: s.fill ( ---) n.fill                                          
24 134 Num.stack@ tf ;                                          
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 100
( Draw.action draw.letter)                        ( 100184 dws) 
: Draw.action ( action.token/topleft point---action token)      
Point>xy 5+ swap 5+ swap over 16+  ( tok/y/x/y)                 
4 pick  Double.sized? if 16+ then                               
over 15 + draw.rect !rect                                       
 dup 8* ( Index) Action.s.rect( +  ( IBOL icon rect)            
 Ibol.bmap screen.bmap rot draw.rect srccopy 0 copybits ;       
                                                                
: draw.letter ( x/y/ascii---)                                   
 dup no.key@ 64 + = not                                         
if >R 2dup 12 - swap 4- swap over 17 + over 14 + clear rectangle
   move.to R> emit                                              
 else    ( draw nothing thing)  drop 2drop                      
   thing.S.rect( mov.empty@ 8* + @rect DRAW.RECT @RECT plop     
 then ;                                                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 101
( Draw.a.thing)                                   ( 100184 dws) 
: Draw.a.thing ( action token/topleft point---action token)     
Point>xy 5+ swap 21 + swap over 16+ over 15 + draw.rect !rect   
dup dup Double.sized? swap Keypress@ = or ( Check action type)  
if dup case                                                     
      Subpanel@ of                                              
              draw.rect @ point>xy 14 + swap 4+ swap            
              get.arg.asc draw.letter endof                     
      KeyPress@ of                                              
           draw.rect @ point>xy 13 + swap 4+ swap               
           get.arg.asc draw.letter endof                        
       endcase                                                  
else                                                            
  Arg.byte c@ 64 mod 8* ( Index) Thing.s.rect( + @RECT          
  draw.rect @rect plop                                          
then ;                                                          
════════════════════════════════════════════════════════════════   SCREEN 102
( Draw.socket,chip Wire.rect Invert.chip)         ( 110184 dws) 
: Draw.socket ( ---)                                            
Ibol.bmap screen.bmap Socket.rect Draw.rect srcor 0 CopyBits ;  
: Draw.chip ( ---)                                              
IBOL.bmap screen.bmap Chip.rect Draw.rect srcor 0 CopyBits ;    
: wire.rect ( top.left---wire.rect) Point>xy >R >R              
 Flow.code @ dup  64 / swap   ( Wire.s.rect index/ flow.code)   
 case    up.f@ of R> 8- R> 14 + endof                           
       down.f@ of R> 40 + R> 4+ endof                           
       left.f@ of R> 9 + R> 8 - endof                           
      right.f@ of R> 25 + R> 24 + endof endcase                 
 over 10+ over 10+ draw.rect !rect  8* Wire.s.rect( +  ;        
: Invert.chip ( chip#---)                                       
panel.left @ over chips.wide@ mod 32 * +  4+                    
panel.top @ 3 pick  chips.wide@ / 48 * +  4+                    
over 18 + over 34 +  invert rectangle  drop ;                   
════════════════════════════════════════════════════════════════   SCREEN 104
( Draw.junct Chip.Draw)                           ( 102884 dws) 
: Draw.junct  ( ---)  Ibol.bmap                                 
screen.bmap junct.rect Draw.rect srcor 0 CopyBits ;             
: Chip.Draw ( chip#---)   Panel.top @ Panel.left @              
  3 pick Chips.wide@ Mod 32 * + Swap ( Chipleft x)              
  3 pick Chips.Wide@ / 48 * +   ( ChipTop y)                    
  Swap XY>POINT >R         ( Send yx point to return stack)     
  R@ POINT>XY over 41 + over 25 + Draw.rect !rect ( chipsize)   
  drop ( chip#)  Get.action Dup Socket@ =                       
  if  Draw.socket drop  ( action) R> drop ( tlpoint)            
  else dup wire@  =                                             
    if draw.junct else Draw.chip                                
      R@  Draw.Action     ( action token/toplft point---tk)     
      Get.arg R@  Draw.a.Thing then                             
    R>  Draw.wire then ;                                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 105
( Panel.draw Debug.heading)                       ( 041185 dws) 
: Panel.draw ( Pan# -) dup 0= if subpanel@ ok boomerang@ not.ok 
else  boomerang@ ok subpanel@ not.ok then  menus.off            
current.panel^ ! ginit 48 Panel.top !  9 Panel.left !           
 clear.panel1 Chip.count@ 0 do i Current.instruction^ !         
  i Chip.draw Loop hot.chip @ current.instruction^ !  ;         
: Debug.heading ( 1/4panel#---) ginit                           
window3.rect @rect 2drop 11 + swap 22 + 2dup 1+ swap 1+ swap    
over 15 + dup >r over 15 + dup >R clear rectangle               
rot dup 4 roll ( yp# p# x) swap 2 mod 1 = if 9 + then ( y p# x) 
rot rot 2/ 1 = if 9 + then ( x y of highlighted 1/4pan)         
over 8+ over 8+ black pattern rectangle                         
R> R> 19 + swap 3- over 4- over 12 - over 15 + over 15 +        
clear rectangle move.to  current.panel^ @ 64 +                  
dup 64 > if emit else drop 49 80 64 95 ( brain source)          
@pen 12 - swap 4- over 15 + over 15 + plop then ( panel) ;      
════════════════════════════════════════════════════════════════   SCREEN 106
( 1/4.panel)                                    ( 080284 dws)   
var panel ( 0 is Topleft, 1 toprt, 2 btmlft, 3 btmrt) 4 panel ! 
var Inv.chip^ -1 Inv.chip^ !   ( Inverted chip)                 
: 1/4.panel  ( panel#---)     dup panel ! dup Debug.heading     
  Btm.w.left@ 2+   Btm.w.top@ 8-                                
 over 171 + over 154 + clear rectangle  ( erase it)             
 30 ( start vert loop) btm.w.left@ 10+ 3 pick 2 mod 1 = ( right)
  if 160 - swap 5+ swap then panel.left !       ( panel/vcnt)   
 btm.w.top@ rot 2/ 1 = ( bottom)                                
  if 144 - swap 30 + swap then panel.top !       ( vcnt)        
  dup chips.wide@ 3 * -        do ( vert)                       
      5 0 do   ( horiz)                                         
      j i+ dup dup 0< swap chip.count@ 1- > or not              
      if  dup Current.instruction^ !  Chip.draw                 
      else drop then                                            
   loop  chips.wide@ +loop   -1 Inv.chip^ !  ;                  
════════════════════════════════════════════════════════════════   SCREEN 107
( Show.Debug )                                    ( 080684 dws) 
: Show.debug ( ---) Current.instruction^ @   ( Inst)            
 0 over chips.wide@ mod 4 > if  1+ then  ( rt)  ( Inst/pnt)     
 over chips.wide@ / 2 > if 2+ then ( bottom)     ( inst/pnt)    
 dup panel @ = not                             ( inst/pnt/f)    
 if 1/4.panel else drop                                         
   dup go.marker@ =  ( maybe new panel)                         
   if 0 1/4.panel then                                          
 then  ( new panel)      ( inst)                                
 dup Current.instruction^ !                                     
 Inv.chip^ @ dup 0< not if Invert.chip else drop then           
   ( reinvert old chip)                                         
 dup  Invert.chip  ( invert new chip)                           
 Inv.chip^ !      ( point to inverted chip)                     
 ;                                                              
                                                                
════════════════════════════════════════════════════════════════   SCREEN 108
( Setup.legal.args)                               ( 100184 dws) 
: Setup.legal.args  ( type ---)                                 
 case                                                           
  t@ of t.fill endof te@ of te.fill endof ts@ of ts.fill endof  
  m@ of m.fill endof me@ of me.fill endof ms@ of ms.fill endof  
  n@ of n.fill endof ne@ of ne.fill endof s@ of s.fill endof    
  st@ of st.fill endof                                          
 endcase ;                                                      
: frame.lab ( rect---) 1 1 pensize black penpat patcopy penmode 
 dup @rect 4 roll 2+ 4 roll 2+ 4 roll 2+ 4 roll 2+              
 rect>rectangle black pattern rectangle                         
 dup @rect rect>rectangle clear rectangle                       
 @rect rect>rectangle frame rectangle ;                         
: Ibol.labels ( ---)                                            
 action.label.rect frame.lab thing.label.rect frame.lab ;       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 109
( Draw.w.commands  Lozenge   )                    ( 100284 dws) 
: Draw.w.commands ( ) 129 73 160 104 s.rect !rect garbage.rect @
 point>xy 3+ swap 2+ over 31 + over 31 + draw.rect !rect        
ibol.bmap screen.bmap s.rect draw.rect srcor 0 copybits ;       
: lozenge ( rect\pattern ---|Draw nice rounded rect)            
 >R black penpat 1 1 pensize  patcopy penmode dup               
 @rect rect>rectangle 4 roll 2- 4 roll 2- 4 roll 2+ 4 roll 2+   
 4 pick 1- 4 pick 1- 4 pick 1+ 4 pick 1+ 16 16 frame rrectangle 
 14 14 R> pattern rrectangle                                    
  2 2 pensize dup @rect rect>rectangle 12 12 frame rrectangle   
 @rect rect>rectangle                                           
 4 roll 2+ 4 roll 2+ 4 roll 1- 4 roll 1- 12 12 clear rrectangle 
 1 1 pensize ;                                                  
 : shaded.lozenge ( rect ---) dup @rect                         
   4 roll 2+ 4 roll 2+ 4 roll 2+ 4 roll 2+ draw.rect !rect      
 draw.rect black lozenge  white lozenge ;                       
════════════════════════════════════════════════════════════════   SCREEN 110
( blink.cursor frame.lab)                         ( 100584 dws) 
var pat.point                                                   
: blink.cursor ( ---) 1 cursor.count +!                         
  cursor.count @ cursor.rate@ mod 0= if  <gw>                   
    pat.point @ 1+ 8 mod dup pat.point !                        
    dup 0= if  0 cursor.count ! then                            
    dup 2 / 2* >R  ( byte pattern offset)                       
    2 mod 0= if stripe1 else stripe2 then >R                    
    patcopy penmode 2 2 pensize R> R>  + penpat                 
    cursor.rect @rect rect>rectangle frame rectangle            
    1 1 pensize  black penpat                                   
   then ;                                                       
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 111
( WS.action,thing.icons)                          ( 100184 dws) 
: WS.action.icons ( ---)                                        
Action.count@ goto.go@ do ibol.bmap screen.bmap                 
 action.s.rect( i 8* + action.w.rect( i 8* + srccopy 0 copybits 
 i action.ok? not if action.w.rect( i 8* + @rect gray.rect      
 then loop ;                                                    
: WS.thing.icons ( data type---|Draw all currently legal args)  
dup -@ = if drop blank.thing.rects  thing.rect white lozenge    
else <gw>                                                       
  thing.rect white lozenge  ( type)  setup.legal.args ( ---)    
  thing.count@ 0 do                                             
   thing.w.rect( i 8* + @ 0= not  ( legal)                      
   if IBOL.bmap screen.bmap                                     
    thing.s.rect( i 8* + thing.w.rect( i 8* + srccopy 0 copybits
   then loop then ;                                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 113
( wire.ok? erase.blank.wires)                     ( 092584 dws) 
: wire.ok? ( flow.code ---flag|Legal wire? None over edge.)     
  current.instruction^ @ swap                                   
  case                                                          
   Up.f@ of chips.wide@ < not endof                             
   Down.f@ of chip.count@ chips.wide@ - < endof                 
   left.f@ of chips.wide@ mod 0= not endof                      
   right.f@ of 1+ chips.wide@ mod 0= not endof                  
  endcase ;                                                     
: blip ( ---) @rect rect>rectangle clear rectangle ;            
: erase.blank.wires ( ---)                                      
  up.f@ wire.ok? if  Up.ws blip then                            
  down.f@ wire.ok? if  down.ws blip then                        
  left.f@ wire.ok? if  left.ws blip then                        
  right.f@ wire.ok? if  right.ws blip then                      
  ;                                                             
════════════════════════════════════════════════════════════════   SCREEN 114
( Erase.ws.chip Blank.ws.chip  ws.name)           ( 110384 dws) 
: erase.ws.chip ( ---)   ws.chip.rect @rect rect>rectangle      
  4 roll 2+ 4 roll 2+ 4 roll 1- 4 roll 1- clear rectangle  ;    
: Blank.ws.chip ( ---|Blanks and draws editor chip)             
  erase.ws.chip                                                 
  ws.chip.rect @rect draw.rect !rect draw.chip                  
  up.f@ wire.ok? if 95 111 105 121  Up.ws @rect plop then       
  down.f@ wire.ok? if 75 111 85 121   Down.ws @rect plop then   
  left.f@ wire.ok? if 65 111 75 121   Left.ws @rect plop then   
  right.f@ wire.ok? if 85 111 95 121 Right.ws @rect plop then ; 
: Ws.name ( ---|Prints name of current chipwit)                 
  srccopy textmode 12 textsize                                  
  window1.rect @ point>xy 14 + swap 29 + swap move.to           
  cw.num @ name>n$ n$ count type srcor textmode ;               
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 115
( Update.ws.chip panel.hilight)                   ( 100284 dws) 
: @swap.pt @ point>xy swap xy>point ;                           
: Update.ws.chip ( ---)  ws.op.byte c@    ( action token)       
  dup dup boomerang@ = not swap goto.go@ = not and              
  if blank.ws.chip else erase.blank.wires then                  
  dup None@ = not if WS.chip.rect @swap.pt  draw.action then    
  ws.arg.byte c@                                                
  None@ = not if WS.chip.rect @swap.pt draw.a.thing then ( tok) 
  dup None@ = not if  WS.chip.rect @swap.pt draw.wire           
  else drop then                                                
 ;                                                              
: Panel.hilight ( ---) 28 29 305 45 clear rectangle ws.name     
  49 80 64 95 29 171 44 186 plop ( draw brain) 0 textfont       
  72 65 do i 65 - 16* 191 + 40 move.to i emit loop              
 current.panel^ @ 16* 171 + 29 over 16 + 45 invert rectangle ;  
                                                                
════════════════════════════════════════════════════════════════   SCREEN 116
( Garbage.panel,ws.chip Update.ws.commands)       ( 102984 dws) 
                                                                
: Garbage.panel.chip ( ---) hot.chip @ current.instruction^ !   
  socket@ 0 !chip  blank.ws.chip update.ws.chip ;               
                                                                
: Garbage.ws.chip ( ---)                                        
  None@ ws.Arg.byte c!                                          
  0 ws.true.flow c! 0 ws.false.flow c!                          
  None@ ws.Op.byte c!                                           
  wire.selected off                                             
  0 this.act.type !                                             
  ;                                                             
: Update.ws.commands ( ---)                                     
 inserter.com off ws.arg.byte c@ none@ = not ( chip finished)   
 this.act.type @ -@ = or ( double chip finished)                
 if inserter.com on then draw.w.commands ;                      
════════════════════════════════════════════════════════════════   SCREEN 117
( Panel.chip>WS WS>Panel.chip WS>arg,op)          ( 100284 dws) 
: Panel.chip>WS  (  ---| Pulls Op,arg, flows into WS data)      
  @chip over socket@ = not if                                   
    dup dup arg.byte c! 64 mod WS.arg.byte c!                   
    192 and WS.false.flow c!                                    
    dup dup op.byte c! 64 mod WS.op.byte c!                     
    192 and WS.true.flow c!                                     
    ws.op.byte c@ action.type( + c@ this.act.type !             
  else 2drop garbage.ws.chip then ;                             
                                                                
: WS>panel.chip ( ---)                                          
  WS.true.flow c@ WS.op.byte c@ + dup op.byte c!                
  WS.false.flow c@ WS.arg.byte c@ + dup arg.byte c! !chip ;     
: WS>arg,op ( ---)                                              
  WS.true.flow c@ dup flow.code ! WS.op.byte c@ + op.byte c!    
  WS.false.flow c@ WS.arg.byte c@ + arg.byte c!  ;              
════════════════════════════════════════════════════════════════   SCREEN 118
( Wire.prog Legal.wire Test.legal.wire)           ( 103184 dws) 
var last.true var last.false                                    
: wire.prog ( flow---new.f| Progression of wire positions)      
 case up.f@ of right.f@ endof right.f@ of down.f@ endof         
     down.f@ of left.f@ endof left.f@ of up.f@ endof endcase ;  
: Legal.wire ( ---) begin last.true @ dup wire.ok?  ( not edge) 
      not if wire.prog then dup last.true !  wire.ok? until     
    last.true @ ws.true.flow c!                                 
    begin last.false @ dup dup                                  
      wire.ok? not swap last.true @ = or                        
      if wire.prog then dup dup last.false !                    
      wire.ok? swap last.true @ = not and until  ( false =true) 
    last.false @ ws.false.flow c! ;                             
: test.legal.wire ( ---) ws.op.byte c@ 64 mod dup dup           
  none@ = swap goto.go@ = or swap boomerang@ = or               
  last.true @ last.false @ = or if  legal.wire then  ;          
════════════════════════════════════════════════════════════════   SCREEN 119
( Subpanel.thing.icons  Keypress.thing.icons)     ( 100284 dws) 
: Subpanel.thing.icons ( ---) srcor textmode                    
thing.rect white lozenge                                        
7 0 do subp.ws.rect( i 8* +  @ point>xy 15 + swap 4+ swap       
   i 65 + draw.letter loop ;                                    
: Keypress.thing.icons  ( ---) srcor textmode                   
thing.rect white lozenge  65 ( "A" cntr)                        
thing.rect @ point>xy 15 + swap drop dup 41 + swap do ( vert)   
  [ thing.rect @ point>xy drop 14 + 15 9 * + ] literal          
   [ thing.rect @ point>xy drop 14 + ] literal do ( horiz loop) 
   i j move.to dup emit 1+                                      
  15 +loop                                                      
20 +loop  drop                                                  
thing.S.rect( mov.empty@ 8* + @rect                             
thing.rect @ point>xy 42 + swap 13 + 15 8* +                    
 over 16+ over 15 + plop ( no key) ;                            
════════════════════════════════════════════════════════════════   SCREEN 120
( insert.it )                                     ( 102984 dws) 
                                                                
: Insert.it ( ---)                                              
  hot.chip @ current.instruction^ !                             
  inserter.com @ true =                                         
  if WS>panel.chip                                              
     zero.stats ( not efficient, but fast)                      
  else garbage.ws.chip                                          
    ws.chip.rect @rect draw.rect !rect                          
    then                                                        
  ws.chip.rect @rect rect>rectangle                             
   4 roll 2+ 4 roll 2+ 4 roll 1- 4 roll 1- clear rectangle      
  erase.blank.wires                                             
  hot.chip @ chip.draw                                          
  update.ws.commands                                            
  ;                                                             
════════════════════════════════════════════════════════════════   SCREEN 121
( calc.blank.wires)                                ( 092584 dws)
: calc.blank.wires  ( ---)                                      
   ws.chip.rect @rect 2drop  ( topleft)                         
   up.f@ wire.ok? if over 8- over 14 + over 10+ over 10+        
   else 0 0 0 0 then up.ws !rect                                
   down.f@ wire.ok? if over 40 + over 4+ over 10+ over 10+      
   else 0 0 0 0 then down.ws !rect                              
   left.f@ wire.ok? if over 9 + over 8- over 10+ over 10+       
   else 0 0 0 0 then left.ws !rect                              
   right.f@ wire.ok? if over 25 + over 24 + over 10+ over 10+   
   else 0 0 0 0 then right.ws !rect                             
   2drop ;                                                      
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 122
( PULL.IT )                                       ( 100184 dws) 
: Pull.it ( ---)                                                
  Hot.chip @ current.instruction^  !                            
  Panel.chip>ws                                                 
  update.ws.commands                                            
  calc.blank.wires                                              
  ws>arg,op                                                     
  update.ws.chip                                                
   WS.OP.BYTE c@ subpanel@ = if subpanel.thing.icons else       
    ws.op.byte c@ keypress@ = if keypress.thing.icons else      
         ws.op.byte c@ dup none@ = ( no legal args for no op)   
         if drop -@ else action.type( + c@                      
         then ws.thing.icons                                    
   then  then  ;                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 123
( Match.wire? Select.wire)                        ( 103184 dws) 
: Match.wire? ( flow.code---none-0,true-1,false-2)              
  dup ws.true.flow c@ =                                         
  if drop 1 else                                                
    ws.op.byte c@ Brancher? ( No false wire on non-branchers)   
    if ws.false.flow c@ =                                       
      if 2 else 0 then                                          
    else drop 0                                                 
    then                                                        
  then ;                                                        
                                                                
 : Select.wire  ( flow code---)                                 
 match.wire? dup if                                             
   draw.rect @rect rect>rectangle invert rectangle              
   wire.selected !  ( store type of wire selected)              
 else drop then  ;                                              
════════════════════════════════════════════════════════════════   SCREEN 124
(  Move.wire?)                                    ( 102984 dws) 
: Move.wire? ( flow code---) dup               ( fc/fc)         
  match.wire? dup 0> ( wire there)             ( fc/tf/flag)    
  if wire.selected @ = not ( not same one)  ( fc/flg)           
    if ws.false.flow c@ ws.true.flow c@                         
       ws.false.flow c! ws.true.flow c!   ( swap 'em)           
       0 wire.selected ! ws>arg,op   drop  ( ---)               
       blank.ws.chip update.ws.chip                             
    else drop then   ( same one)                                
  else drop  ( no wire there)  wire.selected @ 1 =              
     if  ws.true.flow c!              ( --)                     
     else ws.false.flow c!  then   ( --)                        
     0 wire.selected ! ws>arg,op  blank.ws.chip update.ws.chip  
  then                                                          
  ws.true.flow c@ last.true ! ws.false.flow c@ last.false ! ;   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 125
( Command.handler)                                ( 080684 dws) 
: Command.handler ( pt ---)                                     
 Sound? if 8 10 500 tone then                                   
Garbage.rect ptinrect                                           
     if Garbage.ws.chip                                         
        Garbage.panel.chip                                      
        update.ws.commands                                      
        -@ ws.thing.icons                                       
     then                                                       
   ;                                                            
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 126
( New.chip.hot)                                   ( 093084 dws) 
: cursor.chip ( chip#---)                                       
    panel.top @ panel.left @ 3 pick chips.wide@ mod 32 * +      
    swap rot  chips.wide@ /  48 * +  swap ( chipy\chipx)        
    over 41 + over 25 + ws.chip.rect !rect                      
    ws.chip.rect @rect 4 roll 2+ 4 roll 2+ 4 roll 1- 4 roll 1-  
    cursor.rect !rect                                           
    ws.chip.rect @rect                                          
    4 roll 10- 4 roll 10- 4 roll 10+ 4 roll 10+ ws.wire.rect    
    !rect  ;                                                    
: New.chip.hot ( chip#---) dup 0= not                           
    if  dup Hot.chip !  dup current.instruction^ !              
    cursor.chip get.action  drop ( token)                       
    pull.it                                                     
  else drop    ( 0 never edited)  then ;                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 127
( WT point>chip drag.chip)                        ( 110184 dws) 
: Point>chip ( pt ---chip#)     point>xy                        
 panel.top @ - 48 / chips.wide@ *  ( row 10's 40's etc)         
 swap panel.left @ - 2+ 32 / +   ( chip#)  ;                    
var drag.chip^                                                  
: drag.chip ( ---)                                              
 @mousexy xy>point dup panel.rect ptinrect  ( pt)               
 if point>chip dup 0= not                    ( chip)            
   if dup drag.chip^ @ = not if boop then     ( ch)             
     dup dup drag.chip^ !                                       
     2 0 do invert.chip 9 0 do blink.cursor loop 2 wt  loop     
   else drop none@ drag.chip^ ! then                            
 else drop none@ drag.chip^ !                                   
 then ;                                                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 128
(  Panel.handler)                                 ( 103184 dws) 
: Panel.handler ( pt down ---) sound? if 1 20 30000 tone  then  
 point>chip dup 0= not if  insert.it  then                      
    New.chip.hot  none@ drag.chip^ !                            
    4 wt begin still.down while drag.chip repeat                
    drag.chip^ @ none@ = not                                    
    if garbage.panel.chip erase.blank.wires                     
       erase.ws.chip                                            
       hot.chip @ chip.draw  drag.chip^ @                       
       dup hot.chip ! dup current.instruction^ !                
       ws.true.flow c@ last.true ! ws.false.flow c@ last.false !
       legal.wire  cursor.chip calc.blank.wires                 
       insert.it  update.ws.chip  hot.chip @ chip.draw          
    then                                                        
    update.ws.commands  ;                                       
                                                                
════════════════════════════════════════════════════════════════   SCREEN 129
( WS.wire.handler)                                ( 103184 dws) 
: WS.wire.handler ( pt ---)                                     
dup ws.chip.rect ptinrect                                       
if panel.handler   ( in current chip)                           
else  ws.op.byte c@ dup dup Goto.go@ = not swap                 
  Boomerang@ = not and swap none@ = not and                     
  if flow.code @ >R  ( save) sound? if 2 25 10000 tone then     
    4 0 do                                                      
      i 64 * dup flow.code ! wire.ok? if ( wire not on edge?)   
        dup ws.chip.rect @swap.pt wire.rect drop draw.rect      
        ptinrect if wire.selected @                             
           if i 64 * move.wire? else i 64 * select.wire then    
           leave then                                           
        then                                                    
    loop R> flow.code ! ( restore)                              
  then drop then ;                                              
════════════════════════════════════════════════════════════════   SCREEN 130
( Panel.select.handler )                          ( 041185 dws) 
: Panel.select.handler ( pt---)                                 
  sound? if 1 10 20000 tone then                                
  point>xy drop    ( x)                                         
  171 - 16/  7 min  0 MAX    ( panel 0-7)                       
  inserter.com @ true = if                                      
    ws>panel.chip then  ( insert finished chip)                 
  dup current.panel^ !                                          
  panel.hilight                                                 
  panel.draw                                                    
  ws.action.icons                                               
  menus.on                                                      
;                                                               
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 131
( Action.handler)                                 ( 103184 dws) 
: Action.handler ( pt ---)                                      
 action.count@ goto.go@ do   i action.ok?                       
   if dup action.w.rect( i 8* + ptinrect                        
     if  Sound? if 2 40 10000 tone then                         
        test.legal.wire  i ws.op.byte c! none@ ws.arg.byte c!   
        i action.type( + c@ dup this.act.type !    ( save type) 
        WS>arg,op update.ws.chip update.ws.commands             
        dup case                         ( type\type)           
          ts@ s@ range.of ws.thing.icons endof                  
          sb@ of  drop subpanel.thing.icons endof               
          l@ of  drop keypress.thing.icons endof                
          -@ of ws.thing.icons endof                            
        endcase then then                                       
 loop drop ;                                                    
                                                                
════════════════════════════════════════════════════════════════   SCREEN 132
( Subpanel.handler key.handler)                   ( 100284 dws) 
: thing.sound ( ---) Sound?  if 2 10 7000 tone then ;           
: Subpanel.handler ( pt---)                                     
  8 1 do dup subp.ws.rect( i 1- 8* + ptinrect                   
       if  i ws.arg.byte c!  thing.sound                        
         WS>arg,op update.ws.chip                               
         update.ws.commands leave                               
       then loop drop ;                                         
: key.handler ( pt---)   thing.sound                            
  point>xy thing.rect @ point>xy swap >R                        
   - 20 / 9 * 0 MAX 18 MIN swap   ( yrowval/xpoint)             
  R> 12 + - 15 / 0 max 8 min + 1+ ( 1 = A , 27 = no key)        
  ws.arg.byte c!                                                
  ws>arg,op update.ws.chip                                      
  update.ws.commands ;                                          
                                                                
════════════════════════════════════════════════════════════════   SCREEN 133
( Thing.handler)                                  ( 080984 dws) 
: Thing.handler ( pt ---)                                       
 ws.op.byte c@ subpanel@ =                                      
 if subpanel.handler                                            
 else ws.op.byte c@ keypress@ =                                 
   if key.handler                                               
   else thing.count@ 0 do                                       
     dup thing.w.rect( i 8* + ptinrect                          
     if  thing.sound                                            
       i ws.arg.byte c!                                         
       WS>arg,op                                                
       update.ws.chip                                           
       update.ws.commands leave                                 
     then                                                       
     loop drop                                                  
 then then ;                                                    
════════════════════════════════════════════════════════════════   SCREEN 134
( WS.Mouser)                                      ( 100284 dws) 
: WS.mouser ( mousept---)                                       
    dup Command.rect ptinrect                                   
    if Command.handler                                          
    else dup Action.rect ptinrect                               
      if Action.handler                                         
      else dup panel.select.rect ptinrect                       
        if Panel.select.handler                                 
           hot.chip @ new.chip.hot ws>arg,op update.ws.chip     
        else dup WS.wire.rect ptinrect                          
          if WS.wire.handler                                    
          else dup Thing.rect ptinrect                          
           if Thing.handler                                     
           else dup Panel.rect ptinrect                         
            if Panel.handler  else drop                         
            then then then then then then ;                     
════════════════════════════════════════════════════════════════   SCREEN 135
(  Setup.work.screen init.ws error.init.ws    )   ( 092784 dws) 
: Setup.work.screen    ( ---)  back.wipe                        
  Window1.rect @rect white pseudo.window                        
  panel.hilight                                                 
  subpanel@ ok boomerang@ not.ok                                
  Workshop.window  ( garbage.ws.chip )                          
 ;                                                              
: Init.WS                                                       
  59 hot.chip !  garbage.ws.chip                                
  1 new.cw !                                                    
  0 current.instruction^ !                                      
  0 current.panel^ !                                            
  Puller.com off Inserter.com off                               
  garbage.com off  ;                                            
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 136
( W.enter W.leave )                               ( 040585 dws) 
Create W.on$ ," Enter" Create W.off$ ," Exit"                   
: W.enter ( ---)  ginit 1 new.cw !  setup.work.screen           
  right.f@ last.true ! down.f@ last.false !                     
  3 1 w.menu item.enable  ( disable for demo<<<)                
  9 5 do i 1 w.menu item.enable loop  ( workshop opts)          
  copy.buff.full @ not if 7 0 w.menu item.enable then           
  game.off                                                      
  4 0 o.menu item.enable Workshop.on@  Prog.status !            
  1 w.off$ w.menu set.item$ ;                                   
: W.leave ( ---)                                                
  1 W.on$ w.menu set.item$   2 1 g.menu item.enable             
  game.on                                                       
  3 0 g.menu item.enable  4 1 o.menu item.enable                
  3 0 w.menu  item.enable 9 5 do i 0 w.menu item.enable loop    
  hot.chip @ no.chip@ = not if  insert.it then  ;               
════════════════════════════════════════════════════════════════   SCREEN 137
( ******* Workshop Master Word *********)         ( 080185 dws) 
: Workshop ( ---)  menus.off W.enter menus.on                   
 BEGIN DO.Events dup timer                                      
       case mouse.down of mouse.was.. WS.Mouser  endof          
       endcase new.cw @                                         
       if init.ws                                               
          current.panel^ @ panel.draw  ws.action.icons          
          panel.hilight hot.chip @ new.chip.hot                 
          update.ws.chip new.cw off   menus.on                  
          then ( new chipwit loaded)                            
       blink.cursor                                             
 Prog.status @ Workshop.on@ = not UNTIL                         
 menus.off  w.leave menus.on ;                                  
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 138
( Draw.random.creep toward.cw)                    ( 101484 dws) 
: Draw.random.creep  ( sq# ---) square>rects  draw.floor        
 6 irnd case                                                    
  0 of 161 33 endof  1 of 161 97  endof  2 of 161 161  endof    
  3 of 185 33  endof  4 of 185 97 endof    5 of 185 97 endof    
 endcase over 22 + over 30 +  obj.mask.draw  creep.sound ;      
: toward.cw ( sq#---nextsq#) dup                                
  dup squares.wide@ / ( row) swap squares.wide@ mod ( col)      
  robot.square @ squares.wide@ mod < if 1 else -1 then          
  2 irnd 0= if drop 0 then   ( randomness)                      
   ( not 0 for equal so no creep from behind)                   
  swap robot.square @ squares.wide@  / 2dup = ( same row)       
  if 2drop 0                                                    
  else < if squares.wide@ else squares.wide@ negate then        
  then   2 irnd 0= if drop 0 then                               
  + + ;                                                         
════════════════════════════════════════════════════════════════   SCREEN 139
( Creep.move)                                     ( 110584 dws) 
: ?zap.cw ( sq# ---flag)                                        
 robot.square @ = not dup not ( cw is there, zap it)            
if 6 flash.cw -200 update.fuel then ;                           
: Creep.move ( creep#/sq# ---)                                  
 3 irnd 1 = if  ( 33% try to move)                              
   dup  toward.cw   ( creep#/sq#/next sq#)                      
dup dup dup square.object floor@ = swap ?zap.cw and             
    swap robot.square @ squares.wide@ - = not and               
    if  dup 4 roll creeps( + c!  ( sq#/nextsq#) ( safe to move) 
       swap destroy          ( nextsq#)                         
       dup room.data( + creep@ swap c!  (  store in room)       
    else drop swap drop then   ( sq#)                           
  else swap drop       ( sq#)                                   
  then draw.random.creep ;                                      
                                                                
════════════════════════════════════════════════════════════════   SCREEN 140
( Spin.bouncer)                                   ( 101584 dws) 
: Spin.bouncer ( state---)                                      
 dup 1 = if 3 irnd 0= if drop 3 then then ( squat 1/3 state 1)  
 case 0 of 209 1 209 97 endof  1 of 209 33 209 97 endof         
  2 of 209 65 209 97 endof  3 of 209 129 209 161 endof          
 endcase                                                        
 0 0 game.height@ game.width@ s1.rect !rect                     
 4 3 26 33 obj.rect !rect                                       
  source.bmap anim.bmap  floor.rect s1.rect srccopy 0 copybits  
  231 over 30 + s.rect !rect                                    
  source.bmap anim.bmap s.rect obj.rect srcbic 0 copybits       
  231 over 30 + s.rect !rect                                    
  source.bmap anim.bmap s.rect obj.rect srcor 0 copybits        
  bouncer.sq @ square>rects                                     
  anim.bmap screen.bmap s1.rect square.rect srccopy 0 copybits  
  bouncer.state @ 1+ 3 mod bouncer.state ! ;                    
════════════════════════════════════════════════════════════════   SCREEN 141
( Move.baddies)                                                 
                                                                
: Move.baddies ( ---)                                           
  screen.bmap draw.bmap^ !                                      
  12 irnd dup creeps( + c@  55 min  ( no garbage#'s)            
               ( creep#/creep square)                           
  dup dup square.object creep@ =   ( It is there )              
  swap robot.square @ squares.wide@ - = not and ( not under cw) 
  if creep.move                                                 
  else 2drop                                                    
  then                                                          
  bouncers @                                                    
  if bouncer.sq @ robot.square @ squares.wide@ - = not          
    ( not under CW)                                             
      if bouncer.state @ spin.bouncer then                      
  then ;                                                        
════════════════════════════════════════════════════════════════   SCREEN 142
( Ad.message Bye-bye)                             ( 031185 dws) 
: Ad.message ( --)   <sw>                                       
 Printer on                                                     
 cr ." ChipWits, copyright 1984, "                              
    ."  DISCOURSE, Inc. , All rights reserved"                  
 cr cr Printer off <gw> ;                                       
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 143
( Rec.last.cw&envir Read.last.cw&envir)           ( 102584 dws) 
start.stat.byte@ stat.rec.len@ chipwit.count@ * +               
is Last.byte@ ( Byte in CW file)                                
create byte.buffer( 2 allot ( Byte 1 cw, 2 envir)               
: Rec.last.cw&envir  ( ---|Records last cw and environment used)
cw.num @  byte.buffer( c! adventure @ byte.buffer( 1+ c!        
Stat.file open                                                  
     byte.buffer( 2 last.byte@ stat.file write.virtual          
Stat.file close ;                                               
                                                                
: Read.last.cw&envir  ( ---|Reads last cw and environment used) 
Stat.file open                                                  
     byte.buffer( 2 last.byte@ stat.file read.virtual           
Stat.file close                                                 
byte.buffer( c@  16 min cw.num !                                
byte.buffer( 1+ c@ 8 min adventure ! ;                          
════════════════════════════════════════════════════════════════   SCREEN 144
( option.menu)                                    ( 040785 dws) 
Create S.on$ ," Sound On" Create S.off$ ," Sound Off"           
: Option.menu O.menu delete.menu  O.menu " Options" O.menu      
 new.menu " Print Screen;Print Panel;Sound Off/S;Debug Off;Quit"
O.menu append.items O.menu Menu.selection: 0 hilite.menu        
 case 1 of Ad.message Print.screen rst.printer endof            
   2 of Ad.message Window1.rect @rect screen.bmap print.bits    
     rst.printer printer on cr cr cr cr printer off endof       
   3 of Sound.on @ case                                         
    True of Hush 0 Sound.on ! 3 S.on$ o.menu Set.item$ endof    
    False of True Sound.on ! 3 S.off$ o.menu Set.item$ endof    
   endcase endof ( ***) 4 of game.status @ case                 
         debug.on@ of turn.stats.on@ game.status ! endof        
         stats.on@ of turn.debug.on@ game.status ! endof        
      endcase endof 5 of quit@ prog.status !                    
 flush.events close.all    endof  endcase ;                     
════════════════════════════════════════════════════════════════   SCREEN 145
( Clear.panel Copy.panel paste.panel)             ( 041685 dws) 
Create copy.buff( chip.count@ 2* allot                          
: clear.panel ( ---) chip.count@ 1 do i current.instruction^ !  
         socket@ 0 !chip loop 1 current.instruction^ !          
         current.panel^ @ panel.draw  zero.stats                
         garbage.ws.chip update.ws.commands  menus.on ;         
: Copy.panel ( ---) robot.program current.panel^ @              
    chip.count@ 2* * +  copy.buff( chip.count@ 2* cmove         
     7 true w.menu item.enable true copy.buff.full ! ;          
: paste.panel ( ---) copy.buff(                                 
      robot.program current.panel^ @ chip.count@ 2* * +  dup >R 
      chip.count@ 2* cmove                                      
     current.panel^ @ dup 0= if boomerang@ else subpanel@ then  
     R> dup chip.count@ 2* + swap do   ( eliminate inaprop ops) 
      ic@ 64 mod over  = if socket@ ic! then 2 +loop drop       
     panel.draw zero.stats menus.on ;                           
════════════════════════════════════════════════════════════════   SCREEN 146
( ws.menu)                                        ( 102584 dws) 
: WS.menu ( -) W.menu delete.menu                               
0 " Workshop" W.menu new.menu                                   
" Enter/W;-(;Save ChipWit(;-(;Cut panel/X(" W.menu append.items 
" Copy Panel/C(;Paste Panel/V(;Clear Panel(" W.menu append.items
 W.menu Menu.selection: 0 hilite.menu                           
 case 1 of prog.status @ Workshop.on@ =                         
        if  workshop.off@ prog.status !                         
        else  workshop.on@ prog.status ! then endof             
      3 of hot.chip @ no.chip@ = not if insert.it then          
        cw.num @ cw.save edit.name                              
        set.cw.menu.names 1 new.cw ! endof                      
      5 of copy.panel clear.panel endof                         
      6 of copy.panel endof                                     
      7 of paste.panel endof                                    
      8 of clear.panel endof endcase ;                          
════════════════════════════════════════════════════════════════   SCREEN 147
( Wh.menu)                                        ( 102484 dws) 
: Wareh.menu ( ---)  Wh.menu delete.menu                        
0 " Warehouse" Wh.menu new.menu                                 
" . ;. ;. ;. ;. ;. ;. ;. ;. ;. ;. ;. ;. ;. ;. ;. "              
wh.menu append.items                                            
 Wh.menu Menu.selection: 0 hilite.menu dup                      
case                                                            
      1 16 range.of dup  cw.num ! cw.load load.stats            
             prog.status @ Workshop.on@ =                       
             if 1 new.cw !                                      
             else turn.Game.off@ Prog.status !  ad.title then   
             set.cw.menu.names                                  
             rec.last.cw&envir endof                            
 endcase  ;                                                     
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 148
( Envir.menu)                                     ( 040985 dws) 
: Envir.menu.choices ( --) G.menu delete.menu                   
0 " Environments"  G.menu new.menu                              
" Start Mission/M;Series;-("                                    
G.menu append.items  adventure.count@ 0 do                      
   adventure$( i 16* + G.menu append.items loop                 
 G.menu Menu.selection: 0 hilite.menu ;                         
: Ad.m ( adv#-) 13 4 do i 0 G.menu item.check loop              
   dup 3 + -1 g.menu item.check  dup Adventure !                
   Doom.file remove  ( ?file.error)                             
   1- 16 * adventure$( +   ( index into string array)           
  doom.file assign ( ?file.error)                               
  room.size@ doom.file set.rec.len (                            
  doom.file open ( ?file.error)                                 
  set.cw.menu.names ;                                           
                                                                
════════════════════════════════════════════════════════════════   SCREEN 149
( Adventure.menu)                                 ( 110284 dws) 
 : Envir.menu ( ---) envir.menu.choices G.menu Menu.selection:  
  0 hilite.menu  dup  case 1 of drop prog.status @ case         
              workshop.on@ of turn.game.on@ prog.status ! endof 
              series@ of turn.game.off@ prog.status ! endof     
              Game.on@ of  turn.game.off@ prog.status ! endof   
              Game.off@ of turn.game.on@ prog.status ! endof    
          endcase endof                                         
      2 of drop prog.status @ case                              
          series@ of game.on@ prog.status ! true last.mission ! 
          2 se$ g.menu set.item$ endof                          
    false last.mission !                                        
    2 lm$ g.menu set.item$ series@ prog.status ! endcase endof  
      4 13 range.of 3- ad.m  rec.last.cw&envir                  
          turn.game.off@ prog.status ! ad.title endof  endcase ;
                                                                
════════════════════════════════════════════════════════════════   SCREEN 150
( Stack & reg stuff)                              ( 101584 dws) 
: dam.yx 48 340 ; : fuel.yx 48 373 ; : rng.yx 87 373 ;          
: key.yx 87 340 ;                                               
: mov.yx 48 406 ; : obj.yx 48 439 ; : num.yx 48 472 ;           
256 is stack.len@                                               
0 is mov.st(     ( chop.vocab assigned)                         
0 is obj.st(                                                    
0 is num.st(                                                    
var mov.st^ var obj.st^ var num.st^ ( Pointers to top of stacks)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 151
( Check.mov,obj,num.st)                           ( 110384 dws) 
                                                                
: Check.mov.st ( arg---arg|If arg is move st return move)       
  dup Mov.stack@ = if drop                                      
     mov.st( mov.st^ @ + c@ then ;                              
: Check.obj.st ( arg--arg)                                      
  dup obj.stack@ = if drop                                      
     obj.st( obj.st^ @ + c@ then ;                              
: Check.num.st ( arg--arg|Check stack and registers)            
  dup                                                           
  case num.stack@ of drop num.st( num.st^ @ + c@ endof          
       damage.reg@ of drop damage.reg @  200 / num0@ + endof    
       fuel.reg@ of drop fuel.reg @ 1000 / 1+ num0@ + endof     
       range.reg@ of drop range.reg @ num0@ + endof             
       ( else its a number)                                     
  endcase  num7@ min ( error insurance) ;                       
════════════════════════════════════════════════════════════════   SCREEN 152
( Update.energy, damage)                          ( 100484 dws) 
: Num.plop ( number/t/l---)                                     
 >r >r 16* 1+ 17 swap over 16+ over 15 +  ( source num graph)   
 R> R> over 16+ over 15 + plop ;                                
: Update.fuel ( #energy pts ---)                                
 Fuel.reg @ + 6999 min dup fuel.reg !                           
 dup 1 < if game.aborted@ prog.status ! drop 0                  
            else 1000 / 1+                                      
            then                                                
            fuel.yx swap 19 + swap 6+  num.plop  ;              
: Update.damage ( #damage pts ---)                              
 damage.reg @ + dup damage.reg !                                
 dup 1399 > if game.aborted@ prog.status ! drop 7               
            else 200 /                                          
            then                                                
            dam.yx swap 19 + swap 6+  num.plop  ;               
════════════════════════════════════════════════════════════════   SCREEN 153
( Update range St.squash)                         ( 032985 dws) 
: Update.range ( range ---)                                     
 dup range.reg !                                                
 rng.yx swap 19 + swap 6+  num.plop  ;                          
                                                                
: st.squash ( stack address---| Pushes down full stack)         
                              ( bottom item is lost)            
 1+ ( skip empty.stack)                                         
 dup  1+ swap  stack.len@ 2-  cmove ;                           
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 154
( erase.stack Draw.mov.st On.mov.st)              ( 103184 dws) 
: erase.stack ( x/y---)                                         
 6+ swap 22 + swap ( xy offset from top)                        
 2dup swap over 16+ over 48 + clear rectangle ( erase old) ;    
: Draw.mov.st ( ---)                                            
 mov.yx  erase.stack                                            
 mov.st^ @ 2-  0 max  mov.st^ @   do                            
    mov.st( i + c@ 8* thing.s.rect( + @rect ( get source rect)  
    6 pick 6 pick over 16+ over 15 + plop  ( dest rect)         
  swap 17 +  swap           ( increment y offset from top)      
 -1 +loop 2drop ;                                               
: On.mov.st ( mov token ---)                                    
  mov.st^ @ stack.len@ =                                        
  if mov.st( st.squash                                          
  else 1 mov.st^ +! then                                        
  mov.st^ @ mov.st( + c!  Draw.mov.st ;                         
════════════════════════════════════════════════════════════════   SCREEN 155
( Draw.obj.st On.obj.st)                          ( 100484 dws) 
: Draw.obj.st ( ---)                                            
 obj.yx  erase.stack                                            
 obj.st^ @ 2-  0 max  obj.st^ @   do                            
    obj.st( i + c@ 8* thing.s.rect( + @rect ( get source rect)  
    6 pick 6 pick over 16+ over 15 + plop  ( dest rect)         
  swap 17 +  swap           ( increment y offset from top)      
 -1 +loop 2drop ;                                               
                                                                
: On.obj.st ( mov token ---)                                    
  obj.st^ @ stack.len@ =                                        
  if obj.st( st.squash                                          
  else 1 obj.st^ +! then                                        
  obj.st^ @ obj.st( + c!  Draw.obj.st ;                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 156
( Draw.num.st On.num.st)                          ( 100484 dws) 
: Draw.num.st ( ---)                                            
 num.yx  erase.stack                                            
 num.st^ @ 2-  0 max  num.st^ @   do                            
    num.st( i + c@ 8* thing.s.rect( + @rect ( get source rect)  
    6 pick 6 pick over 16+ over 15 + plop  ( dest rect)         
  swap 17 +  swap           ( increment y offset from top)      
 -1 +loop 2drop ;                                               
                                                                
: On.num.st ( num token or register---)                         
  num.st^ @ stack.len@ =                                        
  if num.st( st.squash                                          
  else 1 num.st^ +! then                                        
  check.num.st  ( check for register contents)                  
  num.st^ @ num.st( + c!  Draw.num.st ;                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 157
( Num= Num< Obj= Mov= Clear.stacks)               ( 100584 dws) 
: Num= ( arg---|Is Arg number=to stack top?)                    
 check.num.st  ( for register args)                             
 num.st( num.st^ @ + c@ = not if false.flow then ;              
: Num< ( arg---|Is Arg number> stack top?)                      
 check.num.st  ( for register args)                             
 num.st( num.st^ @ + c@ > not if false.flow then ;              
: Obj= ( arg---|Is Arg obj=to stack top?)                       
 obj.st( obj.st^ @ + c@ = not if false.flow then ;              
: Mov= ( arg---|Is Arg mov=to stack top?)                       
 mov.st( mov.st^ @ + c@ = not if false.flow then ;              
: Clear.stacks ( ---)                                           
 mov.st( stack.len@ erase mov.empty@ mov.st( c!  0 mov.st^ !    
 obj.st( stack.len@ erase obj.empty@ obj.st( c!  0 obj.st^ !    
 num.st( stack.len@ erase num.empty@ num.st( c!  0 num.st^ !    
 draw.mov.st draw.obj.st draw.num.st ;                          
════════════════════════════════════════════════════════════════   SCREEN 158
( Clear.stacks Drop.stack)                        ( 100484 dws) 
: Drop.stack ( arg---|Drop the top of a stack)                  
 case                                                           
  Mov.stack@ of Mov.st^ @ 1- 0 max mov.st^ ! draw.mov.st endof  
  Num.stack@ of Num.st^ @ 1- 0 max num.st^ ! draw.num.st endof  
  Obj.stack@ of Obj.st^ @ 1- 0 max obj.st^ ! draw.obj.st endof  
 endcase ;                                                      
: Plus ( ---| Inc number stack)                                 
 num.st( num.st^ @ + dup c@  dup num.empty@ = not               
  if  num0@ - 1+ 8 mod num0@ + swap c! draw.num.st              
   else 2drop then ;                                            
: Minus ( ---| Dec number stack)                                
 num.st( num.st^ @ + dup c@ dup num.empty@ = not                
  if   num0@ - 1- 8 mod num0@ + swap c! draw.num.st             
  else 2drop then ;                                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 159
( Stacker)                                        ( 100484 dws) 
                                                                
: Stacker ( opcode ---)  arg.byte c@ 64 mod swap                
  case                                                          
     Number=@ of Num= endof                                     
     Number<@ of Num< endof                                     
     Object=@ of Obj= endof                                     
     Move=@ of Mov= endof                                       
     On.number@ of On.num.st endof                              
     On.object@ of On.obj.st endof                              
     On.move@ of On.mov.st endof                                
     Drop.stack@ of Drop.stack endof                            
     Plus@ of drop Plus endof                                   
     Minus@ of drop Minus endof                                 
   endcase ;                                                    
                                                                
════════════════════════════════════════════════════════════════   SCREEN 160
( Name & stat data)                               ( 092884 dws) 
20 is name.len@                                                 
create Name$( ChipWit.count@ name.len@ * allot                  
                                                                
108 is stat.rec.len@  ( 20 bytes name,{2bytes count 18 string}) 
( {2bytes-#games,4bytes cum score,4bytes topscore} 10x8 envirs) 
(  1 byte appropriate environment flag x8 = 108)                
                                                                
prog.size@ ChipWit.count@ 1+ * is start.stat.byte@              
( 16 records of chipwits 1920 bytes of stat records at the end) 
10 is stat.len@ adventure.count@ stat.len@ * is game.stat.len@  
IBOL.buffer@ game.stat.len@ - is Stats(                         
8 is ok.envir.len@                                              
Create Ok.envir( ok.envir.len@ ChipWit.count@ * allot           
   ( 1byte x 8 envirnsx16 Chipwits)                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 161
( Load.names name.addr)                           ( 102384 dws) 
: Load.names ( ---|Load name array from stat file)              
Stat.file open                                                  
  ChipWit.count@ 0 do                                           
   Name$( i name.len@ *  + dup ( Buffer addr)                   
   name.len@               ( length)                            
   start.stat.byte@ i stat.rec.len@ * + ( file addr)            
   Stat.file                   ( file #)                        
   read.virtual                                                 
   dup w@ 10 > if 0 swap w! else drop then ( chop 'em)          
  loop                                                          
Stat.file close ;                                               
                                                                
: name.addr ( cw#---addr\ct)                                    
 1- name.len@ * name$( + dup 2+                                 
 swap w@ ;                                                      
════════════════════════════════════════════════════════════════   SCREEN 162
( Save.name Name>n$)                              ( 110484 dws) 
                                                                
: Save.name  ( ---|save name of current CHipWit)                
Name$( cw.num @ 1- name.len@ * +  ( Buffer)                     
name.len@                         ( length)                     
start.stat.byte@ cw.num @ 1- stat.rec.len@ * + ( file addr)     
Stat.file                                                       
write.virtual                                                   
;                                                               
                                                                
: name>n$ ( cw#---) ( duped from ad.title)                      
name.addr dup 0= if 2drop 1 n$ c! n$ 1+ 10 blanks               
else 10 min ( addr count)  dup n$ c! ( str len)                 
n$ 1+ swap ( src dest #) cmove ( string moved) then  ;          
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 163
( TE stuff t.init)                                ( 103184 dws) 
                                                                
100 93 130 236 rect Name.rect  ( name editing view rectangle)   
name.rect @rect 400 + rect name.d.rect (  dest rect)            
0 constant name.text                                            
: t.init ( ---)                                                 
name.d.rect name.rect   tenew ' name.text !                     
name.text gameboard.window +wrefcon !                           
;                                                               
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 164
(  @TE.ptrs Adjust.cursor update.text)            ( 092784 dws) 
                                                                
 : @TE.ptrs  ( --- addr\cnt| of string used by TE)              
gameboard.window terecord dup 62 + @@ swap 60 + w@ ;            
                                                                
: Adjust.cursor  ( ---|to IBEAM when in te rect)                
@mouse name.rect ptinrect                                       
if IBEAM set.cursor else init.cursor then ;                     
: update.text  ( ---)                                           
 gameboard.window terecord +tvisrect teupdate ;                 
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 165
( Fetch.name stuff.name)                          ( 092784 dws) 
: name.rec ( ---addr|Current name record addr)                  
name$( cw.num @ 1- name.len@ * + ;                              
: fetch.name ( ---|get name from Name$( hand to TE)             
  name.rec dup                                                  
w@ dup 10 > if drop 0 then      ( name len max)                 
swap 2+ swap  teset.text ;                                      
                                                                
: Stuff.name ( ---| store TE'ed name back in Name$( )           
@te.ptrs dup 10 > if drop 10 then                               
 dup name.rec w!                                                
  name.rec 2+ swap cmove ;                                      
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 166
( Load.envirs Save.envirs)                      ( 092884 dws)   
: Load.envirs ( ---|envir array from stat file) Stat.file open  
ChipWIt.count@ 0 do                                             
   Ok.envir(  i ok.envir.len@ * + ( Buffer addr)                
   ok.envir.len@                    ( length)                   
   start.stat.byte@ i stat.rec.len@ * +                         
      name.len@ + game.stat.len@ + ( file addr)                 
   Stat.file  read.virtual                                      
loop Stat.file close ;                                          
: Save.envirs ( ---|Save envir array to stat file)              
   Ok.envir(  cw.num @ 1- ok.envir.len@ * + ( Buffer addr)      
   ok.envir.len@                    ( length)                   
   start.stat.byte@ cw.num @ 1- stat.rec.len@ * +               
      name.len@ + game.stat.len@ + ( file addr)                 
   Stat.file  write.virtual ;                                   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 167
( Button data)                                    ( 102284 dws) 
: ad$( ( adv#--adv( string address) 1- 16 * adventure$( + ;     
create btn.handle( 16 4* allot                                  
0 is ok.button  0 is cancel.button                              
: btn(! ( but#---) 4* btn.handle( + ! ;                         
: adv.button.init ( ---) gameboard.window  dup 12 textsize      
  150 290 " Cancel" -1 0 binary.control ' cancel.button !       
  220 290 " OK" -1 0 binary.control ' ok.button !               
8 0 do                                                          
  39 i 4/ 130 * + ( x) 175 i 4 mod 25 * + ( y) 2dup             
  gameboard.window rot rot "  " -1 1 binary.control i btn(!     
  14 + swap 26 + swap move.to i 1+ ad$( count type              
loop   ;                                                        
                                                                
 : btn.handle ( btn# -- button.handle) 1- 4* btn.handle( + @ ;  
                                                                
════════════════════════════════════════════════════════════════   SCREEN 169
( Ok.envir.addr Setup.buttons)                    ( 040585 dws) 
: ok.envir.addr ( adv/button#---addr)                           
  1- ok.envir( + cw.num @ 1- ok.envir.len@ * + ;                
: Setup.buttons ( ---)   adv.button.init                        
   ok.button 0 set.control                                      
  ( ok.button 0 hilite.control  )                               
   cancel.button 0 set.control                                  
   9 1 do  ( 8 adventures)                                      
     i btn.handle                                               
     i ok.envir.addr c@ 1 min set.control ( reset controls)     
   (  i btn.handle 0 hilite.control   )                         
    loop                                                        
 (  gameboard.window show.controls   )                          
 ;                                                              
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 170
( Stuff.envirs Handle.buttons)                    ( 102284 dws) 
: Stuff.envirs ( ---)                                           
 9 1 do                                                         
   i btn.handle get.control   ( final status of check box)      
   i ok.envir.addr c!                                           
 loop ;                                                         
                                                                
: Handle.buttons ( ---)                                         
  this.control @ @mouse track.control ( follow mouse)           
  if this.control @ toggle.control  boop                        
  then ;                                                        
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 171
( Init.name.panel)                                ( 040585 dws) 
: Init.name.panel ( ---) clear.panel1 menus.off  fetch.name     
  0 0 teset.select  teactivate  gameboard.window terecord >R    
  30 R@ 24 + w! ( lineht)  22 r@ 26 + w! ( ascender)            
  4 R@ 74 + w! ( font) ( bold outline + r@ 76 + w! ( style)     
  24 R> 80 + w! ( size) 2 textsize 0 textfont   setup.buttons   
  12 textsize                                                   
  39 165 move.to   ." It works best in these environments:"     
  24 textsize 55 85 move.to ." Name this ChipWit:"              
  update.text 12 textsize  0 0 move.to                          
   2 2 pensize 0 textfont patcopy penmode                       
  name.rect @rect rect>rectangle                                
  4 roll 3- 4 roll 3- 4 roll 3+ 4 roll 3+  frame rectangle      
   1 1 pensize name.rect @rect rect>rectangle                   
  4 roll 6- 4 roll 6- 4 roll 6+ 4 roll 6+  frame rectangle ;    
                                                                
════════════════════════════════════════════════════════════════   SCREEN 172
( Load.stats Save.stats)                          ( 100684 dws) 
                                                                
: Load.stats ( ---| Loads stats of current ChipWit)             
Stat.file open                                                  
  Stats( game.stat.len@                                         
  start.stat.byte@ cw.num @ 1- stat.rec.len@ * + name.len@ +    
  stat.file read.virtual                                        
Stat.file close ;                                               
                                                                
: Save.stats ( ---)                                             
  Stats( game.stat.len@                                         
  start.stat.byte@ cw.num @ 1- stat.rec.len@ * + name.len@ +    
  stat.file write.virtual ;                                     
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 173
( Mission.addr Cum.score.addr High.score.addr)    ( 100684 dws) 
: Mission.addr ( ---addr| Points to mission count)              
  Stats( Adventure @  1- stat.len@ * + ;                        
                                                                
: Cum.score.addr ( ---addr|Points to cumulative score)          
  mission.addr 2+ ;                                             
                                                                
: High.score.addr ( ---addr)                                    
 mission.addr 6+ ;                                              
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 174
( Zero.stats Inc.missions  update.stats)          ( 101284 dws) 
                                                                
: Zero.stats ( ---| Zeroes stats of current ChipWit)            
  stats( game.stat.len@ erase ;                                 
: Inc.missions ( ---| Adds a game to games played)              
  mission.addr dup w@ 1+ swap w!                                
  Stat.file open  save.stats                                    
  Stat.file close ;                                             
 : Update.stats ( ---| Updates all statistics after a game)     
 cum.score.addr dup @ Points @ + swap !                         
 high.score.addr dup                                            
 @ points @ <                                                   
 if points @ swap ! else drop then                              
 Stat.file open   save.stats                                    
 stat.file close ;                                              
                                                                
════════════════════════════════════════════════════════════════   SCREEN 175
( Stats.screen)                                   ( 110284 dws) 
: Stats.screen ( ---)  <gw>  3window  2 2 pensize               
 window3.rect @rect 4 roll 21 + 4 roll 3+ 4 roll 3- 4 roll 4-   
  rect>rectangle frame rectangle 1 1 pensize                    
  397 146 move.to ." Stats"                                     
  window3.rect @ point>xy  62 + swap 15 + swap                  
  cw.num @ name>n$                                              
  2dup move.to outline textstyle n$ count type                  
  plain textstyle ."   in"                                      
  25 + 2dup move.to  outline textstyle adv.addr count type      
  plain textstyle                                               
  35 + 2dup move.to ." # of missions: " mission.addr w@ dup >R .
  25 + 2dup move.to ." Average score: "                         
  R> dup 0= if  . ( 0 average when no missions)                 
  else cum.score.addr @ swap / . then  25 + move.to             
   ." High score: "  high.score.addr @ . 400 400 rmove  ;       
════════════════════════════════════════════════════════════════   SCREEN 176
( Waste.name.panel)                               ( 040585 dws) 
: save.changes ( ---)                                           
 Stat.file open                                                 
 stuff.name save.name                                           
 stuff.envirs save.envirs                                       
 save.stats                                                     
 Stat.file close  ;                                             
                                                                
: Waste.name.panel ( ---)                                       
 tedeactivate        gameboard.window kill.controls             
 12 textsize  0 textfont                                        
 init.cursor ( in case of cr leaving ibeam) ;                   
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 177
( Edit.name)                                      ( 102184 dws) 
: Edit.name ( ---) init.name.panel                              
  begin adjust.cursor                                           
    teidle do.events mouse.down =                               
    if ?in.control                                              
      if handle.buttons                                         
      else @mouse name.rect ptinrect                            
        if text.click then                                      
      then                                                      
    else ?keystroke if                                          
      dup 13 = if drop ok.button 1 set.control ( CR = ok)       
      else tekey then then ( no cr)                             
    then                                                        
  cancel.button get.control ok.button get.control or until      
  cancel.button get.control not if save.changes then            
  waste.name.panel ;                                            
════════════════════════════════════════════════════════════════   SCREEN 178
( heap.lock voc.chop)                             ( 040785 dws) 
: heap.lock ( size ---addr/handle) ( printer on .s )            
rsrvmem  from.heap ( handle) dup not if 4 100 10000 tone then   
dup lock.handle dup non.purgable dup @ mask.handle swap         
 ;                                                              
: Voc.chop ( ---|Chops Vocab size & sets up 4 data buffers)     
?heap.size 12000 < if ' forth @ to.heap  ?heap.size drop  then  
source.len heap.lock drop dup ' Source.buffer ! source.bmap !   
ibol.len heap.lock  drop dup ' Ibol.buffer@ ! ibol.bmap !       
game.stat.len@  heap.lock drop ' stats( !                       
 ;                                                              
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 179
( Transient.allot Transient.return)               ( 110584 dws) 
create tr.hand( 5 4* allot  ( handles of transient data)        
: transient.return ( ---)                                       
5 0 do tr.hand( i 4* + @  ( get handle) to.heap loop            
 ;                                                              
: Transient.allot ( ---)                                        
 ?heap.size 5000 < if transient.return  then                    
anim.len@ heap.lock tr.hand(  ! dup ' anim.buffer !             
anim.bmap !                                                     
ttl.len@ heap.lock tr.hand( 4+ ! dup ' ttl.buffer ! ttl.bmap !  
stack.len@ dup dup                                              
heap.lock tr.hand( 8+ ! ' mov.st( !                             
heap.lock tr.hand( 12 + ! ' obj.st( !                           
heap.lock tr.hand( 16 + ! ' num.st( !                           
first 32 + dup ' back.buffer ! back.bmap !  ;                   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 180
( startup words)                                  ( 040685 dws) 
: sys.activate if  abort then ;                                 
: go if  sys.window on.activate sys.activate                    
     front.window drop gameboard.window add.window              
    gameboard.window select.window then ;                       
                                                                
: startup  0 0 5 10  sys.window w.bounds                        
          2 sys.window w.type                                   
          0 sys.window w.attributes                             
          sys.window on.activate go                             
          116 @ 112 ! ( override rset)                          
         ( 0  760  c!   ( overrride command keys)               
         ( sys.window select.window )                           
           ;                                                    
( Should run on .87)                                            
                                                                
════════════════════════════════════════════════════════════════   SCREEN 182
( set.cw.menu.names)                              ( 040585 dws) 
 : set.cw.menu.names ( ---)                                     
cw.num @       ( save it on stack)                              
16 0 do i 1+ name>n$                                            
  i 1+ n$ wh.menu set.item$                                     
  i 1+ plain wh.menu item.style                                 
  i 1+ cw.num ! adventure @ ok.envir.addr c@                    
  if i 1+ outline wh.menu item.style then  ( outline good cw's) 
  i 1+ 0 wh.menu item.check                                     
loop                                                            
cw.num ! ( restore it)                                          
cw.num @ -1 wh.menu item.check                                  
9 1 do ( outline best environments)                             
  i 3+ plain g.menu item.style                                  
  i ok.envir.addr c@ if i 3+ outline g.menu item.style then     
loop ;                                                          
════════════════════════════════════════════════════════════════   SCREEN 183
( Setup.name.buttons chooser.text)  exit          ( 102384 dws) 
                                                                
: setup.name.buttons ( ---)                                     
 name.button.init                                               
 ok.button 0 set.control                                        
 ok.button 0 hilite.control                                     
 chipwit.count@ 1+ 1 do                                         
  i btn.handle 0 set.control                                    
  i  cw.num @ = if i btn.handle 1 set.control then              
 loop                                                           
;                                                               
: chooser.text ( ---)                                           
 48 70 move.to 24 textsize ." Choose a ChipWit."                
  14 90 move.to 12 textsize outline textstyle ." Outlined"      
 plain textstyle ."  ones work best in this environment." ;     
                                                                
════════════════════════════════════════════════════════════════   SCREEN 184
 ( handle.name.buttons CW.select)   exit          ( 102384 dws) 
: handle.name.buttons ( ---)                                    
   this.control @ @mouse track.control                          
   if this.control @ ok.button = not                            
     if chipwit.count@ 1+ 1 do   ( 0 'em all if a name)         
       i btn.handle get.control                                 
       if i btn.handle toggle.control then loop                 
     then                                                       
     this.control @ toggle.control                              
   then ;                                                       
  : CW.select ( ---)                                            
   chipwit.count@ 1+ 1 do                                       
     i btn.handle get.control                                   
     if i cw.num ! leave then                                   
   loop                                                         
   cw.num @ cw.load   load.stats ;                              
════════════════════════════════════════════════════════════════   SCREEN 185
( Choose.chipwit)       exit                      ( 102384 dws) 
: choose.chipwit ( ---) get.window <gw>                         
  0 w.menu menu.enable                                          
  0 g.menu menu.enable                                          
  clear.panel1  chooser.text setup.name.buttons                 
  begin do.events mouse.down =                                  
    if ?in.control                                              
      if handle.name.buttons then  then                         
  ok.button get.control until                                   
  clear.panel1 cw.select  gameboard.window kill.controls        
    1 w.menu menu.enable 1 g.menu menu.enable                   
  window ;                                                      
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 186
( workshop.choose.chipwit game.choose.chipwit)    ( 102384 dws) 
exit <<<<<<<<<<<<<<<<<<<                                        
: workshop.choose.chipwit ( ---)                                
  choose.chipwit                                                
  1 new.cw ! workshop.on@ prog.status ! ;                       
 : game.choose.chipwit ( ---)                                   
  choose.chipwit                                                
  game.title ad.title                                           
  game.off@ prog.status ! ;                                     
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 190
( New.interior)                                   ( 110184 dws) 
( pictures 101 - 108 are walls and floors of adventures)        
                                                                
: new.interior ( adventure# ---)   100 + >R                     
  source.bmap setportbits                                       
  320 32 361 193 R@  pict.in.rect                               
  320 32 361 193 R>  pict.in.rect                               
  screen.bmap setportbits ;                                     
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 195
 ( Robotnik loader)                               ( 040785 dws) 
1 delete.menu   29800 resize.object   16860 resize.vocab        
decimal                                                         
  : it ; new.window gameboard.window                            
    0 0 342 512 Gameboard.WINDOW W.BOUNDS                       
   2 24 thru ( Common Ed & Game )  76 83 thru  ( anima stuff)   
   86 95 thru ( Ibol graphics)                                  
   sys.window select.window                                     
   gameboard.window ADD.WINDOW 160 177 thru ( Stat&name )       
   96 105 thru  ( debug) 150 159 thru  ( Stack,reg stuff)       
   106 137 thru ( Workshop)  178 179 thru ( voc.chop) 190 load  
 25  68 thru  ( game )                                          
 sys.window select.window                                       
                                                                
                                                                
                                                                
