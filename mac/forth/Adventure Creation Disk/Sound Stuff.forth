════════════════════════════════════════════════════════════════   SCREEN 001
                                                                
forget it : it ;                                                
2 6 thru                                                        
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( Sound.buffer)                                   ( 081184 dws) 
200 constant sound.len                                          
400 sound.len / constant resolution                             
create Sound.buffer 262 allot                                   
                                                                
: beep ( duration---) 1 max                                     
sound.buffer 6+ !                                               
begin ?sound not until                                          
sound.buffer aplay ;                                            
                                                                
                                                                
: s.fill ( 0 <any values> ----)                                 
 sound.buffer 260 0 fill                                        
 sound.len 6 + sound.buffer w!                                  
  ;                                                             
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( Sound.shaper)                                                 
                                                                
: grid  ginit    page                                           
  0 0 sound.len  resolution * 2+ 256  frame rectangle ;         
: bar ( x/y--)  >r                                              
  resolution / resolution *   ( x)                              
  dup 1 over resolution 1-  + 255 clear rectangle               
   R>  over  resolution 1- + 255 paint rectangle ;              
: read.load   ( x/y ---)                                        
       2dup bar  256 swap -                                     
       swap  resolution /   ( amp/byte#)                        
       sound.buffer 8+ + c!                                     
    ;                                                           
: beep.test 10000 beep ;                                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
( Beep.it)                                                      
                                                                
: beep.it ( x/y ---)                                            
  256 * 64000 * beep drop ;                                     
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
( Mouse.it)                                                     
: mouse.it hide.cursor                                          
   begin still.down                                             
   while  @mousexy                                              
     2dup 255 >     ( x/y/x)                                    
     if 2 sysbeep drop 2drop  ( too low)                        
     else resolution sound.len * <                              
       if      ( x/y--)                                         
         read.load                                              
       else beep.it                                             
       then                                                     
     then                                                       
   repeat show.cursor   ;                                       
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 006
( Sounder)                                                      
                                                                
: sounder   grid  s.fill                                        
   begin do.events                                              
     case mouse.down of  mouse.it endof                         
        key.down of  key                                        
             case 97 of sound.buffer aplay endof                
                  98 of beep.test endof                         
                  99 of grid s.fill endof                       
                 100 of 100 0 do sound.buffer play loop endof   
             endcase endof                                      
     endcase                                                    
   again ;                                                      
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
( 4-note)                                                       
create notes                                                    
100 w,  ( duration)                                             
20000 , 100 ,                                                   
4000 , 200 ,                                                    
410000 , 40 ,                                                   
400 , 0 , 100 , 10000  , 1000 ,  10000 ,                        
                                                                
create 4-note                                                   
6 w, ( length)                                                  
1 w,  ( + int)                                                  
notes ,                                                         
                                                                
: 4beep  200 notes w! 4-note play ;                             
                                                                
                                                                
