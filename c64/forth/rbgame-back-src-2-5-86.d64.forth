(





(





(






(






( chipwit game loader hi)               
172 load     ( zap sprite )             
180 192 thru ( draw.gameboard)          
198 207 thru ( menus)                   
( env editor)                           
210 226 thru  ( w2)                     
260 298 thru ( game)                    
310 312 thru  ( bads)                   
173 load    ( env ed cursor sprite)     
230 255 thru ( env.edit)                
320 323 thru   ( cw master word)        
fre " s0:game" dos save-forth "game"    
dr0                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

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
                        
 ( ecr sprite env ed cursr) 2 base !    
s-def ecr.s                             
11111111 11111111 11111111              
11111111 11111111 11111111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11110000 00000000 00001111              
11111111 11111111 11111111              
11111111 11111111 11111111              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 000000 decimal        
: ecr.sp swapout                        
49152 205 64 * + ecr.s swapin ;         

(





(





(






(






(





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k
































 ( sounds)     hex                      
 : move.s  14d 0 7 d 0 f                
   p#    3fc a3 b bp  sound ;           
                                        
 : bump.s 5c3 0 a 0 0 f                 
   n#    0  38c e lp  sound ;           
 : zap.sd  3f68 6 b 5 0 f               
   p#    527 247 1 hp sound ;           
 : crunch     5f5 3 4 0 0 f             
   p#    527 435 4 lp sound ;           
 : see.sd  71c0 9 4 0 0 d               
   t# 0 187 4 hp  sound ;               
 : arm.s  250 3 9 7 0 f                 
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( clean.up)   exit                      
                                        
 : clean.up ( ---)                      
   64 0 do                              
     i square.object                    
     dup dup                            
      wall@ = swap door@ = or           
      swap floor@ = or not              
      if floor@ i room.data( + c!       
      then                              
   loop ;                               















( walls@)                               
 wall@ 3 + is walls@    exit            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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
  debug? or prog.status @ env.on@ = or  
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
















k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






exit                                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( debug menu strings)                   
 $c d+$ "debug on" $c d-$ "debug off"   
 $c f$ "fast"      $c s$ "slow"         
 $c st+$ "step"    $c st-$ "no step"    
 $c r+$ "see robot" $c r-$ "no robot"   
 var step  var db.sp  0 db.sp !         
: d.$ ( f-) 1 swap if d+$ else d-$ then 
 op$ op( s.it$     ;                    
: s.$ ( f-) 2 swap if f$ else s$ then   
  op$ op( s.it$     ;                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( db- debug.off)                        
                                        
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


                                        




 (   e.db get.rb put.rb)                
                                        
                                        
: e.db ( ---↑enter debug)               
  5 2 do i on  op( it+  loop            
  0 s.$ 1 t.$ 0 r.$ 0 d.$               
  1 53269 c! ;                          
                                        
: get.rb  ( ---)                        
  sprites.off                           
    1  cw.load  ( for now)              
    prog.status @                       
   workshop.on@ = if 1 new.cw !         
   else turn.game.off@ prog.status !    
  debug? not if  name. then  then ;     
                                        
  : put.rb ( ---)                       
  hot.chip @ no.chip@ =                 
  not if insert.it then sv.sp           
0 53269 c! edit.name 1 cw.save ( <<)    
       m.bar  1 53269 c!                
       1 new.cw ! ;                     
                                        
                                        
                                        
                        
 ( op.m  -    option.menu)              
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
 ;; 10 of abort ;;                      
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
  8 on rb( it+                          
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

( r.m robot.menu)                       
: r.m  ( ---)                           
  t.i @  case                           
( edit)                                 
     1 of workshop.on@                  
         prog.status ! ;;               
( new)                                  
     2 of ( new.robot) ;;               
( load)                                 
     3 of  get.rb ;;                    
                                        
                                        
                                        
( save)                                 
     4 of put.rb  ;;                    
                                        
                                        
                                        
                                        
     6 of cp.p cl.p ;;                  
     7 of cp.p ;;                       
     8 of ps.p ;;                       
     9 of cl.p ;;                       
   endcase ;                            


( env.load)                             
                                        
 : env.load ( ad#---) dsk               
  drop                                  
(  screen.off                           
  gm.sc  game.char name. screen.on)     
  prog.status @ dup  game.on@ =         
  swap series@ = or if                  
      turn.game.off@ prog.status !      
then                                    
   first 1024 1000 cmove                
      ( save game colors)               
    first  " a1c" lr                    
   first env.data( head.len@ cmove      
                                        
   swapout first 53248 2048 cmove       
   swapin  env.clr c@ m.bak2            
  1024 first 1000 cmove ( restore clrs) 
   1 53269 c! ;                         
                                        
                                        
                                        
                                        
                                        
                                        

( m.m mission  menu)                    
: m.m t.i @                             
 case                                   
   1 of prog.status @                   
     case workshop.on@ of               
       turn.game.on@ prog.status ! ;;   
      env.on@ of                        
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
  2 se$    ms$    ms( s.it$ ;;          
        0 last.mission !                
  2  lm$    ms$    ms( s.it$            
       series@ prog.status !            
   endcase ;;                           
endcase ;                               
                                        

( environment menu)                     
                                        
var new.env?                            
                                        
: e.m t.i @                             
   case                                 
 ( edit)                                
     1 of env.on@ prog.status ! ;;      
 ( new)                                 
     2 of 1 new.env? !          ;;      
 ( load)                                
     3 of  1 env.load     ( <<<)        
           2 new.env? ! ;;              
 ( save)                                
     4 of ( save environ) ;;            
  endcase ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( do.events)                            
                                        
 : do.events ( ---)                     
   m.ev   ( do menu events)             
   if t.m @                             
     case                               
       1 of m.m ;;                      
       2 of r.m ;;                      
       3 of e.m   ;;                    
       4 of op.m  ;;                    
     endcase                            
   then                                 
   ;                                    
exit                                    





                                        
                                        
                                        
                                        



k





k





k






k






k





k





k






k






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
   i ok@                                
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
  act#@ 1- 0 do i ok! loop              
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
                                        
                                        
: w.enter ( -) 1 0 op( it+              
  screen.off b% bk b% bd sprites.off    
  s2 w% s-c  off s-ml                   
  4 on rb( it+   ( savecw)              
  ( disable env load)                   
 10 6 do i on rb( it+ loop ( edit)      
  cb+ @ not if 9 off rb( it+  then      
  ( edit chosen again?)                 
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
                                        
  4 off rb( it+                         
 10 6 do i off rb( it+ loop ( edit)     
 ( enable env load)  ;                  

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
                                        
                                        







                                        

k





k





k






k






k





k





k






k






k





k





k






k






( env.data)                             
                                        
 create door.r( 4 8 * allot             
  ( 8 door rects)                       
 create next( 8 allot                   
  ( next doors)                         
 create this( 8 allot                   
  ( this door)                          
                                        
                                        
 var door#  ( current door 0-7 )        
 var sq#    ( current square 0-63)      
                                        
 var th     ( current insert thing)     
            ( door, lock or wall)       
 var rm.th  ( thing under cursor)       
                                        
 var old.rm#                            
 var old.door#                          
 var old.sq#                            
                                        
                                        
                                        
                                        
                                        
                        
 ( cl.btn save.rm save.hd)              
                                        
: cl.btn ( ---↑ clear button xy)        
 0 b.x ! 0 b.y ! ;                      
: sc.rm↑  ( room#---addr) 1- sc(        
 head.len@ + comp.rm.size@ rot * + ;    
                                        
: save.rm ( ---)                        
  ( take old env and compress)          
  swapout                               
  room.data(  64 +  ( src)              
  room# @ sc.rm↑ 32 + 16 cmove          
  ( save doors as is)                   
   32 0 do  ( 2 squares --> 1 byte)     
     room.data( i 2* +                  
     dup 1+ c@ swap c@  ( 2 squares)    
     catnib                             
     room# @ sc.rm↑ i + c!              
   loop                                 
   swapin ;                             
                                        
: save.hd ( ---↑save header info)       
 swapout                                
 env.data( sc( head.len@ cmove          
 swapin ;                               
                        
( news? room.cnt.)                      
                                        
: news? ( sq#--direction↑north,east..)  
  (            or 0 if not edge)        
  dup 0 7 within                        
  if drop n                             
  else dup 8 55 within                  
   if dup  squares.wide@ mod 0=         
     if drop  w                         
     else  squares.wide@ mod 7 =        
       if e else 0 then                 
     then                               
   else 55 > if s else 0 then           
   then                                 
  then ;                                
                                        
: room.cnt. ( ---)                      
 ( print room.cnt)                      
 b% char.color  0 2 d-position ." room" 
 1 3 d-position room# @ dup 10 <        
 if ."  " then .                        
 1 4 d-position  ." of"                 
 2 5 d-position room.cnt c@ .           
 ;                                      
                                        
                        
( new.rm  new.env e.rm ( erase room)    
                                        
$c new( " untitled        "             
  21052 ,                               
  1000 , 0 c, 0 c, 0 , 0 ,              
  255 c, 255 c, 255 c,                  
  0 c,                                  
  0 c, 100 c, 0 c, 100 c,  0 c, 100 c,  
  0 c, b% c,  8 allot                   
: e.rm ( -) 0 7 25 24 gl% color.block ; 
: new.rm  ( ---) e.rm                   
  ( load and save new empty room)       
 room.cnt c@ 1+ dup room# ! room.cnt c! 
  64 0 do                               
    i news? if                          
       wall@ else floor@ then           
    room.data( i + c!                   
  loop                                  
  room.data( square.count@ + 16 0 fill  
     ( doors)                           
  save.rm ;                             
                                        
: new.env ( ---)                        
  new( env.data( head.len@ cmove        
  new.rm ;                              
                        
( news. news.pt.rct cncl.rct ct.drs)    
                                        
: news. ( news---)                      
case n of ." top" ;;                    
     e of ." right" ;;                  
     w of ." left" ;;                   
     s of ." bottom" ;;                 
endcase ;                               
                                        
: news.pt.rct ( news---flag)            
 ( did button click on that wall?)      
 case n of 4 21 8 9 ;;                  
      e of 21 23 10 21 ;;               
      w of 1 3 10 21 ;;                 
      s of 4 21 22 23 ;;                
 endcase                                
   but.xy@ pt.rct ;                     
                                        
: cncl.rct ( ---rect of cancel btn)     
  15 24 4 6 ;                           
                                        
: ct.drs ( door sq#---door#)            
  0 k  !   0 do i sq.dl=                
                                        
  if 1 k +! then loop k @    ;          
                        
( new.doors)                            
: new.doors ( ---) door.r( 32 50 fill   
0  k ! square.count@ 0 do               
i sq.dl=                                
  if i news?  i square.xtyt rot         
  case                                  
   n of 1- over 2+ over ( rect)         
     4 pick 1+ 4 pick  ( rm# xy)        
     i i squares.wide@ - ( sq,next) ;;  
   e of swap 3 + swap over over 2+      
     4 pick 4 pick 1+                   
     i i 1+ ;;                          
   w of swap 1- swap over over 2+       
     4 pick 4 pick 1+                   
     i i 1- ;;                          
   s of 2+ over 2+ over                 
     4 pick 1+ 4 pick                   
     i i squares.wide@ + ;; endcase     
  k     @ next( + c!                    
  k     @ this( + c!                    
  d-position  k     @                   
  room.data( square.count@ + + c@ .     
  rot swap k     @ 4 * door.r( + !rect  
  1 k     +! then                       
loop draw.gameboard 1 53269 c!   ;      
                        
( in.dr <insert.door> point>sq curs.sq) 
                                        
: in.dr ( dr.sq#/cn.sq#/cn.rm#/door#---)
dup room.data( square.count@ + + dup >r 
   dup 1+ 8 4 pick 1+ - <cmove          
  ( open the room# array)               
   swap r@ c!  ( insert rm#)            
 r@ 8 + dup 1+ 8 4 roll 1+ - <cmove     
 r> 8 + c!     ( insert sq)             
 th @ room.data( rot + c!               
 draw.gameboard ;                       
                                        
: point>sq ( x/y---sq#)                 
  game.y@ - 16 / squares.wide@ *        
  0 max 56 min                          
  swap game.x@ -  24 / 0 max 7 min + ;  
                                        
: curs.sq  ( sq#---↑draws cursor on sq) 
   s2 w% s-c                            
   dup 8 mod 24 * game.x@ + ( x)        
   swap 8 / 16 * game.y@ +              
   frame s-position                     
   on s-enable  ;                       
                                        
                                        
                        
( connect.doors)                        
                                        
: connect.doors ( ---)                  
   e.rm                                 
   but.xy@ point>sq dup sq#  !          
   ct.drs door# !                       
   sq# @ old.sq# @ old.rm# @            
   door# @ in.dr save.rm                
    ( insert door into new room)        
   old.door# @                          
   door# @ old.door# !  door# !         
   old.sq# @                            
   sq# @ old.sq# ! sq# !                
   old.rm# @                            
   room# @ old.rm# ! dup room# !        
   load.room                            
   sq# @ old.sq# @ old.rm# @            
   door# @ in.dr                        
                                        
             ;                          
                                        
                                        
                                        
                                        
                                        
                        
 ( val.  #. )                           
                                        
: #. ( int ---↑prints signed #)         
  dup 0 < if 231 emit else ."  " then   
  abs                                   
  dup 1000 < if ."  " then              
  dup 100 < if ."  " then               
  dup 10 < if ."  " then                
  . ." " 229 emit ;                   
: p. 34 swap d-position 100 - 10 * #. ; 
: val. ( val# 0-5---)  ." "            
 case                                   
  0 of 31  6 d-position cycles @ dup    
    10000 < if ."  " then #. ;;         
 1 of oil.pnt c@ 13 p. ;;               
 2 of dsk.pnt c@ 15 p. ;;               
 3 of crp.pnt c@ 17 p. ;;               
 4 of food.cnt c@ 36 21 d-position . ;; 
 5 of crp.cnt c@ 36 23 d-position . ;;  
endcase ." " ;                         
                                        
                                        
                                        
                                        
                                        
                        
 ( erase.things env.things)             
                                        
 : erase.things ( ---)                  
 ( erase objects and clear rects)       
   blank.thing.rects                    
  4 2 24 6 gl% color.block              
  ;                                     
                                        
: env.things ( ---)                     
 th#@ 0 do                              
   arg.w.xy( i 4 * +                    
   dup c@ 40 = not                      
    if @xy                              
      i 4 - 7 * obj.block( + obj.       
                                        
                                        
    else drop then                      
 loop ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( edge.things, mid.things)              
: edge.things ( ---)                    
 ( draw legal edge objects)             
 rm.th @ dup  lock@ = swap door@ = or   
 if   7 9 3 4 wall@ af  then            
 rm.th @ wall@ =                        
 63 ct.drs 8 < and                      
 if 13 15 3 4 door@ af                  
    19 21 3 4 lock@ af then             
 env.things ;                           
                                        
: mid.things ( ---)                     
 ( draw legal midfloor things)          
 5 7 2 3 pie@ af                        
 9 11 2 3 coffee@ af                    
 13 15 2 3 disk@ af                     
 17 19 2 3 oil@ af                      
 21 23 2 3 kee@ af                      
 5 7 5 6 wall@ af                       
 9 11 5 6 floor@ af                     
 13 15 5 6 creep@ af                    
 17 19 5 6 bomb@ af                     
 env.things ;                           
                                        
                                        
                        
( room.hnd)                             
                                        
: room.hnd ( ---↑button down in room)   
  but.xy@ point>sq                      
  dup square.object rm.th !             
  dup sq# @ = not                       
  if dup news?  ( at edge)              
    if dup dup dup dup                  
     0 = swap 7 = or swap               
     56 = or swap 63 = or ( corners)    
     if drop                            
     else dup sq# ! erase.things        
       curs.sq                          
       edge.things then                 
    else                                
     dup  sq# ! erase.things            
     curs.sq                            
     mid.things                         
    then                                
  else drop then ;                      
                                        
                                        
                                        
                                        
                                        
                        
( door.hnd)                             
                                        
: door.hnd ( ---)                       
 8 0 do                                 
   door.r( i 4 * + @rect                
   but.xy@ pt.rct if                    
    save.rm  erase.things               
    i this( + c@ robot.square !         
    i next( + c@ dup 200 > if           
        256 - then check.next           
     ( minus next squares, north)       
    drop                                
    0 7 25 24 gl% color.block           
    new.doors                           
    room.cnt.                           
    0 sq# !                             
    leave then                          
 loop ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( val+-)                                
                                        
: val+-  ( x/y---[-1or1]/flag)          
( checks to see if mouse down in)       
( plus or minus part of rect)           
ddup swap dup 3 + rot dup  ( plus rect) 
but.xy@ pt.rct                          
if ddrop 1 1                            
else swap 4 + dup 3 + rot dup ( minus)  
 but.xy@ pt.rct                         
 if -1 1                                
 else 0                                 
 then                                   
then ;                                  
create p( oil.pnt , dsk.pnt , crp.pnt , 
: cyc+ ( ---flag )  0                   
  30 6 val+- if 100 * cycles @ +        
   0 max 32000 min cycles ! 0 val.      
  1+  then ;                            
: pt+ ( ---flag) 0                      
  3 0 do 33 13 i 2* + val+-             
   if  i 2* p( + @ dup c@ rot +         
    0 max 200 min swap c!               
    i 1+ val. 1+ leave then             
  loop ;                                
                        
( ct+ clr+ val.hnd)                     
: ct+ ( ---flag) 0                      
2 0 do 33 21 i 2* + val+-               
 if  i 0= if food.cnt else crp.cnt then 
    dup c@ rot +                        
    0 max  10 min swap c!               
    i 4 + val. 1+ leave then            
  loop ;                                
                                        
: clr+ ( ---)                           
  31 35 9 9 but.xy@ pt.rct              
  if env.clr c@ 1+                      
   dup dup w% = swap b% = or if 1+ then 
     16 mod  dup m.bak2                 
     env.clr c! then ;                  
                                        
 : val.hnd ( ---)                       
   cyc+ not                             
   if pt+ not                           
     if ct+ not                         
       if clr+                          
       then                             
     then                               
   then                                 
   cl.btn ;                             
                        
( btn,  wnd1   cncl)                    
: btn ( wd/x/y---) bl% char.color ddup  
ddup d-position  34 emit d-position     
34 emit 3 pick 0 do ." &" loop ." #'" 
   ddup 1+ d-position ." )"             
   ddup 2+ d-position ." %"             
   3 roll 0 do ." (" loop ." $"         
   swap 1+ swap 1+ d-position ;         
: cncl ( -) 8 15 4 btn ."  cancel" ;    
: wnd1 ( ---flag) s.sc cncl cl.btn      
( 0=cancel,1=new room,2=old room)       
5 2 d-position ." connect to"           
 color-mem 40 r% fill room.cnt c@       
 50 < if 3 5  3 btn ." new" then        
 3 10 3 btn ." old"                     
 8 6 d-position ." room▒"               
 begin 5  9 3 5 but.xy@ pt.rct          
     room.cnt c@ 50 < and if 1 1 ( new) 
     else 10 14 3 5 but.xy@ pt.rct      
      if 2 1 ( old)                     
      else cncl.rct but.xy@ pt.rct      
       if 0 1 ( cancel) r.sc            
       else 0                           
     then then then                     
   until cl.btn ;                       
                        
( w2        new room door)              
: dr. ( -) 5 2 d-position ." click "    
old.sq# @ news? 4 + 8 mod               
 news. ."  wall to" ;                   
: w2 ( ---flag)                         
 ( 0 = cancel, 1 = door connected)      
 save.rm   s2 off s-enable              
 new.rm draw.gameboard                  
 room.cnt. s.sc                         
 dr.                                    
                                        
                                        
 5 3 d-position ." connect door▒"       
 cncl                                   
 begin                                  
  old.sq# @ news? 4 + 8 mod news.pt.rct 
  if 1 1                                
        connect.doors                   
  else cncl.rct but.xy@ pt.rct          
    if room.cnt c@ 1- room.cnt c!       
       0 1  r.sc                        
    else 0 then                         
  then                                  
 until                                  
 cl.btn ;                               
                        
( old.cn connect old room o.dr.)        
                                        
: old.cn ( --connect flag)              
  old.sq# @ news? 4 + 8 mod news.pt.rct 
  if  ( clicked on correct wall)        
    but.xy@ point>sq                    
    square.object wall@ =               
    if connect.doors 1                  
    else 0 then                         
  else 0 then cl.btn ;                  
                                        
: ck.dl ( ---flag↑ are there less than) 
( 8 doors or less than 7 if in 1st rm?) 
63 ct.drs 8 <                           
 room# @ old.rm# @ = if                 
   drop 63 ct.drs 7 < then ;            
: o.dr. ( old door print)               
  ck.dl if dr.                          
    5 3 d-position ." connect door or"  
  then                                  
  5 4 d-position ." click door"         
  5 5 d-position ." number for"         
  5 6 d-position ." old room▒"          
  cncl  ;                               
                                        
                        
( w3 old room door)                     
                                        
: w3 ( ---flag) cl.btn                  
  ( 0=cncl, 1 = connected)              
  save.rm s2 off s-enable               
  o.dr.                                 
                                        
                                        
                                        
  begin                                 
   1 24 8 23 but.xy@ pt.rct             
   ck.dl and                            
   if ( check for right door)           
     old.cn                             
     if 1 1 else 0 then                 
   else 0 25 7 24 but.xy@ pt.rct        
    if save.rm door.hnd 0               
       cl.btn o.dr.                     
    else cncl.rct but.xy@ pt.rct        
      if 0 1                            
      else 0 then                       
    then                                
   then                                 
  until ;                               
                                        
                        
( cl.dr  close door)                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( add.door)                             
var st.rm# ( starting room)             
: add.door ( ---)                       
  room# @ dup  old.rm# ! st.rm# !       
  sq# @ ct.drs old.door#  !             
  sq# @ old.sq# !                       
                                        
  begin                                 
    erase.things                        
    wnd1  ( new room, old room?)        
    erase.things                        
    case 0 of 1 ( cancel) ;;            
         1 of                           
              w2  ( new room door)      
              ;;                        
         2 of w3 ( old.rm.dr) ;;        
    endcase                             
                                        
    save.rm                             
    st.rm# @ dup load.room room# !      
    new.doors  room.cnt.                
    0 sq# !                             
  until m.bar                           
  erase.things cl.btn ;                 
                                        
                        
( env.th.hnd environment thing handler) 
                                        
 : env.th.hnd ( ---)                    
    th#@ 0 do                           
      arg.w.xy( i 4 * + @rect but.xy@   
      pt.rct if                         
        sq# @ news?                     
        if ( outer wall) i th !         
         i door@ = i lock@ = or         
         if add.door                    
         else  ( close.door)            
         then                           
        else                            
         i room.data( sq# @ + c!        
         draw.gameboard                 
        then                            
      then                              
    loop ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( env.ms environment mouser)            
                                        
: env.ms ( ---)                         
   1 24 8 23 but.xy@ pt.rct             
   if room.hnd                          
   else 0 25 7 24 but.xy@ pt.rct        
     if door.hnd                        
     else 5 23 2 6 but.xy@ pt.rct       
       if env.th.hnd                    
       else 30 39 6 23 but.xy@ pt.rct   
         if val.hnd then                
       then                             
     then                               
   then ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
  ( e.scrn)                             
: <. 228 emit ."      " 229 emit ;      
: e.scrn ( ---↑env edit screen)         
 1 53269 c! ( bye robot)                
 bak.c bk w% bd                         
 0 2 39 24 gl% color.block              
 0 1 39 1 w% color.block                
 room.cnt.                              
 28 2 d-position ." environment"       
 31 5 d-position ." cycles"             
 30 6 d-position 228 emit ."       "    
 229 emit 31 8 d-position ." color"     
 31 9 d-position ." UUUUU"            
 27 11 d-position  ." ↑↑ points ↑↑↑"   
 29 13 d-position ." oil " <.           
                                        
 28 15 d-position ." disk " <.          
 28 17 d-position ." crab " <.          
                                        
 27 19 d-position ." ↑↑ maximum ↑↑"     
 28 21 d-position ." food "  <.         
 27 23 d-position ." crabs " <.         
 6 0 do i val. loop                     
                                        
 new.doors draw.gameboard ;             
                        
( e.enter)                              
                                        
: e.enter ( ---)                        
 screen.on ( later screen.off)          
 game.char                              
 1 m-c  0 new.env? !                    
 0 rob+ ! ( turn off robot draw)        
 1 room# !                              
 1 load.room                            
 e.scrn erase.things                    
 s2 ecr.sp off s-enable 205 s-pt        
 off s-yexp off s-xexp                  
   ( setup cursor sprite)               
 screen.on ;                            
                                        
                                        
 : e.leave ( ---)                       
   1 rob+ ! save.rm save.hd ;           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( env.edit)                            
                                        
: env.edit ( ---)                       
  e.enter                               
  begin                                 
    do.events  i-t                      
    new.env? @ case                     
     1 of  new.env e.enter ;;           
     2 of e.enter ;;                    
    endcase                             
    depth if 0 0 d-position depth .     
       dup . then                       
    b.d @ if env.ms then                
    prog.status @ env.on@ = not         
  until                                 
  e.leave ;                             
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
k





k





k






k






k





k





k






k






k





k





k






k






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








( calc.robot.move )                     
 forth                                  
 : calc.move ( --- next sq#)            
  robot.orientation @                   
   arg.byte c@ 64 mod check.mov.st      
   reverse@ = if 4 + 8 mod then         
   robot.square @ next.square ;         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

( goto.next.room)                       
var room#                               
: next.room ( sq#---nextroom sq#)       
 erase.robot  ( from last room)         
 0 robot.square @ 0 do                  
   i sq.dl= if 1+ then                  
 loop                                   
 dup 8 +  ( next room/next sq↑ )        
 room.data( square.count@ + + c@        
 robot.square !                         
 ( get next door sq from and store)     
 room.data( square.count@ + + c@        
 dup room# !                            
 load.room                              
 ( load next room#)                     
 prog.status @ env.on@ = not if         
   0 add.points then                    
 rob? if init.cw then                   
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
  dup  creep@ =                         
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
  case                                  
    coffee@ of 1200 update.fuel ;;      
    oil@ of oil.pnt c@  100 -   10 *    
      add.points ;;                     
                                        
   disk@ of dsk.pnt c@ 10 100 - *       
     add.points ;;                      
                                        
  endcase  destroy ;                    
                                        
                                        
: zap.it ( sq#--) dup square.object     
  case creep@ of                        
    crp.pnt c@ 100 - 10 *               
    add.points ;;                       
                                        
                                        
                                        
                                        
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
    if                                  
    else dup  zap.it                    
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
 dup wall@ = swap creep@ = or           
                                        
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
 else drop arm.in then then ; exit      
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
   env.clr  c@ dg% = if y%  s-c then    
   ( yellow arm over dark green back)   
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
: look ( object---) off seen ! s3       
 rob.or.sq@                             
 ddup next.square check.next            
 drop                                   
 8 0 do  ( search loop)                 
   ddup next.square swap drop           
   dup square.object dup                
   floor@ =                             
   floor@ arg.byte c@ 64 mod = not and  
   ( floor not looked for)              
   if drop ( just floor)                
     else ( over sightline ) 4 pick =   
   if  ( search object seen)            
     see.sd y% s-c   ( flash glasses)   
     on seen !                          
     i 1+ update.range ( sqs to obj)    
     then leave                         
   then                                 
 loop                                   
 seen @ 0= if see.sd 3000 v-f r% s-c    
 false.flow then ( correct obj unseen)  
 drop ddrop 18 wt   g% s-c ;            
                                        

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
                                        
: d?  ( ---obj/flag   )                 
 arg.byte c@ 64 mod check.obj.st        
 dup obj.empty@ = not ;                 
: df drop false.flow ;                  



                                        
                                        
                                        
                                        
                                        

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
                                        















                                        
                                        
                                        
                                        

( subp bmr)                             
                                        
var r↑                                  
                                        
: sub ( ---↑subpanel)                   
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





                                        
                                        

( step? spd)                            
                                        
                                        
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

 ( op.case)                             
 : op.case ( opcode--) get.arg          
case go.marker@ of no.key@ up.key       
 28 4 d-position current.panel @        
 ." " 65 + emit i-t ;;  subpanel@      
 of sub ;; boomerang@ of bmr ;;         
 qray@ of zap ;; sing@ of sing ;;       
 pick.up@ of pick.up ;;                 
 move@ of move.robot ;;                 
feel.for@ of d? if feel else df then ;; 
look.for@ of d? if look else df then ;; 
 smell@ of d? if smell else df then ;;  
 coin@ of coin ;; key@ of keypress ;;   
n=@ of ar@ num= ;; n<@ of ar@ num< ;;   
o=@ of ar@ obj= ;; m=@ of ar@ mov= ;;   
on.n@ of ar@ on.n ;;  on.o@ of ar@      
on.o ;; on.m@ of ar@ on.m ;;            
st-@ of ar@ d.stk ;; plus@ of plus ;;   
minus@ of minus ;;                      
endcase ;                               
                                        
                                        
                                        
                                        
                                        
                        
( execute.robot.instruction)            
                                        
: do.inst ( --)                         
 s2 off s-enable                        
 prog.status @ dup game.on@ =           
 swap series@ = or                      
 if ?terminal dup                       
  if up.key else drop then              
  get.action                            
  dup cycles( + c@ negate count.cycle   
  dup fuel( + c@ negate update.fuel     
  op.case                               
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
                                        
  cycles @                              
  cycle.ct !                            
  room.cnt c@  irnd                     
  1 + load.room   ( for now)            
  begin square.count@ irnd dup          
   robot.square ! square.object         
   floor@ = until ( random start)       
 8 irnd  cw.point                       
   init.cw                              
    ;                                   
                                        
                                        
                                        

 ( start.game stop.game )               
: leave.game ( ---)                     
   1 g.on$ ms$ ms( s.it$                
   2 on  ms( it+                        
   1 off op( it+ l.db                   
   2 se$ ms$ ms( s.it$ ;                
 : start.game ( ---)                    
  1 g.off$ ms$ ms( s.it$                
                                        
                                        
  frame  ( screen.off)  init.game       
   gm.sc   name.                        
   chip#.                               
   0 update.damage  0 update.range      
   0 add.points  0 count.cycle          
   0 update.fuel  clear.stacks          
  frame  draw.gameboard  screen.on      
  1 on op( it+                          
   prog.status @ series@ =              
   not if game.on@ prog.status ! then ; 
 : stop.game ( ---)                     
   prog.status @ series@ = not if       
     game.off@ prog.status !            
     leave.game then ;                  
                                        



























k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






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
  if dup 4 roll cr( + c! ( sq#/nx#)     
   swap destroy  ( nextsq#)             
   dup room.data( + creep@ swap c!      
       ( store creep in room)           
                                        
  else drop swap drop then ( sq#)       
 else swap drop                         
 then rnd.crp ;                         
                                        
                                        

( move.baddies)                         
                                        
 : bads ( ---)                          
  6 irnd 0 do                           
   crp# @ irnd dup cr( + c@             
   55 min  ( no garbage #'s)            
         ( creep#/creep sq#)            
   dup square.object creep@ =           
     ( creep is still there)            
   if crp.mv                            
   else ddrop                           
   then                                 
  loop ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

                                        

k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






  ( game)                               
: game ( ---)                           
                                        
  begin  bads                           
   do.inst                              
( v1 off v-ctrl )                       
                                        
(  0 22 d-position depth dup .          
   0> if dup . then  )                  
   do.events                            
  prog.status @ dup game.on@ =          
  swap series@ = or not until           
                                        
   update.stats                         
  prog.status @ dup workshop.on@ = not  
  swap env.on@ = not and                
  if stats.screen then                  
  leave.game ;                          
                                        
                                        
                                        
                                        
                                        



 ( init.rb)                             
: init.rb ( ---)                        
  0 198 c!  ( keybd buff 0)             
  128 657 c! ( disb sft/comm)           
(   193 792 c! ( shift restore<<<<<<)   
  game.off@ prog.status !               
  s4 w% s-c  s6 lr% s-c s5 w% s-c       
  s3 g% s-c s7 b% s-c s8 b% s-c         
                                        
  63488 96 8 * -                        
  " rb.chr" lr                          
  first " cw.scr" lr swapout            
  first sc( 2048 + 1000 cmove           
  swapin  ( move game chars high)       
  first 1000 + first 1000 cmove         
  1024 " js" lr j?  ( koal or joyst)    
  screen.off  7 charbase s.i            
  g.m.i b% m.bak1                       
 off game.char? !                       
  1 cw.load  ( for now <<<<)            
 1 env.load  ( for now)                 
 57344 " cw.spr" lr  i-joy              
  start.game  stop.game  leave.game     
  0 cb+ !  ( no paste panel) ;          
                                        

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
    2 lm$ ms$ ms( s.it$                 
    1 g.off$ ms$ ms( s.it$              
    8000 0 do do.events loop            
    prog.status @ game.on@ = if         
      turn.game.off@ prog.status ! then 
  then ;                                
                                        

 ( rb       )                           
                                        
: rb       ( ---)                       
  init.rb                               
  begin 1000 irnd drop  i-t             
   prog.status @                        
    case game.off@ of do.events ;;      
         game.on@ of                    
   2 off ms( it+  game ;;               
    turn.game.on@ of start.game ;;      
       series@ of series ;;             
   turn.game.off@ of stop.game ;;       
   game.aborted@ of die     ;;          
   game.finished@ of end     ;;         
   workshop.on@ of workshop ;;          
   env.on@ of env.edit ;;               
                                        
                                        
                                        
    endcase                             
  again ;                               





k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






