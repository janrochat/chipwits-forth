                                        
                                        
                                        























( chipwit game loader)                  
                                        
( forget it : it ; ) forth              
172 197  thru  ( data & common routines)
246 254 thru ( char routines)           
256 265 thru ( ibol graphics)           
330 339 thru ( stat  names)             
266 275 thru  ( debug)                  
320 329 thru  ( stack,reg stuff)        
276 290 thru  ( workshop)               
313 319 thru ( menus)                   
291 307 thru  ( w2)                     
198 241 thru ( game)                    
308 311 thru  ( bads)                   
242 load  ( game)                       
( 251 256 thru ( choose cw)             
243 245 thru   ( cw master word)        
( 255 load  ( dummy prog)               
                                        
dr0                                     
                                        
                                        
                                        
                                        
                                        

( robot vars and consts 11/4/84)        
: var variable ; : is constant ;        
( var robot.square)                     
( var robot.orientation)                
8  is chips.wide@ 5 is chips.high@      
chips.wide@ chips.high@ *               
 is chip.count@                         
10 chip.count@ 2 * * is prog.size@      
create robot.program                    
  prog.size@ allot                      
                                        
16 is chipwit.count@                    
var current.instruction ( 0-39)         
var current.panel   ( 0-9)              
var key.pressed                         
var fuel.reg   ( 0-1400)                
var range.reg  ( 0-8)                   
var damage.reg  ( 0-1400)               
var copy.buff.full                      
 ( is copy buffer full?)                



                                        


( operator consts, cycles 11/4/84)      
  1 is goto's                           
0 is go.marker@ 1 is goto.go@           
2 is subpanel@  3 is boomerang@         
4 is wire@                              
  2 is act.on.world's                   
5 is move@  6 is pick.up@               
7 is qray@  8 is sing@                  
  3 is detect's                         
9 is feel.for@ 10 is look.for@          
11 is smell.for@                        
  4 is special's                        
12 is flip.coin@  13 is keypress@       
  5 is stack's   6 is socket's          
14 is number=@  15 is number<@          
16 is object=@  17 is move=@            
18 is on.number@ 19 is on.object@       
20 is on.move@  21 is drop.stack@       
22 is plus@     23 is minus@            
24 is socket@  25 is action.count@      
create cycles(                          
0 c, 1 c, 1 c, 1 c, 0 c, 3 c, 1 c,      
1 c, 2 c, 4 c, 4 c, 4 c, 3 c, 3 c,      
2 c, 2 c, 2 c, 2 c, 1 c, 1 c, 1 c,      
1 c, 1 c, 1 c, 1 c,                     

( arg, code, orient consts fuel( )      
( program flow bits)                    
0 is up.f@ 64 is down.f@                
128 is left.f@  192 is right.f@         
var op.byte  var arg.byte               
var flow.code                           
                                        
( chipwit orientation)                  
7 is w   6 is sw  5 is s   4 is se      
3 is e   2 is ne  1 is n   0 is nw      
                                        
( args which don't index to graphs)     
27 is no.key@                           
1 is panela@ 2 is panelb@               
3 is panelc@ 4 is paneld@               
5 is panele@ 6 is panelf@               
7 is panelg@                            
                                        
create fuel(                            
0 c, 1 c, 1 c, 1 c, 0 c, 5 c, 5 c,      
7 c, 2 c, 4 c, 2 c, 2 c, 1 c, 1 c,      
1 c, 1 c, 1 c, 1 c, 1 c, 1 c, 1 c,      
1 c, 1 c, 1 c, 1 c,                     
                                        
                                        

( argument constants 11/4/84)           
                                        
0 is turn.right@ 1 is turn.left@        
2 is forward@    3 is reverse@          
                                        
4 is pie@        5 is coffee@           
6 is disk@       7 is oil@              
8 is floor@   9 is bomb@                
10 is bouncer@  11 is creep@            
( 12 is wall@)    13 is door@           
                                        
14 is damage.reg@ 15 is fuel.reg@       
16 is range.reg@                        
                                        
17 is mov.stack@  18 is num.stack@      
19 is obj.stack@  20 is mov.empty@      
21 is num.empty@  22 is obj.empty@      
                                        
23 is num0@ 24 is num1@ 25 is num2@     
26 is num3@ 27 is num4@ 28 is num5@     
29 is num6@ 30 is num7@                 
                                        
31 is thing.count@                      
                                        
                                        

( gameboard data)                       
                                        
8 is squares.wide@                      
8 is squares.high@                      
squares.wide@ squares.high@ *           
  is square.count@                      
square.count@ 16 + is room.size@        
                                        
( create room.data( room.size@ allot)   
                                        
53248 is scenario.buffer@               
 ( scenarios are loaded here)           
var this.room@                          
                                        
24 is game.width@ 16 is game.height@    
                                        
1 is game.xt@ 8 is game.yt@             
( tab positions for upper left game)    
24 game.xt@ 8 * + is game.x@            
50 game.yt@ 8 * + is game.y@            
( sprite xy for upper left)             
                                        
( var wall.covers  ( wall hides cw?)    
                                        
                                        

( game driver data)                     
create adventure 6 allot 1 adventure !  
adventure 2 + is cw.num  1 cw.num !     
dvariable  points                       
var cycle.ct   ( time countdown)        
var sound.on   ( toggle)                
var debug.speed                         
                                        
var game.status 1 is debug.on@          
2 is stats.on@  3 is turn.debug.on@     
4 is turn.stats.on@                     
                                        
var prog.status                         
 1 is turn.game.on@                     
 2 is game.on@                          
 3 is workshop.on@                      
 4 is workshop.off@                     
 5 is game.aborted@ ( dead chipwit)     
 6 is turn.game.off@                    
 7 is game.finished@ ( out of cycles)   
 8 is game.off@  ( wait for choice)     
 9 is quit@  ( bye)                     
 10 is series@  ( multi-game)           
                                        
var last.mission                        

( color constants)                      
lt.gray is ac@ ( act icon bkgnd)        
dk.gray is  tc@ ( thing icon bkgnd)     
dk.gray is ws.back.col@                 
blue is ws.bord.col@                    
blue is gm.bord.col@                    
 black is nc@ ( number)                 
 blue is oc@  ( obj)                    
 red  is  mc@  ( mov@)                  
 black is vc@   ( various)              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
lt.gray is bak.c  ( back color)         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
exit                    
 ( file and menu stuff)                 

























( adventure names)                      
                                        
15 8 * $variable adv$(                  
0 adv$( c!                              
adv$( " ↑ greedville ↑↑" $concat        
adv$( "  chipwit caves " $concat        
adv$( " ↑ doom rooms ↑↑" $concat        
adv$( " ↑ peace paths ↑" $concat        
adv$( "  memory lanes ↑" $concat        
adv$( " octopus garden↑" $concat        
adv$( " ↑↑ ces demo ↑↑↑" $concat        
adv$( " ↑↑ boomtown ↑↑↑" $concat        
                                        
create cycle(                           
 6000 ,  10000 ,  10000 ,  16000 ,      
20000 ,  20000 ,   2000 ,  12000 ,      
                                        
                                        
create trip.count(                      
 0 c,  6 c,  0 c, 20 c,                 
 9 c, 32 c, 12 c,  3 c,                 
                                        
8 is adventure.count@                   
                                        
16 $variable cw.name$                   

( scenario.play( room.ct( )             
: d, 10 * c, ;                          
create scenario.play(                   
( crp.ct) 00 c, 08 c, 08 c, 04 c,       
          03 c, 03 c, 00 c, 03 c,       
( crp.pt) 00 d, 05 d, 10 d, 03 d,       
          03 d, 01 d, 00 d, 04 d,       
( bnc.ct) 00 c, 00 c, 02 c, 00 c,       
          02 c, 02 c, 00 c, 00 c,       
( bnc.pt) 00 d, 00 d, 25 d, 06 d,       
          06 d, 02 d, 00 d, 00 d,       
( oil.ct) 10 c, 06 c, 00 c, 04 c,       
          02 c, 00 c, 00 c, 00 c,       
( oil/pt) 05 d, 05 d, 00 d, 02 d,       
          03 d, 05 d, 15 d, 00 d,       
( dsk.ct) 03 c, 02 c, 00 c, 02 c,       
          00 c, 00 c, 00 c, 00 c,       
( dsk.pt) 10 d, 10 d, 00 d, 15 d,       
          25 d, 25 d, 25 d, 25 d,       
( cof.ct) 03 c, 04 c, 02 c, 03 c,       
          03 c, 01 c, 00 c, 00 c,       
( pie.ct) 03 c, 00 c, 02 c, 03 c,       
          02 c, 04 c, 00 c, 02 c,       
create room.ct( 4 c, 8 c, 12 c,         
50 c, 1 c, 1 c, 1  c, 9 c,              

 ( color.block screen.on,sprites.off)   
: color.block ( l/t/r/b/color---)       
  >r                                    
  swap 4 roll swap  ( t/b/l/r)          
  over - 1+   ( t/b/l/width)            
  r> 5 roll 5 roll  ( l/w/cl/t/b)       
  1+ swap do  ( ytab)                   
   i 40 * 4 pick + >r                   
   'screen r@ + 3 pick 3 pick           
   7 > prog.status @ workshop.on@ =     
not and  if 32 else 33 then fill        
   ( blanks if lt.gray)                 
   color-mem r> + 3 pick 3 pick fill    
  loop                                  
  drop drop drop ;                      
  : screen.on ( ---)                    
    53265 c@ 24 or 53265 c! ;           
  : screen.off ( ---)                   
    53265 c@ 239 and  53265 c! ;        
                                        
 : sprites.off ( ---)                   
  1 53269 c! ;                          
                                        
                                        
                                        

( cw.load cw.save back.wipe )           
                                        
: back.wipe ( color---)                 
 'screen  1000 33 fill ( rev blank)     
 color-mem 1000 rot fill ;              
                                        
: cw.file$ ( #---)                      
  5 savename c!  ( length)              
  64 savename 1+ c! ( @)                
  48 savename 2+ c! ( 0)                
  58 savename 3 + c! ( :)               
  67 savename 4 + c! ( c)               
  64 + savename 5 + c! ( #code) ;       
                                        
: cw.load  ( cw#--)  cw.file$           
  robot.program savename loadram ;      
                                        
: cw.save ( cw#---)                     
  cw.file$                              
  robot.program dup prog.size@ +        
  save ;                                
                                        
                                        
                                        
                                        

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( get.action this.chip @chip !chip)    
                                        
: this.chip  ( --- abs.chip)            
  current.panel @ chip.count@ *         
  current.instruction @ + ;             
                                        
: @chip  ( ---op.byte/arg.byte)         
  this.chip 2* robot.program +          
  dup 1+ swap c@  ( op.byte)            
  swap c@ ( arg.byte) ;                 
                                        
: !chip  ( op/arg---)  >r >r            
  this.chip 2* robot.program +          
  dup r> swap c!  ( op)                 
  r> swap 1+ c!  ( arg) ;               
                                        
: get.action ( --- action.token)        
  robot.program this.chip 2* + c@       
  dup 192 and flow.code !               
  64 mod dup op.byte c! ;               
                                        
                                        
                                        
                                        
                                        

( get.arg false.flow irnd within )      
variable rnd here rnd !                 
: rand rnd @ 31421 * 6927 + dup rnd ! ; 
: irnd ( max--rnd)                      
  rand u* swap drop ;                   
                                        
: get.arg.asc ( -ascii) arg.byte c@     
  64 mod 64 + ( 1 is a) ;               
                                        
: false.flow ( ---)                     
  arg.byte c@ 192 and flow.code ! ;     
                                        
: within ( n/min/max---flag)            
  1+ 3 pick > rot rot 1- > and ;        
                                        
: get.arg ( ---)                        
  robot.program this.chip 2* + 1+       
  c@ arg.byte c! ;                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        

 ( square.xy square.xtyt debug? +mod)   
                                        
: square.xy  ( sq# ---x/y)              
 dup squares.wide@ mod game.width@ *    
 game.x@ +  ( x)                        
 swap squares.wide@ / game.height@ *    
 game.y@ +  ( y) ;                      
                                        
                                        
                                        
: square.xtyt  ( sq# ---xtab/ytab)      
 dup squares.wide@ mod 3 * game.xt@ +   
 swap squares.wide@ / 2 * game.yt@ + ;  
                                        
: debug? ( ---flag)                     
 ( is debug mode on?)                   
game.status @ debug.on@ = ;             
                                        
                                        
                                        
: +mod ( n mod# --n)                    
  mod dup 0< if drop 7 then ;           
                                        
                                        
                                        

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( count.baddies baddy vars)             
                                        
var creep.count                         
create creeps( 12 allot                 
var bouncers ( 0 or 1)                  
var bouncer.sq                          
var bouncer.state                       
                                        
: count.baddies ( ---)                  
 creeps( 12 0 fill                      
 0 creep.count ! 0 bouncers !           
 square.count@ 0 do                     
  i square.object                       
  case creep@ of 1 creep.count +!       
         i creep.count @ 1-             
         creeps( + c! ;;                
       bouncer@ of                      
         1 bouncers !                   
         i bouncer.sq !  ;;             
  endcase                               
 loop ;                                 





 ( put.objects furnish.room)            
                                        
: put.objects ( countlim/objcode--)     
 swap irnd dup 0>                       
 if 0 do begin square.count@ irnd       
     dup square.object                  
     floor@ =                           
     if over swap room.data( + c! 1     
     else drop 0 then                   
    until loop drop                     
 else 2drop then ;                      
                                        
: furnish.room ( ---)                   
 adventure @ 1- scenario.play( +        
 dup c@ creep@ put.objects              
 dup adventure.count@ 2* +  c@          
    bouncer@ put.objects                
 dup adventure.count@ 4 * + c@          
    oil@ put.objects                    
 dup adventure.count@ 6 * + c@          
    disk@ put.objects                   
 dup adventure.count@ 8 * + c@          
    coffee@ put.objects                 
     adventure.count@ 9 * + c@          
    pie@ put.objects ;                  

( room data clear.rooms)                
var rooms.visited                       
  create room( 50 allot ( max rooms)    
: clear.rooms( room( 50 0 fill          
  0 rooms.visited ! ;                   
: chuck.goods ( ---↑erase good things)  
room.data( dup square.count@ + swap do  
  i c@ dup  disk@ = swap oil@ = or      
    if floor@ i c! then                 
loop ;                                  
: goods.check ( room#---)               
 adventure @ dup 4 7 within swap 2      
  = or if 1 else 0 then  ( eraseables)  
  if 1- dup room( + c@ not ( not vis)   
    if room( + 1 swap c!                
      rooms.visited @ 1+ dup            
      trip.count( adventure @ 1- + c@   
      = if drop clear.rooms(            
    else rooms.visited ! then           
   else drop chuck.goods then (         
    ( been here)                        
  else drop then ;                      




( load.room )                           
                                        
: load.room ( room#---)  dup 1-         
  scenario.buffer@ swap room.size@ * +  
  room.data( room.size@                 
  swapout cmove swapin                  
  dup adventure @ 4 = not swap          
  2 mod 0= or                           
  if furnish.room then                  
  count.baddies                         
  goods.check ;                         
                                        
                                        
                                        












                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( sounds)                              
 : move.sound  ;                        
                                        
                                        
 : bump.sound ;                         
                                        
 : zap.sound ;                          
                                        
 : crunch ;                             
                                        
 : see.sound ;                          















                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        


























 ( setup.game.screen)                   
                                        
 : setup.game.screen  ( ---)            
 ( flip in the game graphic screen)     
  1 multi-color                         
  first 'screen 1000 cmove              
  first 1000 + color-mem 1000 cmove     
  bak.c 0 bkgnd                         
  gm.bord.col@ border                   
   6 2 d-position  black char.color     
  adv$( adventure @ 1- 15 * + 1+        
  15 type  ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
exit                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( clean.up)                             
                                        
 : clean.up ( ---)                      
   64 0 do                              
     i square.object                    
     dup dup                            
      wall@ = swap door@ = or           
      swap floor@ = or not              
      if floor@ i room.data( + c!       
      then                              
   loop ;                               















( room stuffer for demo)                
 wall@ 2+ is walls@                     
: r, ( obj# sq# ---)                    
  room.data( + c! ;                     
: blank.room ( ---)                     
  room.size@ 0 do                       
  floor@ room.data( i + c! loop ;       
 blank.room                             
 wall@ 0 r, wall@ 1 r, wall@ 2 r,       
 wall@ 3 r, wall@ 4 r, door@ 5 r,       
 wall@ 6 r, wall@ 7 r,                  
 wall@  8 r,                            
 wall@ 11 r,                            
 wall@ 15 r,                            
 wall@ 16 r,             bomb@ 20 r,    
 door@ 23 r,                            
 door@ 24 r,                            
 coffee@ 29 r,   wall@ 31 r,            
 wall@ 32 r,  wall@ 39 r,               
wall@ 40 r,      wall@ 47 r,            
wall@ 48 r,    wall@ 55 r,              
wall@ 56 r, wall@ 57 r, wall@ 58 r,     
wall@ 59 r, wall@ 60 r, door@ 61 r,     
wall@ 62 r, wall@ 63 r,                 
                                        

( draw.thing )                          
                                        
: draw.thing ( sqx/sqy/obj#---)         
  dup wall@ = if                        
   3 pick 3 pick squares.wide@ * +      
   dup squares.wide@ + square.object    
   ( square toward user is wall)        
   wall@ =                              
   swap 56 < and  ( not bottom row)     
   not if drop  walls@  then            
   ( leave wallside token)              
  then >r                               
  2 * game.yt@ + swap 3 * game.xt@ +    
  swap r> 4 - 7 *  obj.block( +  obj. ; 









                                        
















































































 ( block.wall <<<<<< erase.robot)       
                                        
: block.wall ( orient#--↑draws wall in) 
  ( front of cw)                        
  case s of squares.wide@ ;;            
       e of 1 ;; w of -1 ;;             
       0                                
  endcase                               
  op.byte c@ 64 mod move@ = not         
  if drop 0 then ( no move to block)    
  dup 0= if drop else                   
    robot.square @ +  ( block square)   
    square.xy                           
    s2 s-position off s-enable          
    187 s-pointer                       
    0 s-priority on s-multi             
    off s-yexp off s-xexp               
   53283 c@ s-color 53282 c@ 0 s-multir 
   white 1 s-multir                     
   255 53269                            
   frame c!  ( enable all sprites)      
  then ;                                
: erase.robot ( ---)                    
  1 53269 c! ;                          
                                        

( cw.op.mouth)                          
                                        
: cw.op.mouth ( ---↑open cw's mouth)    
 s4 white s-color robot.orientation @   
 7 * 129 + frame  s-pointer ;           





















( init.cw.graphics draw.robot cw.anim)  
create cw.xy( 12 allot ( xy array)      
: cw.xy! ( x/y/spr#---) 2- 2*           
  cw.xy( + dup 1+ rot swap c! c! ;      
 var cw.x var cw.y  : t 1 cw.load .s ;  
 : cw.go ( x/y---)                      
  2dup cw.y ! cw.x !                    
  19 - ( offset upwards)                
  2dup 2 cw.xy!  2dup 3 cw.xy!          
  2dup 6 cw.xy!                         
  12 +  ( lower body sprites)           
  2dup 4 cw.xy!  2dup 5 cw.xy!          
  7 cw.xy!                              
  56334 c@ 254 and 56334 c!             
  frame      cw.xy( 53252 12 cmove      
  56334 c@ 1 or 56334 c! ;              
 : init.cw.graphics ( ---)              
 ( start cw at right x/y)               
 robot.square @ square.xy swap 1-       
 swap cw.go ;                           
 : cw.anim  ( dx/dy---)                 
  s4 robot.orientation @                
  7 * 128 + frame    s-pointer          
   cw.y @ + swap cw.x @ + swap cw.go ;  
 : draw.robot ( ---)  0 0 cw.anim ;     

( draw.gameboard)                       
                                        
: draw.gameboard ( ---)                 
  room.data( 1-                         
  squares.high@ 0 do                    
   squares.wide@ 0 do                   
     1+ dup c@                          
     i j rot draw.thing                 
   loop                                 
  loop drop ;                           










































( flash.cw)                             
                                        
 : flash.cw  ( #flashes---)             
   0 do                                 
    53289 1024 6 cmove ( save colors)   
    6 0 do 16 irnd 53289 i + c! loop    
     ( random colors  )                 
    2 wait 1024 53289 6 cmove 2 wait    
   loop ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( orient.xy    cw.slide)               
                                        
 : orient.xy ( orientation#---)         
  case n of 0 -2 ;; ne of 3 -2 ;;       
   e of 3 0 ;;  se of 3 2 ;;            
   s of 0 2 ;;  sw of -3 2 ;;           
   w of -3 0 ;; nw of -3 -2 ;;          
  endcase ;                             
                                        
 : cw.slide ( ---↑ move cw forward)     
   robot.orientation @ orient.xy        
   cw.anim move.sound ;                 
                                        
 : cw.back.slide ( ---↑cw reverse)      
   robot.orientation @ 4 + 8 mod        
   orient.xy                            
   cw.anim move.sound ;                 
                                        
                                        
                                        
                                        
                                        
                                        



( next.square)                          
                                        
                                        
: next.square ( orient/sq#--next sq#)   
 ( what is next square#?)               
 swap 0 wall.covers !                   
 case                                   
  n of squares.wide@ - ;;               
  e of 1+ ;;                            
  s of squares.wide@ + ;;               
  w of 1- ;;                            
 ne of 7 - dup                          
  check.cover if e block.wall then ;;   
 se of dup 9 + swap                     
  check.cover if s block.wall then ;;   
 sw of dup 7 + swap                     
  check.cover if s block.wall then ;;   
 nw of 9 - dup                          
  check.cover if w block.wall then ;;   
endcase ;                               






( add.points count.cycles)              
                                        
: add.points  ( points---)              
  0 points d@ d+ ddup points d!         
  debug? if ddrop                       
  else 2 5 d-position d. then           
  ;                                     
                                        
: count.cycle ( cycles---)              
  cycle.ct @ + dup cycle.ct !           
  19 5 d-position                       
  dup 1 < if drop 0 game.finished@      
          prog.status ! then            
  debug? if drop                        
  else blue char.color abs .  then ;    











( calc.robot.move boom ?boom)           
 forth                                  
 : calc.robot.move ( --- next sq#)      
  robot.orientation @                   
   arg.byte c@ 64 mod check.mov.st      
   reverse@ = if 4 + 8 mod then         
   robot.square @ next.square ;         
                                        
 var exploded  ( Was there explosion?)  
 : boom ( ---↑hit a bomb, end game)     
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
: ?boom ( object --- object)            
 0 exploded !                           
 dup bomb@ = if boom then ;             
                                        
                                        
                                        
                                        
                                        

( goto.next.room)                       
                                        
: goto.next.room ( sq#---nextroom sq#)  
 erase.robot  ( from last room)         
 0 robot.square @ 0 do                  
   i square.object door@ = if 1+ then   
 loop                                   
 dup 8 +  ( next room/next sq↑ )        
 room.data( square.count@ + + c@        
 robot.square !                         
 ( get next door sq from and store)     
 room.data( square.count@ + + c@        
 load.room                              
 ( load next room#)                     
 init.cw.graphics                       
 draw.gameboard  cw.init                
 drop calc.robot.move ;                 
                                        








 ( check.for.next.room)                 
                                        
: check.for.next.room ( nextsq--nextsq) 
 robot.square @ square.object door@ =   
 if robot.square @    ( nxt/rob)        
  dup 0 7 within                        
  if drop dup 0<      ( nxt/flag)       
  else                ( nxt/rob)        
   dup 8 55 within ( east or west)      
   if squares.wide@   ( nxt/rob/wd)     
     mod 0=           ( nxt/flag)       
     if ( west)                         
       dup squares.wide@ mod            
       squares.wide@ 1- =  ( nxt/flag)  
     else dup squares.wide@ mod 0=      
     then   ( nxt/flag)                 
   else drop   ( south) ( nxt)          
     dup square.count@ 1- > ( nxt/flg)  
   then                                 
  then                                  
  if goto.next.room then                
then ;                                  
                                        
                                        
                                        

( bump)                                 
                                        
: bump ( obj #moves---obj)              
  init.cw.graphics ( ???)               
  arg.byte c@ 64 mod check.mov.st       
  forward@ =                            
  if 0 do cw.slide loop                 
  else 0 do cw.back.slide loop then     
  bump.sound                            
  dup dup bouncer@ = swap creep@ = or   
  if 5 flash.cw 50 update.damage then   
  ( shake the screen)                   
  50 update.damage ;                    













( move)                                 
: wt ( #---) 40 * 0 do loop ;           
: move ( ---)                           
  calc.robot.move check.for.next.room   
  dup square.object dup floor@ =        
  swap door@ = or                       
  if   ( ok to move)                    
    init.cw.graphics ( ???)             
    arg.byte c@ 64 mod check.mov.st     
    forward@ =                          
    if 8 0 do cw.slide 1 wt  loop       
    else 8 0 do cw.back.slide 1 wt loop 
    then                                
    robot.square !                      
  else  ( hit something)                
    square.object dup wall@ =           
    if 1 bump drop                      
    else 5 bump ?boom drop then         
  then  ;                               







 (  move-robot)                         
                                        
: move.robot ( ---)                     
 arg.byte c@ 64 mod                     
 check.mov.st dup mov.empty@ = not      
 if dup forward@ <                      
   if ( rotation arg)                   
    turn.right@ = if 1 else -1 then     
    robot.orientation @ + 8 +mod        
    move.sound cw.point move.sound      
   else drop move                       
   then                                 
   exploded @ not                       
   if draw.robot move.sound then        
 else drop then ;                       







                                        
                                        


( sightline destroy)                    
                                        
: sightline ( sq#--)                    
  drop ;                                
                                        
                                        
                                        
                                        
 : destroy ( sq#---)                    
   dup room.data( + floor@ swap c!      
   ( put floor in room.data( )          
   debug? not                           
   if square.xtyt floor@ 4 - 7 *        
     obj.block( + obj.                  
   else drop then ;                     











( zapper retract.zapper )               
                                        
: zapper  ( ---)  s2 off s-enable       
  185 s-pointer                         
  robot.square @ square.xy              
  31 -  ( y up offset)                  
  swap 2 - swap s-position              
  white s-color                         
  0 s-priority 0 s-multi                
  0 s-yexp 0 s-xexp                     
  255 53269 frame c! ;                  
                                        
                                        
                                        
: retract.zapper ( ---)                 
  253 53269 c! ;                        
                                        
                                        
                                        







( zap.ray)                              
                                        
: zap.ray  ( targ sq#---)               
  dup robot.square @ squares.wide@ -    
  = not  ( not under head)              
  if                                    
    drop  ( draw ray)                   
  else drop then                        
  ;                                     

















( eat.it zap.it)                        
: eat.it ( sq#---)                      
  dup square.object                     
  case pie@ of 1200 update.fuel ;;      
    coffee@ of 1200 update.fuel ;;      
    oil@ of scenario.play(              
      adventure.count@ 5 * +            
      adventure @ 1- + c@ add.points ;; 
   disk@ of scenario.play(              
      adventure.count@ 7 * +            
      adventure @ 1- + c@ add.points ;; 
  endcase  destroy ;                    
: ?peace adventure @ 4 =                
   if negate then ;                     
: zap.it ( sq#--) dup square.object     
  case creep@ of scenario.play(         
     adventure.count@ + adventure @ 1-  
     + c@ ?peace add.points ;;          
     bouncer@ of scenario.play(         
     adventure.count@ 3 * + adventure @ 
     1- + c@ ?peace add.points          
     0 bouncers ! ;;                    
   bomb@ of retract.zapper boom ;;      
  endcase exploded @ not                
  if destroy else drop then ;           

( zap)                                  
                                        
: zap ( ---) robot.orientation @        
 robot.square @                         
 next.square check.for.next.room drop   
 robot.square @                         
 8 0 do                                 
  robot.orientation @ swap next.square  
  dup square.object   ( tsq#/obj#)      
  dup floor@ =                          
  if drop ( just floor)                 
  else zapper  10 wait                  
    over zap.ray zap.sound              
    dup wall@ = swap door@ = or         
    if dup zap.ray                      
    else dup dup zap.ray zap.it         
    then                                
    retract.zapper  ( ???)  leave       
  then                                  
 loop drop ;                            
                                        
                                        
                                        
                                        
                                        



























 ( move.arm  arm.prep)                  
: arm.prep (  ---↑get ready for arm)    
  s2 off s-enable white s-color         
  off s-multi off s-xexp                
  on s-yexp 0 s-priority ;              
                                        
: arm.xy ( orientation---sprite offx/y) 
  2 * arm.pt( + @ split  robot.square @ 
  square.xy 15 - swap 10 +              
 ( head offset) ( arm.x/y/headoffy/x)   
  4 roll - rot rot swap - ;             
: move.arm ( arm#--)  s2                
  dup 0 = if n arm.xy s-position        
  194 s-pointer on s-enable drop        
  else 1- 192 + robot.orientation @     
    2 * + robot.orientation @ arm.xy    
    on                                  
    frame                               
    s-enable s-position  s-pointer      
  then ;                                
: arm.out ( ---) arm.prep               
   3 0 do i move.arm 5  wait loop ;     
: arm.in ( ---)                         
 -1 2 do i move.arm 2  wait -1 +loop    
 arm.prep ;                             

( sing)                                 
                                        
: sing ( ---)                           
       ;                                






















( pick.up act.on.world)                 
: pick.up ( ---)                        
 rob.or.sq@                             
 next.square check.for.next.room        
 arm.out cw.op.mouth                    
 dup square.object ?boom                
 dup dup wall@ = swap creep@ = or       
 swap bouncer@ = or                     
 if square.object wall@ =               
  if bump.sound 50 update.damage        
  else 5 flash.cw 150 update.damage     
  arm.in then                           
 else dup square.object                 
  dup dup floor@ = swap door@ = or      
  swap bomb@ = or not                   
  if eat.it  arm.in                     
    5 0 do crunch 0 0 cw.anim           
    3 wt crunch cw.op.mouth loop        
    crunch 0 0 cw.anim                  
 else drop arm.in then then ;           
: act.on.world ( opcode ---)            
  case qray@ of zap ;;                  
sing@ of sing ;; pick.up@ of pick.up ;; 
move@ of get.arg move.robot ;;          
endcase ;                               

 ( feel.for)                            
                                        
 : feel.for ( object ---)               
 rob.or.sq@                             
 next.square check.for.next.room        
 arm.prep black  s-color                
 2 move.arm  8 wait                     
 square.object ?boom                    
 = not  ( don't feel it)                
 if false.flow then                     
 s2 off s-enable ;                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        






( look.for)                             
var seen                                
: look.for ( object---) off seen !      
 rob.or.sq@                             
 2dup next.square check.for.next.room   
 drop                                   
 6 0 do  ( search loop)                 
   2dup next.square swap drop           
   dup square.object dup                
   floor@ = if drop ( just floor)       
     else over sightline 4 pick =       
   if  ( search object seen)            
     on seen !                          
     i 1+ update.range ( sqs to obj)    
     see.sound then leave               
   then                                 
 loop                                   
 seen @ 0= if false.flow then           
 ( correct object not seen)             
 drop 2drop ;                           
                                        
                                        
                                        
                                        
                                        

( smell.for detect.&.branch )           
                                        
: smell.for ( object---)                
  false.flow  ( assume false)           
  square.count@ 0 do                    
    dup i square.object =               
 ( compare search item w square it)     
    if this.chip 2* robot.program +     
     c@ 192 and flow.code !             
     ( true.flow)                       
     leave then                         
  loop drop ;                           
                                        
: detect.&.branch ( opcode---)          
 arg.byte c@ 64 mod check.obj.st        
 dup obj.empty@ = not                   
 if swap                                
  case feel.for@ of feel.for ;;         
       look.for@ of look.for ;;         
      smell.for@ of smell.for ;;        
  endcase                               
 else 2drop false.flow then ;           




( keypress update.key)                  
                                        
: keypress ( ---)                       
 key.pressed @ arg.byte c@ 64 mod       
 =  ( key test = last pressed?)         
 if ( right key)                        
   no.key@ key.pressed !                
 else false.flow then ;                 
                                        
                                        
: update.key ( asc ---)                 
( updates and displays key pressed)     
dup 96 > ( lower case?)                 
if 32 - then                            
dup dup 64 < swap 90 > or               
if drop no.key@ 64 + then 64 -          
  ( only alpha)                         
37 4 d-position                         
dup no.key@ = if ." !"                  
0 197  c!  ( reset kbrd)                
else dup 64 + emit then                 
key.pressed ! ;                         


                                        

( flip.coin special)                    
                                        
: flip.coin ( ---)                      
  2 irnd 0=                             
  if false.flow then ;                  
                                        
: special ( opcode---)                  
 case flip.coin@ of flip.coin ;;        
    keypress@ of keypress ;;            
 endcase ;                              
















( subpanel boomerang)                   
                                        
: fudge -1 current.instruction !        
  right.f@ flow.code ! ;                
var return↑                             
                                        
: subpanel ( ---)                       
 current.instruction @ return↑ !        
 arg.byte c@ 64 mod                     
 current.panel !                        
 0 current.instruction !                
 ;                                      
                                        
: boomerang ( ---)                      
 0 current.panel !                      
 return↑ @ current.instruction !        
 robot.program this.chip 2* +           
 c@ 192 and flow.code !                 
  ( new.flow)                           
 ;                                      






( goto)                                 
                                        
: goto ( op.code---)                    
 get.arg                                
 case                                   
   go.marker@ of no.key@ update.key     
   28 4 d-position current.panel @      
   ." " 64 + emit ;;                   
   subpanel@ of subpanel ;;             
   boomerang@ of boomerang ;;           
 endcase ;                              















( calc.next.instruction)                
: chip#.  ( ---↑prints chip #)          
  current.instruction @                 
  dup 8 / 10 * swap 8 mod +             
  ." " 32 4 d-position . ." " ;        
                                        
: calc.next.instruction ( ---)          
 op.byte c@ dup goto.go@ = swap         
 socket@ = or if 0 ( jump to 0)         
 else                                   
   current.instruction @                
   flow.code @                          
   case                                 
       up.f@ of chips.wide@ - ;;        
     down.f@ of chips.wide@ + ;;        
     left.f@ of 1- ;;                   
    right.f@ of 1+ ;;                   
   endcase                              
 then                                   
 current.instruction !                  
 chip#. ;                               





( group( )                              
( array that groups ops by function)    
create group(                           
 goto's c, goto's c, goto's c,          
 goto's c, goto's c,                    
                                        
 act.on.world's c,  act.on.world's c,   
 act.on.world's c,  act.on.world's c,   
                                        
 detect's c, detect's c, detect's c,    
                                        
 special's c, special's c,              
                                        
 stack's c, stack's c, stack's c,       
 stack's c, stack's c, stack's c,       
 stack's c, stack's c, stack's c,       
 stack's c,                             
                                        
 socket's c,                            
                                        
                                        
                                        
                                        



( execute.robot.instruction)            
                                        
: execute.robot.instruction ( --)       
 prog.status @ dup game.on@ =           
 swap series@ = or                      
 if ?terminal dup                       
  if update.key else drop then          
  get.action                            
  dup cycles( + c@ negate count.cycle   
  dup fuel( + c@ negate update.fuel     
  dup group( + c@  ( get op group)      
  case                                  
    goto's of goto ;;                   
    act.on.world's of act.on.world ;;   
    detect's of                         
       get.arg detect.&.branch ;;       
    special's of                        
       get.arg special ;;               
    stack's of get.arg stacker ;;       
    socket's of drop ;;                 
  endcase                               
  calc.next.instruction                 
 then ;                                 



( init.game)                            
                                        
: init.game ( ---)                      
  game.char                             
                                        
  cw.init                               
  0. points d!                          
  0 current.instruction !               
  0 current.panel !                     
  0 exploded !                          
  0 damage.reg ! 6999 fuel.reg !        
  clear.rooms(                          
  cycle( adventure @ 1- 2* + @          
  cycle.ct !                            
  adventure @ 1- room.ct( + c@ irnd     
  1 + load.room                         
  begin square.count@ irnd dup          
   robot.square ! square.object         
   floor@ = until ( random start)       
 8 irnd  cw.point                       
 adventure @ 7 = if                     
   17 robot.square !                    
   e cw.point                           
   pie@ room.data( 45 + c! then         
   init.cw.graphics  ;                  

 ( start.game stop.game )               
$constant g.on$ "start mission"         
$constant g.off$ "end mission"          
$constant se$ "series"                  
$constant lm$ "last mission"            
: leave.game ( ---)                     
   1 g.on$ games$ games( set.item$      
   2 off games( item.enable             
   2 se$ games$ games( set.item$ ;      
 : start.game ( ---)                    
  1 g.off$ games$ games( set.item$      
   screen.off  init.game                
   setup.game.screen                    
   gm.bord.col@ border  chip#.          
   0 update.damage  0 update.range      
   0 add.points  0 count.cycle          
   0 update.fuel  clear.stacks          
   screen.on                            
   draw.gameboard                       
   prog.status @ series@ =              
   not if game.on@ prog.status ! then ; 
 : stop.game ( ---)                     
   prog.status @ series@ = not if       
     game.off@ prog.status ! then ;     




























  ( game)                               
: game ( ---)                           
                                        
  begin                                 
   do.events                            
   move.baddies                         
   game.status @ debug.on@ =            
   if ( show.debug ) then               
   execute.robot.instruction            
 ( 0 22 d-position .s)                  
  prog.status @ game.on@ = not until    
  update.stats stats.screen             
  leave.game ;                          
                                        
                                        
                                        
                                        
                                        





                                        


 ( init.chipwits)                       
: init.chipwits ( ---)                  
  lt.gray bkgnd screen.off              
  graph.mem.init 0 157 c! ( msg off)    
  black  m.bak1                         
  lt.blue m.bak2                        
  graph.load  off game.char? !          
  128 657 c! ( disable sft/comm)        
  game.off@ prog.status !               
  s4 white s-color                      
  s6 lt.red s-color                     
  s5 white s-color                      
  s3 green s-color                      
  s7 black s-color                      
  s8 black s-color                      
  i-joy     7 charbase                  
  read.last cw.num @ cw.load            
  adventure @ ad.m  load.stats          
  start.game                            
  stop.game  leave.game                 
  3 off workshop( item.enable           
  ( no save chipwit)                    
  7 off workshop( item.enable           
  ( no paste panel) ;                   


( stat.points too.bad endgame series)   
: stat.points                           
  28 23 d-position                      
  blue char.color ;                     
: too.bad ( ---↑cw dies)                
  turn.game.off@ prog.status !          
  stat.points  fuel.reg @ 1 <           
  if ." out of fuel"                    
  else ." damaged"  then ;              
: endgame ( ---↑game over normally)     
  prog.status @ series@ = not if        
  turn.game.off@ prog.status !          
  then stat.points                      
  ." game over"       ;                 
: series ( ---)                         
  start.game 0 last.mission !           
  game prog.status @ dup dup            
  workshop.on@ = swap                   
  turn.game.off@ = or swap              
  game.off@ = or not                    
  last.mission @ not and                
  if series@ prog.status !              
  ( menu stuff)                         
  1000 0 do do.events loop then ;       
                                        

 ( chipwits )                           
                                        
: chipwits ( ---)                       
  init.chipwits                         
  begin 1000 irnd drop                  
   prog.status @                        
    case game.off@ of do.events ;;      
         game.on@ of game ;;            
    turn.game.on@ of start.game ;;      
     ( series@ of series ;; )           
   turn.game.off@ of stop.game ;;       
    game.aborted@ of too.bad ;;         
    game.finished@ of endgame ;;        
     workshop.on@ of workshop ;;        
     workshop.off@ of  w.leave          
       game.on@ prog.status !           
       start.game                       
       stop.game ;;                     
    endcase                             
  again ;                               




 exit                                   

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( arm.pt()                              
                                        
: p, swap c, c, ;                       
                                        
create arm.pt(  ( rel xy of arm root)   
22 13 p,  ( nw)                         
11 14 p,  ( n)                          
0 13 p,  ( ne)                          
0 4  p,  ( e)                           
0 3  p,  ( se)                          
11 6  p,  ( s)                          
22 3  p,  ( sw)                         
23 5  p,  ( w)                          
                                        
: obj.  ( x/y/blockarray---)            
  3 2 block. ;                          
: op.   ( x/y/block---)                 
  2 3 block. ;                          
: arg.   ( x/y/block---)                
  2 2 block. ;                          
                                        
                                        
                                        
                                        
                                        
                        
 ( object array builder )               
 var char.pt                            
 58  constant start.obj                 
: obj(, ( color / obj# ---)             
  6 * start.obj + dup char.pt !         
  256 mod   >r   ( startchar)           
  c,   r@ c, r@ 1+ c, r@ 2+ c,          
  r@ 3 + c, r@ 4 + c, r> 5 + c, ;       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        






 ( obj.block(  )                        
                                        
 create obj.block(                      
   yellow 8 +  0 obj(,  ( pie)          
   green  8 +  1 obj(, ( coffee)        
   blue   8 +  2 obj(, ( disk)          
   blue   8 +  3 obj(, ( oil)           
   white  8 +  4 obj(, ( floor)         
   red    8 +  5 obj(, ( bomb)          
   red    8 +  6 obj(, ( bouncer1)      
   purple 8 +  9 obj(, ( creep1)        
   white  8 + 13 obj(, ( walltop)       
   11         15 obj(, ( door)          
   white  8 + 14 obj(, ( wallside)      












 ( bouncer.block(  creep.block(  )      
                                        
 create bouncer.block(                  
 red  8 +  6 obj(,  ( b1)               
 red  8 +  7 obj(,  ( b2)               
 red  8 +  8 obj(,  ( b3)               
                                        
                                        
 create creep.block(                    
 purple  8 +  9 obj(,  ( c1)            
 purple  8 + 10 obj(,  ( c2)            
 purple  8 + 11 obj(,  ( c3)            
 purple  8 + 12 obj(,  ( c4)            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        




 ( game.char ws.char)                   
 var game.char?  ( are game.chars on?)  
 96 8 * constant l@                     
 63488 58 8 * + constant s@             
 63488 96 8 * - constant b@             
 : switch ( --) swapout                 
 ( moves alternate chars into set)      
 s@ 1024 l@ cmove                       
 ( into buffer)                         
 b@ s@ l@ cmove                         
 ( alt into set)                        
 1024 b@ l@ cmove                       
 ( save out set) swapin ;               
                                        
 : game.char ( ---)                     
   game.char? @ not if switch           
     on game.char? ! then ;             
 : ws.char ( ---)                       
   game.char? @ if switch               
                                        
                                        
                                        
                                        
                                        
     off game.char? ! then ;            
                        
( cw.init  cw.point <<<<<<<)            
                                        
: cw.init  ( ---)  frame                
  253 53269 c! ;                        
                                        
  create p( 6 allot                     
: cw.point  ( cw rot 0-7 ---)           
  dup 7 * 128 +  ( rot/sprite addr)     
  dup p( 1+ c!                          
  2+ dup p( 3 + c!                      
  1+ dup p( 2 + c!                      
  1+ dup p(     c!                      
  1+ dup p( 4 + c!                      
  1+     p( 5 + c!                      
  frame p( 'screen 1018 + 6 cmove       
  robot.orientation ! ( store new)      
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( dummy program <<<<<<)                
 : p.stuff ( op/flow/arg/flow/ch#--)    
  current.instruction !                 
  + rot rot + swap !chip ;              
                                        
 : blank.panel ( ---)                   
   0 current.panel !                    
   chip.count@ 0 do                     
    socket@ right.f@ 0 0 i p.stuff      
   loop                                 
   go.marker@ right.f@ 0 0 0 p.stuff ;  
   blank.panel                          
   look.for@ right.f@                   
    creep@ down.f@ 1 p.stuff            
   feel.for@ down.f@                    
    pie@ right.f@ 2 p.stuff             
   move@ left.f@                        
    forward@ 0 3 p.stuff                
   sing@ right.f@                       
    num5@ 0 9 p.stuff                   
   wire@ down.f@                        
    0 0 10 p.stuff                      
   goto.go@ 0 0 0 18 p.stuff            
  forget p.stuff                        
                                        

( *** workshop data ****)               
var hot.chip                            
var ws.op.byte                          
var ws.arg.byte                         
var ws.true.flow                        
var ws.false.flow                       
var puller.com                          
var inserter.com                        
var garbage.com                         
var wire.selected ( 0=none 1=t 2=f)     
var new.cw    ( new cw loaded?)         
62 is none@   ( no chip token)          
9999 is no.chip@                        
                                        
var cursor.count                        
2 is cursor.rate@                       
                                        
                                        
                                        
                                        
                                        





( wire data)                            
 138 is single.wire@                    
 142 is true.wire@                      
 146 is false.wire@                     
 150 is blank.wire@                     
 : rect create 4 allot ;                
 rect ws.chip.rect                      
 rect ws.wire.rect                      
 rect up.ws   rect down.ws              
 rect left.ws  rect right.ws            
 rect panel.rect                        
                                        
: !rect ( xl/xr/yt/yb/rectad---)        
 ( stores 4 byte rectangle)             
 >r                                     
 r@  3 + c! r@ 2 + c!                   
 r@  1+ c!  r> c! ;                     
: @rect  ( rectaddr---xl/xr/yt/yb)      
  >r                                    
  r@ c@ r@ 1+ c@ r@ 2 + c@ r> 3 + c@ ;  
: @xy  ( rectadr ---xl/yt)              
  dup c@ swap 2 + c@ ;                  
1 25 4 24 panel.rect !rect              
                                        
                                        

 ( debug.screen <<<<<<)                 
                                        
 : debug.screen  ( ---)                 
  ( this toggles with game screen)      
 ;                                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        














( op.block( )                           
: #, 1 swap do i  roll c, -1 +loop  ;   
  create op.block(                      
( go)  vc@ 58 59 60 61 62 63 7 #,       
( loop) vc@ 64 65 66 67 68 69 7 #,      
( subp) vc@ 70 71 72 73 32 32 7 #,      
( bmr) vc@ 74 75 76 77 78 79 7 #,       
( wire) vc@ 80 81 82 83 84 85 7 #,      
( mov) mc@ 86 87 32 32 32 32 7 #,       
( pick) vc@ 88 89 90 91 92 93 7 #,      
( zap) vc@ 94 95 96 97 98 99 7 #,       
( sng) nc@ 100 101 32 32 32 32 7 #,     
( fl) oc@ 102 103 32 32 32 32 7 #,      
( lk) oc@ 104 105 32 32 32 32 7 #,      
( sm) oc@ 106 107 32 32 32 32 7 #,      
( f) vc@ 108 109 110 111 112 113 7 #,   
( ke) vc@ 114 115 116 117 32 32 7 #,    
( n=) nc@ 118 119 32 32 32 32 7 #,      
( n<) nc@ 118 122 32 32 32 32 7 #,      
( o=) oc@ 120 119 32 32 32 32 7 #,      
( m=) mc@ 121 119 32 32 32 32 7 #,      
                                        




( op.block( cont'd   arg.block( )       
                                        
( ↑n) nc@ 123 124 32 32 32 32 7 #,      
( ↑o) oc@ 123 126 32 32 32 32 7 #,      
( ↑m) mc@ 123 125 32 32 32 32 7 #,      
( dr) vc@ 127 128 32 32 32 32 7 #,      
( +) nc@ 32 32 129 130 32 32 7 #,       
( -) nc@ 32 32 131 132 32 32 7 #,       
( sk) med.gray 33 33 33 33 33 33 7 #,   
                                        
create arg.block(                       
                                        
( rt) mc@ 154 155 156 157 5 #,          
( lt) mc@ 158 159 160 161 5 #,          
( up) mc@ 162 163 164 165 5 #,          
( dn) mc@ 166 167 168 169 5 #,          
( pi) oc@ 170 171 172 173 5 #,          
( cf) oc@ 174 175 176 177 5 #,          
( ds) oc@ 178 179 180 181 5 #,          
( ol) oc@ 182 183 184 185 5 #,          
( fl) oc@ 186 187 188 189 5 #,          
( bm) oc@ 190 191 192 193 5 #,          
( bn) oc@ 194 195 196 197 5 #,          
( cr) oc@ 198 199 200 201 5 #,          
                                        
                        
 ( arg.block( cont'd)                   
                                        
( wl) oc@ 202 203 204 205 5 #,          
( dr) oc@ 206 207 208 209 5 #,          
                                        
( dr) nc@ 210 211 212 213 5 #,          
( fr) nc@ 214 215 216 217 5 #,          
( rr) nc@ 218 219 220 221 5 #,          
( ms) mc@ 222 223 224 225 5 #,          
( ns) nc@ 226 227 228 229 5 #,          
( os) oc@ 230 231 232 233 5 #,          
( me) mc@ 234 235 236 237 5 #,          
( ne) nc@ 234 235 236 237 5 #,          
( oe) oc@ 234 235 236 237 5 #,          
                                        
( n0) nc@ 238 239 240 241 5 #,          
( n1) nc@ 238 239 242 243 5 #,          
( n2) nc@ 238 239 244 245 5 #,          
( n3) nc@ 238 239 246 247 5 #,          
( n4) nc@ 248 249 246 247 5 #,          
( n5) nc@ 250 251 246 247 5 #,          
( n6) nc@ 252 253 246 247 5 #,          
( n7) nc@ 254 255 246 247 5 #,          
                                        
                                        

( action.type( )                        
var this.act.type                       
100 is ts@  101 is ms@  102 is st@      
  ( thing-stack, move-st, stack)        
103 is t@   104 is te@  105 is m@       
  ( thing, thing-empty,  move)          
106 is me@  107 is n@   108 is ne@      
  ( move-empty,number,num-empty)        
109 is s@   110 is l@   111 is sb@      
  ( sing, letter,subpanel)              
112 is -@   ( no arg)                   
                                        
create action.type( action.count@ allot 
: at ( op/type--)                       
  swap action.type( + c! ;              
0 -@ at  1 -@  at  2 sb@ at  3 -@ at    
4 -@ at  5 ms@ at  6 -@ at   7 -@ at    
8 s@ at  9 ts@ at 10 ts@ at 11 ts@ at   
12 -@ at 13 l@ at 14 ne@ at 15 ne@ at   
16 te@ at 17 me@ at 18 n@ at 19 t@ at   
20 m@ at 21 st@ at 22 -@ at 23 -@ at    
24 -@ at                                
                                        
forget at                               


( ok.actions(  double.sized?)           
                                        
create ok.actions( action.count@ allot  
: action.ok?  ( token ---flag)          
  ok.actions( + c@ ;                    
                                        
: not.ok ( act.token--)                 
  ok.actions( + 0 swap c! ;             
                                        
: ok  ( tok---)                         
  ok.actions( + 1 swap c! ;             
                                        
: double.sized?  ( op token---flag)     
  dup action.type( + c@ -@ =            
  swap subpanel@ = or ;                 











( op.w.xy(  arg.w.xy(  <<<)             
                                        
create op.w.xy( action.count@ 4 * allot 
create arg.w.xy( thing.count@ 4 * allot 
                                        
: arfill ( xl/xr/yt/yb/tok/array---)    
  swap 4 * +  >r    r@ 3 + c!           
  r@ 2 + c!  r@ 1+ c! r> c! ;           
                                        
                                        
: af ( x/x/y/y/argtok---)               
  arg.w.xy( arfill ;                    
                                        
: blank.thing.rects ( ---)              
  arg.w.xy( thing.count@ 4 * 40 fill ;  
                                        
: op.w.draw ( optok) dup >r             
  4 * op.w.xy( + dup 2 +                
  c@ swap c@ swap  ( x/y)               
  r> 7 * op.block( + op. ;              
                                        
: pf ( x/x/y/y/optok---)                
  op.w.xy( arfill ;                     
                                        
                                        

 ( op work xy assignments <<<)          
                                        
27 28 5 6 look.for@ 29 30 5 6 feel.for@ 
31 32 5 6 smell.for@ 34 35 5 6 move@    
37 38 5 6 sing@ pf pf pf pf pf          
                                        
27 28 7 8 on.move@ 30 31 7 8 on.object@ 
33 34 7 7 on.number@ 37 38 7 8          
drop.stack@                             
33 34 8 8 number<@ pf pf pf pf pf       
27 28 9 10 move=@ 30 31 9 10 object=@   
33 34 9 10 number=@ 35 36 9 10 plus@    
37 38 9 10 minus@ pf pf pf pf pf        
                                        
27 28 11 13 subpanel@ 30 31 11 13 wire@ 
34 35 11 13 keypress@ 37 38 11 13 qray@ 
pf pf pf pf                             
27 28 14 16 goto.go@ 30 31 14 16        
boomerang@ 34 35 14 16 flip.coin@       
37 38 14 16 pick.up@ pf pf pf pf        
                                        
forget pf                               
                                        
                                        
                                        

( subp.wd.rect( <<<<<<)                 
                                        
create subp.ws.rect( 9 4 * allot        
                                        
: sf ( x/x/y/y/subindex---)             
( fills subpanel array)                 
 subp.ws.rect( arfill ;                 
                                        
 29 30 19 20 0 sf ( b)                  
 33 34 19 20 1 sf ( c)                  
 37 38 19 20 2 sf ( d)                  
 29 30 21 22 3 sf ( e)                  
 33 34 21 22 4 sf ( f)                  
 37 38 21 22 5 sf ( g)                  
 29 30 23 24 6 sf ( h)                  
 33 34 23 24 7 sf ( i)                  
 37 38 23 24 8 sf ( j)                  
                                        
 ( letter sits in upper left of)        
 ( 4 char sensitive square.)            
                                        
                                        
                                        
                                        
                                        

( t.fill ts.fill te.fill <<<)           
: t.fill ( ---)                         
  blank.thing.rects                     
  27 28 19 20 pie@ af                   
  29 30 19 20 coffee@ af                
  31 32 19 20 creep@ af                 
  33 34 19 20 bomb@ af                  
  35 36 19 20 bouncer@ af               
  27 28 22 23 oil@ af                   
  29 30 22 23 disk@ af                  
  31 32 22 23 wall@ af                  
  33 34 22 23 door@ af                  
  35 36 22 23 floor@ af ;               
                                        
: ts.fill ( ---)                        
  t.fill 37 38 20 21 obj.stack@ af ;    
                                        
: te.fill ( ---)                        
  t.fill 37 38 21 21 obj.empty@ af ;    







( m.fill ms.fill me.fill st.fill <<)    
                                        
: m.fill ( --)                          
  blank.thing.rects                     
  28 29 19 20 forward@ af               
  31 32 19 20 reverse@ af               
  28 29 22 23 turn.right@ af            
  31 32 22 23 turn.left@ af             
;                                       
                                        
: ms.fill ( ---)                        
 m.fill 36 37 20 21 mov.stack@ af ;     
                                        
: me.fill ( --)                         
 m.fill 36 37 20 21 mov.empty@ af ;     
                                        
: st.fill ( --)   blank.thing.rects     
 28 29 20 21 mov.stack@ af              
 32 33 20 21 num.stack@ af              
 36 37 20 21 obj.stack@ af ;            
                                        
                                        
                                        
                                        
                                        

( n.fill ne.fill s.fill <<<<<)          
                                        
: n.fill ( ---)                         
 blank.thing.rects                      
 27 28 19 20 num0@ af                   
 29 30 19 20 num1@ af                   
 31 32 19 20 num2@ af                   
 33 34 19 20 num3@ af                   
 36 37 19 20 damage.reg@ af             
 38 39 19 20 fuel.reg@ af               
 27 28 22 23 num4@ af                   
 29 30 22 23 num5@ af                   
 31 32 22 23 num6@ af                   
 33 34 22 23 num7@ af                   
 36 37 22 23 range.reg@ af ;            
                                        
: ne.fill ( --)                         
 n.fill 38 39 22 23 num.empty@ af ;     
                                        
: s.fill ( --)                          
 n.fill 38 39 22 23 num.stack@ af ;     
                                        
                                        
                                        
                                        

 ( cemit draw.action  draw.letter<<< )  
                                        
: cemit  ( x/y/color/screencode)        
  >r >r 40 * +                          
  r> over color-mem + c!                
  'screen + r> swap c! ;                
                                        
: draw.action ( tok/x/y--tok/x/y )      
  2dup  5 pick 7 * op.block( +          
  op. ;                                 
                                        
                                        
: draw.letter  ( x/y/asc---)            
  black char.color                      
  >r d-position r>                      
  dup 64 - 27 = if                      
   ." !" drop else emit then ;          
                                        
                                        
                                        
                                        
                                        


                                        

( draw.a.thing   o.d.)                  
                                        
: draw.a.thing  ( tok/x/y---tok/x/y)    
  3 pick dup dup                        
  double.sized? swap keypress@ = or     
  if dup subpanel@ =                    
    swap keypress@ = or                 
    if 2dup 2 + swap 1+ swap            
      get.arg.asc 6 pick                
      subpanel@ = if 1+ then            
      draw.letter then                  
  else   drop 2dup  1 +                 
    arg.byte c@ 64 mod 5 * arg.block( + 
    arg.                                
  then ;                                
                                        
: o.d.   ( x/y/arg---)                  
  ( object draw)                        
  5 * arg.block( + arg. ;               
                                        
                                        
                                        
                                        
                                        
                                        

( invert.chip<<<<<<< wire.xy)           
                                        
: invert.chip ( chip#---)               
 drop ;                                 
                                        
var wire.off ( char offset of flow)     
: wire.xy ( chip x/y--wire x/y)         
  flow.code @ dup 64 / wire.off !       
  case up.f@ of 1- swap 1+ swap ;;      
    down.f@ of 3 + ;;                   
    left.f@ of swap 1- swap ;;          
   right.f@ of 2 + swap 2 + swap ;;     
  endcase ;                             











                                        

( wire.it brancher? draw.wire<<<< )     
 var wire.type  ( t/false/single)       
                                        
: wire.it ( x/y--)                      
   ws.back.col@ wire.off @              
   wire.type @ + cemit ;                
                                        
: brancher? ( opcode---flag)            
  dup sing@ > swap on.number@ < and ;   
: draw.wire ( tok/x/y---)               
 single.wire@ wire.type !               
 3 pick dup dup goto.go@ = swap         
  boomerang@ = or swap                  
   socket@ = or not                     
 if  ( draw some wire)                  
   2dup wire.xy    ( tok/x/y/tx/ty)     
   5 roll brancher?                     
   if true.wire@ wire.type !            
     wire.it                            
     false.flow  2dup wire.xy           
     false.wire@ wire.type !            
     wire.it                            
   else wire.it then                    
else drop then  drop drop ;             


 ( chip.draw)                           
                                        
 : chip.draw  ( chip#--)                
   dup chips.wide@ mod 3 * 2+ ( x)      
   swap chips.wide@ / 4 * 4 + ( y)      
   get.action rot rot                   
   draw.action                          
   get.arg draw.a.thing                 
   draw.wire    ;                       

















 ( new.ws panel.draw )                  
                                        
: new.ws ( ---↑refresh workscreen)      
 first 2000 + 'screen 1000 cmove        
 first 3000 + color-mem 1000 cmove ;    
                                        
                                        
 : panel.draw  ( pan#---)               
   dup 0= if subpanel@ ok               
    boomerang@ not.ok                   
   else subpanel@ not.ok                
    boomerang@ ok then                  
   current.panel !                      
   new.ws                               
   chip.count@ 0 do                     
     i current.instruction !            
     i chip.draw                        
   loop                                 
   hot.chip @ current.instruction ! ;   
                                        
                                        
                                        
                                        
                                        
                                        





















































( setup.legal.args)                     
                                        
: setup.legal.args ( type---)           
  case                                  
   t@ of t.fill ;;                      
   te@ of te.fill ;;                    
   ts@ of ts.fill ;;                    
   m@ of m.fill ;;                      
   me@ of me.fill ;;                    
   ms@ of ms.fill ;;                    
   n@ of n.fill ;;                      
   ne@ of ne.fill ;;                    
   s@ of s.fill ;;                      
   st@ of st.fill ;;                    
  endcase ;                             































































( ws.action.icons)                      
                                        
: ws.action.icons ( ---)                
  ( draw boomerang or subp in white)    
 ( when not ok)                         
 ( use op.w.draw) ;                     
                                        
                                        
                                        
                                        
: ws.thing.icons ( type---)             
  26 18 39 24 lt.gray color.block       
  dup -@ = if drop blank.thing.rects    
  else                                  
   setup.legal.args                     
   thing.count@ 0 do                    
    arg.w.xy( i 4 * +                   
    dup c@ 40 = not                     
    if @xy  ( get x/y from rect)        
      i  o.d.                           
    else drop then                      
   loop                                 
  then ;                                
exit                                    
                                        
                        
 exit                                   

























( wire.ok?  erase.blank.w.. but.xy@)    
                                        
 : wire.ok? ( flow.code---flag)         
   current.instruction @ swap           
   case                                 
    up.f@ of chips.wide@ < not ;;       
  down.f@ of chip.count@                
       chips.wide@ - < ;;               
  left.f@ of chips.wide@ mod 0= not ;;  
 right.f@ of 1+ chips.wide@             
       mod 0= not ;;                    
endcase ;                               
: blip ( x/y---↑erase wire)             
  dk.gray char.color                    
  d-position ." !" ;                    
: erase.blank.wires ( ---)              
  ws.chip.rect @xy                      
  2dup swap  1+ swap  1 - blip ( up)    
  2dup             3 + blip  ( down)    
  2dup swap 1 - swap blip   ( left)     
  swap 2 + swap 2 +  blip ( rt)         
  ;                                     
                                        
                                        


( erase.ws.chip blank.ws.chip ws.name)  
                                        
: erase.ws.chip ( ---)  socket@         
  ws.chip.rect @xy                      
  draw.action drop drop drop ;          
                                        
: bl.wr ( flow.code ---)                
  ws.chip.rect @xy rot                  
  case                                  
    up.f@ of 1- swap 1+ swap 150 ;;     
  down.f@ of 3 +  151 ;;                
  left.f@ of swap 1- swap 152 ;;        
 right.f@ of 2 + swap 2 + swap 153 ;;   
  endcase  ws.back.col@ swap cemit ;    
                                        
 : blank.ws.chip ( ---)                 
  erase.ws.chip                         
  up.f@ wire.ok? if up.f@ bl.wr then    
down.f@ wire.ok? if down.f@ bl.wr then  
left.f@ wire.ok? if left.f@ bl.wr then  
right.f@ wire.ok? if right.f@ bl.wr then
 ;                                      
                                        
                                        
                                        

 ( update.ws.chip panel.hilight)        
 : update.ws.chip ( ---)                
  ws.op.byte c@                         
  dup dup boomerang@ = not              
  swap goto.go@ = not and               
  if blank.ws.chip                      
  else erase.blank.wires then           
  dup none@ = not  if ws.chip.rect      
   @xy draw.action 2drop then           
  ws.arg.byte c@                        
  none@ = not if ws.chip.rect @xy       
    draw.a.thing 2drop then             
  dup none@ = not if ws.chip.rect @xy   
    draw.wire                           
  else drop then ;                      
: panel.hilight ( ---)                  
  ( cw.name$ ) dk.gray char.color       
  0 2 d-position ." panel"              
  med.gray char.color                   
  75 65 do  ( a-j)                      
    current.panel @ i 65 - =            
    if dk.gray char.color then          
    i 65 - 2* 6 + 2 d-position          
    i emit med.gray char.color          
  loop ;                                

 ( garbage.panel,ws.chip update.ws.c..) 
                                        
 : garbage.panel.chip ( ---)            
   hot.chip @ current.instruction !     
   socket@ 0 !chip blank.ws.chip        
   update.ws.chip ;                     
                                        
 : garbage.ws.chip ( ---)               
   none@ ws.arg.byte c!                 
   0 ws.true.flow c! 0 ws.false.flow c! 
   none@ ws.op.byte c!                  
   0 wire.selected !                    
   0 this.act.type ! ;                  
                                        
 : update.ws.commands ( ---)            
 ( is chip ready to be inserted?)       
 0 inserter.com !                       
 ws.arg.byte c@ none@ = not             
   ( chip is finished)                  
 this.act.type @ -@ = or                
   ( unary chip finished)               
 if 1 inserter.com ! then ;             




( panel.chip>ws ws>panel.chip ws>arg)   
                                        
 : panel.chip>ws    ( ---)              
   @chip over socket@ = not if          
     dup dup arg.byte c! 64 mod         
     ws.arg.byte c! 192 and             
     ws.false.flow c!                   
     dup dup op.byte c! 64 mod          
     ws.op.byte c! 192 and              
     ws.true.flow c!                    
     ws.op.byte c@ action.type( +       
     c@ this.act.type !                 
   else 2drop garbage.ws.chip then ;    
                                        
 : ws>panel.chip   ( ---)               
   ws.true.flow c@ ws.op.byte c@ +      
   dup op.byte c!                       
   ws.false.flow c@ ws.arg.byte c@ +    
   dup arg.byte c!                      
   !chip ;                              
 : ws>arg,op  ( ---)                    
   ws.true.flow c@ dup flow.code c!     
   ws.op.byte c@ + op.byte c!           
   ws.false.flow c@ ws.arg.byte c@ +    
   arg.byte c! ;                        

( wire.prog legal.wire test.legal.wire) 
 var last.true var last.false           
 : wire.prog ( flow---new.flow)         
  case up.f@ of right.f@ ;;             
    right.f@ of down.f@ ;;              
     down.f@ of left.f@ ;;              
     left.f@ of up.f@ ;;                
  endcase ;                             
: legal.wire ( ---)                     
  begin last.true @ dup wire.ok?        
   not if wire.prog then dup            
   last.true ! wire.ok? until           
  last.true @ ws.true.flow c!           
  begin last.false @ dup dup            
   wire.ok? not swap last.true @ = or   
   if wire.prog then dup dup            
   last.false ! wire.ok? swap last.true 
  @ = not and until ( false = true)     
   last.false @ ws.false.flow c! ;      
 : test.legal.wire ( ---)               
   ws.op.byte c@ 64 mod dup dup         
   none@ = swap goto.go@ = or swap      
   boomerang@ = or last.true @          
   last.false @ = or                    
   if legal.wire then ;                 

( keypress,subpanel.thing.icons)        
                                        
 : keypress.thing.icons                 
  26 18 39 24 lt.gray color.block       
  65   ( a) black char.color            
  24 19 do ( vert loop)                 
   38 29 do  ( horiz)                   
   i j d-position dup emit 1+           
  loop 2 +loop drop ." !" ;            
                                        
 : subpanel.thing.icons ( ---)          
  black char.color                      
  26 18 39 24 lt.gray color.block       
   9 0 do                               
     subp.ws.rect( i 4 * +              
     @xy d-position                     
     66 i + emit                        
  loop  ;                               
                                        
                                        
                                        
                                        




( insert.it <<<<)                       
                                        
: insert.it ( ---)                      
  hot.chip @ current.instruction !      
  inserter.com @                        
  if ws>panel.chip                      
  zero.stats                            
  else garbage.ws.chip  then            
  erase.blank.wires                     
  hot.chip @ chip.draw                  
  update.ws.commands ;                  















( calc.blank.wires)                     
                                        
: calc.blank.wires  ( ---)              
   ws.chip.rect @rect                   
   drop swap drop  ( xl/yt)             
   up.f@ wire.ok?                       
   if over dup 2 + 3 pick 1- dup        
   else 40 40 40 40 then                
   up.ws !rect                          
   down.f@ wire.ok?                     
   if over 1- dup 2 + 3 pick 3 + dup    
   else 40 40 40 40 then                
   down.ws !rect                        
   left.f@ wire.ok?                     
   if over 1- dup 3 pick 1- dup 3 +     
   else 40 40 40 40 then                
   left.ws !rect                        
   right.f@ wire.ok?                    
   if over 2 + dup 3 pick dup 3 +       
   else 40 40 40 40 then                
   right.ws !rect                       
   2drop ;                              




( pull.it )                             
                                        
: pull.it ( ---)                        
   hot.chip @ current.instruction !     
   panel.chip>ws                        
   update.ws.commands                   
   calc.blank.wires                     
   ws>arg,op                            
   update.ws.chip                       
   ws.op.byte c@ subpanel@ =            
   if subpanel.thing.icons              
   else ws.op.byte c@ keypress@ =       
    if  keypress.thing.icons            
    else ws.op.byte c@                  
     dup none@ =  ( no legal args)      
     if drop -@ else action.type( + c@  
     then ws.thing.icons                
   then then ;                          








 ( match.wire? select.wire)             
                                        
 : match.wire? ( flow.code----code)     
 ( 0=none,true=1,false=2)               
 dup ws.true.flow c@ =                  
 if drop 1 else                         
   ws.op.byte c@ brancher?              
     ( no false on non-branchers)       
   if ws.false.flow c@ =                
     if 2 else 0 then                   
   else drop 0                          
   then                                 
 then ;                                 
 : select.wire ( flow.code---)          
 match.wire? dup                        
 if wire.selected ! ws.back.col@        
  single.wire@ wire.type !              
  white ' ws.back.col@  !               
  ws.op.byte c@ brancher?               
  if wire.selected @                    
   1 = if true.wire@ wire.type !        
    else false.wire@ wire.type ! then   
  then ws.chip.rect @xy wire.xy wire.it 
  ' ws.back.col@ !                      
 else drop then ;                       

( move.wire?)                           
                                        
: move.wire? ( flow.code---) dup        
  match.wire? dup 0>   ( wire there)    
  if wire.selected @ = not ( same)      
   if ws.false.flow c@ ws.true.flow c@  
    ws.false.flow c! ws.true.flow c!    
      ( swap em)                        
    0 wire.selected ! ws>arg,op drop    
    blank.ws.chip update.ws.chip        
   else drop then  ( same one)          
  else drop ( no wire there)            
   wire.selected @ 1 =                  
   if ws.true.flow c!                   
   else ws.false.flow c! then           
   0 wire.selected !                    
   ws>arg,op blank.ws.chip              
   update.ws.chip                       
  then                                  
  ws.true.flow c@ last.true !           
  ws.false.flow c@ last.false ! ;       





exit                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( cursor.chip new.chip.hot)            
                                        
 : cursor.chip ( chip#---)              
   s2 on s-enable                       
   dup 8 mod 24 * 36 +  ( x)            
   swap 8 / 32 * 78 +   ( y)            
   2dup frame s-position                
   46 - 8 /             ( ytab )        
   swap 20 - 8 / swap   ( xtab)         
   2dup over 1+ swap dup 2+             
   ws.chip.rect !rect                   
   swap 1 - swap 1 - over 3 + swap      
   dup 4 + ws.wire.rect !rect ;         
                                        
 : new.chip.hot ( chip#---)             
   dup 0= not                           
   if dup hot.chip !                    
      dup current.instruction !         
      cursor.chip                       
      get.action drop pull.it           
   else drop then ;                     





( point>chip   drag.chip)               
                                        
: point>chip ( x/y---chip#)             
  78 - 32 / chips.wide@ * 0 max 32 min  
  swap 36 - 24 / 0 max 7 min +          
  ;                                     
var drag.chip↑                          
: drag.chip  ( ---)                     
  panel.rect @rect but.xy@              
  pt.in.rect                            
  if s2 on s-enable ( in case off)      
    but.xy@ point>chip dup 0= not       
    if dup drag.chip↑ @ = not           
      if ( boop) then                   
      dup drag.chip↑ !   cursor.chip    
      s2 black frame s-color 1 wait     
      white frame s-color               
    else drop none@ drag.chip↑ !        
   (  hot.chip @ cursor.chip ) then     
  else none@ drag.chip↑ !               
    s2 off s-enable then                
  ( dragged off panel)                  
  0 24 d-position ." drag.chip "        
  drag.chip↑ ? ;                        
                                        

 ( panel.handler)                       
: panel.handler ( ---) ( sound)         
  but.xy@ point>chip                    
  dup 0= not if insert.it then          
  new.chip.hot none@ drag.chip↑ !       
  button.down @ if                      
    erase.blank.wires                   
    begin button.down @                 
    while drag.chip repeat then         
  drag.chip↑ @ none@ = not              
  if garbage.panel.chip erase.ws.chip   
    hot.chip @ chip.draw                
    drag.chip↑ @ dup hot.chip !         
    dup current.instruction !           
    ws.true.flow c@ last.true !         
    ws.false.flow c@ last.false !       
    legal.wire cursor.chip              
    calc.blank.wires insert.it          
    update.ws.chip hot.chip @ chip.draw 
 else panel.rect  @rect but.xy@         
    pt.in.rect not  ( drag off panel?)  
    if ( garbage.ws.chip                
      garbage.panel.chip erase.ws.chip  
      erase.blank.wires ) then          
 then update.ws.commands ;              

( ws.wire.handler)                      
 : ws.wire.handler ( ---)               
   ws.chip.rect @rect but.xy@           
   pt.in.rect                           
   if panel.handler                     
    else ws.op.byte c@ dup dup goto.go@ 
     = not swap boomerang@ = not and    
     swap none@ = not and               
     if flow.code @ >r  ( save it)      
     4 0 do                             
       i 64 * dup flow.code ! wire.ok?  
       if  flow.code @                  
        case up.f@ of up.ws ;;          
          down.f@ of down.ws ;;         
          left.f@ of left.ws ;;         
         right.f@ of right.ws ;;        
        endcase  ( wire rect)           
        @rect but.xy@ pt.in.rect        
        if wire.selected @              
         if flow.code @ move.wire?      
         else flow.code @ select.wire   
         then leave                     
       then then                        
     loop r> flow.code !                
   then then ;                          
exit                    
 ( panel.select.handler)                
                                        
 : panel.select.handler ( ---)          
                                        
   button.x @  24 - ( screen coords)    
   44 - 16 /   ( panel #)               
   0 max 9 min  ( legal range)          
   inserter.com @ if                    
    ws>panel.chip then                  
     ( insert finished chip)            
   dup current.panel ! ( new panel)     
                                        
   panel.draw   panel.hilight           
   ws.action.icons ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

( action.handler)                       
                                        
: action.handler ( ---)                 
  action.count@ goto.go@ do             
   i action.ok?                         
   if op.w.xy( i 4 * + @rect            
    but.xy@ pt.in.rect                  
    if ( sound)                         
     legal.wire                         
     i ws.op.byte c!                    
     none@ ws.arg.byte c!               
     i action.type( + c@ dup            
     this.act.type !                    
     ws>arg,op update.ws.chip           
     update.ws.commands                 
     dup                                
     ts@ s@ within                      
     if ws.thing.icons                  
     else dup case                      
   sb@ of drop subpanel.thing.icons  ;; 
   l@ of drop keypress.thing.icons  ;;  
   -@ of ws.thing.icons ;;              
     endcase then                       
   then then                            
 loop ;                                 
exit                    
( subp.handler,key.handler)             
                                        
: subp.handler ( ---)                   
 9 0 do                                 
  subp.ws.rect( i 4 * + @rect           
  but.xy@ pt.in.rect                    
  if i 1 + ws.arg.byte c!               
    ( thing.sound)                      
    ws>arg,op update.ws.chip            
    update.ws.commands  leave           
  then loop ;                           
                                        
 : key.handler ( ---)                   
   but.xy@  50 -  20 8 * - 8 /          
   0 max 2 min  ( row) 9 *              
   swap 24 - 29 8 * - 8 /               
   0 max 8 min  ( col) + 1 +            
   ( letter 1=a 27=none)                
   ws.arg.byte c!                       
   ws>arg,op update.ws.chip             
   update.ws.commands ;                 
                                        
                                        
                                        
                                        
exit                    
( thing.handler)                        
                                        
: thing.handler ( ---)                  
  ws.op.byte c@ subpanel@ =             
  if  subp.handler                      
  else ws.op.byte c@ keypress@ =        
   if  key.handler                      
   else thing.count@ 0 do               
    arg.w.xy( i 4 * + @rect but.xy@     
    pt.in.rect if                       
      ( sound)                          
     i ws.arg.byte c!                   
     ws>arg,op                          
     update.ws.chip                     
     update.ws.commands leave           
    then                                
   loop then                            
  then ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        

( ws.mouser)                            
: ws.mouser  ( ---)                     
26 39 4 17 but.xy@ pt.in.rect           
if action.handler                       
 else 5 25 2 2 but.xy@ pt.in.rect       
 if panel.select.handler                
  hot.chip @ new.chip.hot               
  ws>arg,op update.ws.chip              
  else ws.wire.rect @rect but.xy@       
  pt.in.rect if ws.wire.handler         
  else 26 39 19 24 but.xy@ pt.in.rect   
   if thing.handler                     
   else 0 25 5 24 but.xy@ pt.in.rect    
    if panel.handler                    
    then                                
   then                                 
  then                                  
 then                                   
then                                    
 ;                                      
                                        
                                        
                                        
                                        
                                        
exit                    
 ( setup.work.screen init.ws)           
                                        
: setup.work.screen ( ---)              
  ws.char                               
  new.ws                                
  0 multi-color                         
  ws.bord.col@ border                   
  bak.c bkgnd                           
  action.count@ 1- 0 do i ok loop       
  boomerang@ not.ok ;                   
                                        
                                        
: init.ws ( ---)                        
  39 hot.chip !   garbage.ws.chip       
  1 new.cw !                            
  0 current.instruction !               
  0 current.panel !                     
  0 puller.com !                        
  0 inserter.com !                      
  0 garbage.com !                       
  39 new.chip.hot                       
  ;                                     
                                        
                                        
                                        

 ( w.enter w.leave )                    
 $constant w.on$ "enter"                
 $constant w.off$ "exit"                
: w.enter ( ---)                        
  screen.off black bkgnd black border   
  sprites.off                           
  s2 white s-color  off s-multi         
  3 on workshop( item.enable ( savecw)  
12 4 do i off games( item.enable loop   
  copy.buff.full @ not                  
  if 7 off workshop( item.enable then   
 1 w.off$ workshop$ workshop( set.item$ 
  186 s-pointer on s-yexp on s-xexp     
  setup.work.screen                     
  right.f@ last.true !                  
  down.f@ last.false !                  
  1 new.cw ! ws.action.icons            
  panel.hilight ws.bord.col@ border     
  screen.on  ;                          
 : w.leave ( ---)                       
   hot.chip @ no.chip@ = not            
   if insert.it then                    
  1 w.on$ workshop$ workshop( set.item$ 
  3 off workshop( item.enable           
12 4 do i on games( item.enable loop ;  

 ( **** workshop ****)                  
                                        
: workshop  ( ---)  w.enter             
  begin  do.events                      
   button.down @ if ws.mouser then      
  new.cw @                              
  if init.ws                            
    current.panel @ panel.draw          
    ( ws.action.icons )                 
    panel.hilight                       
    0 new.cw !  then                    
    prog.status @ workshop.on@ =        
                                        
  not until                             
  screen.off                            
  w.leave   ;                           
                                        
                                        








( draw.rnd.crp to.cw)                   
                                        
: draw.rnd.crp ( sq#---)                
  square.xtyt creep.block(              
  4 irnd 7 * + 3 2 block.               
  ( creep.sound) ;                      
                                        
                                        
: to.cw  ( sq#---nextsq#) dup           
  dup squares.wide@ / ( row)            
  swap squares.wide@ mod ( col)         
  robot.square @ squares.wide@ mod      
  < if 1 else -1 then                   
  2 irnd 0= if drop 0 then              
  swap robot.square @ squares.wide@ /   
  2dup =   ( same row)                  
  if 2drop 0                            
  else < if squares.wide@               
   else squares.wide@ negate then       
  then 2 irnd 0= if drop 0 then         
  + + ;                                 
                                        
                                        
                                        
                                        

( ?zap.cw  creep.move)                  
                                        
 : ?zap.cw  ( sq#---flag)               
  robot.square @ = not dup not          
   ( cw is there, zap it)               
  if 6 flash.cw -200 update.fuel then ; 
                                        
                                        
 : creep.move ( creep#/sq#---)          
  3 irnd 1 = if  ( 33% try to move)     
    dup to.cw ( cr#/sq#/nextsq#)        
 dup dup dup square.object              
 floor@ = swap ?zap.cw and              
 swap robot.square @ squares.wide@      
 - = not and                            
  if dup 4 roll creeps( + c! ( sq#/nx#) 
   swap destroy  ( nextsq#)             
   dup room.data( + creep@ swap c!      
       ( store creep in room)           
                                        
  else drop swap drop then ( sq#)       
 else swap drop                         
 then draw.rnd.crp ;                    
                                        
                                        

 ( spin.bouncer <<<<)                   
                                        
 : spin.bouncer ( state---)             
   drop ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( move.baddies)                         
                                        
 : move.baddies ( ---)                  
   12 irnd dup creeps( + c@             
   55 min  ( no garbage #'s)            
         ( creep#/creep sq#)            
   dup square.object creep@ =           
     ( creep is still there)            
   if creep.move                        
   else 2drop                           
   then                                 
   bouncers @                           
   if                                   
     bouncer.state @ spin.bouncer then ;






































( rec.last read.last)                   
                                        
: rec.last ( ---)                       
  0 savename c!                         
  savename " @:tmp" $concat             
  adventure adventure 3 + save          
  " s0:ad" dos                          
  " r0:ad=tmp" dos ;                    
                                        
                                        
: read.last  ( ---)                     
 adventure " ad" loadram ;              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( bye.bye    option.menu)              
                                        
 : bye.bye ( --)                        
   ;                                    
                                        
                                        
                                        
 : option.menu ( ---)                   
   this.item @                          
   case                                 
     1 of ( debug on)  ;;               
     2 of bye.bye ;;                    
   endcase ;                            













( clear.panel copy.panel paste.panel)   
create copy.buff( chip.count@ 2 * allot 
: clear.panel ( ---) chip.count@ 1      
  do i current.instruction !            
     socket@ 0 !chip loop               
  1 current.instruction !               
  current.panel @ panel.draw            
  ( zero.stats)                         
  garbage.ws.chip update.ws.commands ;  
: copy.panel ( ---)                     
  robot.program current.panel @         
  chip.count@ 2 * * + copy.buff(        
  chip.count@ 2 * cmove                 
  7 on workshop( item.enable            
  1 copy.buff.full ! ;                  
: paste.panel ( ---) copy.buff(         
  robot.program current.panel @         
  chip.count@ 2 * * + dup >r            
  chip.count@ 2 * cmove                 
  current.panel @ dup 0= if boomerang@  
  else subpanel@ then                   
  r> dup chip.count@ 2 * + swap do      
   i c@ 64 mod over = if socket@ i c!   
   then 2 +loop drop                    
  panel.draw ( zero.stats) ;            

( ws.menu)                              
                                        
                                        
: ws.menu  ( ---)                       
  this.item @                           
  case                                  
     1 of prog.status @ workshop.on@ =  
         if workshop.off@               
         else workshop.on@ then         
         prog.status ! ;;               
     3 of hot.chip @ no.chip@ =         
       not if insert.it then            
       cw.num @ cw.save                 
     ( edit.name set.menu.names)        
       1 new.cw ! ;;                    
     5 of copy.panel clear.panel ;;     
     6 of copy.panel ;;                 
     7 of paste.panel ;;                
     8 of clear.panel ;;                
   endcase ;                            






( wh.menu)                              
: wh.menu  sprites.off                  
  this.item @ dup cw.load               
  cw.num !                              
  prog.status @ workshop.on@ =          
  if 1 new.cw !                         
  else turn.game.off@ prog.status !     
  then   ( set.cw.menu.names )          
    rec.last  ;                         
 create ad.col( lt.blue c, green c,     
  dk.gray c,  blue c,  brown c,         
  red c,  med.gray c, lt.red c,         
 : ad.m ( ad#---) sprites.off           
   dup 1- ad.col( + c@ m.bak2           
   dup adventure ! ( for now)           
   prog.status @ game.on@ =             
   if turn.game.off@ prog.status !      
then first swap case  1 of " a1" ;;     
   2 of " a2" ;; 3 of " a3" ;;          
   4 of " a4" ;; 5 of " a5" ;;          
   6 of " a6" ;; 7 of " a7" ;;          
   8 of " a8" ;; endcase loadram        
   swapout first 53248 4096 cmove       
   swapin  rec.last                     
   first " cw.scr" loadram ;            

( adventure.menu)                       
: adventure.menu                        
  this.item @  dup                      
  case                                  
   1 of drop prog.status @              
     case                               
      workshop.on@ of                   
       turn.game.on@ prog.status ! ;;   
      series@ of                        
       turn.game.off@ prog.status ! ;;  
      game.on@ of                       
       turn.game.off@ prog.status ! ;;  
      game.off@ of                      
       turn.game.on@ prog.status ! ;;   
    endcase ;;                          
  2 of drop prog.status @               
    case series@ of game.on@            
         prog.status ! 1 last.mission ! 
         ( menu stuff <<<) ;;           
        0 last.mission !                
       ( menu stuff<<<)                 
       series@ prog.status !            
   endcase ;;                           
  3 - ad.m                              
endcase ;                               

( do.events)                            
                                        
 : do.events ( ---)                     
   do.menu.events                       
   if this.menu @                       
     case                               
       1 of wh.menu ;;                  
       2 of ws.menu ;;                  
       3 of adventure.menu ;;           
       4 of option.menu ;;              
     endcase                            
   then                                 
   ;                                    













( stack & reg stuff)                    
                                        
                                        
                                        
256 is stack.len@                       
                                        
create mov.st( 256 allot                
create num.st( 256 allot                
create obj.st( 256 allot                
                                        
var mov.st↑                             
var num.st↑                             
var obj.st↑                             













( check.mov,obj,num.st)                 
                                        
: check.mov.st ( arg---arg)             
 ( if arg is move stack return move)    
 dup mov.stack@ = if drop               
   mov.st( mov.st↑ @ + c@ then ;        
                                        
: check.obj.st ( arg--arg)              
 dup obj.stack@ = if drop               
   obj.st( obj.st↑ @ + c@ then ;        
                                        
: check.num.st ( arg--arg)              
 dup case                               
  num.stack@ of drop                    
     num.st( num.st↑ @ + c@ ;;          
  damage.reg@ of drop damage.reg @      
     200 / num0@ + ;;                   
  fuel.reg@ of drop fuel.reg @          
    1000 / 1+ num0@ + ;;                
  range.reg@ of drop range.reg @        
    num0@ + ;;                          
 ( else it's a number)                  
endcase ;                               



 ( update.fuel,damage)                  
                                        
 : num.plop  ( number/x/y---)           
  ( draws number beaker)  rot           
  num0@ + 5 * ( index into arg.block( ) 
  arg.block( + arg. ;                   
                                        
 : update.fuel ( fuel pts---)           
 fuel.reg @ + 6999 min dup fuel.reg !   
 dup 1 < if game.aborted@ prog.status ! 
            drop 0                      
         else 1000 / 1+ then            
 32 9  num.plop ;                       
                                        
 : update.damage ( damage.pts---)       
   damage.reg @ + dup damage.reg !      
   dup 1399 >                           
   if game.aborted@ prog.status !       
      drop 7                            
   else 200 / then                      
   28 9  num.plop ;                     


                                        


( update.range st.squash)               
                                        
: update.range ( range ---)             
 dup range.reg !                        
 36 9  num.plop ;                       
                                        
                                        
: st.squash ( stack addr---)            
 ( pushes down full stack)              
 ( bottom item is lost)                 
 dup 1+ swap stack.len@ 1- cmove ;      















( erase.stack draw.mov.st on.mov.st)    
                                        
: erase.stack ( x/y---x/y) 2dup         
 over 1+ over 5 + dk.gray color.block ; 
                                        
: draw.mov.st ( ---)                    
  36 17 erase.stack                     
  mov.st↑ @ 2- 0 max mov.st↑ @ do       
   2dup mov.st( i + c@ o.d.             
 ( get mov from stack & draw)           
   2 +                                  
  -1 +loop 2drop ;                      
                                        
  : on.mov.st ( mov.tok---)             
    mov.st↑ @ stack.len@ =              
    if mov.st( st.squash                
 ( if max size squash)                  
    else 1 mov.st↑ +! then              
 ( inc stack top pointer)               
    mov.st↑ @ mov.st( + c!              
 ( store new item)                      
    draw.mov.st ;                       
                                        
                                        
                                        

( draw.obj.st on.obj.st)                
                                        
: draw.obj.st ( ---)                    
  32 17 erase.stack                     
  obj.st↑ @ 2- 0 max obj.st↑ @ do       
   2dup obj.st( i + c@ o.d.             
 ( get obj from stack & draw)           
   2 +                                  
  -1 +loop 2drop ;                      
                                        
  : on.obj.st ( mov.tok---)             
    obj.st↑ @ stack.len@ =              
    if obj.st( st.squash                
 ( if max size squash)                  
    else 1 obj.st↑ +! then              
 ( inc stack top pointer)               
    obj.st↑ @ obj.st( + c!              
 ( store new item)                      
    draw.obj.st ;                       
                                        
                                        
                                        
                                        
                                        
                                        

( draw.num.st on.num.st)                
                                        
: draw.num.st ( ---)                    
  28 17 erase.stack                     
  num.st↑ @ 2- 0 max num.st↑ @ do       
   2dup num.st( i + c@ o.d.             
 ( get num from stack & draw)           
   2 +                                  
  -1 +loop 2drop ;                      
                                        
  : on.num.st ( mov.tok---)             
    num.st↑ @ stack.len@ =              
    if num.st( st.squash                
 ( if max size squash)                  
    else 1 num.st↑ +! then              
 ( inc stack top pointer)               
    num.st↑ @ num.st( + c!              
 ( store new item)                      
    draw.num.st ;                       
                                        
                                        
                                        
                                        
                                        
                                        

( num= num< obj= mov= clear.stacks)     
                                        
: num= ( arg---↑ is arg= stack top?)    
  check.num.st ( for register args)     
  num.st( num.st↑ @ + c@ =              
  not if false.flow then ;              
: num< ( arg---)                        
  check.num.st                          
  num.st( num.st↑ @ + c@ >              
  not if false.flow then ;              
: obj= ( arg---)                        
  obj.st( obj.st↑ @ + c@ =              
  not if false.flow then ;              
: mov= ( arg---)                        
  mov.st( mov.st↑ @ + c@ =              
  not if false.flow then ;              
: clear.stacks ( ---)                   
  mov.st( stack.len@ erase 0 mov.st↑ !  
  obj.st( stack.len@ erase 0 obj.st↑ !  
  num.st( stack.len@ erase 0 num.st↑ !  
  mov.empty@ mov.st( c!                 
  obj.empty@ obj.st( c!                 
  num.empty@ num.st( c!                 
  draw.mov.st draw.obj.st draw.num.st ; 


 ( drop.stack plus minus)               
                                        
 : drop.stack ( arg---)                 
  case                                  
   mov.stack@ of mov.st↑ @ 1- 0 max     
      mov.st↑ ! draw.mov.st ;;          
   obj.stack@ of obj.st↑ @ 1- 0 max     
      obj.st↑ ! draw.obj.st ;;          
   num.stack@ of num.st↑ @ 1- 0 max     
      num.st↑ ! draw.num.st ;;          
  endcase ;                             
                                        
: plus ( ---↑ inc number stack)         
  num.st( num.st↑ @ + dup c@            
  dup num.empty@ = not                  
  if num0@ - 1+ 8 mod num0@ + swap c!   
    draw.num.st                         
  else 2drop then ;                     
                                        
: minus ( ---)                          
  num.st( num.st↑ @ + dup c@            
  dup num.empty@ = not                  
  if num0@ - 1- 8 +mod num0@ + swap c!  
  draw.num.st else 2drop then ;         
                                        

( stacker <<<<<<<<)                     
                                        
: stacker ( opcode ---)                 
  arg.byte c@ 64 mod swap               
  case                                  
    number=@ of num= ;;                 
    number<@ of num< ;;                 
    object=@ of obj= ;;                 
    move=@ of mov= ;;                   
    on.number@ of on.num.st ;;          
    on.object@ of on.obj.st ;;          
    on.move@ of on.mov.st ;;            
    drop.stack@ of drop.stack ;;        
    plus@ of drop plus ;;               
    minus@ of drop minus ;;             
  endcase ;                             
                                        













































































































































































































































































