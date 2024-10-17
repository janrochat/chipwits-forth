 ( chipwits left to do)                 
                                        
 see effect                             
 blue menu items                        
 title loader                           
 series                                 
*mystery matrix                         
*bouncer animation                      
*endgame message                        
 speed menu pulldown                    
 bomb                                   
                                        
*garbage chip redran at edge            
 play note in ws                        
-alpha only key check                   
-crunch lower, eat higher longer        
-fastload                               
 return = ok in naming                  
*off eddit options out of ws            
                                        
                                        
                                        
                                        
                                        
                                        

( chipwit game loader)                  
                                        
( forget it : it ; ) forth              
172 182  thru  ( data & common routines)
255 255 thru ( disk?)                   
183 195 thru                            
246 254 thru ( char routines)           
256 265 thru ( ibol graphics)           
330 338 thru ( stat  names)             
266 275 thru  ( debug)                  
320 329 thru  ( stack,reg stuff)        
276 290 thru  ( workshop)               
" s0:cwlo" dos save-forth "cwlo"        
exit  339 load ( hi)                    
313 319 thru ( menus)                   
311 312 thru ( zap, see sprites)        
291 307 thru  ( w2)                     
" s0:cwwrk" dos save-forth "cwwrk"      
196 241 thru ( game)                    
308 310 thru  ( bads)                   
242 load  ( game)                       
( 251 256 thru ( choose cw)             
243 245 thru   ( cw master word)        
( 255 load  ( dummy prog)               
" s0:game" dos save-forth "game"        

( robot vars and consts 11/4/84)        
: var variable ; : is constant ;        
( var robot.square)                     
( var robot.orientation)                
                                        
40  is chip.count@                      
10 chip.count@ 2 * * is prog.size@      
create robot.program                    
  prog.size@ allot                      
                                        
                                        
var current.instruction ( 0-39)         
var current.panel   ( 0-9)              
var k   ( key pressed)                  
var fuel.reg   ( 0-1400)                
var range.reg  ( 0-8)                   
var damage.reg  ( 0-1400)               
var cb+                                 
 ( is copy buffer full?)                


                                        
                                        

                                        

( operator consts, cycles 11/4/84)      
( 1 is goto's )                         
0 is go.marker@ 1 is goto.go@           
2 is subpanel@  3 is boomerang@         
4 is wire@                              
( 2 is act's )                          
5 is move@  6 is pick.up@               
7 is qray@  8 is sing@                  
( 3 is det's )                          
9 is feel.for@ 10 is look.for@          
11 is smell@                            
( 4 is spec's)                          
12 is coin@  13 is key@                 
( 5 is stack's   6 is socket's)         
14 is n=@  15 is n<@                    
16 is o=@  17 is m=@                    
18 is on.n@ 19 is on.o@                 
20 is on.m@  21 is st-@                 
22 is plus@     23 is minus@            
24 is socket@  25 is act#@              
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
                                        
23 is num0@ ( 24 is num1@ 25 is num2@   
26 is num3@ 27 is num4@ 28 is num5@     
29 is num6@ 30 is num7@ )               
                                        
31 is th#@                              
                                        
                                        

( gameboard data)                       
                                        
8 is squares.wide@                      
8 is squares.high@                      
squares.wide@ squares.high@ *           
  is square.count@                      
square.count@ 16 + is room.size@        
                                        
( create room.data( room.size@ allot)   
                                        
53248 is sc(                            
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
dv  points                              
var cycle.ct   ( time countdown)        
                                        
                                        
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
gl%     is ac@ ( act icon bkgnd)        
dg%     is  tc@ ( thing icon bkgnd)     
dg%     is ws.back.col@                 
bl%  is ws.bord.col@                    
bl%  is gm.bord.col@                    
 b%    is nc@ ( number)                 
 bl%  is oc@  ( obj)                    
 r%   is  mc@  ( mov@)                  
 b%    is vc@   ( various)              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
gl%     is bak.c  ( back color)         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
exit                    
 ( menu item strings  )                 
$c g.on$ " start mission"               
$c g.off$ " end mission"                
$c se$ " series"                        
$c lm$ " last mission"                  



















                                        

( adventure names)                      
                                        
17 8 * $v adv$(                         
0 adv$( c!                              
adv$( " ↑↑ greedville ↑↑↑" $+           
adv$( " ↑ chipwit caves ↑" $+           
adv$( " ↑↑ doom rooms ↑↑↑" $+           
adv$( " ↑↑ peace paths ↑↑" $+           
adv$( " ↑ memory lanes ↑↑" $+           
adv$( "  octopus garden ↑" $+           
adv$( "  mystery matrix ↑" $+           
adv$( " ↑↑↑ boomtown ↑↑↑↑" $+           
                                        
create cycle(                           
 6000 ,  10000 ,  10000 ,  16000 ,      
20000 ,  20000 ,  20000 ,  12000 ,      
                                        
                                        
create trip.count(                      
 0 c,  6 c,  0 c, 20 c,                 
 9 c, 32 c,  8 c,  3 c,                 
                                        
8 is ad#                                
                                        
                                        

( scenario.play( room.ct( )             
: d, 10 * c, ;                          
create scenario.play(                   
( crp.ct) 00 c, 08 c, 08 c, 04 c,       
          03 c, 03 c, 03 c, 03 c,       
( crp.pt) 00 d, 05 d, 10 d, 03 d,       
          03 d, 01 d, 02 d, 04 d,       
( bnc.ct) 00 c, 00 c, 02 c, 00 c,       
          02 c, 02 c, 02 c, 00 c,       
( bnc.pt) 00 d, 00 d, 25 d, 06 d,       
          06 d, 02 d, 04 d, 00 d,       
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
50 c, 1 c, 1 c, 48 c, 9 c,              

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
    53265 c@ 24 or 53265 c!  ;          
  : screen.off ( ---)                   
    53265 c@ 239 and  53265 c!  ;       
                                        
 : sprites.off ( ---)                   
  1 53269 c! ;                          
                                        
                                        
                                        

( cw.load cw.save back.wipe )           
: sv0 ( ---↑savename clear)             
  0 savename c!  ;                      
: dsk ( ---↑disk access setup)          
 sv.sp 0 53269 c! disk? ;               
                                        
: cw$      ( #---)                      
  2 savename c!  ( length)              
  67 savename 1 + c! ( c)               
  64 + savename 2 + c! ( #code) ;       
: cw.load  ( cw#--)  dsk                
  cw$ robot.program savename lr r.sp ;  
: cw.save ( cw#---) dsk                 
  sv0 ( " s0:tmp1" dos)                 
  savename " 0:tmp1" $+                 
  robot.program dup prog.size@ + save   
( ." 0:tmp1" ) sv0                      
  savename " s0:c " $+                  
  dup 64 + savename 5 + c!              
  savename dos ( savename count type)   
  sv0                                   
  savename " r0:c =tmp1" $+             
  64 + savename 5 + c!                  
  savename dos ( savename count type)   
  ;                                     

( rec.last read.last)                   
: rec.last ( --) dsk                    
( " s0:tmp2" dos )                      
  sv0                                   
  savename " 0:tmp2" $+                 
  adventure adventure 4 + save          
  " s0:ad" dos                          
  " r0:ad=tmp2" dos ;                   
                                        
: read.last  ( ---)                     
 adventure " ad" lr      ;              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        

 ( square.xy square.xtyt +mod)          
                                        
: square.xy  ( sq# ---x/y)              
 dup squares.wide@ mod game.width@ *    
 game.x@ +  ( x)                        
 swap squares.wide@ / game.height@ *    
 game.y@ +  ( y) ;                      
                                        
                                        
                                        
: square.xtyt  ( sq# ---xtab/ytab)      
 dup squares.wide@ mod 3 * game.xt@ +   
 swap squares.wide@ / 2 * game.yt@ + ;  
                                        
                                        
                                        
                                        
: +mod ( n mod# --n)                    
  mod dup 0< if drop 7 then ;           
                                        
                                        
                                        
                                        
                                        
                                        

( ws.off)                               
                                        
: ws.off ( ---)                         
  9 3 do i off ws( it+ loop ;           
 ws.off forget ws.off                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( count.baddies baddy vars)             
                                        
var crp#  ( 3 of creeps)                
create creeps( 12 allot                 
                                        
                                        
: bad#  ( ---)                          
 creeps( 12 0 fill                      
 0 crp#        ! 0 bnc#     !           
 square.count@ 0 do                     
  i square.object                       
  case creep@ of 1 crp#   +!            
         i crp#  @ 1-                   
         creeps( + c! ;;                
       bouncer@ of                      
         1 bnc#     !                   
         ;;                             
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
 else ddrop then ;                      
                                        
: furnish.room ( ---)                   
 adventure @ 1- scenario.play( +        
 dup c@ creep@ put.objects              
 dup ad#              2* +  c@          
    bouncer@ put.objects                
 dup ad#              4 * + c@          
    oil@ put.objects                    
 dup ad#              6 * + c@          
    disk@ put.objects                   
 dup ad#              8 * + c@          
    coffee@ put.objects                 
     ad#              9 * + c@          
    pie@ put.objects ;                  

( room data clear.rooms)                
var vis#  ( # of rooms visited)         
  create room( 50 allot ( max rooms)    
: clear.rooms( room( 50 0 fill          
  0 vis#    ! ;                         
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
      vis#   @ 1+ dup                   
      trip.count( adventure @ 1- + c@   
      = if drop clear.rooms(            
    else vis#   ! then                  
   else drop chuck.goods then (         
    ( been here)                        
  else drop then ;                      




( load.room )                           
                                        
: load.room ( room#---)  dup 1-         
  sc(   swap room.size@ * +             
  room.data( room.size@                 
  swapout cmove swapin                  
  dup adventure @ 4 = not swap          
  2 mod 0= or                           
  if furnish.room then                  
  bad#                                  
  goods.check ;                         
                                        
                                        
                                        












 ( su.pn ( setup.panel)                 
                                        
                                        
: su.pn 25 0 do i 40 * >r ( index)      
  first 2000 + r@ + 'screen r@ +        
  26 cmove                              
  first 3000 + r@ + color-mem r> +      
  26 cmove loop ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

 ( sound ws sounds)                     
                                        
: sound ( freq/a/d/s/r/vol/wave)        
 ( pulsewd/cutoff/res/filt/--)          
 v1 off v-ctrl  v-d                     
  >r f1    rf                           
 f-freq  v-pw                           
 >r >r                                  
 v-sr v-ad  v-f                         
 r> r> r>  ( vol/wave/filt)             
 rot mv                                 
 v-ctrl ;                               
 hex                                    
 : thing.s  23fb 0 8 0 2 f              
  s#       0 335 0 bp sound ;           
 : panel.s 1bf5 3 a 0 2 f               
  p#    627 239 9 bp sound ;            
 : op.s 1ef5 3 7 0 2 f                  
  t#       0 0 4 hp  sound ;            
  : wire.s 06f5 0 8 0 2 f               
 s#       0 435 1 lp  sound ;           
  decimal                               
                                        
                                        
                                        
                        
 ( gm.sc db.fl)                         
                                        
 : gm.sc  ( ---)                        
 ( flip in the game graphic screen)     
  1 m-c                                 
  first 'screen 1000 cmove              
  first 1000 + color-mem 1000 cmove     
  bak.c bk                              
  gm.bord.col@ bd                       
   5 2 d-position  b%    char.color     
  adv$( adventure @ 1- 17 * + 1+        
  17 type  ;                            
                                        
: db.fl  ( ---↑ debug fill screen)      
  'screen 64 + 16  33 fill              
  color-mem 64 + 16 bl%  fill           
  'screen 24 40 * + 26 + 14 33 fill     
  color-mem 24 40 * + 26 + 14 gl%       
  fill   gl%     char.color             
 25 2 do  26 i d-position ." !" loop    
 24 2 do  39 i d-position ." !" loop ;  
                                        
                                        
                                        
                                        
exit                    


























 ( sounds)     hex                      
 : move.s  14d 0 7 d c f                
   p#    3fc a3 b bp  sound ;           
                                        
 : bump.s 5c3 0 a 0 0 f                 
   n#    0  38c e lp  sound ;           
 : zap.sd  3f68 6 b 5 3 f               
   p#    527 247 1 hp sound ;           
 : crunch     5f5 3 4 0 0 f             
   p#    527 435 4 lp sound ;           
 : see.sd  71c0 b 4 0 2 d               
  t#       0 187 4 hp  sound ;          
 : arm.s  250 3 9 7 2 f                 
   p#    627 147 1 hp sound ;           
 : creep.s 5000 irnd 2000 + 0 5 3 0     
 f p# 200 0 f hp sound frame frame      
frame frame 9000 irnd 1000 + 2 3 0 0 f  
  p#    223 0 e hp  sound ;             
 : feel.s 4bc 0 8 0 0 a                 
   s#       0 386 f lp  sound ;         
 : flash.s 1368 2 b 0 0 f               
  n#    0 447 4 lp sound ;              
 : boom.s 3c3 1 b 0 0 f                 
  n#    0 35e 9 lp  sound ;             
 decimal                                

 ( rob?)                                
 var rob+   0 rob+ !                    
: rob? ( ---?flag↑show robot?)          
 game.status @ debug.on@ = not          
 rob+ @ or ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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
  debug? if drop drop drop else         
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
  swap r> 4 - 7 *  obj.block( +  obj.   
  then ;                                








                                        















































































 ( block.wall <<<<<< erase.robot)       
                                        
: block.wall ( orient#--↑draws wall in) 
  ( front of cw)                        
  case s of squares.wide@ ;;            
       e of 1 ;; w of -1 ;;             
       0                                
  endcase                               
  op.byte c@ 64 mod move@ = not         
  debug? or                             
  if drop 0 then ( not move or debug)   
  dup 0= if drop else                   
    robot.square @ +  ( block square)   
    square.xy                           
    s2 s-position off s-enable          
    187 s-pt                            
    0 s-p on s-ml                       
    off s-yexp off s-xexp               
   53283 c@ s-c 53282 c@ 0 s-m          
   w%    1 s-m                          
   255 53269                            
   frame c!  ( enable all sprites)      
  then ;                                
: erase.robot ( ---)                    
  1 53269 c! ;                          

( cw.op.mouth)                          
                                        
: cw.op.mouth ( ---↑open cw's mouth)    
 s4 w%    s-c robot.orientation @       
 7 * 129 + frame  s-pt ;                





















( init.cw draw.robot cw.anim)           
create cw.xy( 12 allot ( xy array)      
: cw.xy! ( x/y/spr#---) 2- 2*           
  cw.xy( + dup 1+ rot swap c! c! ;      
 var cw.x var cw.y                      
 : cw.go ( x/y---)                      
  ddup cw.y ! cw.x !                    
  19 - ( offset upwards)                
  ddup 2 cw.xy!  ddup 3 cw.xy!          
  ddup 6 cw.xy!                         
  12 +  ( lower body sprites)           
  ddup 4 cw.xy!  ddup 5 cw.xy!          
  7 cw.xy!                              
  56334 c@ 254 and 56334 c!             
  frame      cw.xy( 53252 12 cmove      
  56334 c@ 1 or 56334 c! ;              
 : init.cw ( ---)                       
 ( start cw at right x/y)               
 robot.square @ square.xy swap 1-       
 swap cw.go ;                           
 : cw.anim  ( dx/dy---)                 
  s4 robot.orientation @                
  7 * 128 + ( frame)   s-pt             
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
















( destroy)                              
                                        
                                        
 : destroy ( sq#---)                    
   dup room.data( + floor@ swap c!      
   ( put floor in room.data( )          
   debug? not                           
   if square.xtyt floor@ 4 - 7 *        
     obj.block( + obj.                  
   else drop then ;                     

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

( flash.cw)                             
                                        
 : flash.cw  ( #flashes---)             
(  v1 v-d n#    v-ctrl)                 
   0 do                                 
    53289 1024 6 cmove ( save colors)   
    6 0 do 16 irnd 53289 i + c! loop    
     ( random colors  )  flash.s        
  frame  2000 irnd v-f                  
  frame frame frame 1024 53289 6 cmove  
   loop  ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( orient.xy    cw.slide)               
                                        
 : orient.xy ( orientation#---)         
  case n of 0 -2 ;; ne of 3 -2 ;;       
   e of 3 0 ;;  se of 3 2 ;;            
   s of 0 2 ;;  sw of -3 2 ;;           
   w of -3 0 ;; nw of -3 -2 ;;          
  endcase ;                             
                                        
 : cw.slide ( ---↑ move cw forward)     
   robot.orientation @ orient.xy        
   cw.anim move.s ;                     
                                        
 : cw.back ( ---↑cw reverse)            
   robot.orientation @ 4 + 8 mod        
   orient.xy                            
   cw.anim move.s ;                     
                                        
                                        
                                        
                                        
                                        
                                        



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
 dup 0< if -1 else 0 then ( make dbl)   
  points d@ d+ ddup 0. d<               
  if ddrop 0. then ( not below 0)       
  ddup points d!                        
  debug? if ddrop                       
  else 2 5 d-position d. then           
  ;                                     
                                        
: count.cycle ( cycles---)              
  cycle.ct @ + dup cycle.ct !           
  19 5 d-position                       
  dup 1 < if drop 0 game.finished@      
          prog.status ! then            
  debug? if drop                        
  else b%   char.color abs .  then ;    








( calc.robot.move boom ?boom)           
 forth                                  
 : calc.move ( --- next sq#)            
  robot.orientation @                   
   arg.byte c@ 64 mod check.mov.st      
   reverse@ = if 4 + 8 mod then         
   robot.square @ next.square ;         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

( goto.next.room)                       
                                        
: next.room ( sq#---nextroom sq#)       
 erase.robot  ( from last room)         
 0 robot.square @ 0 do                  
   i square.object door@ = if 1+ then   
 loop                                   
 dup 8 +  ( next room/next sq↑ )        
 room.data( square.count@ + + c@        
 robot.square !                         
 ( get next door sq from and store)     
 room.data( square.count@ + + c@        
 load.room      0 add.points            
 ( load next room#)                     
 init.cw                                
 draw.gameboard                         
 rob? if cw.init then                   
 drop calc.move ;                       
                                        







 ( check.for.next.room)                 
                                        
: check.next ( nextsq--nextsq)          
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
  if next.room then                     
then ;                                  
                                        
                                        
                                        

( bump)                                 
: bump ( obj #moves---obj)              
( init.cw ( ???)                        
  arg.byte c@ 64 mod check.mov.st       
  forward@ =                            
  if 0 do cw.slide loop                 
  else 0 do cw.back loop then           
  bump.s 10 0 do frame loop             
  53265 c@ 8 - 53270 c@ 8 -             
 7 0 do dup 7 irnd +  53270 frame c!    
  swap dup 4 irnd +  53265 frame c!     
    swap loop frame 53270 c! 53265 c!   
  53265 3 mask sbit 53270 3 mask sbit   
  dup dup bouncer@ = swap creep@ = or   
  if 5 flash.cw 50 update.damage        
   50 update.damage then                
  init.cw 50 update.damage ;            
var exploded ( was there explosion?)    
 : boom ( ---) s2 off s-enable          
 robot.orientation @ robot.square @     
 next.square destroy 0 0 bump drop      
 30 cw.y @ do cw.x @ i cw.go -4 +loop   
  20000 update.damage 1 exploded ! ;    
: ?boom ( obj ---object) 0 exploded !   
 dup bomb@ = if boom then ;             

( move)                                 
: wt ( #---) 40 * 0 do loop ;           
: move ( ---)                           
  calc.move check.next                  
  dup square.object dup floor@ =        
  swap door@ = or                       
  if   ( ok to move)                    
    init.cw ( ???)                      
    arg.byte c@ 64 mod check.mov.st     
    forward@ =                          
    if 8 0 do cw.slide loop             
    else 8 0 do cw.back 1 wt loop       
    then                                
    robot.square !                      
  else  ( hit something)                
    square.object dup wall@ =           
    if 1 bump drop                      
    else 2 bump ?boom drop then         
  then  ;                               







 (  move-robot)                         
                                        
: move.robot ( ---)                     
 arg.byte c@ 64 mod                     
 check.mov.st dup mov.empty@ = not      
 if dup forward@ <                      
   if ( rotation arg)                   
    turn.right@ = if 1 else -1 then     
    robot.orientation @ + 8 +mod        
    move.s cw.point frame frame frame   
   move.s                               
   else drop move                       
   then                                 
   exploded @ not                       
   if draw.robot move.s then            
 else drop then                         
 v1 off v-ctrl ;                        






                                        
                                        

( sightline )                           
                                        
: sightline ( xst/yst/xend/yend---)     
  rob? if                               
    3 pick - swap 4 pick - swap         
    dswap   ( xd/yd/xs/ys)              
    s2 on s-enable v1                   
    21 1 do                             
      4 pick i * 20 / 3 pick + ( x)     
      4 pick i * 20 / 3 pick + ( y)     
      s-position                        
      op.byte c@ 64 mod                 
      qray@ = if 16 irnd s-c            
      16200 i 400 * - v-f  then         
    loop                                
  then ddrop ddrop      ;               
                                        

                                        
                                        
                                        
                                        
                                        
                                        
                                        

( zapper retract.zapper )               
                                        
: zapper  ( ---)  s2 off s-enable       
 rob? if                                
  s2 off s-enable                       
  185 s-pt                              
  robot.square @ square.xy              
  31 -  ( y up offset)                  
  swap 2 - swap s-position              
  w%    s-c                             
  0 s-p 0 s-ml                          
  0 s-yexp 0 s-xexp                     
  255 53269 frame c!                    
 then ;                                 
                                        
                                        
                                        
                                        
                                        







( zap.ray)                              
                                        
: zap.ray  ( targ sq#---)               
  dup robot.square @ squares.wide@ -    
  = not  rob? and   ( not under head)   
  if                                    
    s2                                  
    >r robot.square @ square.xy 30 - r> 
    square.xy zap.sp                    
  off s-enable 205 s-pt sightline       
  else drop then                        
  ;                                     














( eat.it zap.it)                        
: eat.it ( sq#---)                      
  dup square.object                     
  case pie@ of 1200 update.fuel ;;      
    coffee@ of 1200 update.fuel ;;      
    oil@ of scenario.play(              
      ad#              5 * +            
      adventure @ 1- + c@ add.points ;; 
   disk@ of scenario.play(              
      ad#              7 * +            
      adventure @ 1- + c@ add.points ;; 
  endcase  destroy ;                    
: ?peace adventure @ 4 =                
   if negate then ;                     
: zap.it ( sq#--) dup square.object     
  case creep@ of scenario.play(         
     ad#              + adventure @ 1-  
     + c@ ?peace add.points ;;          
     bouncer@ of scenario.play(         
     ad#              3 * + adventure @ 
     1- + c@ ?peace add.points          
     0 bnc#     ! ;;                    
   bomb@ of 253 53269 c! boom ;;        
  endcase exploded @ not                
  if destroy else drop then ;           

( zap)                                  
: wait 200 * 0 do loop ;                
: zap ( ---) robot.orientation @        
 robot.square @                         
 next.square check.next drop            
 robot.square @                         
 8 0 do                                 
  robot.orientation @ swap next.square  
  dup square.object   ( tsq#/obj#)      
  dup floor@ =                          
  if drop ( just floor)                 
  else zapper  10 wait                  
    over  zap.sd  zap.ray bump.s        
                                        
    dup wall@ = swap door@ = or         
    if ( dup zap.ray)                   
    else dup ( dup zap.ray) zap.it      
    then                                
    rob? if 253 53269 c! then leave     
                                        
  then                                  
 loop drop  ;                           
                                        
                                        
                                        



























 ( move.arm  arm.prep)                  
: arm.prep (  ---↑get ready for arm)    
  rob? if s2 off s-enable w%    s-c     
  off s-ml off s-xexp                   
  on s-yexp 0 s-p arm.s then ;          
                                        
: arm.xy ( orientation---sprite offx/y) 
  2 * arm.pt( + @ split  robot.square @ 
  square.xy 15 - swap 10 +              
 ( head offset) ( arm.x/y/headoffy/x)   
  4 roll - rot rot swap - ;             
: move.arm ( arm#--)  s2                
  dup 0 = if n arm.xy s-position        
  190 s-pt on s-enable drop             
  else 1- 188 + robot.orientation @     
    2 * + robot.orientation @ arm.xy    
    frame                               
    s-position on s-enable  s-pt then ; 
: arm.out ( ---) rob? if  arm.prep      
 3 0 do i move.arm 5 wait               
  loop   off v-ctrl then ;              
: arm.in ( ---)  rob? if                
 -1 2 do i move.arm 2 wait              
 -1 +loop   arm.prep then off v-ctrl    
 ;                                      

( sing)                                 
                                        
: sing ( ---)                           
 get.arg arg.byte c@ 64 mod             
 check.num.st                           
 num0@ - 0 max 7 min dup                
 num.empty@ = not                       
 if cw.op.mouth 4 8 v-ad 0 0 v-sr       
  case                                  
    0 of 48 ;; 1 of 50 ;;               
    2 of 52 ;; 3 of 53 ;;               
    4 of 55 ;; 5 of 57 ;;               
    6 of 59 ;; 7 of 60 ;;               
 endcase p.n   5 wait                   
   0 0 cw.anim                          
 else drop then ;                       










( pick.up act)                          
: pick.up ( ---)                        
 rob.or.sq@                             
 next.square check.next                 
 arm.out cw.op.mouth                    
 dup square.object ?boom                
 dup dup wall@ = swap creep@ = or       
 swap bouncer@ = or                     
 if square.object wall@ =               
  if bump.s 50 update.damage  arm.in    
  else 5 flash.cw 150 update.damage     
  arm.in then                           
 else dup square.object                 
  dup dup floor@ = swap door@ = or      
  swap bomb@ = or not                   
  if eat.it  arm.in                     
    5 0 do crunch 5 wt  0 0 cw.anim     
   crunch 5 wt cw.op.mouth loop         
    crunch 0 0 cw.anim                  
 else drop arm.in then then ;           
: act ( opcode ---)                     
  case qray@ of zap ;;                  
sing@ of sing ;; pick.up@ of pick.up ;; 
move@ of get.arg move.robot ;;          
endcase ;                               

 ( feel)                                
                                        
 : feel ( object ---)                   
 rob.or.sq@                             
 next.square check.next                 
 rob? if                                
   s2 off s-enable off s-ml             
   on s-yexp off s-xexp b%  s-c         
   adventure @ 3 = if y%  s-c then      
   0 s-p                                
   robot.orientation @  dup             
   arm.xy s-position                    
   dup n = if drop 190                  
   else 204 + then s-pt                 
   frame on s-enable                    
   feel.s  5 wait                       
 then                                   
 square.object ?boom                    
 = not  ( don't feel it)                
 if false.flow then                     
 rob? if s2 off s-enable then ;         
                                        
                                        
                                        
                                        

( look)                                 
var seen                                
: look ( object---) off seen !          
 rob.or.sq@                             
 ddup next.square check.next            
 drop                                   
 6 0 do  ( search loop)                 
   ddup next.square swap drop           
   dup square.object dup                
   floor@ =                             
   floor@ arg.byte c@ 64 mod = not and  
   ( floor not looked for)              
   if drop ( just floor)                
     else ( over sightline ) 4 pick =   
   if  ( search object seen)            
     s3 y% s-c  18 wt ( flash glasses)  
     on seen !                          
     i 1+ update.range ( sqs to obj)    
     see.sd g% s-c then leave           
   then                                 
 loop                                   
 seen @ 0= if false.flow then           
 ( correct object not seen)             
 drop ddrop ;                           
                                        

( smell detect )                        
                                        
: smell ( object---)                    
  false.flow  ( assume false)           
  square.count@ 0 do                    
    dup i square.object =               
 ( compare search item w square it)     
    if this.chip 2* robot.program +     
     c@ 192 and flow.code !             
     ( true.flow)                       
     leave then                         
  loop drop ;                           
                                        
: detect ( opcode---)                   
 arg.byte c@ 64 mod check.obj.st        
 dup obj.empty@ = not                   
 if swap                                
  case feel.for@ of feel ;;             
       look.for@ of look ;;             
      smell@ of smell ;;                
  endcase                               
 else ddrop false.flow then ;           




( keypress update.key)                  
                                        
: keypress ( ---)                       
 k @ arg.byte c@ 64 mod                 
 =  ( key test = last pressed?)         
 if ( right key)                        
   no.key@ k !                          
 else false.flow then ;                 
                                        
                                        
: up.key ( asc ---)                     
( updates and displays key pressed)     
dup 65 90 within not                    
if drop no.key@ 64 + then 64 -          
37 4 d-position                         
dup no.key@ = if ." !"                  
0 197  c!  ( reset kbrd)                
else dup 64 + emit then                 
k ! ;                                   


                                        
                                        
                                        
                                        

( coin special)                         
                                        
: coin ( ---)                           
  2 irnd 0=                             
  if false.flow then ;                  
                                        
: special ( opcode---)                  
 case coin@ of coin ;;                  
    key@ of keypress ;;                 
 endcase ;                              
















( subp bmr)                             
                                        
var r↑                                  
                                        
: subp ( ---↑subpanel)                  
 current.instruction @ r↑ !             
 arg.byte c@ 64 mod                     
 current.panel !                        
 -1 current.instruction !               
 right.f@ flow.code ! 0 hot.chip ! ;    
                                        
: bmr ( ---↑boomerang)                  
 0 current.panel !                      
 r↑ @ current.instruction !             
 robot.program this.chip 2* +           
 c@ 192 and flow.code !                 
  ( new.flow)                           
 ;                                      





                                        
                                        

( goto step? spd)                       
                                        
: goto ( op.code---)                    
 get.arg                                
 case                                   
   go.marker@ of no.key@ up.key         
   28 4 d-position current.panel @      
   ." " 65 + emit  i-t  ;;             
   subpanel@ of subp ;;                 
   boomerang@ of bmr ;;                 
 endcase ;                              
                                        
 : step? step @                         
  if 2 wt begin do.events 2 wt b.d @    
   step  @ not  or until                
  then ;                                
 : spd db.sp @ 0 do loop ;              
                                        
 : b- ( --) step @ if begin b.d @ not   
 do.events until then ;  ( button off)  


                                        
                                        
                                        

( chip#.     calc.inst)                 
var pn#                                 
: chip#.  ( ---↑prints chip #)          
  current.instruction @                 
  bl%  char.color 32 4 d-position       
  dup 8 / 1 +  . 33 4 d-position        
  r%   char.color 8 mod 1+ . ;          
: calc.inst ( ---)                      
 op.byte c@ dup goto.go@ = swap         
 socket@ = or if 0 ( jump to 0)         
else current.instruction @ flow.code @  
 case up.f@ of 8 - ;; down.f@ of 8 + ;; 
     left.f@ of 1- ;;                   
    right.f@ of 1+ ;; endcase           
 then current.instruction !             
 debug? if current.instruction @        
   s2 186 s-pt                          
   on s-yexp on s-xexp off s-ml         
   current.panel @ pn# @ = not if       
     dup hot.chip ! current.panel @ dup 
  s2 off s-enable panel.draw            
  current.instruction @ cursor.chip     
  chip#.       on s-enable              
 pn# ! panel.hilight then  spd step?    
 cursor.chip chip#. b- then chip#. ;    

( group( )                              
( array that groups ops by function)    
create tp(   ( instruction type)        
 1      c, 1      c, 1      c,          
 1      c, 1      c,                    
                                        
 2     c,  2     c,                     
 2     c,  2     c,                     
                                        
 3     c, 3     c, 3     c,             
                                        
 4      c,  4     c,                    
                                        
 5       c, 5       c, 5       c,       
 5       c, 5       c, 5       c,       
 5       c, 5       c, 5       c,       
 5       c,                             
                                        
 6        c,                            
                                        
                                        
                                        
                                        



( execute.robot.instruction)            
                                        
: do.inst ( --)                         
 prog.status @ dup game.on@ =           
 swap series@ = or                      
 if ?terminal dup                       
  if up.key else drop then              
  get.action                            
  dup cycles( + c@ negate count.cycle   
  dup fuel( + c@ negate update.fuel     
  dup tp( + c@  ( get op group)         
  case                                  
    1      of goto ;;                   
    2     of act ;;                     
    3     of                            
       get.arg detect ;;                
    4      of                           
       get.arg special ;;               
    5       of get.arg stk ;;           
    6        of drop ;;                 
  endcase                               
  debug? if current.instruction @       
    cursor.chip then                    
  calc.inst                             
 then ;                                 

( init.game)                            
                                        
: init.game ( ---)                      
  game.char                             
  off game.status !                     
  cw.init                               
  0. points d!   0 pn# !                
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
   init.cw                              
   m.names ;                            
                                        
                                        
                                        

 ( start.game stop.game )               
: leave.game ( ---)                     
   1 g.on$ games$ games( s.it$          
   2 on  games( it+                     
   1 off op( it+ l.db                   
   2 se$ games$ games( s.it$ ;          
 : start.game ( ---)                    
  1 g.off$ games$ games( s.it$          
  frame  screen.off  init.game          
   gm.sc   name.                        
   gm.bord.col@ bd  chip#.              
   0 update.damage  0 update.range      
   0 add.points  0 count.cycle          
   0 update.fuel  clear.stacks          
  frame   screen.on draw.gameboard      
  1 on op( it+                          
   prog.status @ series@ =              
   not if game.on@ prog.status ! then ; 
 : stop.game ( ---)                     
   prog.status @ series@ = not if       
     game.off@ prog.status !            
     leave.game then ;                  
                                        
                                        
                                        



























  ( game)                               
: game ( ---)                           
                                        
  begin  bads                           
   do.inst                              
( v1 off v-ctrl )                       
                                        
 ( 0 22 d-position depth dup .          
   0> if dup . then)                    
   do.events                            
  prog.status @ dup game.on@ =          
  swap series@ = or not until           
                                        
   update.stats                         
  prog.status @ workshop.on@ = not      
  if stats.screen then                  
  leave.game ;                          
                                        
                                        
                                        
                                        
                                        




 ( init.chipwits)                       
: init.chipwits ( ---)                  
  128 657 c! ( disb sft/comm)           
  game.off@ prog.status ! 0 bnc↑ !      
  s4 w% s-c  s6 lr% s-c s5 w% s-c       
  s3 g% s-c s7 b% s-c s8 b% s-c         
  read.last cw.num @ cw.load load.stats 
  first " cw.chr" lr   swapout          
  first 53248 2816 cmove swapin         
  first " cw.scr"  lr  load.names       
  2048 192 - " cw.bnc" lr               
  screen.off  7 charbase s.i            
  g.m.i b% m.bak1 swapout               
  53248 62720 2816 cmove swapin         
 off game.char? !                       
 adventure @ ad.m                       
 57344 " cw.spr" lr  i-joy              
  start.game  stop.game  leave.game     
  0 cb+ !  ( no paste panel) m.names    
  fk ( check for and kill fastload)     
   ;                                    
                                        
                                        
                                        
                                        

( s↑ die end series)                    
: s↑ debug? if db- stats.screen then    
 2 7 d-position bl% char.color  ;       
: die ( -) turn.game.off@ prog.status ! 
  s↑ fuel.reg @ 1 <                     
  if ."   i ran out of fuel"  else      
." i am entirely broken"  then ;        
: end ( ---↑game over normally)         
  prog.status @ series@ = not if        
  turn.game.off@ prog.status ! then     
  s↑ ."   i finished the game"       ;  
: series  start.game 0 last.mission !   
  game prog.status @ dup dup            
  workshop.on@ = swap                   
  turn.game.off@ = or swap              
  game.off@ = or not                    
  last.mission @ not and                
  if series@ prog.status !              
    2 lm$ games$ games( s.it$           
    1 g.off$ games$ games( s.it$        
    8000 0 do do.events loop            
    prog.status @ game.on@ = if         
      turn.game.off@ prog.status ! then 
  then ;                                
                                        

 ( cw       )                           
                                        
: cw       ( ---)                       
  init.chipwits                         
  begin 1000 irnd drop  i-t             
   prog.status @                        
    case game.off@ of do.events ;;      
         game.on@ of                    
   2 off games( it+  game ;;            
    turn.game.on@ of start.game ;;      
       series@ of series ;;             
   turn.game.off@ of stop.game ;;       
    game.aborted@ of die     ;;         
    game.finished@ of end     ;;        
     workshop.on@ of workshop ;;        
     workshop.off@ of  w.leave          
       game.on@ prog.status !           
       start.game                       
       stop.game leave.game ;;          
    endcase                             
  again ;                               





                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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
   y%     8 +  0 obj(,  ( pie)          
   g%     8 +  1 obj(, ( coffee)        
   bl%    8 +  2 obj(, ( disk)          
   bl%    8 +  3 obj(, ( oil)           
   w%     8 +  4 obj(, ( floor)         
   r%     8 +  5 obj(, ( bomb)          
   r%     8 +  6 obj(, ( bouncer1)      
   p%     8 +  9 obj(, ( creep1)        
   w%     8 + 13 obj(, ( walltop)       
   11         15 obj(, ( door)          
   w%     8 + 14 obj(, ( wallside)      












 ( crp(  )                              
                                        
 create crp(                            
 p%   8 +  9 obj(,  ( c1)               
 p%   8 + 10 obj(,  ( c2)               
 p%   8 + 11 obj(,  ( c3)               
 p%   8 + 12 obj(,  ( c4)               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        



                                        
                                        
                                        
                                        
                                        

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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( disk? fk)                            
hex                                     
: fk  ( ---↑fastload kill)              
  330 c@ df =  ( fastload present)      
  if 0 1f do fd30 i + c@                
     314 i + c! -1 +loop then ;         
 decimal                                
                                        
: disk? ( ---↑ck for disk) " i" dos fk  
 cw.num @ adventure @   begin           
  adventure " ad" lr st 64 = not        
  while s.sc                            
    4 10 34 12 b%    color.block        
    5 11 d-position                     
    b%    char.color                    
    ." insert disk and press any key"   
    begin ?terminal until r.sc          
 repeat                                 
 adventure ! cw.num ! ;                 
                                        
                                        
                                        
                                        
                                        
                                        
                        
( *** workshop data ****)               
var hot.chip                            
var ws.op.byte                          
var ws.arg.byte                         
var ws.true.flow                        
var ws.false.flow                       
var i.cm  ( inserter.com)               
var wire↑         ( 0=none 1=t 2=f)     
var new.cw    ( new cw loaded?)         
62 is none@   ( no chip token)          
9999 is no.chip@                        
                                        
                                        
                                        
                                        
                                        
                                        




                                        
                                        
                                        
                                        

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
1 25 3 24 panel.rect !rect              
                                        
                                        

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        













                                        
                                        
                                        

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
( sk) mg%      33 33 33 33 33 33 7 #,   
                                        
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
                                        
create action.type( act#@    allot      
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
                                        
create ok.actions( act#@ allot          
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
                                        
create op.w.xy( act#@ 4 * allot         
create arg.w.xy( th#@ 4 * allot         
                                        
: arfill ( xl/xr/yt/yb/tok/array---)    
  swap 4 * +  >r    r@ 3 + c!           
  r@ 2 + c!  r@ 1+ c! r> c! ;           
                                        
                                        
: af ( x/x/y/y/argtok---)               
  arg.w.xy( arfill ;                    
                                        
: blank.thing.rects ( ---)              
  arg.w.xy( th#@ 4 * 40 fill ;          
                                        
: op.w.draw ( optok) dup >r             
  4 * op.w.xy( + dup 2 +                
  c@ swap c@ swap  ( x/y)               
  r> 7 * op.block( + op. ;              
                                        
: pf ( x/x/y/y/optok---)                
  op.w.xy( arfill ;                     
                                        
                                        

 ( op work xy assignments <<<)          
                                        
27 28 5 6 look.for@ 29 30 5 6 feel.for@ 
31 32 5 6 smell@ 34 35 5 6 move@        
37 38 5 6 sing@ pf pf pf pf pf          
                                        
27 28 7 8 on.m@ 30 31 7 8 on.o@         
33 34 7 7 on.n@ 37 38 7 8               
st-@                                    
33 34 8 8 n<@ pf pf pf pf pf            
27 28 9 10 m=@ 30 31 9 10 o=@           
33 34 9 10 n=@ 35 36 9 10 plus@         
37 38 9 10 minus@ pf pf pf pf pf        
                                        
27 28 11 13 subpanel@ 30 31 11 13 wire@ 
34 35 11 13 key@ 37 38 11 13 qray@      
pf pf pf pf                             
27 28 14 16 goto.go@ 30 31 14 16        
boomerang@ 34 35 14 16 coin@            
37 38 14 16 pick.up@ pf pf pf pf        
                                        
                                        
                                        
                                        
                                        

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
                                        
                                        
                                        
forget sf                               
                                        

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
 29 30 19 20 24    af                   
 31 32 19 20 25    af                   
 33 34 19 20 26    af                   
 35 36 19 20 damage.reg@ af             
 37 38 19 20 fuel.reg@ af               
 27 28 22 23 27    af                   
 29 30 22 23 28    af                   
 31 32 22 23 29    af                   
 33 34 22 23 30    af                   
 35 36 22 23 range.reg@ af ;            
                                        
: ne.fill ( --)                         
 n.fill 37 38 22 23 num.empty@ af ;     
                                        
: s.fill ( --)                          
 n.fill 37 38 22 23 num.stack@ af ;     
                                        
                                        
                                        
                                        

 ( cemit draw.action  draw.letter<<< )  
                                        
: cemit  ( x/y/color/screencode)        
  >r >r 40 * +                          
  r> over color-mem + c!                
  'screen + r> swap c! ;                
                                        
: draw.action ( tok/x/y--tok/x/y )      
  ddup  5 pick 7 * op.block( +          
  op. ;                                 
                                        
                                        
: draw.letter  ( x/y/asc---)            
  b%    char.color                      
  >r d-position r>                      
  dup 64 - 27 = if                      
   ." !" drop else emit then ;          
                                        
                                        
                                        
                                        
                                        


                                        

( draw.a.thing   o.d.)                  
                                        
: draw.a.thing  ( tok/x/y---tok/x/y)    
  3 pick dup dup                        
  double.sized? swap key@ = or          
  if dup subpanel@ =                    
    swap key@ = or                      
    if ddup 2 + swap 1+ swap            
      get.arg.asc 6 pick                
      subpanel@ = if 1+ then            
      draw.letter then                  
  else   drop ddup  1 +                 
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
  dup sing@ > swap on.n@ < and ;        
: draw.wire ( tok/x/y---)               
 single.wire@ wire.type !               
 3 pick dup dup goto.go@ = swap         
  boomerang@ = or swap                  
   socket@ = or not                     
 if  ( draw some wire)                  
   ddup wire.xy    ( tok/x/y/tx/ty)     
   5 roll brancher?                     
   if true.wire@ wire.type !            
     wire.it                            
     false.flow  ddup wire.xy           
     false.wire@ wire.type !            
     wire.it                            
   else wire.it then                    
else drop then  drop drop ;             


 ( chip.draw)                           
                                        
 : chip.draw  ( chip#--)                
   dup 8  mod 3 * 2+ ( x)               
   swap 8  / 4 * 4 + ( y)               
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
   su.pn                                
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
  26 18 39 24 gl%     color.block       
  dup -@ = if drop blank.thing.rects    
  else                                  
   setup.legal.args                     
   th#@ 0 do                            
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
    up.f@ of 8  < not ;;                
  down.f@ of chip.count@                
       8     - < ;;                     
  left.f@ of 8 mod 0= not ;;            
 right.f@ of 1+ 8                       
       mod 0= not ;;                    
endcase ;                               
: blip ( x/y---↑erase wire)             
  dg%     char.color                    
  d-position ." !" ;                    
: erase.blank.wires ( ---)              
  ws.chip.rect @xy                      
  ddup swap  1+ swap  1 - blip ( up)    
  ddup             3 + blip  ( down)    
  ddup swap 1 - swap blip   ( left)     
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
   @xy draw.action ddrop then           
  ws.arg.byte c@                        
  none@ = not if ws.chip.rect @xy       
    draw.a.thing ddrop then             
  dup none@ = not if ws.chip.rect @xy   
    draw.wire                           
  else drop then ;                      
: panel.hilight ( ---)                  
  ( cw.name$ ) dg%     char.color       
  0 2 d-position ." panel"              
  mg%      char.color                   
  75 65 do  ( a-j)                      
    current.panel @ i 65 - =            
    if dg%     char.color then          
    i 65 - 2* 6 + 2 d-position          
    i emit mg%      char.color          
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
   0 wire↑   !                          
   0 this.act.type ! ;                  
                                        
 : update.ws.commands ( ---)            
 ( is chip ready to be inserted?)       
 0 i.cm !                               
 ws.arg.byte c@ none@ = not             
   ( chip is finished)                  
 this.act.type @ -@ = or                
   ( unary chip finished)               
 if 1 i.cm ! then ;                     




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
   else ddrop garbage.ws.chip then ;    
                                        
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
                                        
 : key.ics  ( keypress icons)           
  26 18 39 24 gl%     color.block       
  65   ( a) b%    char.color            
  24 19 do ( vert loop)                 
   38 29 do  ( horiz)                   
   i j d-position dup emit 1+           
  loop 2 +loop drop ." !" ;            
                                        
 : subp.ics  ( ---)                     
  b%    char.color                      
  26 18 39 24 gl%     color.block       
   9 0 do                               
     subp.ws.rect( i 4 * +              
     @xy d-position                     
     66 i + emit                        
  loop  ;                               
                                        
                                        
                                        
                                        




( insert.it <<<<)                       
                                        
: insert.it ( ---)                      
  hot.chip @ current.instruction !      
  i.cm @                                
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
   ddrop ;                              




( pull.it )                             
                                        
: pull.it ( ---)                        
   hot.chip @ current.instruction !     
   panel.chip>ws                        
   update.ws.commands                   
   calc.blank.wires                     
   ws>arg,op                            
   update.ws.chip                       
   ws.op.byte c@ subpanel@ =            
   if subp.ics                          
   else ws.op.byte c@ key@ =            
    if  key.ics                         
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
 if wire↑         ! ws.back.col@        
  single.wire@ wire.type !              
  w%    ' ws.back.col@  !               
  ws.op.byte c@ brancher?               
  if wire↑         @                    
   1 = if true.wire@ wire.type !        
    else false.wire@ wire.type ! then   
  then ws.chip.rect @xy wire.xy wire.it 
  ' ws.back.col@ !                      
 else drop then ;                       

( move.wire?)                           
                                        
: move.wire? ( flow.code---) dup        
  match.wire? dup 0>   ( wire there)    
  if wire↑         @ = not ( same)      
   if ws.false.flow c@ ws.true.flow c@  
    ws.false.flow c! ws.true.flow c!    
      ( swap em)                        
    0 wire↑         ! ws>arg,op drop    
    blank.ws.chip update.ws.chip        
   else drop then  ( same one)          
  else drop ( no wire there)            
   wire↑         @ 1 =                  
   if ws.true.flow c!                   
   else ws.false.flow c! then           
   0 wire↑         !                    
   ws>arg,op blank.ws.chip              
   update.ws.chip                       
  then                                  
  ws.true.flow c@ last.true !           
  ws.false.flow c@ last.false ! ;       





exit                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( cursor.chip new.chip.hot)            
                                        
 : cursor.chip ( chip#---)              
   s2 w% s-c                            
   dup 8 mod 24 * 36 +  ( x)            
   swap 8 / 32 * 78 +   ( y)            
   ddup frame s-position  on s-enable   
   46 - 8 /             ( ytab )        
   swap 20 - 8 / swap   ( xtab)         
   ddup over 1+ swap dup 2+             
   ws.chip.rect !rect                   
   swap 1 - swap 1 - over 3 + swap      
   dup 4 + ws.wire.rect !rect ;         
                                        
 : new.chip.hot ( chip#---)             
   dup 0= not                           
   if dup hot.chip !                    
      dup current.instruction !         
      cursor.chip                       
      get.action drop pull.it           
      0 wire↑  !                        
   else drop then ;                     




( point>chip   drag.chip)               
                                        
: point>chip ( x/y---chip#)             
  78 - 32 / 8  * 0 max 32 min           
  swap 36 - 24 / 0 max 7 min +          
  ;                                     
var drag.chip↑                          
: drag.chip  ( ---)                     
  panel.rect @rect but.xy@              
  pt.rct                                
  if s2 on s-enable ( in case off)      
    but.xy@ point>chip dup 0= not       
    if dup drag.chip↑ @ = not           
      if ( boop) then                   
      dup drag.chip↑ !   cursor.chip    
     s2 b%   frame s-c 1000 0 do loop   
      w%    frame s-c                   
    else drop none@ drag.chip↑ !        
   (  hot.chip @ cursor.chip ) then     
  else none@ drag.chip↑ !               
    s2 off s-enable then                
  ( dragged off panel)                  
( 0 24 d-position ." drag.chip "        
  drag.chip↑ ? ) ;                      
                                        

 ( panel.handler)                       
: panel.handler ( ---) ( sound)         
  but.xy@ point>chip                    
  dup 0= not if insert.it then          
  new.chip.hot none@ drag.chip↑ !       
  b.d @ if erase.blank.wires            
    begin b.d @                         
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
   pt.rct not  ( drag off panel?)       
 if hot.chip @ cursor.chip              
   garbage.ws.chip garbage.panel.chip   
 erase.ws.chip erase.blank.wires        
  hot.chip @ new.chip.hot  then         
 then update.ws.commands ;              

( ws.wire.handler)                      
 : ws.wire.handler ( ---)               
   ws.chip.rect @rect but.xy@           
   pt.rct                               
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
        @rect but.xy@ pt.rct            
        if wire↑         @  wire.s      
         if flow.code @ move.wire?      
         else flow.code @ select.wire   
         then leave                     
       then then                        
     loop r> flow.code !                
   then then ;                          
exit                    
 ( panel.select.handler)                
                                        
 : panel.select.handler ( ---)          
   panel.s                              
   b.x @  24 - ( screen coords)         
   44 - 16 /   ( panel #)               
   0 max 9 min  ( legal range)          
   i.cm @ if                            
    ws>panel.chip then                  
     ( insert finished chip)            
   dup current.panel ! ( new panel)     
                                        
   panel.draw   panel.hilight           
   ws.action.icons ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

( action.handler)                       
                                        
: action.handler ( ---)                 
  act#@ goto.go@ do                     
   i action.ok?                         
   if op.w.xy( i 4 * + @rect            
    but.xy@ pt.rct                      
    if op.s                             
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
   sb@ of drop subp.ics  ;;             
   l@ of drop key.ics  ;;               
   -@ of ws.thing.icons ;;              
     endcase then                       
   then then                            
 loop ;                                 
exit                    
( subp.handler,key.handler)             
                                        
: subp.handler ( ---)                   
 9 0 do                                 
  subp.ws.rect( i 4 * + @rect           
  but.xy@ pt.rct                        
  if i 1 + ws.arg.byte c!               
      thing.s                           
    ws>arg,op update.ws.chip            
    update.ws.commands  leave           
  then loop ;                           
                                        
 : key.handler ( ---)  thing.s          
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
  else ws.op.byte c@ key@ =             
   if  key.handler                      
   else th#@ 0 do                       
    arg.w.xy( i 4 * + @rect but.xy@     
    pt.rct if                           
      thing.s                           
     i ws.arg.byte c!                   
     ws>arg,op                          
     update.ws.chip                     
     update.ws.commands leave           
    then                                
   loop then                            
  then ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        

( ws.mouser)                            
: ws.mouser  ( ---)                     
26 39 4 17 but.xy@ pt.rct               
if action.handler                       
 else 5 25 2 2 but.xy@ pt.rct           
 if panel.select.handler                
  hot.chip @ new.chip.hot               
  ws>arg,op update.ws.chip              
  else ws.wire.rect @rect but.xy@       
  pt.rct if ws.wire.handler             
  else 26 39 19 24 but.xy@ pt.rct       
   if thing.handler                     
   else 0 25 3 24 but.xy@ pt.rct        
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
  0 m-c                                 
  ws.bord.col@ bd                       
  bak.c bk                              
  act#@ 1- 0 do i ok loop               
  boomerang@ not.ok ;                   
                                        
                                        
: init.ws ( ---)                        
  39 hot.chip !   garbage.ws.chip       
  1 new.cw !                            
  0 current.instruction !               
  0 current.panel !                     
  0 i.cm !                              
  39 new.chip.hot                       
  ;                                     
                                        
                                        
                                        
                                        
                                        

 ( w.enter w.leave )                    
 $c w.on$ "enter"                       
 $c w.off$ "exit"                       
: w.enter ( -) 1 0 op( it+  0 bnc# !    
  screen.off b% bk b% bd sprites.off    
  s2 w% s-c  off s-ml                   
  3 on ws( it+   ( savecw)              
  12 4 do i off games( it+  loop        
  9 5 do i on ws( it+ loop ( edit)      
  cb+ @ not if 7 off ws( it+  then      
 1 w.off$ ws$ ws( s.it$                 
  186 s-pt on s-yexp on s-xexp          
  setup.work.screen                     
  right.f@ last.true !                  
  down.f@ last.false !                  
  1 new.cw ! ws.action.icons            
  panel.hilight ws.bord.col@ bd         
  screen.on  ;                          
: w.leave ( -) 1 1 op( it+              
   hot.chip @ no.chip@ = not            
   if insert.it then                    
  1 w.on$ ws$ ws( s.it$                 
  3 off ws( it+                         
  9 5 do i off ws( it+ loop ( edit)     
12 4 do i on games( it+  loop ;         

 ( **** workshop ****)                  
                                        
: workshop  ( ---)  w.enter             
  begin  do.events i-t                  
  new.cw @                              
  if 0 panel.draw init.ws               
    ( ws.action.icons )                 
    panel.hilight                       
    0 new.cw !  then                    
   b.d @ if ws.mouser then              
    prog.status @ workshop.on@ =        
                                        
  not until                             
  screen.off                            
  w.leave   ;                           
                                        
                                        







                                        

( draw.rnd.crp to.cw)                   
                                        
: rnd.crp ( sq#---)                     
  debug? if drop                        
  else  square.xtyt crp(                
    4 irnd 7 * + 3 2 block.             
    creep.s then ;                      
                                        
                                        
: to.cw  ( sq#---nextsq#) dup           
  dup squares.wide@ / ( row)            
  swap squares.wide@ mod ( col)         
  robot.square @ squares.wide@ mod      
  < if 1 else -1 then                   
  2 irnd 0= if drop 0 then              
  swap robot.square @ squares.wide@ /   
  ddup =   ( same row)                  
  if ddrop 0                            
  else < if squares.wide@               
   else squares.wide@ negate then       
  then 2 irnd 0= if drop 0 then         
  + + ;                                 
                                        
                                        
                                        

( ?zap.cw  creep.move)                  
                                        
 : ?zap  ( sq#---flag↑zap cw?)          
  robot.square @ = not dup not          
   ( cw is there, zap it)               
  if 6 flash.cw -200 update.fuel then ; 
                                        
                                        
 : crp.mv ( creep#/sq#---)              
  3 irnd 2 < if  ( 66% try to move)     
    dup to.cw ( cr#/sq#/nextsq#)        
 dup dup dup square.object              
 floor@ = swap ?zap and                 
 swap robot.square @ squares.wide@      
 - = not and                            
  if dup 4 roll creeps( + c! ( sq#/nx#) 
   swap destroy  ( nextsq#)             
   dup room.data( + creep@ swap c!      
       ( store creep in room)           
                                        
  else drop swap drop then ( sq#)       
 else swap drop                         
 then rnd.crp ;                         
                                        
                                        

( move.baddies)                         
                                        
 : bads ( ---)                          
   12 irnd dup creeps( + c@             
   55 min  ( no garbage #'s)            
         ( creep#/creep sq#)            
   dup square.object creep@ =           
     ( creep is still there)            
   if crp.mv                            
   else ddrop                           
   then  ; exit                         
 ( bnc#  @                              
   debug? not and                       
   if  ( spin.bouncer)                  
     bnc↑   @  dup                      
     dup 1 = if 2 irnd 1 =              
      if drop 3 then then ( bounce)     
     48 * 1856 +   ( bounce buf)        
     -1296 48 cmove                     
     1 + 3 mod  bnc↑ !                  
   then ) ;                             


                                        
                                        

 ( zap sprite) 2 base !                 
s-def zap.s                             
00000000 00000000 00000000              
00000000 00000000 00000000              
00000001 10000001 10000000              
00000000 11000011 00000000              
00000000 01100110 00000000              
00000000 00111100 00000000              
00000111 11111111 11100000              
00000000 00111100 00000000              
00000000 01100110 00000000              
00000000 11000011 00000000              
00000001 10000001 10000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 000000 decimal        
: zap.sp swapout                        
49152 205 64 * + zap.s swapin ;         
                        
 ( see sprite) exit    2 base !         
s-def see.s                             
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 01111110 000000                
00000000 11000011 000000                
00000000 00000011 000000                
00000000 00001110 000000                
00000000 00111000 000000                
00000000 00000000 000000                
00000000 00111000 000000                
00000000 00111000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000                
00000000 00000000 000000 decimal        
: see.sp swapout                        
49152 205 64 * + see.s swapin ;         
                        
(  l.db db- bye.bye)                    
 $c d+$ "debug on" $c d-$ "debug off"   
 $c f$ "fast"      $c s$ "slow"         
 $c st+$ "step"    $c st-$ "no step"    
 $c r+$ "see robot" $c r-$ "no robot"   
 var step  var db.sp  0 db.sp !         
: d.$ ( f-) 1 swap if d+$ else d-$ then 
 op$ op( s.it$     ;                    
: s.$ ( f-) 2 swap if f$ else s$ then   
  op$ op( s.it$     ;                   
: t.$ ( f-) 3 swap if st+$              
  else st-$ then op$ op( s.it$  ;       
: r.$ ( f-) 4 swap if r-$ else r+$ then 
  op$ op( s.it$ ;                       
: l.db ( ---↑leave debug)  253 53269 c! 
  5 2 do i off op( it+  loop            
  1 d.$  0 s.$  1 t.$ 0 r.$             
  0 step ! 0 rob+ ! 0 db.sp ! ;         
: db- ( ---)                            
    screen.off game.char 1 m-c          
  gm.sc 0 game.status ! draw.gameboard  
 draw.num.st draw.mov.st draw.obj.st    
     0 update.fuel 0 update.damage      
     0 update.range  l.db               
     name. 253 53269 c! screen.on ;     
                        
 ( bye.bye    option.menu)              
: bye.bye ( --)  rec.last begin again ; 
: e.db ( ---↑enter debug)               
  5 2 do i on  op( it+  loop            
  0 s.$ 1 t.$ 0 r.$ 0 d.$               
  1 53269 c! ;                          
 : op.m ( ---) t.i @                    
  case   1 of game.status @             
    debug.on@ =  not                    
    if debug.on@ game.status !          
      screen.off ws.char 0 m-c          
      current.instruction @ hot.chip !  
      current.panel @ panel.draw        
    panel.hilight db.fl e.db screen.on  
    else db- then ;;                    
 2 of db.sp @ if 0 s.$ 0                
      else 1 s.$ 10000 then db.sp ! ;;  
 3 of step @ if 1 t.$ 0                 
    2 on op( it+                        
      else 0 t.$ 1                      
   2 off op( it+ then step ! ;;         
 4 of rob+ @ if 0 r.$ 0  1 53269 c!     
else 253 53269 c! 1 r.$ 1 then rob+ !   
 ;;  6 of bye.bye ;;                    
 endcase ;                              

( clear.panel copy.panel paste.panel)   
create copy.buff( chip.count@ 2 * allot 
: cl.p ( ---↑clear.panel) chip.count@ 1 
  do i current.instruction !            
     socket@ 0 !chip loop               
  1 current.instruction !               
  current.panel @ panel.draw            
  panel.hilight zero.stats              
  garbage.ws.chip update.ws.commands ;  
: cp.p ( ---↑copy.panel)                
  robot.program current.panel @         
  chip.count@ 2 * * + copy.buff(        
  chip.count@ 2 * cmove                 
  7 on ws( it+                          
  1 cb+  ! ;                            
: ps.p ( ---↑copy.panel) copy.buff(     
  robot.program current.panel @         
  chip.count@ 2 * * + dup >r            
  chip.count@ 2 * cmove                 
  current.panel @ dup 0= if boomerang@  
  else subpanel@ then                   
  r> dup chip.count@ 2 * + swap do      
   i c@ 64 mod over = if socket@ i c!   
   then 2 +loop drop                    
  panel.draw   zero.stats  ;            

( ws.m)                                 
                                        
                                        
: ws.m  ( ---)                          
  t.i @                                 
  case                                  
     1 of prog.status @ workshop.on@ =  
         if workshop.off@               
         else workshop.on@ then         
         prog.status ! ;;               
     3 of hot.chip @ no.chip@ =         
       not if insert.it then sv.sp      
0 53269 c! edit.name cw.num @ cw.save   
       m.bar  1 53269 c!                
       1 new.cw ! ;;                    
     5 of cp.p cl.p ;;                  
     6 of cp.p ;;                       
     7 of ps.p ;;                       
     8 of cl.p ;;                       
   endcase ;                            






( wh.m)                                 
: wh.m  sprites.off                     
  t.i @ dup cw.load                     
  cw.num !   load.stats  prog.status @  
  workshop.on@ = if 1 new.cw !          
  else turn.game.off@ prog.status !     
  debug? not if  name. then  then       
 m.names ( rec.last ) ;                 
 create ad.col( lb% c, g% c,  dg% c,    
 bl% c, br% c, r% c, mg% c, lr% c,      
 : ad.m ( ad#---) dsk                   
   dup 1- ad.col( + c@ m.bak2           
   dup adventure ! screen.off           
  gm.sc  game.char name. screen.on      
  prog.status @ dup  game.on@ =         
  swap series@ = or if                  
      turn.game.off@ prog.status !      
then first swap case  1 of " a1" ;;     
   2 of " a2" ;; 3 of " a3" ;;          
   4 of " a4" ;; 5 of " a5" ;;          
   6 of " a6" ;; 7 of " a7" ;;          
   8 of " a8" ;; endcase lr             
   swapout first 53248 4000 cmove       
   swapin  ( rec.last )                 
   first " cw.scr" lr 1 53269 c! ;      

( adventure.menu)                       
: a.m t.i @ dup                         
  4 11 within if 3 - ad.m  m.names      
  else case                             
   1 of prog.status @                   
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
  2 of prog.status @                    
    case series@ of game.on@            
         prog.status ! 1 last.mission ! 
  2 se$ games$ games( s.it$ ;;          
        0 last.mission !                
  2  lm$ games$ games( s.it$            
       series@ prog.status !            
   endcase ;;                           
endcase                                 
then ;                                  

( do.events)                            
                                        
 : do.events ( ---)                     
   m.ev   ( do menu events)             
   if t.m @                             
     case                               
       1 of wh.m ;;                     
       2 of ws.m ;;                     
       3 of a.m   ;;                    
       4 of op.m  ;;                    
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
                                        
: erase.stack ( x/y---x/y) ddup         
 over 1+ over 5 + dg%     color.block ; 
                                        
: draw.mov.st ( ---)                    
  36 17 erase.stack                     
  mov.st↑ @ 2- 0 max mov.st↑ @ do       
   ddup mov.st( i + c@ o.d.             
 ( get mov from stack & draw)           
   2+                                   
  -1 +loop ddrop ;                      
                                        
  : on.m ( mov.tok---)                  
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
   ddup obj.st( i + c@ o.d.             
 ( get obj from stack & draw)           
   2+                                   
  -1 +loop ddrop ;                      
                                        
  : on.o ( mov.tok---)                  
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
   ddup num.st( i + c@ o.d.             
 ( get num from stack & draw)           
   2+                                   
  -1 +loop ddrop ;                      
                                        
  : on.n ( mov.tok---)                  
    num.st↑ @ stack.len@ =              
    if num.st( st.squash                
 ( if max size squash)                  
    else 1 num.st↑ +! then              
 ( inc stack top pointer)               
    check.num.st                        
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
  mov.st( stack.len@ 0 fill 0 mov.st↑ ! 
  obj.st( stack.len@ 0 fill 0 obj.st↑ ! 
  num.st( stack.len@ 0 fill 0 num.st↑ ! 
  mov.empty@ mov.st( c!                 
  obj.empty@ obj.st( c!                 
  num.empty@ num.st( c!                 
  draw.mov.st draw.obj.st draw.num.st ; 


 ( d.stk plus minus)                    
                                        
 : d.stk ( arg---↑drop stack)           
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
  else ddrop then ;                     
                                        
: minus ( ---)                          
  num.st( num.st↑ @ + dup c@            
  dup num.empty@ = not                  
  if num0@ - 1- 8 +mod num0@ + swap c!  
  draw.num.st else ddrop then ;         
                                        

( stk <<<<<<<<)                         
                                        
: stk     ( opcode ---↑stacker)         
  arg.byte c@ 64 mod swap               
  case                                  
    n=@ of num= ;;                      
    n<@ of num< ;;                      
    o=@ of obj= ;;                      
    m=@ of mov= ;;                      
    on.n@ of on.n ;;                    
    on.o@ of on.o ;;                    
    on.m@ of on.m ;;                    
    st-@ of d.stk ;;                    
    plus@ of drop plus ;;               
    minus@ of drop minus ;;             
  endcase ;                             
                                        









( stat name data structs)               
                                        
first 4001 + constant stats(            
( 8 * [2bytes #games,4 bytes cum score, 
  4 bytes high], 8 * 1 byte ok envir)   
( 88 byte buffer)                       
                                        



















( zero.stats load.stats save.stats)     
: zero.stats ( ---)                     
  stats( 80 0 fill ;                    
                                        
: load.stats ( ---)  dsk                
  0 savename c!                         
  savename " s " $+                     
  cw.num @ 64 + savename 2 + c!         
  stats( savename lr r.sp ;             
                                        
                                        
: save.stats ( ---)  dsk                
( " s0.tmp" dos ) sv0                   
  savename " 0:tmp" $+                  
  stats( dup 87 + save ( ." 0:tmp")     
  sv0                                   
  savename " s0:s " $+                  
  cw.num @ 64 + savename 5 + c!         
  savename dos ( savename count type)   
  sv0                                   
  savename " r0:s =tmp" $+              
  cw.num @ 64 + savename 5 + c!         
  savename dos ( savename count type)   
             ;                          


 ( update.stats)                        
                                        
: stat.adr ( ---stats address)          
 adventure @ 1- 10 * stats( + ;         
: update.stats ( ---)                   
 stat.adr                               
 1  over  +! ( inc game#)               
 dup 2 + d@                             
 points d@ d+ 3 pick 2 +  d!            
 6 + dup  d@                            
 points  d@ d<                          
 if points d@ rot  d! else drop then    
  save.stats   ;                        


                                        










( stats.screen)                         
: c. ( dnum---↑center print)            
  ddup 99. d> if ." " then  ( left)    
  ddup 9999. d> if ." " then           
  d. ;                                  
: stats.screen ( ---) b%    char.color  
  400000. stat.adr 6 + d@ d<            
  if zero.stats update.stats then       
  ( garbage hi score)                   
  27 12 38 23 gl%     color.block       
  27 12 d-position ." ↑↑↑ stats ↑↑"     
  29 14 d-position ." missions"         
  32 15 d-position stat.adr @ 0 c.      
  29 17 d-position ." average"          
  32 18 d-position stat.adr 2 + d@      
  stat.adr @  m/                        
  dup -1 = if drop 0 then ( /0) 0 c.    
  drop 28 20 d-position ." high score"  
  32 21 d-position stat.adr 6 + d@ c. ; 
                                        






 ( load.names save.names)               
                                        
: load.names ( ---)  dsk                
  0 savename c!                         
  savename " nm" $+                     
  wh$ 1+                                
  savename lr  r.sp ;                   
                                        
: save.names ( ---) dsk ( ." dsk")      
 ( " s0:tmp3" dos ) sv0                 
  savename " 0:tmp3" $+                 
  wh$ 1+ dup                            
  wh( 1 + c@ wh( 2 + c@                 
  * + save  ( ." 0:tmp3")               
  sv0                                   
  savename " s0:nm" $+                  
  savename dos ( savename count type)   
  sv0                                   
  savename " r0:nm=tmp3" $+             
  savename dos    ;                     
 : name. ( ---)                         
 9 6 d-position                         
 bl% char.color cw.num @ 1- wh(         
 1+ c@ *  wh$ + 2 +                     
 wh( 1+ c@ 1- type ; ( skip -)          

  ( adv.)                               
: nm↑  ( ---name addr)                  
 cw.num @ 1- wh( 1+ c@ * 1+ wh$ + ;     
                                        
: nm.  ( ---↑print cw name edit wndw)   
 8 7 d-position bl% char.color          
 nm↑ 1+ wh( 1+ c@ 1- type ;             
                                        
                                        
: adv. ( ad#-1---↑adventure print)      
  dup stats( 80 + + c@ ( best array)    
  if bl% else b% then char.color        
  dup 13 + 5 swap d-position            
  3 + games( 1+ c@ dup >r ( menu width) 
  * 1+ games$ +    r> type ;            
                                        
                                        
: all. ( ---↑print all adventures)      
   8 0 do                               
    i adv. loop ;                       
                                        
                                        
                                        
                                        
                                        
                        
 ( nm.scr)                              
                                        
: nm.scr ( ---↑naming screen)           
0 2 25 24 gl% color.block               
b% char.color                           
7 4 d-position ." this chipwit"         
9 5 d-position ." is named"             
                                        
6 6 d-position ." *((((((((((((+"       
6 7 d-position ." '            )"       
6 8 d-position ." -&&&&&&&&&&&&,"       
nm.                                     
5 11 d-position ." it works best in"    
 all.   ( adv names)  bl% char.color    
 21 21 d-position ." *((+"              
 21 22 d-position ." 'ok)"            
 21 23 d-position ." -&&,"              
 color-mem 40 r% fill ;                 





                                        
                                        

 ( ed.it  flip)                         
var e↑  0 e↑ ! ( edit char ptr)         
var cr↑    ( cr pressed?)               
: ed.it  ( char---↑edit name)           
dup dup dup 20 =  ( delete)             
  swap 32 =   or  ( space)              
swap 65 90 within or if                 
  e↑ @ 0= if nm↑ wh( 1+ c@ 32 fill then 
  dup 20 = if  e↑ @ 1- 0 max e↑ !       
   drop 32 nm↑ 1+ e↑ @ + c!             
  else nm↑ 1+ e↑ @  + c!                
   e↑ @ 1+ 11 min e↑  !                 
  then nm.                              
else 13 = if 1 cr↑ ! then then ;        
                                        
: flip ( ---↑toggle best adv)           
  but.xy@ swap drop  ( y)               
  50 - 13 8 * -  ( offset to top)       
  8 /         ( adv#)                   
  dup stats( 80 + + dup                 
  c@ not swap c!                        
  adv.                                  
  begin b.d @ not until ;               



( edit.name)                            
 : edit.name ( ---) 0 e↑ ! 0 cr↑ !      
   1 53269 c!  ( 1 sprite)              
   nm.scr  ( draw the screen)           
   begin  ?terminal dup                 
     if ed.it else drop then            
     b.d @  if 6 19 13 20 but.xy@       
       pt.rct if flip then              
     then 21 24 21 23 but.xy@           
  pt.rct    ( ok button)                
  cr↑ @ or until ( return pressed)      
  save.names  save.stats ;              
: m.names ( ---) prog.status @          
  workshop.on@ = not                    
  if  8 0 do  ( adventures)             
     stats( 80 + i + c@                 
     if bl% else b% then                
     games( 6 + i + c! ( blue or black) 
 i adventure @ 1- = if 46 else 32 then  
     games$ 1 + games( 1+ c@ dup >r     
     3 * + r> i * +  c! ( curr adv)     
    loop then                           
16 0 do i cw.num @ 1- = if 46 else 32   
  then  wh$ 1 + wh( 1+ c@ i * + c!      
loop ;                                  

( chipwit game loader hi)               
196 208 thru ( draw.gameboard)          
313 319 thru ( menus)                   
311 312 thru ( zap, see sprites)        
291 307 thru  ( w2)                     
209 241 thru ( game)                    
308 310 thru  ( bads)                   
242 244 thru   ( cw master word)        
first here - . 245 load                 
( 255 load  ( dummy prog)               
" s0:game" dos save-forth "game"        
dr0                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

