

























( joystick menu load screen)            
( start forth interrupt)                
                                        
172 175 thru ( vars & sprite)           
                                        
                                        
                                        
                                        
 181 189 thru  ( joystick stuff)        
                                        
 200 207 thru  ( menu stuff)            
                                        
 250 254 thru ( menu test)              
                                        
 260 load     ( frame)                  
 279 284 thru ( machine lang progs)     
 forth .s   a-remove                    
 : it ;                                 

 ( 320 329 game & workshop screens)     
 ( 310 -311 are scenario savers)        
                                        
                                        
                                        
                                        

( cursor vars)                          
                                        
variable button.down  0 button.down !   
                                        
variable button.x  ( button down pos)   
variable button.y                       
0 button.y ! 0 button.x !               
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
                                        
 : graph.mem.init ( ---)                
   3 bank 3 screen                      
   3 16 * 4 + 53272 c! ( out to 0 scr)  
   204 648 c!  ( scr 192 * 256)         
   147 emit ( clear screen)             
   6 charbase ;                         
                                        
 : graph.load  ( ---)                   
   63488 96 8 * -  " cw.chr" loadram    
   57344 " cw.spr" loadram ;            
                                        
 : m.bak1  ( color---↑set multi clr1)   
   53282 c! ;                           
                                        
 : m.bak2  ( color---)                  
   53283 c! ;                           
                                        
 : char.copy ( ---)                     
   56334 c@ 254 and 56334 c!            
   1 c@ 251 and 1 c!                    
   53248 61440 4096 cmove               
   1 c@ 4 or 1 c!                       
   56334 c@ 1 or 56334 c! ;             

 ( char.color color assignments)        
                                        
 : char.color  ( color---)              
 ( switches character colors)           
 case black of ." " ;;                 
 white of ." " ;; red of ." " ;;      
 cyan of ." " ;; purple of ." " ;;    
 green of ." " ;; blue of ." " ;;     
 yellow of ." " ;;                     
 orange of ." " ;; brown of ." " ;;   
 lt.red of ." " ;; dk.gray of ." " ;; 
 med.gray of ." " ;;                   
 lt.green of ." " ;;                   
 lt.blue of ." " ;;                    
 lt.gray of ." " ;;                    
 endcase ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
k





k





k






k






                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
k





k





k






k






k





k





k






k






( joystick reader)                      
: read.joy ( ---) joy2 c@               
dup 127 = not if 255 xor                
  dup 1 and  ( up?)                     
  if curs.y @ 2- 50 max curs.y !        
  else dup 2 and  ( down?)              
    if curs.y @ 2+ 234 min curs.y !     
    then                                
  then                                  
  dup 4 and  ( left?)                   
  if curs.x @ 2- 24 max curs.x !        
  else dup 8 and   ( right?)            
    if curs.x @ 2+ 330 min curs.x !     
    then                                
  then                                  
  16 and if on button.down !            
     curs.x @ button.x !                
     curs.y @ button.y !                
  else off button.down ! then           
else 0 button.down ! drop then ;        
: joy.test ( ---)  s1                   
  20000 0 do                            
   read.joy  curs.x @ curs.y @          
   s-position loop ;                    
                                        

( pt.in.rect)                           
: pt.in.rect                            
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
 else r> drop 2drop                     
 0 then ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( joy.read vars)                        
                                        
 51 constant j.top                      
 235 constant j.bot                     
 25 constant j.left                     
 331 constant j.right                   
 j.right 256 - constant j.rt.lo         
                                        
 exit                                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( machine lang read.joy)   hex          
code   read.joy                         
  d019     lda,  ( get interrupt flags) 
 1 # and, 0=  ( raster interrupt?)      
 if, ' i-system jmp,  ( exit to sys)    
 else,  ( my interrupt)                 
  d019     sta,  ( clear it)            
  0 # ldx,  button.down stx, ( clear)   
  dc00      lda, ( get joy2 val)        
  7f #      cmp, ( 7f = no joy)         
  0= not if,     ( joy active)          
   .a    lsr,   ( up test)              
   cs not if,      ( up button)         
    d001 ldy,  ( grab spr0 y)           
    j.top #  cpy, ( at top?)            
    0= not if, dey, dey, then, ( no)    
    d001 sty,  ( new spr0 y)            
   then,                                
   .a    lsr,   ( down test)            
   cs not if,   ( down thrown)          
    d001 ldy,  ( get spr0 y)            
    j.bot # cpy,  ( at bot?)            
    0= not if, iny, iny, then, ( no)    
    d001 sty,                           
   then,                                
                        
( machine read.joy  cont.d)             
   .a   lsr,  ( left.test)              
   cs  not   if,                        
     d010 ldx, d000 ldy, ( spr0 x h/l)  
     1 # cpx, 0= not if, ( spr0<255)    
       j.left # cpy,  ( left edge?)     
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
       j.rt.lo # cpy,  ( rt edge?)      
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
    1 #   lda,                          
    button.down sta, ( turn on var)     
    d001 lda,        ( spr0 y)          
    button.y    sta,                    
    d000 lda,        ( spr0 x lo)       
    button.x    sta,                    
    d010 lda,        ( spr0 x hi)       
    button.x 1+ sta,                    
   then,                                
  then,  ( joy stick active)            
 then,                                  
 ' i-user  jmp, ( no sys interrupt)     
 end-code                               
 decimal                                
                                        
                                        
                                        
                                        
                                        
                                        
                        
( machine joy.test)                     
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
                                        
 : i-joy  ( ---)                        
 ( set up cursor joystick interrupt)    
 788 @ 59953 = if i-init then           
  ( forth irq rotuine setup)            
( -12352 curs.spr  ( put cursor gr)     
 s1 184 s-pointer                       
 j.left j.top s-position                
 white s-color                          
 on s-enable                            
 53265 7 mask cbit ( clear hi bit)      
 251 53266 c! ( raster int lo byte)     
 56334 c@ 254 and 56334 c!              
 ' read.joy 5 i-set                     
 53274 0 mask sbit                      
 ( enable raster interrupt)             
 56334 c@ 1 or 56334 c! ;               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( but.xy@)                              
                                        
code but.xy@ ( ---butx/buty)            
  ' button.x lda,                       
  dex, dex,                             
  bot sta,                              
  ' button.x 1+ lda,                    
  bot 1+ sta,                           
  ' button.y lda, pha,                  
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






( draw.menu.bar)                        
  : draw.menu.bar ( ---)                
    0 0 d-position ."  warehouse "     
    ."  workshop "                      
    ."  games "                         
    ."  options    "  ;                 
 create menu.x(                         
 ( x bounds of each menu heading)       
 1 c, 9  c,     ( warehouse)            
 12 c, 19 c,   ( workshop)              
 22 c, 26 c,   ( games)                 
 29 c, 35 c,   ( options)               
                                        
 1024 constant color.buf(               
 create screen.buf( 1000 allot          
 : save.screen ( ---)                   
   color-mem  color.buf( 1000 cmove     
   'screen screen.buf( 1000 cmove ;     
 : restore.screen ( ---)                
   0 20 do                              
     screen.buf( i 40 * +               
     'screen i 40 * + 40 cmove          
     color.buf( i 40 * +                
     color-mem i 40 * + 40 cmove        
   -1 +loop ;                           

( disp.item hilight.item)               
variable men.wd  ( width of item $)     
variable men.hi  ( # of items)          
variable men.x   ( left edge of menu)   
variable men$.addr                      
variable menu(                          
: disp.item ( color/item#---)           
  men.x @ 1- over 1+ d-position         
  ." '"  swap char.color               
  dup men.wd @ * ( index into men$)     
  men$.addr @ + 1+  ( addr$)            
  men.wd @  type   ( count)             
  ." )" drop ;                         
                                        
: bot.shadow ( ---)                     
  men.x @ 1- men.hi @ 1+ d-position     
  black char.color  45 emit ( left)     
  men.wd @ 0 do 38 emit loop            
  44 emit  ( rt shadow)  ;              
                                        
: hilight.item ( color/item#---)        
  1+ 40 * men.x @ +  color-mem +        
  men.wd @ rot fill ;                   
                                        
                                        
                        
( show.menu disabled, men$, item.off)   
variable arr.addr ( menu array)         
: show.menu ( string addr/arr adrr--)   
  dup c@ men.x ! dup 1+ c@ men.wd !     
  dup 2+ c@ men.hi !                    
  arr.addr ! men$.addr !                
  men.hi @ 0 do                         
   arr.addr @ 3 + i + c@ ( disabled?)   
   if red else black   then             
   i disp.item  loop                    
  bot.shadow ;                          
                                        
: disabled,  ( ---)                     
( compile 16 0's for item enabled       
  array)                                
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 
0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 0 c, 
;                                       
: men$, ( string addr---)               
  men$.addr @ swap $concat ;            
: item.off ( item#/flag---)             
  swap 2+ menu( @ +  c! ;               
                                        
: item.enable  ( item#/flag/menuad---)  
 menu( ! not item.off ;                 
                        
( warehouse)                            
create warehouse(  1 c, ( left edge)    
 10 c,  ( width)  16 c, ( height)       
 disabled,                              
16 10 * $variable warehouse$            
0 warehouse$ c!                         
16 men.wd ! warehouse$ men$.addr !      
" greedy    " men$,                     
" mister cw " men$,                     
" 3         " men$,                     
" 4         " men$,                     
" 5         " men$,                     
" 6         " men$,                     
" 7         " men$,                     
" 8         " men$,                     
" 9         " men$,                     
" 10        " men$,                     
" 11        " men$,                     
" 12        " men$,                     
" 13        " men$,                     
" 14        " men$,                     
" 15        " men$,                     
" 16        " men$,                     
: wh.menu.                              
warehouse$ warehouse( show.menu ;       
                        
( workshop)                             
create workshop(  12 c, ( left edge)    
 12 c,  ( width)  8 c, ( height)        
 disabled,                              
8 12 * $variable workshop$              
0 workshop$ c! workshop( menu( !        
16 men.wd ! workshop$ men$.addr !       
" enter       " men$,                   
" ............" men$, 2 1 item.off      
" save chipwit" men$,                   
" ............" men$, 4 1 item.off      
" cut panel   " men$,                   
" copy panel  " men$,                   
" paste panel " men$,                   
" clear panel " men$,                   
                                        
: ws.menu.                              
 workshop$ workshop( show.menu ;        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( games)                                
create games(  22 c, ( left edge)       
 14 c,  ( width)  11 c, ( height)       
 disabled, games( menu( !               
11 14 * $variable games$                
0 games$ c!                             
16 men.wd ! games$ men$.addr !          
" start game    " men$,                 
" series        " men$,                 
" .............." men$, 3 1 item.off    
" greedville    " men$,                 
" chipwit caves " men$,                 
" doom rooms    " men$,                 
" peace paths   " men$,                 
" memory lanes  " men$,                 
" octopus garden" men$,                 
" ces demo      " men$,                 
" boomtown      " men$,                 
: gm.menu.                              
games$ games( show.menu ;               
                                        
                                        
                                        
                                        
                                        
                        
( options)                              
create options(  29 c, ( left edge)     
 9 c,  ( width)  2 c, ( height)         
 disabled,                              
2 9 * $variable options$                
0 options$ c!                           
16 men.wd ! options$ men$.addr !        
" debug on " men$,                      
" quit     " men$,                      
                                        
: op.menu.                              
 options$ options( show.menu ;          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
 ( set.item$)                           
                                        
: set.item$ ( item#/straddr/men$/men(--)
 1 + c@  >r  ( width)                   
 1+ men$.addr !                         
 swap 1- r@ *  men$.addr @ + ( str/it$) 
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
                                        
variable this.menu                      
variable this.item                      
variable menu.right                     
variable item.count                     
 : in.menu.bar? ( ---flag)              
 0 39 0 0  ( x/x/y/y)                   
 but.xy@                                
 pt.in.rect ;                           
                                        
 create menu.array(                     
 warehouse( ,                           
 workshop( ,                            
 games( ,                               
 options( ,                             
                                        
 create menu$(                          
 warehouse$ ,                           
 workshop$ ,                            
 games$ ,                               
 options$ ,                             
                                        
                                        
                                        
                        
( which.menu show.menu)                 
: which.menu ( ---menu# or 0)           
  0 ( leave false on stack)             
  4 0 do                                
    i 2* menu.x( + dup                  
    c@ swap 1+ c@ ( menu x bounds)      
    0 0 but.xy@                         
    pt.in.rect                          
    if drop i 1+ leave then             
  loop  ;                               
 : show.menu ( menu#---)                
  ( draws correct menu and sets vars)   
  dup this.menu !    ( men#)            
  dup 1- 2* menu.array( + @ ( menu adr) 
  menu( !            ( men#)            
  dup 1- 2* menu$( + @ men$.addr !      
  menu( @ dup c@ dup men.x !            
  over 1+ c@ dup  men.wd !              
  +  menu.right !                       
  2+ c@ men.hi !  0 this.item !         
  case                                  
    1 of wh.menu. ;;                    
    2 of ws.menu. ;;                    
    3 of gm.menu. ;;                    
    4 of op.menu. ;; endcase ;          
                        
 ( new.item)                            
                                        
 : new.item ( item#---)                 
 ( hilight new item or none if 0)       
 ( or disabled)                         
 this.item @ dup 0>                     
 if black swap ( black not selected)    
   1- hilight.item                      
 else drop then ( none selected)        
 dup 2+ menu( @ + c@ ( disabled)        
 if drop 0 then                         
 dup dup 0>                             
 if white swap ( white selected)        
   1- hilight.item                      
 else drop then                         
 this.item ! ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( track.cursor)                         
                                        
: track.cursor ( ---)                   
  ( follow cursor and hilight)          
  ( item selections)                    
  men.x @ menu.right @                  
  1 men.hi @                            
  but.xy@                               
  pt.in.rect  ( in the menu)            
  if                                    
    button.y @  50 - 8 / ( item #)      
    dup men.hi @ > if drop 0 then       
  else                                  
     0   ( no item)                     
  then                                  
  dup this.item @ =                     
  if drop  ( same item)                 
  else                                  
    new.item                            
  then ;                                
                                        
                                        
                                        
                                        
                                        
                        
( do.menu.events)                       
                                        
: do.menu.events ( ---flag)             
   button.down @                        
   if  in.menu.bar?                     
     if which.menu                      
       dup if                           
         save.screen                    
         show.menu                      
         begin                          
           track.cursor                 
           button.down @ not until      
           this.item @ dup 0=           
           if drop                      
           else  ( flash)               
           3 0 do 0 new.item            
             dup new.item               
           loop drop                    
         then restore.screen            
       this.item @                      
       ( true if item chosen)           
       then  ( leave 0)                 
     else 0 then                        
   else 0 then  ;                       
                                        
                        
( menu.test)                            
                                        
: menu.test ( ---) s1 draw.menu.bar     
  on s-enable                           
  begin                                 
    do.menu.events                      
    if 0 24 d-position ." menu:"        
       this.menu @ .                    
       ."   item:"                      
       this.item @ . ."  "              
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






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






k





k





k






k






