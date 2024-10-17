F(▖qm$┌Frm$p┌F
Cstep▚V┌┌▘▄£<▄▘▄▝#"$
┌▒CspDW┌┌J▄F&▘▒Crob▚┘┌┌Cpn
▔┴exchip#┐┴┌sq▄▝8r=" T,K2▍,
'"│┘"!T,K28r=,▌#┘Ccalc.ne
xt.instructioN(┴┌t▍├qv)s"$
FFxsq▄/t▄Wsrm$c└F(rm$
┼└F rm$m┐FF┼
]CkeypresS┐┌Yq▄t"@▌#tY
q2F]Cupdate.keY┴┐┌▍"─("
 ▔▍▍"@┼v)"z("$t"@"
@▔"%T,K2▍t─!F"EVF▍
"@▕Yq2Cflip.coiN ▂┌iM]






I▏FF▝
L,I▏p▕▒pFF▝
F
├Cact.on.worlD!▗┌trm$F
<─rm$+├F*hrm$+▗F9
rm$▔]K▒FCfeel.foRY▗┌vm▄
'▁▌─*9):5):I52:5):58▎5fw▄L,
E8▎5F5wl▄▍g 0▍Jt"▘F
"LZ5Fk2:5"&;m
( super-forth system loader block )     
                            3 ." thru " 
          load cr                       
            4 ." c64 utilities "  load c
r                                5  6 ."
 kernal words "   thru cr               
                 7 12 ." strings "      
  thru cr                               
( 13 17 ." file-mode "      thru cr )   
                        18 21 ." graphic
s "       thru cr                       
        22 23 ." sound "          thru c
r                               24 26  .
" utilities "      thru cr              
                33 34 ." supplementals "
  thru cr                               
 105 112 thru                           
                        ( 42 45 ." edito
r "           thru cr                   
        ( 46 49 ." decompiler util. " th
ru cr   )                       122 load
  ( cheap forget)                       
                ( 123 load  ( new save) 
                                        
                                        
                        
( disk directory/loader )               
                        ( 50 51 ." trig 
routines "    thru cr )                 
        ( 52 53 ." square root "      th
ru cr)                          ( 54 61 
." floating point "   thru cr)          
                62 66 ." c64 data/const.
 "  thru cr                             
67 72 ." graphics "         thru cr     
                        73 75 ." i/o ext
ensions "   thru cr                     
        76 load  79 ." utilities "   loa
d      cr                       80 load 
  ( music)                              
                121 load ( custom)      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( utilities: thru )                     
                        forth definition
s                                       
                                        
                                : thru  
1+ swap                                 
                    do i u. i load      
                                        
     ?terminal if leave then loop ;     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( c64 utilities: syscall recurse -text )
                                        
                                        
        : sy  ( a x y addr --- )        
                                   sys d
drop ddrop ;                            
                exit <<<<<<<<<<<        
                                        
( implement recursive definitions )     
                        : recurse  ( imp
lement recursive procedures )           
           latest  pfa  cfa  , ;  immedi
ate                                     
                                        
                : -text   ( adr1 c adr2 
--- flag )                              
   ddup + swap                          
                           do drop 1+ du
p 1- c@ i c@ - dup                      
            if 1 swap +- leave then     
                                   loop 
swap drop ;                             
                                        
                                        
                                        
                        
( kernal & i/o: setlfs setnam open close
 clrchn )               hex             
                                        
        : setlfs ( lfn dev cmd --- )    
                                   ffba 
sy ;                                    
                                        
                                        
: setnam ( stringaddr --- )             
                           count swap sp
lit ffbd sy ;                           
                                        
                                : open  
( lfn dev cmd addr --- )                
                   setnam   setlfs      
                                        
   ffc0 go ;                            
                                        
                                        
        : close  ( lfn --- )            
                                   0 0 f
fc3 sy ;                                
                                        
                                        
: clrchn  ( --- )  ffcc go ; decimal    
                        
( kernal interface: loadram dos st )    
                        hex             
                                        
        : lr ( loadaddr fileaddr --- )  
                                   setna
m                                       
                   >r ff sysdev @ r@ 0= 
 setlfs                                 
   0 r> split ffd5 sy ;                 
                                        
                                        
                                        
                                : dos  (
 stringaddr --- )                       
                   >r f sysdev @ f r> op
en                                      
   f close ;                            
                                        
                                        
        : st  ( --- status ) 0090 c@ ;  
                                decimal 
                                        
                                        
                                        
                                        
                        
( strings: $variable $constant <$concat>
 )                      : $v            
                                        
           create  ( # --- )            
                                    0 c,
 allot ;                                
                                        
                                        
: $c                                    
                           create  ( ---
 )                                      
            here 1+  34 text  pad count 
                                    dup 
c,  dup allot  cmove ;                  
                                        
                                        
( concatenation primitive- concat c2 cha
rs from a2 onto end s1 ): <$+>  ( s1 a2 
c2 --- )                                
           >r over count +              
                                   r@ cm
ove dup c@ r> +                         
                   swap c! ;            
                                        
                                        
                        
( strings: $concat $left $mid $right )  
                        ( concat s2 onto
 end of s1 )                            
        : $+  ( s1 s2 ---  )            
                                   count
 <$+> ;                                 
                 exit <<<<<<<<<<<       
                                        
( concat n leftmost chars of s2 to s1 ) 
                        : $left  ( s1 s2
 num --- )                              
           swap 1+ swap <$concat> ;     
                                        
                                        
                ( concat n chars startin
g from s in s2 to s1 )                  
: $mid   ( s1 s2 s n --- )              
                           >r + r> <$con
cat> ;                                  
                                        
                                ( concat
 n rightmost chars of s2 to s1 )        
                : $right ( s1 s2 num ---
 )                                      
   >r count + r@ - r> <$concat> ;       
                        
( strings: $val  $len  $.  $clr )       
                        ( convert string
 s1 into 16 bit # )                     
        exit <<<  : $val    ( s1 --- n )
                                   numbe
r drop ;                                
                                        
                                        
( get length of string s1 )             
                        : $len    ( s1 -
-- n )                                  
           c@ ;                         
                                        
                                        
                ( print a string )      
                                        
: $.     ( s1 --- )                     
                           count type ; 
                                        
                                        
                                ( clear 
a string )                              
                : $clr   ( s1 --- )     
                                        
   0 swap c! ;                          
                        
( strings: <$"> " )                     
                        ( run-time routi
ne for " )                              
        : <">  ( --- s1 )               
                                   0 pad
 c! pad                                 
                   r@ count dup 1+ r> + 
>r                                      
   <$+> pad ;                           
                                        
                                        
        ( enter a string into the pad ) 
                                : "   ( 
--- s1 )                                
                   34 state @  ( check f
or compile)                             
   if compile <">  ( compile addr of run
-time routine )             word c@ 1+ a
llot                                    
           else text pad                
                                   then 
; immediate                             
                                        
                                        
                                        
                        
( strings: $cmp $< )                    
                        ( compare two st
rings- results:                         
           0: s1=s2;  1: s1>s2;  2: s1<s
2 )                             exit <<<
<<<<                                    
                : $cmp  ( s1 a2 c2 --- f
lag )                                   
   rot count rot ddup - >r r@           
                           0> if swap th
en                                      
           drop rot -text               
                                    ?dup
 if  r> drop                            
                     else r> dup if 1 sw
ap +- then                              
     then ;                             
                                        
                                        
        ( check if s1 < s2 )            
                                : $<   (
 s1 s2 --- f )                          
                   count $cmp 0< ;      
                                        
                                        
                        
( strings: $> $= $find ) exit <<<       
                        ( check if s1 < 
s2 )                                    
        ( check if s1 > s2 )            
                                : $>   (
 s1 s2 --- f )                          
                   count $cmp 0> ;      
                                        
                                        
                        ( check if s1 = 
s2 )                                    
        : $=   ( s1 s2 --- f )          
                                   count
 $cmp 0= ;                              
                                        
                                        
( find occurence of s1 in string )      
                        : $find ( s1 a2 
c2 --- [addr] flag)                     
           over + swap                  
                                    do d
up count i -text dup 0=                 
                     if swap drop i swap
 leave else drop then                   
    loop not ;                          
                        
( file mode: fname fopen file-mode )    
                        23 $variable fna
me                                      
                                        
                                ( open a
 file )                                 
                : f-open  ( --- )       
                                        
   9 sysdev @ 9 fname open ;            
                        ( dummy r/w rout
ine )                                   
        : fr/w  ddrop drop ;            
                                ( set up
 file-mode )                            
                : file-mode  ( "filename
" --- )                                 
   dr0  1 mode !  ' fr/w cfa 'r/w !     
                           34 text pad $
len                                     
            if fname $clr fname pad $con
cat                                 then
 ;                                      
                                        
                                        
: f-exit 0 mode !   ' <r/w> cfa 'r/w ! ;
                        
( file-mode: readb writeb )             
                        ( read a block f
rom an opened file into a buffer )      
        : readb  ( addr --- )           
                                   9 inp
lfn !                                   
                   1024 0 do            
                                        
     key over i + c!                    
                            loop        
                                        
           2 inplfn !  drop ;           
                                        
                                        
                ( write a block from a b
uffer into an opened file )             
: writeb  ( addr --- )                  
                           9 outlfn !   
                                        
           1024 0 do                    
                                     dup
 i + c@ emit                            
                    loop                
                                        
   3 outlfn ! drop ;                    
                        
( file-mode: f-init f-new f-append )    
                        ( initialize to 
edit a file )                           
        : f-new   ( [filename] )        
                                   empty
-buffers  file-mode                     
                   limit 1028 - prev !  
first use !                             
   0 flast !  1 scr ! ;                 
                                        
                                        
        ( append file to buffers )      
                                : f-appe
nd  ( [filename] )                      
                   file-mode  f-open    
                                        
   #buff 1+ flast @ 1+ dup scr ! do     
                            i block read
b st                                    
             if i flast ! leave then    
                                    loop
                                        
                   9 close ;            
                                        
                                        
                        
( file-mode: f-edit f-save )            
                        ( init system & 
read in file )                          
        : f-edit  ( [filename] )        
                                   f-new
  f-append ;                            
                                        
                                        
hex                                     
                        ( save buffers t
o a file )                              
        : f-save  ( [filename] )        
                                   file-
mode f-open                             
                   limit 1- first do    
                                        
    i @ 7fff and 7fff xor               
                             if i 2+ wri
teb then                                
            404 /loop                   
                                   9 clo
se ;                                    
                decimal                 
                                        
                                        
                        
( file mode: f-load f-number )          
                        : f-load  ( [fil
ename] ; --- )                          
           f-new  f-open                
                                   1 blo
ck  ( load into block 1 )               
                   170 0 do             
                                        
    dup readb st                        
                            1 load      
                                        
            if leave then  ( check statu
s for eof )                        loop 
  9 close ;   hex                       
                : f-number  ( start --- 
)                                       
   depth 0=   if 1 then                 
                           8000 or  limi
t 1- first do                           
             i @ 7fff = not             
                                      if
 dup i ! 1+ then                        
                   404 /loop drop ;     
                                        
decimal                                 
                        
( graphics: s-m m-c s-s-collision s-b-co
llision)                hex             
                                        
        : s-m ( color num --- )         
                                   d025 
+ c! ;                                  
                                        
                                        
: m-c   ( f --- )                       
                           d016 10 fbit 
;                                       
         decimal exit <<<<<             
                                : s-s-co
llision   ( --- value )                 
                   d01e c@ ;            
                                        
                                        
                        : s-b-collision 
  ( --- value )                         
           d01f c@ ;                    
                                decimal 
  exit                                  
                                        
                                        
                                        
                        
( graphics: b-graphics b-fill b-color b-
col-fill )               exit <<<<    he
x                                       
        : b-graphics   ( flag --- )     
                                   d011 
20 fbit ;                               
                                        
                                        
: b-fill   ( char --- )                 
                           'bitmap 1f40 
rot fill ;                              
                                        
                                : b-colo
r    ( pos hcol lcol --- )              
                   catnib swap 'screen +
 c! ;                                   
                                        
                        : b-color-fill  
 ( hcol lcol --- )                      
           catnib 'screen 3e8 rot fill ;
                                decimal 
                                        
                                        
                                        
                                        
                        
( graphics: s-f s-enable s-xexp s-yexp )
                        hex             
                                        
        : s-f   ( flag addr --- )       
                                   sprit
e @ mask fbit ;                         
                                        
                                        
: s-enable   ( flag --- )               
                           d015 s-f ;   
                                        
                                        
                                : s-xexp
   ( flag --- )                         
                   d01d s-f ;           
                                        
                                        
                        : s-yexp    ( fl
ag --- )                                
           d017 s-f ;                   
                                decimal 
 exit                                   
                                        
                                        
                                        
                        
( graphics: s-p s-ml s-pt s-c )         
                        hex             
                                        
        : s-p   ( flag --- )            
                                       d
01b s-f ;                               
                                        
                                        
: s-ml   ( flag --- )                   
                           d01c s-f ;   
                                        
                                        
                                : s-pt  
 ( spr# --- )                           
                   'screen 3f8 + sprite 
@ + c! ;                                
                                        
                        : s-c   ( color 
--- )                                   
           d027 sprite @ + c! ;         
                                decimal 
exit                                    
                                        
                                        
                                        
                        
( sound- v-f v-pw v-ad v-sr )           
                        ( set frequency 
of voice )                              
        : v-f  ( value --- )            
                                   split
  1  v!  0  v! ;                        
                                        
                                        
( set pulse width of voice )            
                        : v-pw  ( value1
2 --- )                                 
           split  3  v!  2  v! ;        
                                        
                                        
                ( set attack & decay of 
voice )                                 
: v-ad  ( attack4 decay4 --- )          
                           catnib  5  v!
 ;                                      
                                        
                                ( set su
stain & release of voice )              
                : v-sr  ( sust4 rel4 ---
 )                                      
   catnib  6  v! ;                      
                        
( sound- v-ctrl rf mv )                 
                        ( set control va
lues of voice )                         
        : v-ctrl  ( value --- )         
                                   4  v!
 ;                                      
                                        
                                        
( set filter frequency )                
                        ( set resonance 
& filter switches )                     
        : rf  ( res fsws --- )          
                                   catni
b 23 sid! ;                             
                                        
                                        
( set filter mode & sid volume )        
                        : mv   ( mode vo
lume --- )                              
           catnib 24 sid! ;             
                                        
                                        
                                        
                                        
                                        
                        
( utilities: .s .sl .sr .ss .index <rot 
)  exit <<              -1 constant .ss 
                                        
        : .sl 0 ' .ss ! ;               
                                : .sr -1
 ' .ss  ! ;                             
                : .s cr depth           
                                        
    if .ss  if sp@ s0 2-                
                             else sp@ s0
 swap then                              
             do i @ 0 d. 2 .ss +- +loop 
                                    else
 ." empty stack " then cr ;             
                : <rot rot rot ;        
                                        
: .index                                
                          dup pad 1 rot 
t&scalc 1 rwts drop                     
          cr offset @ - 4 .r            
                                  2 spac
es pad c/l -trailing type ;             
                                        
                                        
                                        
                        
( utilities:max-buffs bmove copy scopy d
swap d- d0= )           : dswap 4 roll 4
 roll ;                                 
        : d- dnegate d+ ;               
                                : d0= or
 0= ;                                   
                : copy offset @ + swap b
lock 2- ! update ; exit <<<<            
: max-buffs  ( --- )                    
                           limit here - 
0 1028 u/mod                            
           ' #buff ! drop change ;      
                                        
                                        
                : bmove <rot ddup u<    
                                        
   if rot <cmove                        
                           else rot cmov
e then ;                                
                                        
                                : scopy 
( fstart fend tstart --- )              
                   <rot 1+ swap   do i o
ver copy 1+ loop drop ;                 
                                        
                        
( utilities: d= d> d@ dconstant dmax dmi
n dover du< dv )        : d= d- d0= ;   
                                        
        : d> dswap d< ;                 
                                : d@ dup
 2+ @ swap @ ;                          
                ( : dconstant create swa
p , ,                                   
   does> dup @ swap 2+ @ ; )            
                        : dover 4 pick 4
 pick ;                                 
        : dv create 4 allot ; exit <<<  
                                : dmax d
over dover d< if dswap then ddrop ;     
                : dmin dover dover d< no
t if dswap then ddrop ;                 
: du< >r >r 32768 +                     
                             r> r> 32768
 + d< ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                        
( utilities:  pause  )                  
                        hex             
                                        
        : pause  ?terminal              
                                   if 10
00 0 do loop                            
                     begin ?terminal unt
il                                      
     1000 0 do loop                     
                           then ;       
                                        
        decimal                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( utilities: index ?loading --> )       
                         exit           
                                        
        : ?loading                      
                                  blk @ 
not abort" loading only " ;             
                                        
                                        
: -->  ( --- )                          
                           ?loading 0 >i
n ! 1 blk +! ;                          
        immediate                       
                                : index 
    ( from to --- , )                   
                  cr offset @ dup rot + 
1+ rot rot +                            
  over max-blks 1+ >                    
                          abort" blk no.
 error"                                 
          do i .index pause ?terminal   
                                    if l
eave then                               
                  loop ;                
                                        
                                        
                        
( utilities: dump )                     
                        hex   ( addr n -
-- )                                    
        : dump 0 base @ >r hex          
                                  do cr 
dup i + dup 0 6                         
                   d.r 2 spaces dup 8 0 
                                        
    do dup i + c@ 3 .r loop             
                           drop space du
p 8 + 8 0                               
            do dup i + c@ 3 .r loop     
                                   drop 
3 spaces 10 0                           
                    do dup i + c@ dup 20
 < over 7e > or                         
     if drop 2e then emit               
                           loop drop 10 
                                        
          pause ?terminal if leave then 
                                 /loop  
                                        
                 drop cr r> base ! ;    
                                        
decimal                                 
                        
( utilities: 'title title triad )       
                        variable 'title 
                                        
        : title  cr 11 spaces           
                                   ." ch
ipwits c-64 development" cr ;           
                                        
                                        
' title cfa 'title !                    
                                        
                                        
        : triad 0 2 u/mod swap drop     
                                   2 * 2
 over + swap                            
                   do cr i list ?termina
l                                       
    if leave then  1  /loop             
                           'title @ exec
ute                                     
           12 emit ;                    
                                        
                                        
                                        
                                        
                                        
                        
( utilities:  <7>  id.  )               
                        hex             
                                        
                                        
                                : <7>  7
f and <emit> ;                          
                                        
                                        
( id. : print name from nfa )           
                        : id.   ( addr -
-- )                                    
           ' <7> cfa 'emit !            
                                   count
 1f and type                            
                   ' <emit> cfa 'emit ! 
;                                       
                                        
                        decimal         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( utilities: vl vt vlist ) decimal      
                        variable vl     
40 vl !                                 
        variable vt     13 vt !         
                                        
                                        
                : vlist 32767 out !  con
text @ @                                
   begin vl @ 1- out @ - over c@ 31 and 
                            < if cr 0 ou
t ! then                                
            dup id.                     
                                    vt @
 out @ over mod - spaces                
                    pfa lfa @ dup       
                                        
    0= pause ?terminal or               
                           until drop ; 
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( supplementals:  's "2" double number s
et )                                    
                                        
        : 's sp@ ;                      
                                  exit  
                                        
                : 2! d! ;               
                                        
: 2@ d@ ;                               
                        : 2constant dcon
stant ;                                 
        : 2drop ddrop ;                 
                                : 2dup d
dup ;                                   
                : 2over dover ;         
                                        
: 2swap dswap ;                         
                        : 2variable dvar
iable ;                                 
                                        
                                        
                                        
                                        
                                        
                                        
                        
( supplementals: >binary erase flush h u
.r ['] )                ( : >binary conv
ert ;  )                                
                                        
                                ( : empt
y init-forth @ ' forth 2+ !             
                   init-user up @ 6 + 48
 cmove ; )                              
                                        
                        ( : erase 0 fill
 ; )                                    
                                        
                                : flush 
save-buffers ;                          
                exit <<<                
                                        
: h dp ;                                
                                        
                                        
        : u.r 0 swap d.r ;              
                                        
                                        
                : ['] ?comp [compile] ' 
; immediate                             
                                        
                        
( assembler: constants index )          
                        vocabulary assem
bler immediate                          
        hex assembler definitions       
                                ( regist
er assignments specific to this implemen
tation )        83 constant xsave   81 c
onstant w                               
fb constant ip      87 constant n       
                                        
                                        
        ( nucleus locations specific to 
this implementation)            0884 con
stant pop    0882 constant poptwo       
                088b constant put    088
9 constant push                         
0890 constant next   0871 constant setup
n                                       
                                        
        variable index -2  allot        
                                0909 , 1
505 , 0115 , 8011 , 8009 , 1d0d , 8019 ,
 8080 ,         0080 , 1404 , 8014 , 808
0 , 8080 , 1c0c , 801c , 2c80 , decimal 
                                        
                        
( assembler: mode addressing modes bot s
ec rp> upmode )         hex             
                                        
        variable mode 2 mode !          
                                : .a 0 m
ode ! ; : # 1 mode ! ;  : mem 2 mode ! ;
                : ,x 3 mode ! ; : ,y 4 m
ode ! ; : ,x) 5 mode ! ;                
: ),y 6 mode ! ; : ) f mode ! ;         
                                        
                                        
        : bot ,x 0 ;     ( address the b
ottom of data stack )           : sec ,x
 2 ;     ( address second item on data s
tack )          : rp> ,x 101   ; ( addre
ss bottom of return stack )             
                                        
                        : upmode if mode
 @   8 and 0= if 8 mode +! then then    
           1 mode @ 0f and ?dup  if 0 do
 dup + loop then                   over 
1+ @ and 0= ;                           
                                        
                                        
decimal                                 
                        
( assembler: cpu )                      
                                        
                                        
        hex                             
                                : cpu cr
eate c, does>  c@ c, mem ;              
                    00 cpu brk,    18 cp
u clc,    de cpu cld,    58 cpu cli,    
    b8 cpu clv,    ca cpu dex,    88 cpu
 dey,    e8 cpu inx,        c8 cpu iny, 
   ea cpu nop,    48 cpu pha,    08 cpu 
php,        68 cpu pla,    28 cpu plp,  
  40 cpu rti,    60 cpu rts,        38 c
pu sec,    f8 cpu sed,    78 cpu sei,   
 aa cpu tax,        a8 cpu tay,    ba cp
u tsx,    8a cpu txa,    9a cpu txs,    
    98 cpu tya,                         
                                        
                                        
        decimal                         
                                        
                                        
                                        
                                        
                                        
                        
( assembler: m/cpu )                    
                        hex             
                                        
        : m/cpu create c, , does>       
                                   dup 1
+ @ 80 and if 10 mode +! then over      
                   ff00 and upmode upmod
e if mem cr latest id.                  
   abort" incorrect addressing" then c@ 
mode c@                    index + c@ + 
c, mode c@ 7 and if mode c@             
           0f and 7 < if c, else , then 
then mem ;                      1c6e 60 
m/cpu adc, 1c6e 20 m/cpu and, 1c6e c0 m/
cpu cmp,        1c6e 40 m/cpu eor, 1c6e 
a0 m/cpu lda, 1c6e  0 m/cpu ora,        
1c6e e0 m/cpu sbc, 1c6c 80 m/cpu sta, 0d
0d  1 m/cpu asl,        0c0c c1 m/cpu de
c, 0c0c e1 m/cpu inc, 0d0d 41 m/cpu lsr,
        0d0d 21 m/cpu rol, 0d0d 61 m/cpu
 ror, 0414 81 m/cpu stx,        0486 e0 
m/cpu cpx, 0486 c0 m/cpu cpy, 1496 a2 m/
cpu ldx,        0c8e a0 m/cpu ldy, 048c 
80 m/cpu sty, 0480 14 m/cpu jsr,        
8480 40 m/cpu jmp, 0484 20 m/cpu bit, de
cimal                   
( assembler: begin, until, if, then, els
e, not branches )       : begin, here 1 
;                                       
        : until,  >r 1 ?pairs r> c, here
 1+ - c, ;                      : if, c,
 here 0 c, 2 ;                          
                : then,  2 ?pairs here o
ver c@                                  
   if swap !  else over 1+ - swap c! the
n ;                     : else, 2 ?pairs
 here 1+ 1 jmp,                         
           swap here over 1+ - swap c! 2
 ;                               hex    
                                        
                : not  20 + ;   ( revers
e assembly test )                       
90 constant cs  ( assemble test for carr
y set )                 d0 constant 0=  
( assembler test for equal zero )       
        10 constant 0<  ( assemble test 
for less than or equal zero )   90 const
ant >=  ( assemble test for greater or e
qual zero )     ( .= is only correct aft
er sub, or cmp, )                       
50 constant vs  decimal                 
                        
( assembler:  again, while, repeat )    
                                        
                                        
        : again, 1 ?pairs jmp, ;        
                                        
                                        
                : while, >r dup 1 ?pairs
 r> if, 2+ ;                            
                                        
                        : repeat, >r >r 
1 ?pairs jmp, r> r> 2 - then, ;         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( assembler: end-code entercode ;code co
de )                    : end-code   cur
rent @ context ! sp@ 2+ =               
           if smudge                    
                                   else 
." code error, stack depth change"      
                   then ;               
                                        
forth definitions                       
                        : entercode [com
pile] assembler sp@ ;                   
        : code create smudge here dup 2-
 !                                 assem
bler mem entercode ;   immediate        
                : ;code ?csp compile <;c
ode> [compile]  [ entercode ; immediate 
    exit                                
                                        
                                        
                                        
                                        
                                        
                ( this 6510 forth assemb
ler was written by william f. ragsdale )
( it was published in "forth dimensions"
, vol. iii # 5         )
( editor: chklin line pp c )   hex      
                        : chklin    ( li
ne# --- )                               
           dup c/l * 1023 > abort" off s
creen" ;                                
                                        
                : line ( line# --- buf-a
ddr count )                             
   chklin dup r# ! scr @ <line> update ;
                                        
                                        
        : pp   ( line# --- )            
                                   pad 1
+ swap line 1 text cmove ;              
                                        
                                        
                                        
                                        
                                        
                                        
                                : c    (
 from# to# --- )                        
                   swap line drop swap l
ine cmove ;                             
decimal                                 
                        
( editor: screen commands )             
                        : se dup r# ! pp
 quit ;                                 
        :  0) 0 se ;    :  1)  1 se ;   
                                :  2) 2 
se ;    :  3)  3 se ;                   
                :  4) 4 se ;    :  5)  5
 se ;                                   
:  6) 6 se ;    :  7)  7 se ;           
                        :  8) 8 se ;    
:  9)  9 se ;                           
        : 10) 10 se ;   : 11) 11 se ;   
                                : 12) 12
 se ;   : 13) 13 se ;                   
                : 14) 14 se ;   : 15) 15
 se ;                                   
      ( ext. for > 15 lines/scr )       
                        : 16) 16 se ;   
: 17) 17 se ;                           
        : 18) 18 se ;   : 19) 19 se ;   
                                : 20) 20
 se ;   : 21) 21 se ;                   
                : 22) 22 se ;   : 23) 23
 se ;                                   
: 24) 24 se ;   : 25) 25 se ;           
                        
( editor: k x o m )                     
                        ( kill - replace
 line with blanks )                     
        : k      ( line# --- )          
                                   line 
blank ;                                 
                                        
                                        
( x-tract a line from screen )          
                        : x      ( line#
 --- )                                  
           24 swap do i 1+ i c loop 24 k
 ;                                      
                                        
                ( open a line for input 
)                                       
: o      ( line# --- )                  
                           dup 23 do i i
 1+ c -1 +loop k ;                      
        ( move line )                   
                                : m     
 ( from to --- )                        
                   over swap c x ;      
                                        
                                        
                        
( editor: f l w n p sc sm list )        
                        : f  scr @ dup b
lock dup 2- @ 0<                        
           if ddup 2- ! swap 0 r/w else 
ddrop then ;                    : l  ( [
scr] --- ) depth if f else scr @ then li
st ;            : w   scr @ block 1024 b
l fill l update ;                       
: n   f  1 scr +! ;                     
                        : p   f -1 scr +
! ;                                     
        ( copy line from diff screen )  
                                : sc   (
 fr-scr fr-line --- )                   
                   chklin swap <line> dr
op                                      
   r# @  dup o line cmove ;             
                        ( move line from
 diff screen )                          
        : sm   ( fr-scr fr-line --- )   
                                   >r >r
   scr @   r# @   r@ i' sc              
                   r> scr !   r> x  r# !
   scr ! ;                              
                                        
                        
( decompiler: gin  gin+  din )          
                        variable gin  ( 
# to indent )                           
        : gin+ cr gin @ 2+ dup gin ! spa
ces ;                           : din cr
 gin @ spaces ;                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( decompiler: gchk )                    
                        : gchk  dup @ 2+
 ' compile =                            
           if  2+ dup @ 2+ nfa id. 2+   
                                   else 
dup @ 2+ dup ' <lit> =                  
                        over ' branch = 
or                                      
        over ' 0branch = or             
                                over ' <
loop> = or                              
                over ' </loop> = or     
                                        
swap ' <+loop> = or                     
                     if 2+ dup @ space .
 2+                                     
     else dup @ 2+ dup ' <."> = swap ' <
abort"> = or                   if space 
2+ dup count type dup c@ 1+  +          
               else 2+ then             
                                     the
n                                       
                   then -2 gin +! ;     
                                        
( handle special cases )                
                        
( decompiler: <decom>  )                
                        : <decom>  ( pfa
 --- )                                  
           dup cfa @ ' : cfa @ =        
                                  if ( c
olon def. )                             
                    begin dup @ dup ' ex
it cfa =                                
      over ' <;code> cfa = or 0=        
                            while ( high
 level & not end of colon def )         
              2+ dup gin+ nfa id. key du
p 81 =                               if 
( 'q' ) sp! quit                        
                     else 13 =  ( return
 )                                      
       if recurse ( go down one level ) 
                               else  dro
p                                       
               then                     
                                     the
n  gchk  repeat ( show last word )      
                   2+ din nfa id.       
                                        
  then drop ;                           
                        
( decompiler: decompile )               
                        : decompile -fin
d if drop 0 gin !                       
          <decom> else ." not found" the
n ;                                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( trig: sin/cos values table )          
                        create sintable 
                                        
         0000 , 0175 , 0349 , 0523 , 069
8 , 0872 , 1045 , 1219 , 1392 ,  1564 , 
1736 , 1908 , 2079 , 2250 , 2419 , 2588 
, 2756 , 2924 ,  3090 , 3256 , 3420 , 35
84 , 3746 , 3907 , 4067 , 4226 , 4384 , 
 4540 , 4695 , 4848 , 5000 , 5150 , 5299
 , 5446 , 5592 , 5736 ,  5878 , 6018 , 6
157 , 6293 , 6428 , 6561 , 6691 , 6820 ,
 6947 ,  7071 , 7193 , 7314 , 7431 , 754
7 , 7660 , 7771 , 7880 , 7986 ,  8090 , 
8192 , 8290 , 8387 , 8480 , 8572 , 8660 
, 8746 , 8829 ,                         
                                        
 8910 , 8988 , 9063 , 9135 , 9205 , 9272
 , 9336 , 9397 , 9455 ,  9511 , 9563 , 9
613 , 9659 , 9703 , 9744 , 9781 , 9816 ,
 9848 ,  9877 , 9903 , 9925 , 9945 , 996
2 , 9976 , 9986 , 9994 , 9998 , 10000 , 
                                        
                                        
                                        
                                        
                        
( trig: qsin qcos sin cos )             
                        code <sin> bot a
sl, bot ldy, sintable ,y lda,           
         bot sta, sintable 1+ ,y lda, bo
t 1+ sta,                        next jm
p, end-code                             
                : s180 dup 90 >  if 180 
swap - then                             
   <sin> ;                              
                        : qsin  dup 180 
> if ( 181-359 deg)                     
           180 - s180 negate else s180 t
hen ;                           : sin ( 
degrees --- sine*10000 )                
                   dup abs 359 >        
                                        
    if 360 mod then ( doesn't change sin
 value )                   dup 0< if 360
 + then ( handle negative argument )    
           qsin ;                       
                                : qcos  
dup 270 > if 270 - else 90 + then qsin ;
                : cos ( degrees --- cosi
ne*10000 )                              
   90 + sin ;                           
                        
( math: square root  routines )         
                        code d2* sec asl
, sec 1+ rol,                           
          bot rol, bot 1+ rol, next jmp,
 end-code                       : easy-b
its ( drem1 partialroot1 count --- drem2
 partialroot2 )    0 do                 
                                        
    >r d2* d2*             ( shift drem 
twice )                     r@ - dup    
           ( subr. partial root )       
            0< if r@ +   r> 2* 1-  ( res
tore drem & set 0 )                   el
se  r> 2* 3 +        ( or set 1 )       
                      then ( proot shift
ed for next go-round ) loop ;           
: 2's-bit  ( drem2 proot2 --- drem3 proo
t3 ; get penult. bit )     >r d2*  dup 0
< if    d2* r@ -    r> 1+               
                          else  d2* r@ d
dup                                     
                u< if drop r> 1-    ( se
t 0 )                                   
   ho←e - r>  1+    ( set 1 )           
                  then then ;           
                        
( math: square root routines )          
                        : 1's-bit  ( dre
m3 proot3 --- fullroot ; remainder lost 
)          >r dup 0< if  ddrop r> 1+    
                                        
     else d2* 32768 r@ du< 0= r> + then 
;                                       
                                        
: sqrt ( ud1 --- u2 ; 32-bit unsigned ra
dicand--> 16-bit root)     0 1 8 easy-bi
ts  rot drop 6 easy-bits                
           2's-bit  1's-bit ;           
                                exit    
                                        
                                        
                                        
( this was written by klaxon suralis and
 published in             forth dimensio
ns vol. iv no. 1 )                      
                                        
                                        
                                        
                                        
                                        
                                        
                        
( f.p. math: fpsw freset fer fze fne fov
 )                      create fpsw 0 c,
        ( floating point status word )  
        create fbase 10 c,      ( base )
                                : freset
 ( --- )        ( clear condition codes 
)                  0 fpsw c! ;          
                                        
                                        
                        : fer ( --- n ) 
        ( returns sum of condition codes
 )         fpsw c@ ;                    
                                : fze ( 
--- n )         ( true if last f# was ze
ro )               fer 1 and 0= not ;   
                                        
: fne ( --- n )         ( true if last f
# was < zero )             fer 2 and 0= 
not ;                                   
        : fov ( --- n )         ( true i
f last operation overflowed )      fer 4
 and 0= not ;                           
                                        
                                        
                                        
                        
( f.p. math: sfz sfn e@ )               
                        ( cc's 8, 16, 32
, 64 and 128 are available for use )    
        hex                             
                                : sfz  (
 f# --- f# ; z )   ( sets z according to
 f# )              fer fffe and fpsw c! 
   ( reset z )                          
   ddup 00ff and d0= fer or fpsw c! ;   
                        : sfn  ( f# --- 
f# ; n )   ( sets n according to f# )   
           fer fffd and fpsw c!    ( res
et n )                             dup 0
080 and 40 / fer or fpsw c! ;           
                : e@    ( f# --- m e ; z
 n )  ( remove exponent )               
                                        
                           freset  sfz  
sfn        ( set flags )                
           dup  ff00 and 100 /  >r  ( ob
tain exponent )                    fne i
f ff00 or          ( sign extend mantiss
a )                    else 00ff and the
n   r> ;                                
decimal                                 
                        
( f.p. math: e! e. )                    
                        hex             
                                        
                                        
                                : e! ( m
 e --- f# ; v z n )  (  restore exponent
 )                 dup 100 *  dup 100 / 
rot = not                               
    if 4 fpsw c! then        ( exponent 
overflow )                 swap dup ff00
 and dup                                
            if dup ff00 = not           
                                     if 
4 fpsw c! then       ( mantissa overflow
 )                  then                
                                        
   drop 00ff and  or  sfz sfn ;         
                                        
                                        
        : e.   ( f# --- ; z n )         
                                   e@  <
rot d. ." . e" . ;                      
                                        
                                        
decimal                                 
                        
( f.p. math: f. f* f/ )                 
                        : f.  ( f# --- ;
 z n )                                  
           e@ >r   swap over dabs       
                                   <#  r
@   0<                                  
                    if i abs 0 do  #  lo
op  46 hold                             
    else 46 hold  r@                    
                              if  r@ 0 d
o 48 hold loop then                     
            then  r> drop  #s rot sign #
> type space ;                          
                                        
                : f*  ( f#1 f#2 --- f# ;
 n z v )  ( multiply )                  
   dswap e@ >r   dswap e@  >r           
                           drop 1 m*/ r>
  r> +  e! ;                            
                                        
                                : f/  ( 
f#1 f#2 --- f# ; n z v )  ( divide )    
                   dswap e@ >r   dswap e
@ >r                                    
   drop 1 swap m*/ r> r> swap - e! ;    
                        
( f.p. math: align f+ f- )              
                        : align ( m1 e1 
 m2 e2 --- m1 m2 e )                    
           4 roll                       
                                   begin
   ddup = not                           
                   while  ddup >  ( e2 >
 e1? )                                  
    if >r >r fbase c@ 1 m*/ r> 1- r>    
                            else >r >r d
swap fbase c@ 1 m*/ dswap r> r> 1- then 
           repeat drop ;                
                                        
                                        
                : f+  ( f#1 f#2 --- fsum
 ; n v z )                              
   e@  >r  dswap r> <rot e@             
                           align  >r  d+
  r>  e! ;                              
                                        
                                : f-  ( 
f#1 f#2 --- fdiff ; n v z )             
                   dswap e@  >r  dswap r
> <rot e@                               
   align >r  d-  r>  e! ;               
                        
( f.p. math: rscale lscale dfix )       
                        : rscale  ( f# -
-- f# ; n z v )                         
           e@  1- <rot   fbase c@ 1 m*/ 
rot   e! ;                              
                                        
                : lscale  ( f# --- f# ; 
n z v )                                 
   e@  1+ <rot   1 fbase c@ m*/ rot   e!
 ;                                      
                                        
        : dfix  ( f# --- d ; v z n )    
                                   e@   
                                        
                    begin ?dup          
                                        
    while  dup 0>                       
                             if 1- <rot 
fbase c@ 1 m*/                          
             else 1+ <rot  1 fbase c@ m*
/ ddup d0=                            if
 5 fpsw c! rot drop 0 <rot then ( underf
low )                then rot           
                                        
    repeat ;                            
                        
( f.p. math: fix dfloat float fsin fcos 
fsqrt finit fexit )     : fix  ( f# --- 
n )  dfix drop ;                        
        : dfloat ( d --- f# ) 0 e! ;    
                                : float 
 ( n --- f# ) s->d dfloat ;             
                : fsin  ( fdeg --- fsine
 )                                      
   fix sin s->d -4 e! ;                 
                        : fcos  ( fdeg -
-- fcosine )                            
           fix cos s->d -4 e! ;         
                                : fsqrt 
( f# --- fsqrt )                        
                   fix 10000 u* sqrt s->
d -2 e! ;                               
: <fnum> ( addr --- d )                 
                           <number> dpl 
@ negate e! ;                           
        : finit  ( --- )                
                                   frese
t base @ fbase c!                       
                   ' <fnum> cfa 'number 
! ;                                     
: fexit  ( --- )  ' <number> cfa 'number
 ! ;                    
( f.p. math: fabs fnegate fmin f> fmax )
                        : fabs  ( f# ---
 abs[f#] : n z v )                      
           e@   <rot dabs rot e! ;      
                                : fnegat
e  ( f# --- -f# : n z v )               
                   e@  <rot  dnegate  ro
t  e! ;                                 
: fmin   ( f#1 f#2 --- min[f#s] ; n z v 
)                          dswap  e@  >r
   dswap r> <rot e@                     
           align >r dmin r> e! ;        
                                : f>  ( 
f#1 f#2 --- b ; n z v )                 
                   f- ddrop fne ;       
                                        
: fmax ( f#1 f#2 --- max[f#s] ; n z v ) 
                           dover dover f
min f- f+ ;                             
                                        
                                ( these 
routines were adapted from the article b
y michael jesch   published in forth dim
ensions, vol. iv no. 1 )                
                                        
                        
( c64 data: colors sprite-defs )        
                        0 constant b%   
   1 constant w%        2 constant r%   
        3 constant c%      4 constant p%
        5 constant g%           6 consta
nt bl%     7 constant y%        8 consta
nt o%           9 constant br%    10 con
stant lr%      11 constant dg%          
12 constant mg%      13 constant lg%    
                        14 constant lb% 
     15 constant gl%                    
                                        
                                code s1 
sprite sty, next jmp, end-code          
                code s2 iny, ' s1 jmp, e
nd-code                                 
code s3 2 # ldy, ' s1 jmp, end-code     
                        code s4 3 # ldy,
 ' s1 jmp, end-code                     
        code s5 4 # ldy, ' s1 jmp, end-c
ode                             code s6 
5 # ldy, ' s1 jmp, end-code             
                code s7 6 # ldy, ' s1 jm
p, end-code                             
code s8 7 # ldy, ' s1 jmp, end-code     
                        
( c64 data: sound )                     
                        ( ctrl reg const
ants )    hex                           
        11 constant t#                  
                                21 const
ant s#                                  
                41 constant p#          
                                        
81 constant n#                          
                        ( 15 constant ri
ng                                      
           8 constant reset             
                                 3 const
ant sync  )                             
                    decimal             
                                        
( filter constants )                    
                         1 constant f1 (
 2 constant filt2                       
         4 constant filt3  8 constant fi
ltex)                            1 const
ant lp 2 constant bp                    
                 4 constant hp          
                                        
( lowpass highpass or constant notch)   
                        
( c64 data: sound misc i/o )            
                        create n-v 34334
 , 36376 , 38539 , 40830 , 43258 ,      
        45830 , 48556 , 51443 , 54502 , 
57743 , 61176 , 64814 ,         : note@ 
( # --- freq ) 2* n-v + @ ;             
                                        
                                        
8 constant 3off                         
                           hex          
                                        
        code v1 voice sty, next jmp, end
-code                           code v2 
iny, ' v1 jmp, end-code                 
                code v3 2 # ldy, ' v1 jm
p, end-code                             
                                        
                        0 constant off  
   1 constant on                        
        (          dc01 constant joy1   
                                dc00 con
stant joy2  )                           
                ( dd01 constant uport ) 
                                        
d800 constant color-mem     decimal     
                        
( data structures: s-def )              
                        ( compile: alloc
ates room & reads sprite data from input
 stream)( exec: moves sprite data to add
r on stack )                    : s-def 
                                        
                   create   ( [63 byte v
alues in input stream] ; --- )          
    63 0 do                             
                             bl text pad
 number drop c,                         
            loop                        
                                   does>
    ( addr --- )                        
                    swap 63 cmove ;     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( data structures: 1array 2array ) exit 
<<<                     ( creates & gets
 element from 16-bit 1 dimensional array
 )      : 1array                        
                                   creat
e    ( #elem --- )                      
                    2* allot            
                                        
   does>     ( element --- addr )       
                            swap 2* + ; 
                                        
                                        
                                ( create
s & gets element from 16-bit 2 dimension
al array )      : 2array                
                                        
   create    ( #y-elem #x-elem --- )    
                            dup , * 2* a
llot                                    
           does>     ( y-elem x-elem ---
 addr )                             >r r
@ @ rot * + ( get x-max * y + x )       
                    2* r> + 2+      ( ma
ke 2 byte & add array base )            
 ;                                      
                        
( graphics: m-x m-y s.dist l.dist b-mfla
g border bkgnd )         exit <<<<<     
                                        
        ( mirror center coordinates )   
                                0 consta
nt m-x                                  
                0 constant m-y          
                                        
                                        
                        ( mirror flag ) 
                                        
        variable b-mflag  0 b-mflag !   
                                        
                                        
                ( line variables )      
                                        
variable s.dist    variable l.dist      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( graphics: bd bk m-origin )            
                        ( change border 
color )                                 
        : bd ( c --- ) 53280 c! ;       
                                        
                                        
                ( change a background re
gister )                                
: bk ( c --- )                          
                           53281 c!     
                                        
             ;                          
                                 exit <<
<<<<                                    
                code m-origin  ( x y ---
 )                                      
 sec lda,  ' m-x sta,                   
                         sec 1- lda, ' m
-x 1+ sta,                              
         bot lda,  ' m-y sta,           
                                 poptwo 
jmp,                                    
                end-code                
                                        
                                        
                        
( graphics: r-plot )  exit <<<<         
                        ( plot a point x
,y relative to m-x,m-y )                
        code r-plot ( x y --- )         
                                 clc,   
                                        
                 ' m-x lda,  sec adc,  s
ec sta,                                 
 ' m-x 1+ lda,  sec 1+ adc,  sec 1+ sta,
                         clc,           
                                        
         ' m-y lda,  bot adc,  bot sta, 
                                 ' m-y 1
+ lda,  bot 1+ adc,  bot 1+ sta,        
                 ' b-plot jmp,          
                                        
end-code                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( graphics: m-plot )  exit <<<<         
                        ( m-plot 4 point
s around m-x,m-y )                      
        : m-plot  ( x y --- )           
                                   b-mfl
ag @ if                                 
                    ddup negate r-plot (
  x -y )                                
    over negate over ddup r-plot ( -x y 
)                           negate r-plo
t ( -x -y )                             
            r-plot ( x y )              
                                   else 
                                        
                    r-plot              
                                        
   then ;                               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( graphics: b-line )   exit <<<         
                        : b-line  ( x y 
--- )                                   
           b-y - ( dy )  1 over +- ( sig
n of dy )                          >r  a
bs swap                                 
                   b-x - ( dx )  1 over 
+- ( sign of dx )  >r abs               
   ddup min s.dist !  ddup max l.dist ! 
 > ( dy > dx? )            r> r> ddup 5 
roll                                    
           if   swap drop 0 swap b-y    
                                   else 
drop 0 b-x then                         
                   l.dist @ mod l.dist @
 -                                      
   l.dist @ 0 do                        
                             s.dist @  +
 >r r@                                  
             0< if ddup r>              
                                     els
e dover r> l.dist @ - then              
                     rot b-x + rot b-y +
 b-plot                                 
   loop ddrop ddrop drop ;              
                        
( graphics: arc ellipse circle ) exit <<
<<                      : arc ( hr vr st
rt end --- )                            
           >r >r ddup max 360 swap /    
                                   r> 2*
 2* r> 1+ 2* 2* swap rot >r             
                   do                   
                                        
    over i 2 rshift qcos 10005 */       
                            over i 2 rsh
ift qsin 10005 */                       
            m-plot                      
                                   j +lo
op                                      
                  r> ddrop drop ;       
                                        
                                        
                        : ellipse ( x y 
hr vr --- )                             
           dswap  m-origin   on b-mflag 
! 0 90 arc                         off b
-mflag ! ;                              
                                        
                                        
: circle ( x y r --- ) dup 3 4 */ ellips
e ;                     
( i/o extensions: cmd cmdi input input# 
print# $input prt )     : cmd   ( lfn --
- ) outlfn ! ;                          
        : cmdi  ( lfn --- ) inplfn ! ;  
                                        
                                        
                ( : input ( --- n )     
                                        
(  query 1 word number drop ;           
                        ( : input# ( lfn
 --- n )                                
        (  cmdi input ;   )             
                                ( : prin
t#   ( n lfn --- )                      
                (  cmd .  ;   )         
                                        
(  : $input  ( --- addr )               
                        (  query 1 text 
pad ;  )                                
                                        
                                : prt ( 
flag --- )                              
                   if 127 4 0 " @" open 
  127 cmd                               
   else 127 close   0 cmd then ;        
                        
( i/o extensions: get# put# rs232 fre rd
tim )                   ( : get#  ( lfn 
--- n ) ( cmdi ?terminal ; )            
        ( : put#  ( n lfn --- ) ( cmd em
it ; )                          ( : rs23
2  ( lfn addr --- )                     
                (  2 0 rot open ;  )    
                                        
                                        
                        : fre  ( --- n )
                                        
           first here - u. ;            
                                exit <<<
<                                       
                code rdtim  ( --- d )   
                                        
 dex, dex, sei,                         
                         162 lda,  bot s
ta,                                     
         161 lda,  bot 1+ sta,          
                                 160 lda
,  pha,  tya,                           
                 cli,  push jmp,        
                                        
end-code                                
                        
( i/o extensions: settim wait )         
                        ( set the 60 cyc
le clock value )                        
        ( code settim ( d --- )         
                                ( sei,  
bot lda,   160 sta,                     
                 sec 1+ lda, 161 sta,   
                                        
 sec lda,   162 sta,                    
                         cli,  poptwo jm
p, )                                    
        (  end-code  )                  
                                 exit <<
<<                                      
                ( wait n ticks [1/60 sec
onds] )                                 
: wait  ( n --- )                       
                           s->d rdtim d+
                                        
           begin                        
                                    ddup
 rdtim                                  
                    d> not              
                                        
   until ddrop ;                        
                        
( utilities: case of ;; endcase )       
                        ( execute code b
ased on stack value )                   
        : case ?comp csp @ sp@ csp ! 4 ;
                                immediat
e                                       
                                        
                                        
: of                                    
                           4 ?pairs comp
ile over compile                        
           = compile 0branch here 0 ,   
                                   compi
le drop 5 ; immediate                   
                                        
                                        
: ;;                                    
                           5 ?pairs  com
pile branch  here 0 ,                   
           swap 2 [compile] then 4 ; imm
ediate                          : endcas
e 4 ?pairs compile drop                 
                   begin sp@ csp @ = 0= 
                                        
   while 2 [compile] then repeat csp ! ;
 immediate              
( utilities: dir )  exit <<<            
                        : dir ( --- )   
                                        
           pad " $" loadram   cr  pad 2+
                                ( main l
oop - print entry )                     
                 begin                  
                                        
  dup @ . 2+  ( print #pages )          
                          begin       ( 
print text )                            
           dup c@ ?dup                  
                                    whil
e emit 1+                               
                  repeat   1+ cr        
                                        
( check for user intervention )         
                          pause ?termina
l if quit then                          
        ( more to do? )                 
                                  dup 2+
 swap @                                 
                  not until  drop ;     
                                        
                                        
                        
( utilities: patch )                    
                        : patch  ( patch
-addr --- next-patch-addr )             
           cr query             ( get pa
tch input line )                   begin
                                        
                    dup bl word         
( get an entry )                        
    dup count swap drop ( entry not null
? )                          while numbe
r drop  ( convert to 16 bit number )    
              swap c! 1+        ( put at
 patch addr & update addr )        repea
t  ddrop ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( utilities: h@ hc@ h! hc! )            
                        ( hi-ram access 
routines )                              
        : h@  ( --- n )                 
                                   swapo
ut @ swapin ;                           
                                        
                                        
: hc@ ( --- n )                         
                           swapout c@ sw
apin ;                                  
                                        
                                : h!  ( 
n --- )                                 
                   swapout ! swapin ;   
                                        
                                        
                        : hc! ( n --- ) 
                                        
           swapout c! swapin ;          
                                        
                                        
                                        
                                        
                                        
                        
( music edit: wv p.n v-d s.i )          
                        variable wv     
                                        
        : p.n ( note# --- )             
                                   12 /m
od    ( determine octave & note )       
                   7 xor     ( get value
 to divide by )                         
   swap note@ ( get note value )        
                           swap rshift (
 divide for octave)                     
           v-f     ( set frequency )    
                                   off v
-ctrl ( clear previous note )           
                   wv @ v-ctrl ; ( play 
new note )                              
                                        
                        : v-d  ( --- )  
                                        
           8 v-ctrl  9 12 v-ad  s# wv ! 
;                               : s.i ( 
--- )                                   
                   sid @ 25 0 fill  ( cl
ear sid )                               
   v3 v-d  v2 v-d  v1 v-d 0 15 mv ;     
                        
( music edit: t@ t! )                   
                        0 constant t@   
                                        
                                        
                                code t! 
                                        
                 bot lda, ' t@ sta, pop 
jmp,                                    
end-code                                
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( music edit: o@ o! ox )                
                        ( return octave 
value )                                 
        0 constant o@                   
                                        
                                        
                code o!                 
                                        
 bot lda, ' o@ sta, pop jmp,            
                        end-code        
                                        
                                        
                                : o0 0 o
! ;  : o1 12 o! ;                       
                : o2 24 o! ;  : o3 36 o!
 ;                                      
: o4 48 o! ;  : o5 60 o! ;              
                        : o6 72 o! ;  : 
o7 84 o! ;                              
                                        
                                        
                                        
                                        
                                        
                                        
                        
( music edit: tempo duration timings )  
                        variable tempo  
 variable duration                      
        ( durations based on 64th note r
esolution - 4/4 time assumed )  : whole 
192 duration ! ;                        
                : .1/2 144 duration ! ; 
                                        
: 1/2 96 duration ! ;                   
                        : .1/4 72 durati
on ! ;                                  
        : 1/4 48 duration ! ;           
                                : .1/8 3
6 duration ! ;                          
                : 1/8 24 duration ! ;   
                                        
: .1/16 18 duration ! ;                 
                        : 1/16 12 durati
on ! ;                                  
        : 1/32 6 duration ! ;           
                                : 1/64 3
 duration ! ;                           
                : triplet duration @ 2* 
3 / duration ! ;                        
60 tempo ! 1/4                          
                        
(2064)laljKX▒
 ,a▃bUi(Q@Og▚5└▚┬mu
1:09 0 35 13£i0£b-p 09 0£#▒▒▒▍
HDP▍ ─lJJH ┴┴▏
I▒lv2.0.0:march 11, 1984      
    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒                        
                                        
ndef next.note                          
                                        
                                        
        : ready ( --- flag )            
                                   next.
note d@  rdtim d< ;                     
                                        
                                        
( calculate ticks till next note )      
                        : ncalc duration
 @ 75 tempo @ */ 0                      
           next.note d@ d+ next.note d! 
;                                       
                                        
                : song.init  rdtim ddup 
ddup                                    
   v3 next.note d! v2 next.note d! v1 ne
xt.note d! ;            
( music edit: play.wait )               
                                        
                                        
        : play.wait  ( value --- )      
                                   begin
 ready until                            
                   o@ +        ( get oct
ave )                                   
   t@ +        ( add transpose )        
                           play.note    
                                        
           ncalc ;                      
                                        
                                        
                exit                    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( music edit: note defs )               
                        : c  0 play.wait
 ;                                      
        : c# 1 play.wait ;  : d£  c#  ; 
                                : d  2 p
lay.wait ;                              
                : d# 3 play.wait ;  : e£
  d#  ;                                 
: e  4 play.wait ;                      
                        : f  5 play.wait
 ;                                      
        : f# 6 play.wait ;  : g£  f#  ; 
                                : g  7 p
lay.wait ;                              
                : g# 8 play.wait ;  : a£
  g#  ;                                 
: a  9 play.wait ;                      
                        : a# 10 play.wai
t ; : b£  a#  ;                         
        : b  11 play.wait ;             
                                : r begi
n ready until off v-ctrl ncalc ;        
                : tie ncalc ;           
                                        
forth definitions                       
                        
( s-editor: s-editor )                  
                        : s-editor ( ---
 )                                      
           create 63 allot page         
                                    ( dr
aw sprite easel )                       
                     21 0 do space space
                                        
      24 0 do 209 emit loop cr          
                             loop       
                                        
             26 0 do 184 emit loop      
                                    ( cl
ear sprite area #13 )                   
                     832 63 0 fill      
                                        
    ( activate s1 at area #13 )         
                             s1  on s-en
able  13 s-pointer blue s-color         
             270 130 s-position on s-xex
p on s-yexp                         char
in drop ( signal end of input )         
                    0 22 d-position     
                                        
      -->                               
                        
( s-editor:  )                          
                           832  ( sprite
 area # 13 )                            
           21 0 do  ( rows )            
                                    24 0
 do i j  ( addr col row )               
                     40 * 2+ + 'screen +
                                        
     8 0 do  ( bit# )                   
                              dup c@  81
 = not                                  
              3 pick i 7 xor mask fbit  
                                     1+ 
loop                                    
                     drop 1+            
                                        
    8 +loop                             
                           loop drop    
                                        
           832 latest pfa 63 cmove      
                                        
                                        
                   does> swap 63 cmove ;
                                        
                                        
                        
( trace colon words )                   
                        forth definition
s                                       
        create tflag 1 ,                
                                : trace 
tflag ! ;                               
                                        
                                        
: <trace>                               
                           tflag @ if   
                                        
            cr r@ 2- nfa  id. .s key dro
p                                  then 
;                                       
                : : sp@ csp ! current @ 
context ! create tflag @ if             
  ' <trace> cfa dup @ here 2- ! , then s
mudge ]                   ;code         
                                        
           ip 1+ lda, pha, ip lda, pha, 
clc, w lda, 2 # adc,               ip st
a, tya, w 1+ adc, ip 1+ sta,            
                   next jmp,            
                                        
  end-code                              
                        
( curves: constants directions )        
                                        
                                        
        4 constant +90deg               
                                +90deg n
egate constant -90deg                   
                                        
                                        
( directions: table of 2 cell records- x
dir*xlen , ydir*ylen )  (  each record d
escribes a 90 deg change in dir from las
t rec )                                 
                                create d
irections                               
                   0 , -1 ,  (   0 deg )
                                        
   1 ,  0 ,  (  90 )                    
                           0 ,  1 ,  ( 1
80 )                                    
          -1 ,  0 ,  ( 270 )            
                                        
                                        
                                        
                                        
                                        
                        
( curves: dragon1 )  hex                
                        s-def dragon1   
                                        
        01  01  00      00  81  80      
                                00  c1  
c0      00  e1  c0                      
                00  f1  e0      00  f9  
80                                      
00  ff  00      00  ff  ff              
                        00  7f  fe      
00  3f  f8                              
        00  3f  e0      00  3f  80      
                                00  3c  
00      00  78  00                      
                00  f0  00      01  e0  
00                                      
06  60  00      1c  70  00              
                        38  38  00      
70  1c  00                              
        a8  2a  00                      
                                decimal 
                                        
                                        
                                        
                                        
                        
( curves: dragon2 )    hex              
                        s-def dragon2   
                                        
        00  01  00    00  01  80        
                                00  01  
c0    00  01  c0                        
                00  01  e0    00  01  80
                                        
03  ff  80    07  ff  e0                
                        0f  ff  f0    0f
  ff  f8                                
        0f  ff  fc    0e  7d  fe        
                                0c  f8  
7e    09  f0  3e                        
                03  e0  1e    07  60  1e
                                        
0e  60  00    1c  70  00                
                        38  70  00    54
  70  00                                
        00  a8  00                      
                                decimal 
                                        
                                        
                                        
                                        
                        
( curves: variables  note next-pointer m
ove-sprite )            variable length 
                                        
        variable dir-indx               
                                        
                                        
                LCal┌▁┌FFv▒C
▄gD▝#▄▒C┌C
init.chipwitS ┬┌▌@c▔G
fF"V!@fS@▌fyfWbuO2""V▝D$D
2a-@96&a@96a-@96a[@962a!@96>a!@96pj
)YC▄vHJC▄S┌▁┌L,WbIrJq"WbIrJqCs
tat.pointSM┬┌Ctoo.baD[┤┌D$D2I┤Ce
ndgamEM┤┌$D▄VD▝#D$D2I┤Vja7 
             a5         
     a6              
a8              
cb              cwe
d            ;cwwrk      
     se              
Vja7              
a5              a6 
             a8         
     cb              
cwed            ;
cwwrk           se 
             
 ( ibol & obj   char defs)              
256 102 - constant arg.st@              
variable op.char arg.st@ 81 - op.char ! 
: op.stuff ( bytes../startchar---)      
  2 1 op.char @ dup 2 +    op.char !    
  c.stuff ;                             
: op.b.stuff ( bytes  )                 
  2 3 op.char @ dup 6 + op.char !       
  c.stuff ;                             
: arg.stuff ( bytes../arg#--)           
  2 2 rot 4 * arg.st@ + c.stuff ;       
                                        
arg.st@ 256 + 90 - op.char !            
: obj.stuff ( bytes--)                  
  3 2 op.char @ dup 6 + op.char !       
  c.stuff ;                             
                                        
: dye ( color----) color-mem            
 256 rot fill ;                         
                                        
: test ." " 256 0 do i 'screen i + hc! 
  loop 10 10 d-position ;               
  black dye test                        
                                        


( curves: c-draw )                      
                        : c-draw  ( leve
l --- )                                 
           dup 0=                       
                                   if dr
aw                                      
                   else                 
                                        
     dup 1- recurse                     
                             +90deg move
-direction                              
             dup 1- recurse             
                                     -90
deg move-direction                      
                   then drop ;          
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( curves: sprites-init  hi-res-init ) he
x                       ( move sprite-da
ta to 0 & 1 sprites in bank 2 )         
        : sprites-init  s1   ( set sprit
e 1 as active sprite )             c000 
dragon1   ( move data to sprite areas ) 
                   c040 dragon2   ( 2 po
sitions of dragon for animation )       
   0 s-pointer    ( set pointer to sprit
e area 0 )                 red s-color  
  ( set sprite color to red )           
           on s-enable    ( turn on spri
te )                               on s-
xexp ;    ( expand in x direction )     
                                        
                                        
: hi-res-init                           
                           7 bitmap  on 
b-graphics  ( set bitmap area )         
           0 b-fill       ( clear bitmap
 area )                            yello
w black b-color-fill  ( set bitmap color
 scheme )          b-draw  a0 90 b-plot 
; ( specify pen down & plot start pt )  
decimal                                 
                        
( curves: directions-init )             
                        : directions-ini
t                                       
           length @                     
                                   direc
tions dup 16 + swap                     
                    do i @ if dup 1 i @ 
+-   *  i ! then                        
    2 /loop drop ;                      
                                        
                                        
        : csound-init                   
                                   sound
.init             ( init sound system ) 
                   2048 v-pw            
  ( square wave )                       
   0 0 v-ad   15 0 v-sr   ( set envelope
 )                                      
                                        
           pulse v-ctrl           ( set 
osc 1 to pulse waveform )          0 15 
modevol ;                               
                                        
                                        
                                        
                        
( curves: curve-init  c-curve )         
                                        
                                        
        : curve-init  ( levels length di
r --- )                            dir-i
ndx !                                   
                   length !             
                                        
   directions-init                      
                           hi-res-init  
                                        
           sprites-init                 
                                   csoun
d-init ;                                
                                        
                                        
: c-curve ( levels length --- )         
                           0 curve-init 
                                        
           c-draw ;                     
                                        
                                        
                                        
                                        
                                        
                        
( curves: call-rdragon  ldragon )       
                                        
                                        
        ( address of rdragon gets stuffe
d into here enabling )          (   ldra
gon to call rdragon by calling this word
 )              : call-rdragon  0 ;     
                                        
                                        
                        ( make a -90 deg
ree turn )                              
        : ldragon  ( level --- )        
                                   dup 0
=                                       
                   if draw              
                                        
   else                                 
                             dup 1- recu
rse                                     
             -90deg move-direction      
                                     dup
 1- call-rdragon                        
                   then drop ;          
                                        
                                        
                        
( curves: rdragon )                     
                                        
                                        
        ( make a +90 degree turn )      
                                : rdrago
n  ( level --- )                        
                   dup 0=               
                                        
   if draw                              
                             else       
                                        
               dup 1- ldragon           
                                       +
90deg move-direction                    
                       dup 1- recurse   
                                        
     then drop ;                        
                                        
                                        
        ( set up so ldragon can call rdr
agon )                          ' rdrago
n cfa ' call-rdragon !                  
                                        
                                        
                                        
                        
( curves: d-curve wait-5-sec demo )     
                        : d-curve ( leve
ls length --- )                         
           +90deg 2* curve-init         
                                   ldrag
on ;                                    
                                        
                                        
: demo ( --- )                          
                          24 d-split pag
e 3 24 d-position                       
          ." *** Fractals by SUPER-FORT
H 64 *** "                         begin
                                        
                    7 1 do              
                                        
     i 2* i 7 xor mask d-curve          
                             sound.init 
120 wait loop                           
            6 1 do                      
                                     i 2
* i 7 xor 1- mask c-curve               
                     sound.init 120 wait
 loop                                   
   again ;                              
                        
( backup: dual drive buffer copy )      
                        ( copy buffers f
rom dr0 to dr1 )                        
        : copybuf ( flag end start --- )
                                   ( rea
d source screens)                       
                   do i . i i bpdrv + co
py loop                                 
   dup if 53248 1 0 20 17 3 rwts then   
                           save-buffers 
cr                                      
           if 53248 0 1 20 17 3 rwts the
n ;                                     
                                        
                 104 load               
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( backup: copybuf )                     
                        ( single drive b
uffer copy )                            
        : copybuf ( flag end start --- )
                                   cr ."
 insert source-hit key " key drop       
                   ( read source screens
)                                       
    do i . i block update drop loop     
                           dup if 53248 
1 0 20 17 3 rwts drop then              
           cr ." insert dest-hit key " k
ey drop  save-buffers cr           if 53
248 0 0 20 17 3 rwts drop then ;        
                  -->                   
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( backup: pcopy backup source-backup )  
                        ( perform a part
ial backup copy )                       
        : pcopy  ( flag start end --- ) 
                                   empty
-buffers 1+ ddup swap -                 
                   #buff /mod drop over 
swap -                                  
   dup 1- 4 roll ( e+1 e+1-r e-r s --- )
                           ddup > if ( c
heck if screens <= #buff )              
            do 0 i #buff + i copybuf    
                                     #bu
ff +loop else ddrop then                
                   copybuf ;            
                                        
                                        
                        : backup  ( --- 
)                                       
           1 0 169 pcopy ;              
                                        
                                        
                : source-backup  ( --- )
                                        
   0 0 112 pcopy ;                      
                        
( assembler: constants index )          
                          latest here 30
000 dp !  ( set up for assembler removal
 )      vocabulary assembler immediate  
                                hex asse
mbler definitions                       
                ( register assignments s
pecific to this implementation )        
83 constant xsave   81 constant w       
                        fb constant ip  
    87 constant n                       
                                        
                                ( nucleu
s locations specific to this implementat
ion)            0884 constant pop    088
2 constant poptwo                       
088b constant put    0889 constant push 
                        0890 constant ne
xt   0871 constant setupn               
                                        
                                variable
 index -2  allot                        
                0909 , 1505 , 0115 , 801
1 , 8009 , 1d0d , 8019 , 8080 ,         
0080 , 1404 , 8014 , 8080 , 8080 , 1c0c 
, 801c , 2c80 , decimal 
( assembler: mode addressing modes bot s
ec rp> upmode )         hex             
                                        
        variable mode 2 mode !          
                                : .a 0 m
ode ! ; : # 1 mode ! ;  : mem 2 mode ! ;
                : ,x 3 mode ! ; : ,y 4 m
ode ! ; : ,x) 5 mode ! ;                
: ),y 6 mode ! ; : ) f mode ! ;         
                                        
                                        
        : bot ,x 0 ;     ( address the b
ottom of data stack )           : sec ,x
 2 ;     ( address second item on data s
tack )          : rp> ,x 101   ; ( addre
ss bottom of return stack )             
                                        
                        : upmode if mode
 @   8 and 0= if 8 mode +! then then    
           1 mode @ 0f and ?dup  if 0 do
 dup + loop then                   over 
1+ @ and 0= ;                           
                                        
                                        
decimal                                 
                        
( assembler: cpu )                      
                                        
                                        
        hex                             
                                : cpu cr
eate c, does>  c@ c, mem ;              
                    00 cpu brk,    18 cp
u clc,    de cpu cld,    58 cpu cli,    
    b8 cpu clv,    ca cpu dex,    88 cpu
 dey,    e8 cpu inx,        c8 cpu iny, 
   ea cpu nop,    48 cpu pha,    08 cpu 
php,        68 cpu pla,    28 cpu plp,  
  40 cpu rti,    60 cpu rts,        38 c
pu sec,    f8 cpu sed,    78 cpu sei,   
 aa cpu tax,        a8 cpu tay,    ba cp
u tsx,    8a cpu txa,    9a cpu txs,    
    98 cpu tya,                         
                                        
                                        
        decimal                         
                                        
                                        
                                        
                                        
                                        
                        
( assembler: m/cpu )                    
                        hex             
                                        
        : m/cpu create c, , does>       
                                   dup 1
+ @ 80 and if 10 mode +! then over      
                   ff00 and upmode upmod
e if mem cr ( latest id.)               
   abort" incorrect addressing" then c@ 
mode c@                    index + c@ + 
c, mode c@ 7 and if mode c@             
           0f and 7 < if c, else , then 
then mem ;                      1c6e 60 
m/cpu adc, 1c6e 20 m/cpu and, 1c6e c0 m/
cpu cmp,        1c6e 40 m/cpu eor, 1c6e 
a0 m/cpu lda, 1c6e  0 m/cpu ora,        
1c6e e0 m/cpu sbc, 1c6c 80 m/cpu sta, 0d
0d  1 m/cpu asl,        0c0c c1 m/cpu de
c, 0c0c e1 m/cpu inc, 0d0d 41 m/cpu lsr,
        0d0d 21 m/cpu rol, 0d0d 61 m/cpu
 ror, 0414 81 m/cpu stx,        0486 e0 
m/cpu cpx, 0486 c0 m/cpu cpy, 1496 a2 m/
cpu ldx,        0c8e a0 m/cpu ldy, 048c 
80 m/cpu sty, 0480 14 m/cpu jsr,        
8480 40 m/cpu jmp, 0484 20 m/cpu bit, de
cimal                   
( assembler: begin, until, if, then, els
e, not branches )       : begin, here 1 
;                                       
        : until,  >r 1 ?pairs r> c, here
 1+ - c, ;                      : if, c,
 here 0 c, 2 ;                          
                : then,  2 ?pairs here o
ver c@                                  
   if swap !  else over 1+ - swap c! the
n ;                     : else, 2 ?pairs
 here 1+ 1 jmp,                         
           swap here over 1+ - swap c! 2
 ;                               hex    
                                        
                : not  20 + ;   ( revers
e assembly test )                       
90 constant cs  ( assemble test for carr
y set )                 d0 constant 0=  
( assembler test for equal zero )       
        10 constant 0<  ( assemble test 
for less than or equal zero )   90 const
ant >=  ( assemble test for greater or e
qual zero )     ( .= is only correct aft
er sub, or cmp, )                       
50 constant vs  decimal                 
                        
( assembler:  again, while, repeat )    
                                        
                                        
        : again, 1 ?pairs jmp, ;        
                                        
                                        
                : while, >r dup 1 ?pairs
 r> if, 2+ ;                            
                                        
                        : repeat, >r >r 
1 ?pairs jmp, r> r> 2 - then, ;         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( assembler: end-code entercode ;code co
de )                    : end-code   cur
rent @ context ! sp@ 2+ =               
           if smudge                    
                                   else 
." code error, stack depth change"      
                   then ;               
                                        
forth definitions                       
                        : entercode [com
pile] assembler sp@ ;                   
        : code create smudge here dup 2-
 !                                 assem
bler mem entercode ;   immediate        
                : ;code ?csp compile <;c
ode> [compile]  [ entercode ; immediate 
    exit                                
                                        
                                        
                                        
                                        
                                        
                ( this 6510 forth assemb
ler was written by william f. ragsdale )
( it was published in "forth dimensions"
, vol. iii # 5         )
( assembler: a-remove )                 
                          dp ! ( reset d
p to pre-assembler area )               
        : a-remove ( causes removal of a
ssembler from dictionary )         liter
al [ 0 latest pfa lfa ]                 
                   literal ! ; drop     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        
( 4040 patch )                          
                        here     ( prese
rve dict. pointer )                     
        hex assembler  ( invoke assemble
r )                             3049 08c
9 !  5c0d 08cb !                        
                08cd dp !               
                                        
 30 # lda,  0852 sta,                   
                         6 ,x lda,   1 #
 cmp,                                   
          0= if,                        
                                   31 # 
lda,  0852 sta, 0 # lda,                
                  then,                 
                                        
 clc,  26e0 jmp,                        
                        dp ! forth  ( re
store dict ptr )                        
                                        
                                 c9a2 27
a9 !                                    
                 cd4c 26dd !  08 26df c!
                                        
decimal                                 
                        




























































































































































( show)                                 
                                        
                                        
        : show ( begin end---)          
                                  1+ swa
p do                                    
                    i triad             
                                        
  2 +loop ;                             
                        
















( 40 c/l it)                            
                                        
                                        
        40 ' c/l !                      
                                        
                                        
                : it ;                  
                                        


















( cheap forget)                         
                                        
                                        
        : forget                        
                                  [compi
le] '                                   
                  dup nfa swap lfa @    
                                        
  current @ !                           
                          dp ! ;        
                                        
        


 ( remark)              
                                        
                                        
                                        
                                        
        






( new save)                             
                         hex            
                                        
        : save ( start end ---)         
                                15 8 15 
setlfs                                  
                savename setnam         
                                        
swap 14  !  ( save start addr at 4)     
                        14 swap split  f
fd8 sy  ;                               
        ( start pt endlot endhi save add
r)                                      
                                        
                decimal                 
                                        




        
                                        
                                        
                                        








































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































