

























( chipwits demo  9-18-84)               
forget it : it ;                        
2 6 thru   ( vars)                      
100 107 thru ( head sprites)            
108 115 thru ( feet sprites)            
116 120 thru ( obj sprites)             
10 40 thru                              
                                        


















 ( variables)                           
: var variable ; : is constant ;        
var robot.square                        
var robot.orientation                   
var robot.x var robot.y                 





















( room vars, room)                      
                                        
8 is sqs.wd@ 8 is sqs.hi@               
sqs.wd@ sqs.hi@ * is squ.cnt@           
squ.cnt@ 16 + is room.size@             
                                        
                                        
: t, 1 c, ; ( top)                      
: w, 2 c, ; ( wall)                     
: f, 3 c, ; ( floor)                    
create room.data(                       
                                        
t, w, w, t, w, w, w, t,                 
t, f, f, t, f, f, f, t,                 
t, f, f, w, f, f, f, t,                 
                                        
t, f, f, f, f, t, t, t,                 
t, f, f, f, f, t, w, t,                 
t, f, f, f, f, w, f, t,                 
t, f, t, f, f, f, f, t,                 
w, w, w, w, w, w, w, w,                 

16 allot ( door data)                   



( orientation constants)                
                                        
7 is w 6 is sw 5 is s 4 is se           
3 is e 2 is ne 1 is n 0 is nw           
















































( move.sound)                           
                                        
: move.sound ;                          











































































( char.copy)                            
                                        
: char.copy  ( bank# charbase# --)      
 ( see p134 mem map)                    
 56334 c@  254 and 56334 c!             
 1 c@  251 and 1 c!                     
 2dup                                   
 2048 * ( charbase)                     
 swap 16384 * + ( bottom of set)        
 256 0 do  ( characters)                
  8 0 do ( bytes/char)                  
    dup                                 
    j 8 * i + ( byte index)             
    dup >r                              
    53248 + c@    (  rom charset)       
    swap r> + c!  ( ram charset)        
  loop                                  
 loop drop                              
 1 c@ 4 or 1 c!                         
 56334 c@ 1 or 56334 c!                 
 charbase bank ;                        
                                        
                                        
                                        
                                        

( char.copy)                            
                                        
: char.copy  ( bank# charbase# --)      
 ( see p134 mem map)                    
 56334 c@  254 and 56334 c!             
 1 c@  251 and 1 c!                     
 2dup                                   
 2048 * ( charbase)                     
 swap 16384 * + ( bottom of set)        
 256 0 do  ( characters)                
  8 0 do ( bytes/char)                  
    dup                                 
    j 8 * i + ( byte index)             
    dup >r                              
    53248 + c@    (  rom charset)       
    swap r> + c!  ( ram charset)        
  loop                                  
 loop drop                              
 1 c@ 4 or 1 c!                         
 56334 c@ 1 or 56334 c!                 
 drop drop  ;                           
                                        
                                        
                                        
                                        

( head.init)                            
( initialize head sprite)               
hex : head.load ( ---)                  
    8000 head0 8040 head1               
    8080 head2 80c0 head3               
    8100 head4 8140 head5               
    8180 head6 81c0 head7               
; decimal                               
: s.head s4 ;                           
: head.init ( ---) head.load            
  s.head on s-multi ( multicolor)       
  med.gray s-color  ( 2)                
                                        
  off s-yexp off s-xexp                 
  0 s-pointer ;                         
                                        










( feet.init)                            
( initialize feet sprite)               
hex  : feet.load ( ---)                 
    8200 feet0 8240 feet1               
    8280 feet2 82c0 feet3               
    8300 feet4 8340 feet5               
    8380 feet6 83c0 feet7               
; decimal                               
: s.feet s3 ;                           
: feet.init ( ---) feet.load            
  s.feet on s-multi ( multicolor)       
  red s-color  ( 2)                     
                                        
  off s-yexp off s-xexp                 
  8 s-pointer ;                         
                                        










( obj.init)                             
hex : obj.load                          
    8800 pie.s                          
    8840 coffee.s                       
    8880 brick.s                        
    88c0 coffee2.s                      
; decimal                               
: obj.s  ( color pointer ---)           
  s-pointer s-color                     
  off s-yexp off s-xexp                 
  on s-multi ;                          
                                        
: obj.init ( ---) obj.load              
  s5 brown 32 obj.s ( pie)              
  s8 black 33 obj.s ( coffee)           
  s1 lt.red 34 obj.s ( brick)           
  s2 lt.red 34 obj.s ( brick)           
  s7 brown 32 obj.s ( pie)              
  s6 blue 35 obj.s ( blue cup)          
  ;                                     
































( b2.init  bank 2 initializer)          
( see p 48, 64 sound & graphics)        
                                        
: b2.init  ( ---)                       
  ( 56576 c@ 253 and 56576 c!)          
  1 16 * 4 + 53272 c!                   
  132 648 c! ( output to 132 * 356)     
  147 emit   ;                          
                                        
                                        
                                        
                                        
                                        
                                        
                                        


                                        
                                        







( s.in   s.test cw.plop)                
 : s.in  (  s-pointer---)               
    dup s.head s-pointer                
    s.feet 8 + s-pointer ;              
                                        
 : s.test ( ---)                        
  3 0 do                                
   8 0 do i s.in 10 wait loop           
  loop ;                                
                                        
 : cw.plop ( ---)                       
   s.head 100 127 s-position            
   on s-enable                          
   s.feet 100 110 s-position            
   on s-enable ;                        











( color.test sprites.off)               
                                        
: color.test ( ---)                     
 0 0 d-position                         
 ."                 "          
 0 1 d-position                         
 ."                 "          
 ;                                      
                                        
 : sprites.off ( ---)                   
   s1 off s-enable                      
   s2 off s-enable                      
   s3 off s-enable                      
   s4 off s-enable                      
   s5 off s-enable                      
   s6 off s-enable                      
   s7 off s-enable                      
   s8 off s-enable ;                    








                                        
                                        
                                        
                                        























                                        
























( graph.init)                           
( setup graphics)                       
: graph.init ( ---)                     
                                        
 white 0 s-multir ( 1 color)            
 green 1 s-multir ( 3)                  
 2 4 char.copy                          
 head.init                              
 feet.init                              
 obj.init ;                             
                                        
                                        
                                        
                                        
                                        











( game stuff ,vars)                     
                                        
: $is $constant ;                       
$is f$ "P  "                   
                                        
$is w$ "▂▂✓  ▕"                 
                                        
                                        
$is t$ "▂▂✓▂▂✓"                  
                                        
$is r$ "          "              
$is r1$ "     "                   
                                        
                                        
                                        
: r$.? r$ $. r1$ $. ;                   










( draw.room)                            
                                        
: draw.room ( ---)                      
  room.data( 1-                         
  sqs.hi@ 0 do                          
   sqs.wd@ 0 do                         
   i 3 * 1 + j 2 * 5 + d-position       
   1+ dup c@                            
   case                                 
     1 of t$ $. ;;                      
     2 of w$ $. ;;                      
     3 of f$ $. ;;                      
   endcase                              
 loop loop drop ." " ;                 












( game.bk)                              
                                        
: game.bk ( ---)                        
  black bkgnd purple border             
  33832 960 160 fill                    
  ( fill screen inverse blanks)         
  55336 960 36 fill                     
  ( fill color mem w cyan)              
  ;                                     
                                        
                                        















 ( game.wndw stat.wndws)                
: game.wndw ( ---)                      
  0 2 d-position                        
  ."                           "      
  0 3 d-position                        
  ."  ====== greedville ====== "        
  0 4 d-position                        
  ."                           "        
  1 5 d-position                        
  ."                          "       
  0 5 d-position                        
  16 0 do ."   " loop              
  24 5 d-position                       
  16 0 do ."   " loop              
  0 21 d-position                       
  ."                           "       
  1 22 d-position                       
  ." ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▘"     
  26 3 d-position                       
  19 0 do ." ▌" loop                  
  ;                                     































( score.wndw)                           
                                        
: score.wndw ( ---)                     
27 2 d-position                         
." "                                  
27 2 d-position                         
." cycles score"                        
27 3 d-position                         
."  1291   170 ▌"                     
28 4 d-position                         
." ▄▄▄▄▄▄▄▄▄▄▄▘"                     
;                                       














 ( status.wndw)                         
                                        
: status.wndw ( ---)                    
 27 5 d-position                        
 ."    status   "                     
 27 6 d-position                        
 6 0 do                                 
  27 6 i + d-position                   
 ."             ▌"               
 loop                                   
 27 12 d-position                       
 ."             ▌"                  
 28 13 d-position                       
 ." ▄▄▄▄▄▄▄▄▄▄▄▘"                    
 28 6 d-position                        
 ." "  r$.?                            
 33 6 d-position                        
 ." "  r$.?                            
 28 9 d-position                        
 ." "  r$.?                            
 33 9 d-position                        
 ." "  r$.? ;                          




 ( memory.wndw)                         
                                        
: memory.wndw ( ---)                    
 27 14 d-position                       
 ."    memory   "                     
 27 15 d-position                       
 6 0 do                                 
  27 15 i + d-position                  
 ."             ▌"               
 loop                                   
 27 21 d-position                       
 ."             ▌"                  
 28 22 d-position                       
 ." ▄▄▄▄▄▄▄▄▄▄▄▘"                    
 28 15 d-position                       
 ." "  r$.?                            
 28 18 d-position                       
 r$.?                                   
 33 15 d-position                       
 ." " r$.?                             
 33 18 d-position                       
 r$.? ;                                 




( s.square.xy obj.put)                  
: s.square.xy ( sq# ---x/y)             
  dup 8 mod 24 * 7 + 24 + ( x)          
  swap 8 / 16 * 40 + 50 + ( y) ;        
 ( see p 140 c64 prog ref)              
                                        
: room.put ( obj# sq# ---)              
  room.data( + c! ;                     
                                        
: obj.put ( ---)                        
  50 s.square.xy s1 s-position          
  on s-enable  ( brick)                 
  29 s.square.xy s2 s-position          
  on s-enable ( brick)                  
  34 s.square.xy s6 s-position          
  on s-enable   1 22 room.put           
  22 s.square.xy s5 s-position          
  on s-enable ( coffee)                 
  1 34 room.put                         
  34 s.square.xy s8 s-position          
  on s-enable                           
  1 12 room.put                         
  12 s.square.xy s7 s-position          
  on s-enable ;                         
                                        

( game.init)                            
                                        
: game.init ( ---)                      
 0 0 d-position                         
 ."  options  game  workshop  "       
 ."                "                    
  game.bk                               
  game.wndw                             
  draw.room                             
  score.wndw                            
  status.wndw                           
  memory.wndw                           
  obj.put ;                             













(  cw.square.put)                       
                                        
: cw.position ( x/y ---)                
  2dup 16 -                             
  s.head s-position on s-enable         
  s.feet s-position on s-enable ;       

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        










( cw.square.put)                        
                                        
: cw.square.put ( sq# ---)              
  s.square.xy                           
  2dup robot.y !                        
  robot.x !                             
  cw.position ;                         

                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        










( square.object next.square)            
                                        
: square.object ( sq# ---obj#)          
  room.data( + c@ ;                     
                                        
: next.square ( orient/sq--nextsq#)     
 swap                                   
 case n of 8 - ;; e of 1 + ;;           
      s of 8 + ;; w of 1 - ;;           
      ne of 7 - ;;                      
      se of 9 + ;;                      
      sw of 7 + ;;                      
      nw of 9 - ;;                      
 endcase ;                              






































 ( slide)                               
                                        
                                        
 : slide ( x/ydeltas---)                
   8 0 do 2dup                          
                                        
   robot.y @ + dup robot.y !            
   swap robot.x @ + dup robot.x !       
   swap                                 
   cw.position                          
    move.sound 1 wait                   
   loop drop drop ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        


 ( cw.slide)                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
 : cw.slide ( ---)                      
   robot.orientation @                  
   case n of 0 -2 slide ;;              
        ne of 3 -2 slide ;;             
        e of 3 0 slide ;;               
        se of 3 2 slide ;;              
        s of 0 2 slide ;;               
        sw of -3 2 slide ;;             
        w of -3 0 slide ;;              
        nw of -3 -2 slide ;;            
   endcase                              
   ;                                    


( cw.turn)                              
                                        
: cw.turn ( ---)                        
  robot.orientation @                   
  osc3@ 2 mod ( pseudornd)              
  case 0 of 1 + ;;                      
       1 of 1 - ;;                      
  endcase                               
  dup 7 > if drop 0 then                
  dup 0 < if drop 7 then                
  dup s.in 5 wait                       
  robot.orientation ! ;                 














( cw.init)                              
                                        
: cw.init                               
  9 robot.square !                      
  9 cw.square.put                       
  sw robot.orientation !                
  sw s.in                               
  s.head on s-enable                    
  s.feet on s-enable ;                  

















( cw.chug)                              
                                        
: cw.chug ( ---)                        
  begin                                 
    robot.orientation @                 
    robot.square @                      
    next.square dup square.object       
    3 = if  ( floor)                    
      cw.slide                          
      robot.square !                    
      rdtim drop 10 mod                 
      1 < if cw.turn  then              
    else                                
      drop cw.turn                      
    then                                
  again ;                               










( cw.demo)                              
: cw.demo ( ---)                        
 ."    chipwits demo by interacti"     
 ." ve arts."                           
  graph.init                            
  b2.init                               
  game.init                             
  2 bank                                
  cw.init                               
  sound.init                            
  v3 noise v-ctrl 65535 v-freq          
  ( set up for random numbers)          
  ( see p 103 c64 forth manual)         
  cw.chug ;                             
















































































































































































































































































































































































































































































































































































































































































































































▝▒".!".!┼%
┼%X0"0!▒I%$z&▗)Sq+a*9f
lnB┤:mt┤:mt$9#I%I%Lm9f▂└nB
┤:mt┤:mt$9*#I%I%*▒Lm9aligNP
nB"&2T$:>tt▍l▒9#I
%oI%tt┤:▍l▒9#┤:I%I%o─▒$9
f├nBmt┤:I%-nmot▝I%Lm9fTmlB
"┐""$▎+tlXhhh".!Sq+a*9
fpsWPlG hfbasE▄l▗lfreseT└lBXl┘9
finiT▃lBBlD▍l┘9feRLlBl▒9fz
E▄lBl9S┤T$9fnE┌lBl[S┤T$9fo
VmBl"S┤T$9sfZmBl"▘▒Sl┘
"▒SV:l$l┘9sfN.mBl"┘▒Sl┘/
"SboundSlwG  notE[wBwD#wD
"%69next-pointeRKwB3"k5D
/▒9-*┘9move-spritEwBwwD#w
D┬5Rw9drawlinE▍wBwD#wD▍t9valid-
point▚UwBwD#wDG$G$"H└*"@└S*
"▒▒>S*"▒▒>S/T$+sGw19new-p
oinT┐wBwwDwv/D/w1
intableBjj▂]✓HCPHT
JSDL£▄c▔ ▝w┌┤
fXH▌#▁#┼▗sin
tablEWjB/"2>"3▒%jj9s1
8┌├jB/"z>"▎*▒j9siNkB"
H$/▌"H/"▎>"▎▒kh$
k9coS5kB:;▎4$4$tDh$t$
4D▎4D▎4─▒││9ellipsE▗tB"HG$"
▏┤9*"HX0"%G$"!Uk"
'"D"%G$"!;k"'"%*"
D"%▎4G$▒│││9circlE
uBt
tt"D"kI%I%I%u9+90deGv-90
deG0v▒directionS=vG▒▒▒▒r*9d
iNFhBBhDr*9gchKhB/DR"2
R/DR↑$▔=R/DR/""2G$"2
$G$"2$G$"2$G$"2$*"!2
$R/Da*R(/DR"T2R
/q+/▒bR"▘▒Bh$9<decom▘
hB/D"▗D2B/D/";2G$
"▖2sX1arraY£sB└DE▃ X*D
92arraYLsB└/DE▃ Xt┼%Dz
&DI%R9s-deFsB└"?X0┤*W
$$$K┬▒▃ X*"?W9strinG▝sB└▄
 b""┤*W$/K/EW▃ X9wavE▂sG
 tplay.notEtB"H"*▒*Lr*%
6s37$tD379v-defaulT(
4QfB"<f95fB"<f96fB"
<f97fB"<f98└fB"<f99▝
fB"<f910KfB"<f911ZfB"<
f912fB"<f913✓fB"<f914
gB"<f915gB"<f9K*gB▒eB9
X:gB"*0"!b"!'f▒">g9OfgB/
"0"!"!b'fyqB9k519s┤HqB[k
519s▎WqB"k519s▍qB"k519
sqB"k519sqB"k519s▃qB
"k519trianglEJqsawtootH┼q!
pulsEqanoisE▃qrinGrrese
TrsynCrfilt┴(rfilt┬3r
filt┤?rfilteXkrlowpj4XA4
iqp4▌4" " ▎49directions-iniTcyB
hwDwv/" *0/"!D"!R1"▗▒
$9csound-iniTUyB8"▎6XX7"X
7$r37r37X"▒79curve-iniT▍yBww1h
w1y6sGw1qy!yCy9c-curvE└yBX✓yx9
call-rdragoNzBUz9ldragoN(zB/┤
x/└noB┤:mt┤:I%-nmotH:I%Lm9
rscalEMoBmo-n▍l▒9#z&Lm9lscalE
oBmb-n9▍l▒#z&Lm9fiX└oBm▏d/
o-n▍l▒9#&b-n9▍l▒#V:
"l┘z&$X-nz&✓▒9fabSLoBm-n
Mz&Lm9fnegatE pBm-n9z&Lm9fmiN5pB
┤:mt┤:I%-nmotJ;I%L
"@l$l┘9@exponenTvmBBl4m£m/
"▒S"tm"▒$"▒SI%9
!exponenTmB/"/"z&2T$
"l┘*/"▒S//"▒2T$"
l┘$"▒S$4m£m9<roT─mBz&z&9e┐&
nBm-n┴R. e9f┐5nBmt*G$M┼%
▌"!;X0hR/D4Dw1R/D
;w1RD▎4D#w19draW?xBkx┘w$GwD
 wCw6sGw1wD#wD▎4Cw9move-d
irectioNxBwwD"Sww19c-draW▝xB
/┤x/ox9vMx/oxfvMx$9
sprites-iniT▌xB↑q"v"@NvXV5Kp.6s
O5s59hi-res-iniTyB"R3s"H$
"z;k9d2OkB▝9easy-bitSkBX
0t
k
k┼%▒/▌┼%I%DoI%D"
T▒92's-biTkBt
k/▌
k┼%▒
I%b
k┼%,$I%o▒I%b91
's-biTWkBt/▌│I%b
k"┼%;
┤I%9sqrTlBX9"▌kz&$"▌k▌k%
l92roo▒▒▒▒drago
n┴jv▄sA─▌─┴ ▃▒▒▒▘?? 
?<X┌ ─P88P*dragon┬Yv▄
s── ▒▒ ▒┌▒▒▝│▘▒
┌> ──P8PtPx-neWDvGvay-n
eWwGotx-inCwGnty-inC'wGrilengtH3
wG  dir-indX?wG  in-
$┤:R/Mh↑$▔=F!/"q2*C%
"2li$h▒Rh↑$▔=$9de
coMbiBM$XBh1liRnot found9
tablEFiB└X0▝▒▃ X*[D9
sintableA┬ij[H2 B C  !!T!*"│"N"
#G#▂#▍#8$X$▍$▂$'%[%
%▖%▕%&5&x&X&&▂&E&
Y&&&''''stB""7XX7▍q$
t1X"▒79s.disTztG ll.disTtGce
acCtGe b-linE▄tB▎4D▒9G$a/tt;
*4D▒9G$a/tt;$t1▘#t1>
I%I%I%I%z&*"&▎4Dt1*$X*
4Dt1$XtDtD$tD▒t1tDX
0tDt$tD▌▎4$4$"▒▒┬
▒>g9MHgBG$*'fjg9LgBL)D$"9FgB
L)D/┼/D▌1*X┬%│9
WgBL)D┼"Jgb,9NVgB▗g9L)$
9P┌gB▗g"▒▒L)$9sChBFe*└$%D
/Lg▒eW9sMhBttL)D%D┼%)!hI%L)1
I%jg%1L)19giNfGe gin├£hBBhD
R/Bh1asSwrbandpasSDrhighp
asSRrnotcHrnote-valueSrG
▒✓┤▗┘┤H▒T▌┐.┘note─rBDrD9
3ofFDrv┴XrBX619v┬▔rB961
9v┤┬rB[619ofFsoNsfal
sEstruE#sjoy┴/sjoy┬:s
uporTes│color-meMp
▌ogzfvMx/o7z$9rdragoN=zB/┤
x/ogz9vMx/oUz$9d-curvEKzB"
✓ygz9wait-5-seCzB"X0"!"!$
▒9demO▂zB"[▔z8▝zz8▝z┐▒
9x9vMx/oxfvMx$9sprites-iniT▌xB
↑q"v"@NvXV5Kp.6sO5s59hi-res-
iniTyB"R3sm9f▘mpBRo│m9fma
XPpB:;:;tpRoso9blacKporangEp
whitE pbrowN└preD▃plt.
reDEpcyaNOpgray┴ppurplE▕
pgray┬┤pgreeNqlt.greeNq
bluEqlt.bluE'qyelloW2q
gray┤@qs┴mqBXk519s┬Y919
.S
9BT0W90*W(0*W(*0"
!DX┴[W9a┌▒Rempty stack 9
.indeX▌9B/W$9z&+9&$$D▒"
[r*W$│▔q+9?estacK┴9BT┤kempty 
stack9bmovE(:Bz&z&,z&Vz&W
9copYh:B$D*┼1b,9scopYL:B
z&z&b*J69osc3─7B"J69env3─▁
7B"J69sid.iniT7B"X6D"
1"1"1X6D"XJX619
sound.iniTH7B"TX61S79finiS8G
rwsecT(8Bz&[┐"z&z&▄ *"&tz&/"x
>o+I%&9readsrC48BG$G$9=8$9
writedsTM8BG$G$X=8$9
G$"▒Saa!N@Y!▔=kincorrect 
addressing▒g@▒@▒Kg@▒"S
g@▒"S"└KN@9adc▗]bO
b─Nand▗bOb Ncmp▗cOb─Neor▗cOb@N
lda▗cOb Nora▗'cObNsbc▗3cOb Nsta
▗?cObLasl▗kcObdec▗wcObAinc▗CcO
b▌lsr▗OcObarioritY5B"Px59s-
multI5B"Px59s-pointeR5B3"k
5D┘9s-poSJ5B"Pk5DD┘"H
"Pk5Dn.."Pk5DD┘9s-coloR5B
"'Pk5D┘9
s-s-collisioN$6B"P▒9

s-b-collisioN>6B"P▒9siDx6Ge voic
ER6Gidsid▌6BX6D┘9voice@B"
g@19x@B"g@19)Y@B"g@19
├@B"g@19boT▝@B│@X9seCL@B│
@[9rp▘Z@B│@"9upmodE@Bg@D
"S┤"g@$9g@D"S▏X
0/✓▒G$bDS┤9cpU@B└K▃ X▒
KN@9brk▗iawaclc▗Bawacld▗Lawa▒cl
i▗VawaxeNS3B"┐""P▒"S$"P
┘9bitmaP▄3B[HZ3"P".9charba
sEI3BD"P▒"┌S$"P┘9s-multiR▒
3B"%P┘9multi-modE4B"P".9
b-graphicS"4B"P" .9b-filL=4B33
"@z&J9b-coloRx4B✓*3┘9b-col
-filLO4B✓3"z&J9
92─>B┘:92constanT>B;92dro
P >B│92duP┬>B92oveR─>B:;92sw
aPM>B┤:92variablE┼>B;9>binarY>B
?9emptY▖>B!D" R1!5,D""
0W9erasE?BXJ9flusH5?B┐(9He?
B▚9octaLs?B"19u.R]?BX*
9C['│Q?BU9RL1BT┤9"$
"o▔0"!D"▒2T$/"!1b"▄▒$
9applicatioN▔1B"E%"Y!✓$G$1R
"G$1R"✓▒*1""/o▒BY
!/✓$"D*/▒"SbB/T$▄▒$)9
swapouT▗1B""."".9swapiN
─2B""S.""S.9h─2B▒"
┌▒$"r*"X0/"!▒/" └G$
"▒>$$".AX▒$"▘;├!
£▒$I%19'titlE4<G=titlE▖<B
"r*Rsuper-forth 64 version 1.1.0
9triaD=BX"D+*$""G$*
0"!$"├!9┐▒=D#"A9<em
it7▘==B['▄ b9✓c*▄ G$b▒*┘[9
noT┼dB" 9cS▔d0┘┤dP0▝▝d
>┘EdvSNdpagain▗WdB9'✓c9
while▗ dBt/9'I%adR9repeat▗┤dBt
t9'✓cI%I%[▒wd9end-codEeBD2
10*R2*#Rcode error, stack d
epth change9entercodE
0"!G$S:b▒$9dswaP:B"&"
&9d└├:B9▝9d0┘C:B$┤9d┘P:BH:
V:9d▘▒:B┤:>9d─├:B/RD*D9dco
nstanT:B└*▃ X/D*RD9dove
R;B"%"%9dmaX2;B:;:;>┤:
│9dmiNj;B:;:;>T$┤:│9du▝C;Bt
t"I%I%"calcnexT8BG$*z&
G$G$*▒/*$z&z&*X$*$X
z&z&*90819ciniT8BG$▒b5,D▄ ▒X
"D+*$z&G$▒9copysdisK8BX"┴8
8Rinsert source diskF!$W8Rinse
rt dest diskF!$808D▘▒9.sS9▒▒
.sLQ9BX"Y919.sR┼9B"▒▒"rol▗┼
cOb!ror▗cObAstx▗cObcpx▗cOb 
cpy▗├cOb─ldx▗cOb▄ldy▗CcOb s
ty▗OcObjsr▗┼cObjmp▗▕cOb@bit▗┤
cOb begin▗▒cB▄ 99until▗dBt9'
I%K▄ b▒K9if▗dBK▄ XK[9then▗
;dB['▄ G$▒*1G$b▒*┘9e
lse▗odBofF6B6D"9v▌6B▒6
69sid─6BX6D▒9v-freQC6BR*9▖6
X▖69v-pWV6BR*"▖6[▖69v-aD└6B✓
"▖69v-sR7B✓"▖69v-ctrL7B"
▖69f-freQ*7BX"D+"6"69
resfilT=7B✓"69modevoL↑7B✓"
69paddle─T7B"J6"
clv▗awadex▗awaJdey▗awainx▗awa
iny▗awaHnop▗┬awapha▗▝awahphp▗Fawa
pla▗PawaHplp▗Zawa(rti▗▁awa@rts▗┐aw
a─sec▗▃awa8sed▗bwasei▗bwaXtax▗bw
atay▗!bwatsx▗+bwa✓txa▗5bwatxs▗?bw
atya▗ibwam/cpUsbB└K▃ X/bD
"S"g@$b-X4Ge b-Y▁4Ge b-
peN┐4Gasb-erasE4BX─419b-draWD4B
9─419b-ploTX4B▎4141/"S"(
*"SG$"S33─4D*z&"S
"*▒n..9spritE├4G ss-fseTb5Bk
5Dn..9s-enablEo5B"Px59s-xexPD5B
"Px59s-yexPY5B"Px59s-pIassem
bleR?▒ 0e xsavE W▔?uaP▂?
▘iP?▖NA?poPJ?poptwOR?
puT?pusH?nexT┤?set
upN▘?OindeX@G
,modE@G.A@@BXg@19▔k
@B9g@19meMz@B[g@19,XH@B"g@
19,YXJ2D29h▌▔2BJ2129hc─┬2
BJ2▒29hc▌A2BJ2┘29'banKQ2B"│
▒"S"-"┐"9'screeN▌2B"P▒
"┌S"┐"29'bitmaP3B"P▒"
S"┐"29'charbasE)3B"P▒"S
"┐"29banKm3B"│"S."-"
│▒"▝S$"│┘9scre
"Sj9id┐=B"=1"Sq+
"l19vleN=G(vtaBE=GvlisT
P=B"▒┌$12DDL=Do┌$D▒G$▒"S
└X┌$1/▔=W=D┌$DG$$▒r*✓$"D
/┤▘;$▒$9'S┼=B0*9-texTc>B
*0$R/D"!D▒//;├![
▒▒*$92▌n>B?B?0*9DcodEXeB└*
▄ /1N@e9E;codEeB▃L-e9chk
liN▕eB/"┌▒Skoff screen9linE┘eBF
e/%1L)D└b,9pPeBW$b*▒e9┤*W9
FeditoR▖e▒ /h▌?C B*▒e$*▒eW9s
E#fB/%1fC%907fBX<f91jfB9<
f92wfB[<f93DfB"<f9>9
dvariablE▒;B└"E9pausE;B 
"X0▘▒▝▒"X0▘▒9indeX
;B$D/z&bz&z&G$Y#b>kblk no
. error0"!✓9▘;├!9┐▒9dumP▒;B
XDt┌ 0/"!/X"[r*/"
X0/"!▒"┌▒$a*/""X
0/"!┤$I$▍h▍lpaD─$B▄ "d9
pagEQ$BoD#9pfA▔$B9.+"9pi
cK▎$B/9└kpick argument < 1D0*D
9preV%G▝JquerY5%B*D"pmXl19
quiT@%BXP1L-&h%▌!*DT$Ro
k▕▒9r▔£%O,lrshifT%%▎l▒%vV▃l
r/W%ByD#9r┌▗%O,
DlooP▃"B"'▄ ▒9lshifTJ"┌
"▎l▃"6▃lm▏"B-t;*+I% 9
m*▂▒"B-*;t*;tG$-z&z&M*┼%
+z&I%+z&X▝┼%D+z&z&I%D+*$*z& 9m├
#B←(▝9m▂D#BG$tt/ ┼%;D+I%┼%-a
*I%a*9m/moDQ#BtX┼%D+I%*tD+I%9
maX#B└xoR-✓-▍uh▍ulA
┼┬-BX*19I[compile│H-BUMT$knot 
found$9│V-B"─*19thrU▘-Bb
*0"!▎+"!─"├!┐▒9syscalL.B├(
││9masK3.B9*┐"9ErecuRg.BY!✓$
9sbiTx.BG$D"▒-S+9cbiTL.BG$D
S+9fbiT.Bz&S..9l
 ▒lherE▘ B▚D9heX┼ B"19
hlD O,fholD▝ B"▒▒!$!D┘9I!│
%i▕!+!✓┘h┘▒lBiF$!B▄ X
[9immediatE:!BY!"@+9inplfNo!G
init-fortHG!init-useRT!inter
preT!B"D#9J!┴!✓┘h┘▒lke
Y├!B,D┴9u/moD▂+F+▍▎▍▎
*66&8▍▍▍▍h▏H66
FPlu▝▝+BX*X>9EuntiL,B9'
▄ ▒9uP,▘updatE0,B<%DD"
$<%D19usE9,G ┐useRx,B▃ ┴E
▘hE▒lvariablEB,B└[E9voc-linK▒
,O,vocabularY,B D#
▒┴E┌┤▍┴P▍UP▍UP
Plh▍HP▒HEPMlexecu
tE▂%▍▍lexiT;H▖H▝lex
pecT2BD#9fencEdO,filLwBG$
┤│$9finDCBM$
X9firsT ┐flasTGLflD▕O,dfo
rgeT┤B-D&;pEX┴DW
▝ 2dvGXsigN)B▌"-
!9smudgE▏)BY!" +9sp▌▝)* ┴▘l
sp┌*O,sp─!*2*hlspacE**BA9
spaceS9*BX▘#▏X0a*▝▒9spliTi
*T*▍l3*statEJ*O,psysdeV┼*GswaP
**▍h▍▍▎ltexT*B▄ │0*W(
*▒9digiTL▗8▍00I08I0U
hlhlHdliteraL▄B*D*▕"
▕"9dnegatE;8▍▍lk$BdO/B0
▄ "9Edoes▘iB▃" KX9JJ
▏IE8HHlBdoserR£└
*I┌ K' ┤' C▒▒ldPO,dpL✓O,b
dr┌BB▒ ┴ R▒HP─▒  ✓▒└H┌▄I 
 ┘▒ ─▒ ┤'─ ┤'▒(─▄ F▒ O▒I0┌ P O▒ 
R▒IP L▒▄ I▒▄z  ?( L▒8─ L▒─▄
▒
8
▃F
I:m▏
0l─
 ┴
I£P─ R▒▒
P┬▒
le(s->D▌&B/▌h$9savEx(R( O┐* 
P l( ✓▒└r)▄s ) ┘▒▁▒ X▒▒l
sySI(└( Ol▁▒▏
 ( coffee obj)                          
 4 base !                               
                                        
 0000 0000 0000                         
 1111 1111 1110                         
 1111 1111 1110                         
 1113 3311 1110                         
 1133 3331 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
                                        
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110                         
 1111 1111 1110 decimal                 
                                        
 obj.stuff                              
                                        
 create pie$ obj$,                      


#9latesT─!BDD9leavEP!└!✓┘
┘▒llfA▔!B"▒9limiT"
OlisT"B/L)1/▂D>/▂1R
screen #▎+"│X0"!"R) "!
L)D├!▒9<lit▘""┴▖h▒▖P▒
▝┴▖▒▖P▒▝lGliteraL"B*D"9
loaD"B7D#99warninG▌,O,EwhilE
,B?!R9wherEE,BPD]PD/L)1R
screen # /lD"▒$│H/Rline#
 │z&┼│▔q+lD"▒>l
D▄ ▒/t▒▄ ┼%b▒" 2or*I
%X0"↑A▒9widtHU,O,worD-B├D
#9─-BPD*D
I%$9DZ┤
knot in current vocabulary$↑$/←D,
kin protected dictionaryt┼%2D,
 ┼%D, ─,D┼%G$,D┬▒/
,1/"▒✓$"D/┼%,┬▒G$1D▏┤
Z▒I%▚19EfortH▝▒ TzfreezE B
"▘D"!"0W" RD!19gO E 
▍▍bB-G$/▒b┘W$│bW9
DtheN▗*BU['▄ G$▒*19tiBW*O,t&s
calC┬*BD#9togglE▖*+▌ultra
versE+B*G$"G$▒└┌▒*$9typE
#+B/G$*0"!▒A9▒│9
uj+▒+▍▍ 666▏U▏
UUP lu┐W+BX
X$19dr┴KBQX)9dr┬┼B▌9)
9dr┤├B┴[)9dr▎▖B")9dro
P&lduP1▍h▍lDelsE)B['
▄ X*[▒*[9emiT9BD#9
empty
-bufferSzB▔"G$▒┤"o▔0"▒"!1
X"!"1"▒▒9enclosEK▖ O
8FVHP
 h▒Hl
s┌▏(B'*D9save-bufferSR(BbX0"▒
+$▒9save-fortH(B ─ ""┤*W$
/p)┘p)W│"▄ P(9saven
amE)Gsuper-forth 64     scRe)O,nsec
/blKF)Gset-drXO)B$$9sec/trK│)
G▒▒*?tI▒┘R▕▝-neWV0
B┼/""▒<%1▔↑,1X▂19L)19f
-appenD├0BD/b▂Db/L)10"!┼l0/
"!▂1├!▒"c/9f-ediTY0B┤0▁09
f-savE1B/D/"o▔0"!D"▒S"▒-
"!R0" ▒"c/9f-loaD+1B┤0D/
9┼"X0/l0/9─"├!┐▒"c/9
f-numbeG  ┘▒ ─▒ ▕'┌qF▏E▏E▒h▏
)8▃)▃)HE▏▒l│& I' L▒FF
F▏)8▃)▃)FFP┼ C▒ C▒ L▒▒
lI▍▎JJ0HH0
m▍▍
▍I ▎─▏)  $(▏  $(▏ 
'┌ ├'─▄ I▒▄]  ?( ┐▒ ▖'▄ I▒▄l  ?( L▒
 ▕'─▄ F▒  ▁▒HP─▄ I
(2064)rllTzOX▒
.▃z!f[2┼jLdF<▚QHCu
1:4 0 03 14£i£b-p 4 0£#▒▒▒▍
HDP▍ ─lJJH ┴▖┴▖▏▖I
▖▒▝l ebs# ▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒K▒▒
▒▒▒▒▒▒▒▒no. error+"&$9
<t&scalc▘IBH*[┐"/"─>Rb
"#D)/D/"%>$▒z&*▒
*)▒9<word▘▘BF*▃>││
X▄ 14l$G$▒/t▄ ┘▄ bI%/"▒
>kinput > 255bW▄ 9<vocabulary79▘z
B└" " ▄ ,D,1▃ H┴q
P#▒JJJJIE E┴hl┌H
┴▖H┴H┴P▍▒hl<interpret▘Q
BM*D└#▄ $H
Db$▕"pD▒9<key▘6┐
R! F▒ ▁▒I┌▃▒l3*<line▘B┼*││
9<load▘▁B▏T$kunloadablePDtlD
tXl1B//9?loadinG▒BPDT
$kuse only when loading9?pairS┴B▒
kconditionals not paired9?stacKB0
*W(*,kempty stack0*W("U▒,kfull
 stack9?streaMgBkinput stream exha
usted9?terminaLBYD#9─F▌h
P▌laborT─B▏D#
l┐┴▏┌FFF ▒l┐l<?termin
al▘G ▁▒▒l3*<abort▘B*p ─C%9
<abort"▘(B│,┼%q+*C%I%/
▒bt9<block▘@B$Dt<%D/D┼%
▒D0tT$$┼%+/┼%9┬%/D┼%▒
DT$Z▒/<%1I%$R9<cmovEQB/9└
│$R9#9bordeRSB" P┘9
bpdrV▏brancH┴▖E▖hH┴▖E▝▝H▖
lbuffeRB↑,D<%D2↑,Dt$↑,1
↑,D/D"▒2T$($DSkbuffers full/t
t▝▒↑,1┼%D▌┼%R┼%D"▒SX┬%┼
%1┼%<%1I%R9byE"B "▄▝C 9c▌▒▚
▍lc▗B▄ ┘9E9c/LF▍
PHl0▘┐BX>90brancH▍▘▒┌
▏▖I▖▒▝ll┴1├5B99
1└=B9▒9┬j2wF6l2├←B
[92└MB[▒92▂ZB[979-sta
ndarDB9✓B0*Y1D21└*.▃▏
▝h▏▖h▏I▖E▝lA▖▒B9*L-9▝
W▂8▍▍▝┴▖XlLl&B*┼"P!
1"▝$1$"▕"┐"ARh       
   super-forth 64 v1.1.1  copyright 198
3 by elliot b. schneider▔↑,1"▝J<%1
Q!D"
 1▒29compilEBUI%/Rt
D9configurEBRno. of drives
? F!/"1▒/",T$k
▁Bt#I%V#9├┤▍U▍Ul
+▌&▌UP▌Ul+└B▌
h$9+buF<B"/"2$▔/<%D
▒9E+looPmB"'▄ ▒9▗TB▄
 1"E9└8▍▍▍U▍U
l-finD▄BID#9-trailinGEB/
X0o▒▒ull/2DDZ%│B,D
/q+a*R isn't unique ▒-D$b
"▒S"┘2*/bz&V"K*
b*E/"+▄ o"+Y![ED1▃
▏IhElcsP▁O,>currenTSO,@d▌
▍P▍P▍P▍l
d├▘▍U▍U▍U▍U▒▒▒
▒▒O▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▌▌3▍P▍l▔-BD▄#z&
"G$└""0!9#▘dB│!D
W$G$▒9#bufFN#SBh$┤▒9
A▕BMT$knot found$▕"9'-finD▁O,
'?terminaL─O,'aborTLO,'blocKO,
'cROXR219<vocabularyfig▘B
└" D▄ ,D,1▃ XR219
┘┴B▒T$9▘.B*└9>iN:O,6>Rfv
▍h▍hl▚oBD9?comPAB*DT$
k compile only9?configurEMB▃#
Rdrives9?csPB0*YD▒kdefiniti
on not finished9?duP┴
P1▌!I%l1I%P19<loop▘┘✓▘P
▘┘┘┘┘▒HHHHl$l<number
▘▒BXXz&/b▒"-2/t"▒▒H1?/
▒>@/▒".2T$knot recognized
XH1?/▒>knot recognized$I%
99<page▘1A R▒l<r/w▘B*/Y#
>G$▌$kblk 9Fabort▄TBUkF
▒""29l$XK"""-/▒b*
G$▒""2T$
E9abS▒B/a9EagaiN
5B9'▄ ▒9alloTcB▚$9anD
]U▍5h▍5lbasEMO,8EbegiNBU
▄ 99bkgnD
B"!P┘9bL blanK┴
BJ9blK✓O,:blocKJB┴D<cmove
▘M✓ Ol┴HP▒▒DP┴F└l<cr▘
┐! R▒l<do▘2▍h▍h▍h▍hl<em
it▘)l┐▘$ I▒▒▍ R▒┐jOl<expect▘aB
G$G$0?/"2├!$X/"!┘
X"!b1$9R▒$9<fill▘A▍ O▏l
FHP▒DP▍F┴l<find▘ O 
┴q)?P-@c─W▌lcatniB▌▝▍
lcfA┴B9changEB""
▒"▏1┼9chariNa┐R! F▒ O▒▒
l3*cleaR6B$D+"Jb,9cmovE
qB/9└│$9colDOcl
▏)▘@
▃▒▒ ▃✓▒
▖▒▘▒
▒▒


▏└▘└▒▃▘
▍▍piHl<▔BW$!19<+l
oop▘!▍▒hh▍▘✓│H│H┘
┘┘┘l"l<-find▘B-2DDZ
9<."▘qB┼%/bI%tq+9</loop▘K!
▍▒h▍▘✓│H│l<;code▘
BI%Y!✓$19<<cmove▘▂T O▁PF▏
E▏E┌┴out of range*Ab"▖
#1QRdr0 selected 9constanT▄B└
▃ ┴hH┴lcontexTO,<converT(B
b/t▒D,*D+$z&D+▝H
Db9H$I%F▒I%9counT5B/b*
▒9cRB✓D#9creatEB-//b
▒X2kattempted to redefine n├!
o▒▒9┐WB←(┴9B.▄BF▒""2
9l$@""*DR-/▒bG
$▒""2T$
*D▒bEq+9
.linEB└▔q+9.RTBt←(I%9▂B
H*$9E/looPB"'▄ ▒9/mo
D▏Bt←(I%V#9┌A0▝T▔*l
0┘▍ld+└B▌99d┐ZBX
a*9d.R▗BT"└kempty stackt*
G$/ z&▗)SI%G$▒r*q+9d▝▖Bz&2
z&z&9▝▌*└*$*$9dabS9
B/ 9ddroPFdduPU▍h▍JJH▍
h▍ldecimaLB"19definition
SB2D19deptH┬B






























































































































































































































































































( sprites -- head0)                     
4 base !                                
s-def head0                             
0000 0000 0000                          
0222 2220 0000                          
0122 2222 0000                          
0112 2222 2000                          
0311 2222 2200                          
0131 2111 1110                          
0111 2111 1110                          
1111 2111 1110                          
2111 2222 2220                          
1211 2111 1110                          
1121 2111 1110                          
0112 2111 1112                          
0111 2111 1112                          
0011 2111 1112                          
0002 1111 1110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
0000 2110 2110                          
decimal                                 
                        
( sprites -- head1)                     
4 base !                                
s-def head1                             
0000 0000 0000                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0011 1111 1100                          
0011 1111 1100                          
0011 1111 1100                          
0222 2222 2220                          
0211 1111 1120                          
0211 1111 1120                          
0211 1111 1120                          
0011 1111 1100                          
0011 1111 1100                          
0022 2002 2200                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
decimal                                 
                        
( sprites -- head2)                     
4 base !                                
s-def head2                             
0000 0000 0000                          
0000 0222 2220                          
0000 2222 2210                          
0002 2222 2110                          
0022 2222 1130                          
0111 1112 1310                          
0111 1113 1110                          
0111 1112 1111                          
0222 2222 1112                          
0111 1112 1121                          
0111 1111 2211                          
2111 1112 1110                          
2111 1112 1110                          
2111 1112 1100                          
0111 1111 2000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
decimal                                 
                        
( sprites -- head3)                     
4 base !                                
s-def head3                             
0000 0000 0000                          
0002 2222 2200                          
0222 2222 2100                          
1111 1121 1100                          
1111 1121 1330                          
1113 3333 3330                          
1131 1123 3330                          
1111 1123 3100                          
1111 1121 1110                          
0111 1112 1111                          
0111 1111 2112                          
0222 1112 2221                          
1111 2221 2111                          
1221 1111 2110                          
1111 1112 1000                          
1111 2220 0000                          
0222 2220 0000                          
0211 2110 0000                          
0211 2110 0000                          
0211 2110 0000                          
0211 2110 0000                          
decimal                                 
                        
( sprites -- head4)                     
4 base !                                
s-def head4                             
0000 0000 0000                          
0222 2222 0000                          
0122 2222 2000                          
0112 2222 2200                          
0112 1111 1110                          
0312 1111 1110                          
0133 3333 3330                          
0113 3333 3330                          
0112 3331 3330                          
2212 1111 1110                          
1121 1111 1111                          
1112 1111 1112                          
1111 2222 2221                          
0211 1111 1110                          
0221 2111 1110                          
0222 0222 0000                          
0212 0222 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
0211 0211 0000                          
decimal                                 
                        
( sprites -- head5)                     
4 base !                                
s-def head5                             
0000 0000 0000                          
0022 2222 2200                          
0022 2222 2200                          
0022 2222 2200                          
0011 1111 1100                          
0011 1111 1100                          
0033 3333 3300                          
0033 3113 3300                          
0233 3113 3320                          
0211 1111 1120                          
0211 1111 1120                          
0221 1111 1220                          
0212 2222 2120                          
0011 1111 1100                          
0011 1111 1100                          
0022 2002 2200                          
0022 2002 2200                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
0021 1002 1100                          
decimal                                 
                        
( sprites -- head6)                     
4 base !                                
s-def head6                             
0000 0000 0000                          
0000 2222 2220                          
0002 2222 2210                          
0022 2222 2110                          
0111 1111 1110                          
0111 1111 2130                          
0333 3333 3310                          
0333 3333 3110                          
0333 1333 2110                          
0111 1111 2122                          
1111 1111 1211                          
2111 1112 2111                          
1222 2222 1111                          
0111 1111 1120                          
0111 1112 1220                          
0000 2220 2220                          
0000 2220 2120                          
0000 1120 1120                          
0000 1120 1120                          
0000 1120 1120                          
0000 1120 1120                          
decimal                                 
                        
( sprites -- head7)                     
4 base !                                
s-def head7                             
0000 0000 0000                          
0022 2222 2000                          
0012 2222 2220                          
0011 1211 1111                          
0331 1211 1111                          
0333 3333 3111                          
0333 3211 1311                          
0013 3211 1111                          
0111 1211 1111                          
1111 2111 1110                          
2112 1111 1110                          
1222 2111 2220                          
1112 1222 1111                          
0112 1111 1221                          
0001 2111 1111                          
0000 0222 1111                          
0000 0222 2220                          
0000 0211 2110                          
0000 0211 2110                          
0000 0211 2110                          
0000 0211 2110                          
decimal                                 
                        
( sprites -- feet0)                     
4 base !                                
s-def feet0                             
0000 2000 2000                          
0000 2220 2220                          
0000 2220 2220                          
0110 1220 1220                          
1122 1222 1220                          
1222 2222 2220                          
0222 2222 2220                          
0122 2222 2220                          
0112 2222 2220                          
0110 2220 2220                          
0000 1220 1220                          
0000 1100 1100                          
0000 1100 1100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet1)                     
4 base !                                
s-def feet1                             
0020 2002 0200                          
0022 2002 2200                          
0022 2002 2200                          
0022 2002 2100                          
0012 2002 2100                          
0012 2012 2210                          
0122 2112 2210                          
0122 2112 2210                          
0122 2102 2200                          
0022 2012 2210                          
0122 2112 2210                          
0122 2111 0110                          
0110 1100 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet2)                     
4 base !                                
s-def feet2                             
0002 0002 0000                          
0222 0222 0000                          
0222 0222 0000                          
0221 0221 0110                          
0221 2221 2211                          
0222 2222 2221                          
0222 2222 2220                          
0222 2222 2210                          
0222 2222 2110                          
0222 0222 0110                          
0221 0221 0000                          
0011 0011 0000                          
0011 0011 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet3)                     
4 base !                                
s-def feet3                             
0000 0020 0000                          
0002 2220 0000                          
0222 2220 0000                          
0222 2120 0000                          
0212 2120 0000                          
0212 2220 0000                          
0222 2222 2110                          
0222 2221 2211                          
0222 2221 1211                          
0222 2221 1222                          
0222 2222 2110                          
0111 0111 1110                          
0111 0111 0100                          
0010 0010 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet4)                     
4 base !                                
s-def feet4                             
0200 0200 0000                          
0222 0222 0000                          
0222 0222 0000                          
0122 0122 0000                          
0122 0122 0000                          
0222 2222 0000                          
0222 2222 2000                          
0122 2211 2110                          
0112 2111 1111                          
0110 2111 1111                          
0000 1222 2222                          
0000 1100 1100                          
0000 1100 1100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet5)                     
4 base !                                
s-def feet5                             
0020 2002 0200                          
0022 2002 2200                          
0022 2002 2200                          
0022 2002 2200                          
0012 2002 2100                          
0012 2002 2100                          
0122 2112 2210                          
0122 2112 2210                          
0122 2112 2210                          
0021 2002 1200                          
0111 1111 1110                          
0122 2112 2210                          
0110 1111 0010                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet6)                     
4 base !                                
s-def feet6                             
0000 0020 0020                          
0000 2220 2220                          
0000 2220 2220                          
0000 2210 2210                          
0000 2210 2210                          
0000 2222 2220                          
0002 2222 2220                          
0112 1122 2210                          
1111 1112 2110                          
1111 1112 0110                          
2222 2221 0000                          
0011 0011 0000                          
0011 0011 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( sprites -- feet7)                     
4 base !                                
s-def feet7                             
0000 0200 0000                          
0000 0222 2000                          
0000 0222 2220                          
0000 0212 2220                          
0000 0212 2120                          
0000 0222 2120                          
0112 2222 2220                          
1122 1222 2220                          
1121 1222 2220                          
2221 1222 2220                          
0112 2222 2220                          
0111 1110 1110                          
0010 1110 1110                          
0000 0100 0100                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( pie.s)                                
4 base !                                
s-def pie.s                             
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0022 0000                          
0000 0022 2000                          
0000 0212 2200                          
0000 2221 2220                          
0002 2222 1222                          
0222 2222 2122                          
2222 2222 2212                          
0111 3113 1112                          
0131 1111 1312                          
0311 1311 3112                          
2222 2222 2222                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( coffee.s)                             
4 base !                                
s-def coffee.s                          
0000 0000 0000                          
0000 0100 1000                          
0000 1001 0000                          
0000 1001 0000                          
0000 0000 0000                          
0003 3330 0000                          
0033 2233 0000                          
0332 2223 3000                          
0332 2223 3330                          
0333 3333 3033                          
0333 3313 3033                          
0333 3313 3033                          
0333 3313 3330                          
0333 3313 3000                          
0033 3333 0000                          
0003 3330 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( brick.s)                              
4 base !                                
s-def brick.s                           
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0222 2222 2220                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
( coffee2.s)                            
4 base !                                
s-def coffee2.s                         
0000 0000 0000                          
0000 0100 1000                          
0000 1001 0000                          
0000 1001 0000                          
0000 0000 0000                          
0002 2220 0000                          
0022 0022 0000                          
0220 0002 2000                          
0220 0002 2220                          
0222 2222 2022                          
0222 2212 2022                          
0222 2212 2022                          
0222 2212 2220                          
0222 2212 2000                          
0022 2222 0000                          
0002 2220 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
0000 0000 0000                          
decimal                                 
                        
















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































( editor patches)                       
                        : se dup r# ! pp
 quit ;                                 
        : 16) 16 se ; : 17) 17 se ;     
                                : 18) 18
 se ; : 19) 19 se ;                     
                : 20) 20 se ; : 21) 21 s
e ;                                     
: 22) 22 se ; : 23) 23 se ;             
                        : 24) 24 se ; : 
25) 25 se ;                             
                                        
                                : s-c/l 
40 ' c/l ! ;                            
                : n-c/l 64 ' c/l ! ;    
                                        










( printer opener)                       
." 4 close --- turns off printer."      
4 4 3 " 0" open                         
4 cmd                                   
                                        





































































































































































































































