

























( joystick menu load screen)            
( start forth interrupt)                
                                        
172 175 thru ( vars & sprite)           
                                        
 g.m.i (  char.copy)                    
                                        
                                        
 180 189 thru  ( joystick stuff)        
                                        
 200 207 thru  ( menu stuff)            
                                        
 250 254 thru ( menu test)              
                                        
 260 load     ( frame)                  
 279 284 thru ( machine lang progs)     
 forth   a-remove                       
 : it ;                                 
                                        
 ( 320 329 game & workshop screens)     
 ( 310 -311 are scenario savers)        
                                        
                                        
                                        
                                        

( cursor vars)                          
                                        
variable b.d  0 b.d ! ( button.down)    
                                        
variable b.x  ( button down pos)        
variable b.y                            
0 b.y ! 0 b.x !                         
exit                                    









                                        


                                        
                                        
                                        
                                        

 ,▁lAci(Q@Og
( curs.spr)     exit                    
2 base !                                
s-def curs.spr                          
11111111 11110000 00000000              
11111111 11100000 00000000              
11111111 11000000 00000000              
11111111 10000000 00000000              
11111111 10000000 00000000              
11111111 11000000 00000000              
11111111 11100000 00000000              
11111111 11110000 00000000              
11110011 11111000 00000000              
11100001 11111100 00000000              
11000000 11111110 00000000              
00000000 01111110 00000000              
00000000 00111100 00000000              
00000000 00011000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
00000000 00000000 00000000              
decimal                                 

( graph.mem.initgraph.load,set m.bak1,2)
                                        
 : g.m.i ( ---↑graph.mem.init)          
   3 bank 3 screen                      
   3 16 * 4 + 53272 c! ( out to 0 scr)  
   204 648 c!  ( scr 192 * 256)         
   147 emit ( clear screen)             
   7 charbase ;                         
                                        
 : gr.ld  ( ---↑graph.load)             
   63488 96 8 * -  " cw.chr" lr         
   57344 " cw.spr" lr ;                 
                                        
 : m.bak1  ( color---↑set multi clr1)   
   53282 c! ;                           
                                        
 : m.bak2  ( color---)                  
   53283 c! ;                           
 exit                                   
 : char.copy ( ---)                     
   56334 c@ 254 and 56334 c!            
   1 c@ 251 and 1 c!                    
   53248 61440 4096 cmove               
   1 c@ 4 or 1 c!                       
   56334 c@ 1 or 56334 c! ;             

 ( char.color color assignments)        
                                        
 : char.color  ( color---)              
 ( switches character colors)           
 case b%    of ." " ;;                 
 w%    of ." " ;; r%  of ." " ;;      
 c%   of ." " ;; p%     of ." " ;;    
 g%    of ." " ;; bl%  of ." " ;;     
 y%     of ." " ;;                     
 o%     of ." " ;; br%   of ." " ;;   
 lr%    of ." " ;; dg%     of ." " ;; 
 mg%      of ." " ;;                   
 lg%      of ." " ;;                   
 lb%     of ." " ;;                    
 gl%     of ." " ;;                    
 endcase ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
k





k





k






k






( code test for js or koala) decimal    
 dp @ 1024 dp !   0 c,                  
 hex  create <t> assembler              
  pa@ sta, ( trigger paddle)            
  80 # ldy, ( wait)                     
  begin, nop, dey, 0= until,  decimal   
  sid@ 25 + ldx, inx,                   
  0= not if,                            
   sid@ 26 + ldx, inx, hex              
   0= not if, 400  sta,                 
   then, then, rts,                     
 create  <j?> xsave stx,                
  php, sei, ( disable interrupts)       
  pa@ lda, pha, ca@ lda, pha,           
     ( save por values for kbd)         
  c0 # lda, ca@ sta, ( ddr for paddle)  
  0 # lda, 400  sta, ( clear flag)      
  80 # lda, ' <t> jsr, ( port one?)     
  40 # lda, ' <t> jsr,                  
  pla, ca@ sta, pla, pa@ sta, ( port)   
  plp, xsave ldx,                       
  rts,  decimal  here dup . ." end" cr  
 dp !  ' <j?> . ." ' <j?> " 0 savename  
 c! savename " @0:js" $concat           
 1024 swap save                         
                        
( <b.d> button down sub)                
 hex                                    
 create <b.d> assembler                 
    1 #   lda,                          
    b.d sta, ( turn on var)             
    d001 lda,        ( spr0 y)          
    b.y    sta,                         
    d000 lda,        ( spr0 x lo)       
    b.x    sta,                         
    d010 lda,        ( spr0 x hi)       
    b.x 1+ sta,                         
 rts,                                   
 decimal forth                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( sv.sp r.sp 1off)                     
                                        
                                        
 variable sp↑                           
                                        
 : sv.sp ( ---↑ save sprites)           
  53269 c@ sp↑ c! ;                     
                                        
 : r.sp ( ---↑restore sprites)          
   sp↑ c@ 53269 c! ;                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( pt.in.rect)                           
: pt.rct                                
 ( lcrx/rx/ty/by/ptx/pty--flag)         
 ( determine if pt is in rectangle)     
 ( rect coord in character scale)       
swap >r                                 
 50 - 8 /  ( y in char coords)          
 dup rot > ( lx/rx/ty/pty/f)            
 rot rot > or not  ( in y range)        
 if                                     
   r> 24 - 8 /  ( x in char coords)     
   dup rot >  ( lx/ptx/f)               
   rot rot >  or not ( in x range)      
   if  1 else 0 then                    
 else r> drop ddrop                     
 0 then ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( joy.read vars)                        
                                        
 51 constant j.t ( joy top)             
 235 constant j.b ( bot)                
 25 constant j.l  ( left)               
 329 constant j.r ( right)              
 j.r 256 - constant j.lo ( low byte)    
                                        
 create pd 1 allot ( 0=jst 40,80 koala) 
                                        
                                        
 hex                                    
 dc00 constant pa@ ( porta)             
 dc02 constant ca@ ( ciddra)            
 d400 constant sid@ decimal             
                                        
                                        
exit                                    
 file " js" is loaded into ram at 1024  
 and the j? word will jump to it        
                                        
                                        
                                        
                                        
                                        
                        
( j?  <koal>)                           
decimal                                 
code j?                                 
 ( loads in paddle checker code)        
 1067 jsr,                              
 1024 lda, pd sta,   next jmp,          
end-code                                
hex create tp 1 allot                   
create <koal> assembler                 
 ( php, sei, ( disable interrupts)      
 pa@ lda, pha, ca@ lda, pha,            
  ( save keyboard)                      
 c0 # lda, ca@ sta, ( ddr)              
 pd lda, pa@ sta, ( trigger right pad)  
 80 # ldy,  ( wait)                     
 begin, nop, dey, 0= until,             
 sid@ 19 + lda,  ( x value)             
 tp sta,                                
 .a lsr, .a lsr,                        
 clc, tp adc,                           
  ( multi by 1.25)                      
 d000 sta,  ( set x.lo)                 
 0 # lda, .a rol, tp sta, d010 lda,     
 fe # and, tp ora, d010 sta,            
   ( set x hi)                          
                        
( <koal> cont)                          
hex                                     
sid@ 1a + lda,  ( get y)                
d001 sta,                               
pa@ lda,                                
pa@ 1+ and,  ( read both buttons)       
                                        
0c # and,   ( bits 3,4)                 
c # cmp,                                
0= not if, ' <b.d> jsr, then,           
( carry will indicate button on)        
pla, ca@ sta, pla, pa@ sta,             
 rts,                                   
                                        
forth decimal                           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( machine lang read.joy)   hex          
code   r.joy                            
  d019     lda,  ( get interrupt flags) 
 1 # and, 0=  ( raster interrupt?)      
 if, ' i-system  jmp,  ( exit to sys)   
 else,  ( my interrupt)                 
  d019     sta,  ( clear it)            
  0 # ldx,  b.d stx, ( clear)           
  pd lda, 0 # cmp, 0= not if,           
    ' <koal> jsr,                       
  else, dc00    lda,                    
   7f #      cmp, ( 7f = no joy)        
    0= not if,     ( joy active)        
     .a    lsr,   ( up test)            
     cs not if,      ( up button)       
      d001 ldy,  ( grab spr0 y)         
      j.t #  cpy, ( at top?)            
      0= not if, dey, dey, then, ( no)  
      d001 sty,  ( new spr0 y) then,    
     .a    lsr,   ( down test)          
     cs not if,   ( down thrown)        
      d001 ldy,  ( get spr0 y)          
      j.b # cpy,  ( at bot?)            
      0= not if, iny, iny, then, ( no)  
      d001 sty,  then,                  
                        
( machine read.joy  cont.d)             
   .a   lsr,  ( left.test)              
   cs  not   if,                        
     d010 ldx, d000 ldy, ( spr0 x h/l)  
     1 # cpx, 0= not if, ( spr0<255)    
       j.l # cpy,  ( left edge?)        
       0= if, iny, iny, then, ( back)   
     then,                              
     dey, dey, ff # cpy, ( cross seam)  
     0= if, d010 dec, then,             
     d000 sty,  ( new spr0 x)           
   then,                                
   .a   lsr, ( right test)              
   cs not  if,  ( right button)         
     d010 ldx,  d000  ldy,              
     1 # cpx,  ( spr0 >255?)            
     0= if,    ( yes)                   
       j.lo # cpy,  ( rt edge?)         
       0= if, dey, dey, then, ( back)   
     then,                              
     iny, iny, 1 # cpy, ( move right)   
     0= if, d010 inc, then, ( spr0 hi)  
        ( if 1 then inc hi bit)         
     d000 sty,                          
   then,                                
                        
( machine read.joy end)                 
     .a    lsr,                         
   cs not   ( fire button pushed?)      
   if,                                  
    ' <b.d> jsr,                        
   then,                                
  then,  ( joy stick active)            
  then, ( back from koala?)             
 then,                                  
 ' bnc# lda, 0= not if, ( yes bouncer)  
   ' game.status lda, 0= if, ( no dbg)  
     a2 lda,  ( read jiffy timer)       
      6 # cmp, cs if,  ( 1/2 second)    
       ' <spin.b> jsr,                  
     0 # lda, a2 sta,  then,            
   then, then,                          
 ' i-user  jmp, ( no sys interrupt)     
 end-code  decimal                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( machine joy.test) exit <<<            
s1 on   s-enable                        
 100 100 s-position                     
: joy.test                              
                                        
                                        
                                        
   10000 0 do                           
     100 0 do  read.joy loop            
   loop ;                               
                                        
                                        
 : joy.timer ( ---)                     
   0. settim                            
   30000 0 do loop                      
   rdtim drop 6 / .                     
   ." 30000 empty loop" cr              
   0. settim                            
   30000 0 do loop                      
   rdtim drop 6 / .                     
   ." 30000 empt loop" cr               
  ;                                     
                                        
                                        
                                        
                        
 ( i-joy)                               
 : i-t  ( ---↑restore interrupt)        
 251 53266 c! ( raster int lo byte)     
 56334 c@ 254 and 56334 c!              
 ' r.joy 6 i-set                        
 53274 0 mask sbit ( enable rast int)   
 56334 c@ 1 or 56334 c!                 
 53265 7 mask cbit ( clear hi bit) ;    
 : i-joy  ( ---)                        
 ( set up cursor joystick interrupt)    
 788 @ 59953 = if i-init then           
  ( forth irq rotuine setup)            
( -12352 curs.spr  ( put cursor gr)     
 s1 184 s-pt on s-ml                    
 j.l j.t s-position                     
 dg%     s-c w%    1 s-m                
 on s-enable                            
 i-t  ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( but.xy@)                              
                                        
code but.xy@ ( ---butx/buty)            
  ' b.x lda,                            
  dex, dex,                             
  bot sta,                              
  ' b.x 1+ lda,                         
  bot 1+ sta,                           
  ' b.y lda, pha,                       
  0 # lda,                              
 push jmp,                              
end-code                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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






( m.bar  ( draw.menu.bar)               
  : m.bar ( ---)                        
    0 0 d-position ."  warehouse "     
    ."  workshop "                      
    ."  games "                         
    ."  options    "  ;                 
 create m.x(                            
 ( x bounds of each menu heading)       
 1 c, 9  c,     ( warehouse)            
 12 c, 19 c,   ( workshop)              
 22 c, 26 c,   ( games)                 
 29 c, 35 c,   ( options)               
                                        
 1024 constant cl.b(                    
create sc.b( 800 allot ( screen.buff()  
 : s.sc ( ---)                          
   color-mem  cl.b( 800 cmove           
   'screen sc.b( 800 cmove ;            
 : r.sc ( ---↑restore.screen)           
   0 19 do                              
     sc.b( i 40 * +                     
     'screen i 40 * + 40 cmove          
     cl.b( i 40 * +                     
     color-mem i 40 * + 40 cmove        
   -1 +loop ;                           

( disp.item hilight.item)               
variable m.wd  ( width of item $)       
variable m.hi  ( # of items)            
variable m.x   ( left edge of menu)     
variable m$.addr                        
variable menu(                          
: d.it ( color/item#---)                
  m.x @ 1- over 1+ d-position           
  ." '"  swap char.color               
  dup m.wd @ * ( index into men$)       
  m$.addr @ + 1+  ( addr$)              
  m.wd @  type   ( count)               
  ." )" drop ;                         
                                        
: bot ( ---↑bottom shadow of menu)      
  m.x @ 1- m.hi @ 1+ d-position         
  b%    char.color  45 emit ( left)     
  m.wd @ 0 do 38 emit loop              
  44 emit  ( rt shadow)  ;              
                                        
: h.it ( color/item#---)                
  1+ 40 * m.x @ +  color-mem +          
  m.wd @ rot fill ;                     
                                        
                                        
                        
( show.menu disabled, men$, item.off)   
variable arr↑ ( menu array)             
: sh.m ( string addr/arr adrr--)        
  dup c@ m.x ! dup 1+ c@ m.wd !         
  dup 2+ c@ m.hi !                      
  arr↑ ! m$.addr !                      
  m.hi @ 0 do                           
   arr↑ @ 3 + i + c@ ( color?)          
   i d.it  loop                         
  bot ;                                 
                                        
: d,  ( ---)                            
( compile 16 0's for item enabled       
  array)                                
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 
;                                       
: m$, ( string addr---)                 
  m$.addr @ swap $+ ;                   
: it- ( item#/color---)                 
  swap 2+ menu( @ +  c! ;               
                                        
: it+  ( item#/flag/menuad---)          
 menu( ! 0 = if r%  else b%    then     
 it-      ;                             
                        
( warehouse)                            
create wh(  1 c, ( left edge)           
 11 c,  ( width)  16 c, ( height)       
 d,                                     
16 11 * $v wh$                          
0 wh$  c!                               
16 m.wd ! wh$ m$.addr !                 
"  greedy    " m$,                      
"  mister cw " m$,                      
"  3         " m$,                      
"  4         " m$,                      
"  5         " m$,                      
"  6         " m$,                      
"  7         " m$,                      
"  8         " m$,                      
"  9         " m$,                      
"  10        " m$,                      
"  11        " m$,                      
"  12        " m$,                      
"  13        " m$,                      
"  14        " m$,                      
"  15        " m$,                      
"  16        " m$,                      
: wh.m.                                 
wh$ wh( sh.m ;                          
                        
( workshop)                             
create ws(  12 c, ( left edge)          
 12 c,  ( width)  8 c, ( height)        
 d,                                     
8 12 * $v ws$                           
0 ws$ c! ws( menu( !                    
16 m.wd ! ws$ m$.addr !                 
" enter       " m$,                     
" ............" m$, 2 r% it-            
" save chipwit" m$,                     
" ............" m$, 4 r%  it-           
" cut panel   " m$,                     
" copy panel  " m$,                     
" paste panel " m$,                     
" clear panel " m$,                     
                                        
: ws.m.                                 
 ws$ ws( sh.m ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( games)                                
create games(  22 c, ( left edge)       
 15 c,  ( width)  11 c, ( height)       
 d, games( menu( !                      
11 15 * $v games$                       
0 games$ c!                             
16 m.wd ! games$ m$.addr !              
"  start game    " m$,                  
"  series        " m$,                  
"  .............." m$, 3 r% it-         
"  greedville    " m$,                  
"  chipwit caves " m$,                  
"  doom rooms    " m$,                  
"  peace paths   " m$,                  
"  memory lanes  " m$,                  
"  octopus garden" m$,                  
"  mystery matrix" m$,                  
"  boomtown      " m$,                  
: gm.m.                                 
games$ games( sh.m ;                    
                                        
                                        
                                        
                                        
                                        
                        
( options)                              
create op(  29 c, ( left edge)          
 9 c,  ( width)  6 c, ( height)         
 d,                                     
6 9 * $v op$                            
0 op$ c! op( menu( !                    
16 m.wd ! op$ m$.addr !                 
" debug on " m$,                        
" see robot" m$,                        
" slow     " m$,                        
" step     " m$,                        
" ........." m$, 5 r%  it-              
" quit     " m$,                        
                                        
: op.m.                                 
 op$ op( sh.m ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( set.item$)                           
                                        
: s.it$ ( item#/straddr/men$/men(--)    
 1 + c@  >r  ( width)                   
 1+ m$.addr !                           
 swap 1- r@ *  m$.addr @ + ( str/it$)   
 ( start address of item$)              
 dup r> 32 fill  ( erase old)           
 swap count    ( it$/str$/cnt)          
 swap            ( it$/cnt/str$)        
 rot rot cmove  ;                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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






( in.menu.bar?)                         
                                        
variable t.m                            
variable t.i                            
variable m.rt                           
variable i#                             
 : bar? ( ---flag)                      
 0 39 0 0  ( x/x/y/y)                   
 but.xy@                                
 pt.rct ;                               
                                        
 create m(                              
 wh( ,                                  
 ws( ,                                  
 games( ,                               
 op( ,                                  
                                        
 create menu$(                          
 wh$ ,                                  
 ws$ ,                                  
 games$ ,                               
 op$ ,                                  
                                        
                                        
                                        
                        
( which.menu show.menu)                 
: m# ( ---menu# or 0)                   
  0 ( leave false on stack)             
  4 0 do                                
    i 2* m.x( + dup                     
    c@ swap 1+ c@ ( menu x bounds)      
    0 0 but.xy@                         
    pt.rct                              
    if drop i 1+ leave then             
  loop  ;                               
 : show.menu ( menu#---)                
  ( draws correct menu and sets vars)   
  dup t.m !    ( men#)                  
  dup 1- 2* m( + @ ( menu adr)          
  menu( !            ( men#)            
  dup 1- 2* menu$( + @ m$.addr !        
  menu( @ dup c@ dup m.x !              
  over 1+ c@ dup  m.wd !                
  +  m.rt !                             
  2+ c@ m.hi !  0 t.i !                 
  case                                  
    1 of wh.m. ;;                       
    2 of ws.m. ;;                       
    3 of gm.m. ;;                       
    4 of op.m. ;; endcase ;             
                        
 ( new.item)                            
                                        
 : new.i ( item#---)                    
 ( hilight new item or none if 0)       
 ( or disabled)                         
 t.i @ dup 0>                           
 if dup 2+ menu( @ + c@ ( black,blue?)  
 swap ( deselected)                     
   1- h.it                              
 else drop then ( none selected)        
 dup 2+ menu( @ + c@ ( disabled)        
 if drop 0 then                         
 dup dup 0>                             
 if w%    swap ( white selected)        
   1- h.it                              
 else drop then                         
 t.i ! ;                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( track.cursor)                         
                                        
: tr.c ( ---)                           
  ( follow cursor and hilight)          
  ( item selections)                    
  m.x @ m.rt @                          
  1 m.hi @                              
  but.xy@                               
  pt.rct  ( in the menu)                
  if                                    
    b.y @  50 - 8 / ( item #)           
    dup m.hi @ > if drop 0 then         
  else                                  
     0   ( no item)                     
  then                                  
  dup t.i @ =                           
  if drop  ( same item)                 
  else                                  
    new.i                               
  then ;                                
                                        
                                        
                                        
                                        
                                        
                        
( do.menu.events)                       
                                        
: m.ev ( ---flag↑do.menu.events)        
   b.d @                                
   if  bar?                             
     if m#                              
       dup if                           
         s.sc                           
         show.menu                      
         begin                          
           tr.c                         
           b.d @ not until              
           t.i @ dup 0=                 
           if drop                      
           else  ( flash)               
           3 0 do 0 new.i               
             dup new.i                  
           loop drop                    
         then r.sc                      
       t.i @                            
       ( true if item chosen)           
       then  ( leave 0)                 
     else 0 then                        
   else 0 then  ;                       
                                        
                        
( menu.test)                            
                                        
: menu.test ( ---) s1 m.bar             
  on s-enable                           
  begin                                 
    m.ev                                
    if 0 24 d-position ." menu:"        
       t.m @ .                          
       ."   item:"                      
       t.i @ . ."  "                    
       ."   depth:" depth .             
       ."   "                           
    then                                
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






                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( frame)                               
                                        
 code frame                             
  ( waits for raster to reach 240)      
   242 # lda, ( bottom of sprite y)     
   begin,                               
     53266 cmp,  ( there yet?)          
   0= until,                            
   next jmp,                            
 end-code                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( ftest)                               
                                        
 : ftest                                
    1000 0 do                           
      frame                             
      green 53281 c!                    
      red 53281 c!                      
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






 ( machine lang vars)                   
                                        
create room.data(  80 allot             
variable wall.covers                    
                                        
variable robot.orientation              
variable robot.square                   
                                        
12 constant wall@                       
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
(  block.)                              
                                        
code block. ( xt/yt/block/cwd/cht)      
( print a block at xt yt)               
  3 #   lda,  xsave stx,                
  setupn jsr,  ( move 3 stack to n)     
  xsave ldx, inx, inx,                  
  xsave stx, 0 # ldy,                   
  n 4 + ),y lda, ( get color byte)      
  n 1 -  sta,   ( store at n-1)         
  sec 2 + ldy,     ( ytab)  clc,        
  0 # lda,  0 # ldx, ( init char↑ calc) 
  begin,  clc,                          
    40 # adc, cs if, inx, then,         
    dey, 0=  ( dec ytab index)          
  until, n 6 + stx, xsave ldx,          
  clc, sec 4 + adc, n 6 + ldx, ( xtab)  
  cs if, inx,  then,                    
  n 6 +  sta,  ( lo screen start)       
  n 2 +  sta,  ( lo color start)        
  txa,  clc, ( hi↑ into a  )            
  'screen 8 rshift # adc, ( hi screen)  
  n 7 +  sta, ( store hi) txa, clc,     
  color-mem 8 rshift # adc, ( hi col)   
  n 3 + sta,    ( store color hi)       

  ( block. cont'd)  clc,                
  n 4 + inc,  ( point to 1st char)      
  0= if, n 5 + inc, then,               
  begin,   ( y  draw loop)              
    n 1+ ldy,  ( ht index)              
    xsave ldx, bot lda,  ( wd counter)  
    bot 1+ sta,  ( store it)            
    begin,  ( x draw loop)              
      n 1 - lda,  ( get color)          
      n 2 + ),y  sta,  ( store it)      
      tya, pha, 0 # ldy, ( save scr↑)   
      n 4 + ),y lda,  ( get char)       
      tax, pla, tay, ( recover scr↑)    
      txa,  xsave ldx, clc,             
      n 6 + ),y sta, ( store char)      
      n 4 + inc,  ( next char)          
      0= if, n 5 + inc, then,           
      iny, bot 1 + dec,  ( wd index)    
    0=  until,  ( last in row?)         
    n 1+ lda, clc, ( get ht index)      
    40 # adc, n 1+ sta, ( next row↑)    
    n dec,  ( height counter dec)       
  0= until,                             
  xsave ldx, inx, inx, inx, inx,        
poptwo jmp,  end-code                   
                        
( check.cover )                         
assembler                               
create  <check.cover>                   
 ( sq#--flag↑wall below square?  )      
   bot lda,  8 # adc, ( square down)    
   tay,                                 
   ' room.data( ,y lda, ( sqare.object) 
   wall@ # cmp, 0=                      
   if,  tya,    ' wall.covers sta,      
        1 # lda,                        
        bot sta,  ( 1 flag on stack)    
   else,                                
        0 # lda,                        
        bot sta,  ( no on stack)        
   then, rts,                           
                                        
 code check.cover ( sq--flag)           
   <check.cover> jsr,                   
   next jmp, end-code                   
                                        
                                        
                                        
                                        
                                        


( rob.or.sq@)                           
                                        
code rob.or.sq@ ( ---orient/sqre)       
  ' robot.orientation lda,              
  dex, dex,                             
  bot sta,                              
  0 # lda,                              
  bot 1+ sta,                           
  ' robot.square lda, pha,              
  0 # lda,                              
 push jmp,                              
end-code                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( square.object)                        
                                        
code square.object ( sq#--obj#)         
  ' room.data( 255 and # lda,           
  n sta,                                
  ' room.data( 8 rshift # lda,          
  n 1+ sta,                             
  bot ldy,                              
  n ),y lda,  ( grab object#)           
  bot sta,    ( on stack)               
  next jmp,                             
end-code                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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






( p.in.rect tester)                     
                                        
: ptest cr                              
  0. settim                             
  1000 0 do                             
   5 irnd 40 irnd 5 irnd 24 irnd        
   300 irnd 250 irnd                    
   drop drop drop drop drop drop        
  loop                                  
  rdtim drop 6 / .  cr                  
  0. settim 1000 0 do                   
   5 irnd 40 irnd 5 irnd 24 irnd        
   300 irnd 250 irnd                    
   pt.in.rect drop                      
  loop                                  
  rdtim drop 6 / .                      
  ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
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






 ( dummy program maker )                
 : p.stuff ( op/flow/arg/flow/ch#--)    
  current.instruction !                 
  + rot rot + swap !chip ;              
                                        
 : blank.panel ( pan#--)                
   current.panel !                      
   chip.count@ 0 do                     
    socket@ right.f@ 0 0 i p.stuff      
   loop                                 
   go.marker@ right.f@ 0 0 0 p.stuff ;  
 : blank.all  10 0 do i blank.panel     
       loop 0 current.panel ! ;         
 : save.new.cw ( #---)                  
   blank.all                            
   cw.save ;                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

 ( dummy program <<<<<<)                
   blank.all                            
   feel.for@ right.f@                   
    floor@ down.f@ 1 p.stuff            
   move@ right.f@                       
    forward@ 0    2 p.stuff             
   goto.go@ 0                           
    0 0 3 p.stuff                       
   flip.coin@ right.f@                  
    0 down.f@  9 p.stuff                
   move@ down.f@                        
    turn.right@ 0 10 p.stuff            
   move@ right.f@                       
    turn.left@ 0  17 p.stuff            
   goto.go@ 0 0 0 18 p.stuff            
                                        
                                        
 1 cw.save                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        

(  cw2)                                 
  blank.all                             
  feel.for@ right.f@                    
   disk@ down.f@ 1 p.stuff              
  pick.up@ right.f@                     
   0 0             2 p.stuff            
  sing@  right.f@                       
   range.reg@ 0    3 p.stuff            
  goto.go@ 0 0 0   4 p.stuff            
  look.for@ right.f@                    
   creep@ down.f@  9 p.stuff            
  qray@     right.f@                    
   0 0             10 p.stuff           
  feel.for@ right.f@                    
   floor@ down.f@ 17 p.stuff            
  move@    right.f@                     
   forward@ 0     18 p.stuff            
  goto.go@ 0 0 0  19 p.stuff            
  flip.coin@  right.f@                  
   0 down.f@         25 p.stuff         
move@ right.f@ turn.left@ 0 26 p.stuff  
move@ right.f@ turn.right@ 0 33 p.stuff 
move@ right.f@ turn.right@ 0 34 p.stuff 
goto.go@ 0 0 0 35 p.stuff               
 2 cw.save                              
                        
(  cw3)                                 
blank.all                               
feel.for@ right.f@ disk@ down.f@ 1      
p.stuff                                 
pick.up@ right.f@ 0 0 2 p.stuff         
feel.for@ right.f@                      
   coffee@ down.f@ 9 p.stuff            
wire@ up.f@  0 0  10 p.stuff            
feel.for@ right.f@                      
   oil@ down.f@ 17 p.stuff              
wire@ up.f@  0 0  18 p.stuff            
  look.for@ right.f@                    
   creep@ down.f@ 25 p.stuff            
  qray@  right.f@  0 0 26 p.stuff       
  feel.for@ left.f@                     
   floor@ right.f@ 33 p.stuff           
  move@ up.f@ forward@ 0 32 p.stuff     
  goto.go@ 0 0 0  24 p.stuff            
wire@ right.f@ 0 0 34 p.stuff           
wire@ right.f@ 0 0 35 p.stuff           
flip.coin@ right.f@ 0 up.f@ 36 p.stuff  
move@ right.f@ turn.left@ 0 37 p.stuff  
move@ right.f@ turn.right@ 0 28 p.stuff 
move@ right.f@ turn.left@ 0 38 p.stuff  
3 cw.save                               
                        
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






( scenario chopper)                     
128 157 c!  ( show messages)            
create chop(  5000 allot                
 311 load ( fix.pp)                     
: save$ ( str$---)                      
 0 savename c!                          
 savename swap $concat ;                
                                        
: chop.save ( #rooms---)                
  chop( 78 + dup rot 80 * + .s save ;   
chop( " greedville" loadram             
" @:a1" save$  4 chop.save              
chop( " cw caves" loadram               
" @:a2" save$  8 chop.save              
chop( " doom rooms" loadram             
" @:a3" save$  13 chop.save             
chop( " peace paths" loadram            
" @:a4" fix.pp save$ 50 chop.save       
" @:a7" save$ 50 chop.save ( temp)      
chop( " memory lanes" loadram           
" @:a5" save$ 10 chop.save              
chop( " octo gardens" loadram           
" @:a6" save$ 44 chop.save              
chop( " boomtown" loadram               
" @:a8" save$ 9 chop.save               
                        
( fix.pp)                               
                                        
: fix.pp  ( fit peace paths in 4k)      
  chop( 78 +  ( base)                   
  49 over 67 + c!                       
  49 over 68 + c!                       
  49 over 69 + c!  ( conect 1 to 49)    
  32 over 75 + c! 40 over 76 + c!       
  48 over 77 + c!                       
  dup 80 46 * + ( room 47)              
  12 over 31 + c! ( close door)         
  49 over 68 + c!                       
  49 over 69 + c!                       
  49 over 70 + c!  ( slide over ptrs)   
  1 over  76 + c!                       
  2 over 77 + c!                        
  3 over 78 + c!  ( door ptrs) drop     
  80 48 * +        ( room 49)           
  1 over 67 + c!                        
  1 over 68 + c!                        
  1 over 69 + c!  ( point to 1)         
  23 over 75 + c! 31 over 76 + c!       
  39 over 77 + c! ( right doors)        
  57 + 12 swap c! ( close btm door) ;   
                                        
                        
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






 ( shadow shadow.block)                 
 : shadow  ( l/b/r/t---)                
   4 pick 1- 2 pick 1- d-position       
   gm.bord.col@ 8 + char.color          
   64 emit swap 4 roll ( b/t/r/l)       
   - dup >r  ( width)                   
   0 do 91 emit loop  ( top margin)     
   92 emit ." "  ( top rt edge)       
   - dup 0 do ( height)                 
    93 emit ." "  loop ( rt shad)     
   95 emit   ( lower rt shadow)         
   ." "                               
   r> 0 do 47 emit ." " loop          
   174 emit  ( bottom left )            
   0 do ." " 175 emit loop            
   ( left shadw)                        
   ;                                    
                                        
 : shadow.block ( l/t/r/b/color---)     
   5 pick 3 pick 1+                     
   5 pick 1+ 7 pick shadow              
   color.block ;                        
                                        
                                        
                                        
                        
( game.title)                           
create cw.title( black c,               
100 c, 101 c, 102 c, 103 c, 104 c,      
105 c, 106 c, 107 c, 108 c,             
32 c, 32 c, 109 c, 32 c, 32 c, 32 c,    
32 c, 32 c, 32 c,                       
                                        
: game.title  ( ---)                    
  8 4 cw.title(                         
  9 2 block. ;                          
                                        
                                        
                                        
                                        
                                        











( setup.game.screen)                    
: setup.game.screen ( ---)              
 black dup  border bkgnd                
 0 0 d-position ." " 1 multi-color     
 0 0 39 24 gm.bord.col@ color.block     
 1 2 24 23 bak.c shadow.block ." "     
 1 2 d-position 24 0 do 94 emit loop    
 draw.menu.bar                          
 27 2 38 22 bak.c shadow.block          
 27 2 38 23 bak.c color.block           
    ( stat mem window)                  
 26 23 d-position 175 emit              
26 24 d-position 174 emit gm.bord.col@  
 8 + char.color 12 0 do 47 emit loop    
31 'screen 999 + c! gm.bord.col@ 8 + dup
 color-mem 999 + dup >r c! r>  40 - c!  
 29  'screen 959 + c!                   
 black char.color  game.title           
( 8  3 d-position ." greedy  in"        
 8  4 d-position ." greedville" )       
 2  4 d-position ." score"              
 18 4 d-position ." cycles"             
 27 2 d-position ." ↑↑ status ↑↑"       
 27 12 d-position ." ↑↑ memory ↑↑"      
 bak.c bkgnd gm.bord.col@ border ;      

( register.draw)                        
: b ." " ;                         
: reg.outln  ( height/color/x/y---)     
  d-position char.color  34 emit        
 34 emit ." " 38 emit 38 emit 35 emit  
b 0 do 41 emit i 2 = not if ."   "      
  else ." .." then 39 emit b  loop      
  37 emit 40 emit 40 emit 36 emit ;     
: register.draw ( ---)                  
  27 3 d-position                       
  ." pnl chip key"                      
  27 4 d-position                       
  5 nc@ 27 5 reg.outln                  
  28 6 damage.reg@ o.d.                 
  5 nc@ 31 5 reg.outln                  
  32 6 fuel.reg@ o.d.                   
  5 nc@ 35 5 reg.outln                  
  36 6 range.reg@ o.d.                  
  9 nc@ 27 13 reg.outln                 
  28 14 num.stack@ o.d.                 
  9 oc@ 31 13 reg.outln                 
  32 14 obj.stack@ o.d.                 
  9 mc@ 35 13 reg.outln                 
                                        
  36 14 mov.stack@ o.d. ;               

( vert.num)                             
                                        
: vert.num ( ---)                       
 ( number panel vertically)             
 0 3 d-position                         
 5 0 do                                 
   ." " i . ."  0" loop ;       
                                        
                                        

















 ( setup.work.screen)                   
                                        
: setup.work.screen ( ---)              
  0 multi-color                         
0 0 d-position                          
  ." "  draw.menu.bar ws.char          
  0 1 39 1 ws.bord.col@ color.block     
( 2 5 25 24 ws.back.col@ color.block)   
  black char.color                      
 26 2 d-position ." ↑↑↑↑ ibol ↑↑↑↑"     
 26 3 d-position ." ↑↑ operators ↑"     
  26 4 39 17 ac@ color.block            
( 26 18 39 18 white color.block )       
 26 17 d-position ." ↑↑ arguments ↑"    
( 26 19 39 24 tc@ color.block )         
  ws.back.col@ char.color               
  3 24 d-position                       
  ." 0  1  2  3  4  5  6  7"            
  vert.num   lt.gray bkgnd   ;          
                                        
                                        
                                        
                                        
                                        
                                        

( ws.action,thing.icons)                
                                        
: ws.action.icons ( ---)                
  action.count@ 1- goto.go@ do          
    i op.w.draw                         
  loop                                  
  26 6 39 6 ac@ color.block             
  26 8 32 9 ac@ color.block             
  object=@ op.w.draw move=@ op.w.draw   
  number<@ op.w.draw number=@ op.w.draw 
  subpanel@ op.w.draw wire@ op.w.draw   
  keypress@ op.w.draw                   
  26 8 32 8 ac@ color.block             
  35 8 39 8 ac@ color.block             
  26 10 39 10 ac@ color.block           
  33 11 33 11 ac@ color.block           
  29 7 29 7 ac@ color.block             
  32 7 32 7 ac@ color.block             
  35 7 35 7 ac@ color.block ;           
                                        
                                        
                                        
                                        
                                        


                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
  ( save.screens)                       
                                        
 : save.screens  0 157 c! ( no msg)     
   game.on@ prog.status !               
   graph.mem.init                       
   graph.load                           
   setup.game.screen                    
   game.title                           
   register.draw                        
   'screen first 1000 cmove             
   color-mem first 1000 + 1000 cmove    
   workshop.on@ prog.status !           
   setup.work.screen                    
   ws.action.icons                      
   15 cw.load                           
   0 panel.draw                         
   'screen first 2000 + 1000 cmove      
   color-mem first 3000 + 1000 cmove    
   0 savename c!                        
  savename  " @0:cw.scr" $concat        
   first first 4000 + save              
  empty-buffers ;                       
                                        
                                        
                                        
                        
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






