════════════════════════════════════════════════════════════════   SCREEN 000
( Robot list)                                                   
                                                                
5-7 Wander                                                      
10-11 Dumbo                                                     
15  Nik                                                         
                                                                
"cw" is the robot file. 1 record for each ChipWit.              
A CW program = 60 instructions * 2 bytes * 8 panels=960bytes.   
There can be 16 different ChipWits and the first record is      
used for storing CW names so there are 17 records =~16k.        
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 001
( CW file loader temp)                            ( 072884 dws) 
                                                                
( Load this on top of ChipWits to use same vars)                
                                                                
( 3 load ( CW creator)                                          
2 load   ( save.cw)                                             
                                                                
forget save.cw                                                  
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( Save.cw)                                        ( 093084 dws) 
CW.file remove                                                  
" macforth3:CW" CW.file assign ?file.error  ( virtual access)   
prog.size@ CW.file set.rec.len   ?file.error                    
 : save.cw ( cw# ----)   cw.file close                          
 robot.program swap CW.file dup >r dup .s open ?file.error      
." open"                                                        
 .s write.fixed ?file.error ." Written"                         
r> close ?file.error ." closed" ;                               
: new.robot robot.program prog.size@ Socket@ fill               
 8 0 do go.marker@ right.f@ +                                   
   robot.program chip.count@ i * 2* + c! loop ;                 
: blank.cws                                                     
  17 1 do  new.robot i save.cw loop ; ( 16 records)             
: Nop@ wire@ ;                                                  
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( CW file creator)                                ( 072884 dws) 
( CW.file delete ?file.error)                                   
 Cw.file create.file ?file.error                                
                                                                
CW.file open                                                    
                                                                
17 ( records) prog.size@ * Cw.file allocate ?file.error         
CW.file close ?file.error                                       
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
( Wander Data 0-21)                                ( 060484 dws)
( p^/In^/Flow.code/op.code   /Flow.code/arg.code ---)           
  0  0   Right.F@  Go.Marker@ 0         0           Load-robot  
  0  1   RIght.F@  Look.for@  Down.f@   pie@        Load-robot  
  0  2   Right.F@  Move@      0         Forward@    Load-robot  
  0  3   Right.F@  Feel.for@  Left.F@   pie@         Load-robot 
  0  4   Right.f@  Pick.up@   0         up@          Load-robot 
  0  5   0         Goto.Go@   0         0           Load-robot  
  0  11  Right.F@  Look.for@  Down.F@   Creep@      Load-robot  
  0  12  Right.F@  Qray@       0         0           Load-robot 
  0  13  0         Goto.Go@   0         0           Load-robot  
  0  21  Right.F@  Look.for@  Down.F@   Door@       Load-robot  
  0  22  Right.F@  Move@      0         FOrward@    Load-robot  
  0  23  0         Goto.Go@   0         0           Load-robot  
                                                                
 -->                                                            
════════════════════════════════════════════════════════════════   SCREEN 006
( Wandder Data 25-48)                             ( 060484 dws) 
( p^/In^/Flow.code/op.code   /Flow.code/arg.code ---)           
  0  31  Right.F@  Feel.for@  Down.F@   Wall@       Load-robot  
  0  32  left.F@   Move@      0         Turn.right@ Load-robot  
  0  40  0         Goto.Go@   0         0           Load-robot  
  0  41  right.F@  Flip.coin@ Down.F@   0           Load-robot  
  0  42  Right.F@  Nop@       0         0           Load-robot  
  0  43  Right.F@  NOP@       0         0           Load-robot  
  0  44  Right.F@  Move@      0         Forward@    Load-robot  
  0  45  right.F@  Flip.coin@ Down.F@   0           Load-robot  
  0  46  0         Goto.Go@   0         0           Load-robot  
-->                                                             
                                                                
                                                                
                                                                
                                                                
