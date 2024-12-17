════════════════════════════════════════════════════════════════   SCREEN 001
( Scenario loader)                                ( 060184 dws) 
                                                                
( load over chipwits) : this ;                                  
2 load  ( Scenario data structures)                             
 3 load ( Doom pit file creator)                                
5 17 thru  ( Load doom pit scenario)                            
20 29 thru  ( CW Caves)                                         
 30 36 thru  ( Greedville)                                      
forget this                                                     
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( Scenario data structures )                      ( 101084 dws) 
room.size@ doom.file set.rec.len                                
: Save-room ( room# file# ---)                                  
  Room.data( rot rot dup >r dup .s open ?file.error ." opened"  
  .s write.fixed ?file.error ." Written"                        
  r> .s close ?file.error ." Closed" ;                          
                                                                
: wall, wall@ c, ;  : crep, creep@ c, ;                         
: flor, floor@ c, ;   : door, door@ c, ;  : ppie, pie@ c, ;     
: coff, coffee@ c, ; : disk, disk@ c, ;                         
: oilc, oil@ c, ;                                               
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( doom pit file creator )                         ( 073084 dws) 
 doom.file remove   ." 1"                                       
" Doom Rooms"  Doom.file assign ?file.error  ." 3"              
 Doom.file delete ?file.error ( )    ." 2"                      
 Doom.file create.file ?file.error     ." 4"                    
                                                                
Doom.file open                                                  
                                                                
13 ( rooms) Room.size@ * Doom.file allocate  ?file.error        
                                                                
Doom.file close ?file.error                                     
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
 ( Template  room 1 )                              ( 081384 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
 ( Doom room 1 )                                 ( 060284 dws)  
 doom.file remove                                               
" macforth3:Doom Rooms"  Doom.file assign ?file.error  ." 3"    
room.size@ doom.file set.rec.len here Room.data( dp !           
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, wall, ppie, flor,  wall,                
wall, flor, flor, flor, wall, wall, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, crep, wall,                 
wall, wall, door, door, wall, wall, wall, wall,                 
02 c, 02 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
02 c, 03 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
════════════════════════════════════════════════════════════════   SCREEN 006
( Doom room 2 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, door, door, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, crep,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, wall, wall, flor, flor, wall,                 
wall, flor, flor, wall, wall, flor, flor, wall,                 
wall, flor, flor, flor, crep, flor, flor, wall,                 
wall, wall, wall, wall, wall, door, wall, wall,                 
01 c, 01 c, 03 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 59 c, 05 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
2 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
( Doom room 3 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, door, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, wall, flor,  wall,                
door, flor, flor, flor, flor, wall, ppie, wall,                 
wall, flor, flor, flor, flor, wall, flor, door,                 
wall, wall, wall, flor, flor, flor, flor, door,                 
wall, ppie, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
02 c, 04 c, 08 c, 08 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
61 c, 31 c, 32 c, 40 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
3 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( Doom room 4 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
door, flor, ppie, flor, flor, flor, flor,  wall,                
wall, wall, wall, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, wall, wall, flor, wall,                 
wall, flor, flor, flor, wall, crep, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, door, wall, wall, wall, wall, wall,                 
05 c, 03 c, 13 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
15 c, 24 c, 02 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
4 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( Doom room 5 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  door,                
door, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, wall, flor, flor, flor, flor, wall,                 
wall, crep, wall, flor, flor, flor, flor, wall,                 
wall, wall, wall, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, ppie, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
04 c, 06 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
08 c, 23 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
5 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 010
( Doom room 6 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, door, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, wall, wall, flor,  door,                
wall, flor, flor, flor, ppie, wall, flor, wall,                 
wall, flor, wall, wall, wall, wall, flor, wall,                 
wall, flor, wall, ppie, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, door, door, wall,                 
07 c, 08 c, 05 c, 09 c, 09 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 31 c, 16 c, 05 c, 06 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
6 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 011
( Doom room 7 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, door, door, wall, wall, door,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, ppie, flor, flor, flor, wall,                 
wall, flor, flor, ppie, flor, flor, flor, wall,                 
wall, flor, crep, flor, crep, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, door, wall, wall, wall, wall, wall,                 
10 c, 10 c, 10 c, 06 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 59 c, 62 c, 02 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
7 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 012
( Doom room 8 )                                 ( ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, crep,  wall,                
wall, flor, wall, wall, wall, wall, flor,  wall,                
wall, flor, flor, flor, ppie, wall, flor, door,                 
door, flor, flor, wall, crep, wall, flor, wall,                 
door, flor, wall, wall, ppie, wall, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
06 c, 03 c, 03 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
16 c, 39 c, 47 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
8 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 013
( Doom room 9 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, door, door,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, ppie, ppie, flor, ppie, flor,  wall,                
wall, flor, wall, wall, wall, wall, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, door, wall, wall, wall, wall, wall, wall,                 
06 c, 06 c, 10 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
61 c, 62 c, 01 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
9 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 014
( Doom room 10 )                                 ( 060284 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, door, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, ppie,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, crep, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, wall, door, door, wall, wall, door, wall,                 
09 c, 11 c, 07 c, 07 c, 07 c, 00 c, 00 c, 00 c,  ( room#)       
57 c, 48 c, 02 c, 03 c, 06 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
10 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 015
( Doom room 11 )                                 ( 060284 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, ppie, flor, ppie, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, ppie, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, ppie, flor, wall,                 
wall, flor, wall, wall, wall, wall, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
10 c, 12 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
55 c, 48 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
11 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 016
( Doom room 12 )                                 ( 060284 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, door,  wall,                
wall, flor, flor, flor, ppie, flor, flor,  wall,                
wall, flor, flor, flor, wall, wall, flor,  wall,                
wall, flor, flor, flor, wall, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
13 c, 11 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
62 c, 55 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
12 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 017
( Doom room 13 )                                 ( 060284 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, door, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, wall, wall, flor, flor, flor,  wall,                
wall, flor, wall, ppie, ppie, flor, flor, wall,                 
wall, flor, wall, wall, wall, wall, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, door, wall,                 
04 c, 12 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 06 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
13 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 018
( Doom room 0 )                                 ( 060284 dws)   
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
0 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 020
( CW Caves)                                       ( 081384 dws) 
 doom.file remove                                               
" macforth3:ChipWit Caves"  Doom.file assign ?file.error  ." 3" 
room.size@ doom.file set.rec.len                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 021
 ( TCW Caves room 1 )                              ( 081384 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, wall, wall, wall, wall, flor,  door,                
wall, flor, wall, flor, flor, flor, flor, door,                 
wall, flor, wall, flor, flor, flor, flor, door,                 
wall, flor, wall, wall, wall, wall, flor, door,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
02 c, 02 c, 02 c, 02 c, 08 c, 00 c, 00 c, 00 c,  ( room#)       
16 c, 24 c, 32 c, 40 c, 15 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 022
 ( CW Caves room 2 )                              ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, wall, flor, flor, wall, flor,  door,                
door, flor, wall, wall, wall, wall, flor, door,                 
door, flor, wall, flor, flor, wall, flor, door,                 
door, flor, wall, flor, flor, wall, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
01 c, 03 c, 01 c, 03 c, 01 c, 03 c, 01 c, 03 c,   ( room#)      
23 c, 16 c, 31 c, 24 c, 39 c, 32 c, 47 c, 40 c,  ( sq#) dp !    
2 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 023
 ( CW Caves room 3 )                              ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, wall, wall, wall, wall, flor,  door,                
door, flor, flor, wall, wall, flor, flor, door,                 
door, flor, flor, wall, wall, flor, flor, door,                 
door, flor, wall, wall, wall, wall, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
02 c, 04 c, 02 c, 04 c, 02 c, 04 c, 02 c, 04 c,  ( room#)       
23 c, 16 c, 31 c, 24 c, 39 c, 32 c, 47 c, 40 c,  ( sq#) dp !    
3 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 024
 ( CW Caves room 4 )                              ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, wall, wall, wall, wall, flor,  wall,                
door, flor, wall, wall, wall, wall, flor, door,                 
door, flor, wall, wall, wall, wall, flor, door,                 
door, flor, wall, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
03 c, 03 c, 05 c, 03 c, 05 c, 03 c, 00 c, 00 c,  ( room#)       
23 c, 31 c, 24 c, 39 c, 32 c, 47 c, 00 c, 00 c,  ( sq#) dp !    
4 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 025
 ( CW Caves room 5 )                              ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, wall, wall, wall, wall, wall,  door,                
wall, flor, wall, wall, flor, wall, wall,  door,                
door, flor, wall, flor, flor, flor, wall, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, wall, flor, flor, door,                 
wall, flor, flor, wall, wall, wall, flor, door,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
06 c, 06 c, 04 c, 06 c, 04 c, 06 c, 06 c, 06 c,  ( room#)       
16 c, 16 c, 31 c, 24 c, 39 c, 32 c, 40 c, 40 c,  ( sq#) dp !    
5 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 026
 ( CW Caves room 6 )                              ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, wall, wall, wall, wall, flor,  door,                
door, flor, flor, wall, wall, flor, flor, door,                 
door, flor, flor, wall, wall, flor, flor, door,                 
door, flor, wall, wall, wall, wall, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
05 c, 07 c, 05 c, 07 c, 05 c, 07 c, 05 c, 07 c,  ( room#)       
23 c, 16 c, 31 c, 24 c, 39 c, 32 c, 47 c, 40 c,  ( sq#) dp !    
6 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 027
 ( CW Caves room 7 )                              ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, wall, wall, wall, wall, flor,  door,                
door, flor, flor, wall, wall, flor, flor, door,                 
door, flor, flor, wall, wall, flor, flor, door,                 
door, flor, flor, wall, wall, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
06 c, 08 c, 06 c, 08 c, 06 c, 08 c, 06 c, 08 c,  ( room#)       
23 c, 40 c, 31 c, 40 c, 39 c, 48 c, 47 c, 48 c,  ( sq#) dp !    
7 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 028
 ( TCW Caves room 8 )                              ( 081384 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, wall, flor, flor, flor, flor, flor,  door,                
wall, wall, flor, flor, wall, wall, wall,  wall,                
wall, wall, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
01 c, 07 c, 07 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
48 c, 39 c, 47 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
8 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 030
( Greedville)                                     ( 081384 dws) 
 doom.file remove                                               
" Greedville"  Doom.file assign ?file.error  ." 3"              
room.size@ doom.file set.rec.len                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 031
 ( Greedville room 1 )                            ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, wall, wall, flor, flor, door,                 
door, flor, flor, wall, wall, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
01 c, 02 c, 04 c, 02 c, 03 c, 02 c, 03 c, 02 c,  ( room#)       
59 c, 62 c, 31 c, 40 c, 23 c, 48 c, 02 c, 02 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 032
 ( Greedville room 2 )                            ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, door, door, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, wall, flor,  door,                
wall, wall, flor, flor, flor, flor, flor,  door,                
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, wall, wall,                 
door, flor, wall, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, door, door, wall,                 
02 c, 04 c, 04 c, 03 c, 02 c, 01 c, 04 c, 03 c,  ( room#)       
61 c, 60 c, 24 c, 16 c, 15 c, 31 c, 03 c, 05 c,  ( sq#) dp !    
2 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 033
 ( Greedville room 3 )                            ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, door, wall, wall, door, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor,  door,                
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, door, wall, wall, door, wall, wall,                 
03 c, 03 c, 04 c, 01 c, 01 c, 04 c, 01 c, 01 c,  ( room#)       
61 c, 58 c, 39 c, 32 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
3 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 034
 ( Greedville room 4 )                            ( 081384 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, wall, wall, flor, flor, wall, wall,  wall,                
wall, wall, flor, flor, flor, flor, wall,  wall,                
door, flor, flor, flor, flor, flor, flor,  door,                
door, flor, flor, flor, flor, flor, flor, door,                 
wall, wall, flor, flor, flor, flor, wall,  wall,                
wall, wall, wall, flor, flor, wall, wall,  wall,                
wall, wall, wall, door, door, wall, wall,  wall,                
01 c, 04 c, 03 c, 01 c, 02 c, 03 c, 04 c, 02 c,  ( room#)       
60 c, 59 c, 47 c, 24 c, 23 c, 40 c, 04 c, 01 c,  ( sq#) dp !    
4 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 039
                                                                
: cm, 1- 100 mod 1 + . ;                                        
                                                                
 dup 10 - cm, dup 10 - cm,                                      
dup  1- 10 / over 1-  10 mod 1- 10 mod 1 + swap 10 * + .        
dup  1- 10 / over  10 mod 1+ swap 10 * + .                      
dup  1- 10 / over  10 mod 1- swap 10 * + .                      
dup  1- 10 / over  10 mod 1+ swap 10 * + .                      
dup 10 + cm, dup 10 + cm,                                       
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 040
( Mystery Matrix Routines)                        ( 101084 dws) 
 doom.file remove                                               
" macforth3:Mystery Matrix"  Doom.file assign ?file.error  ." 3"
 room.size@ doom.file set.rec.len                               
: cm, 1- 100 mod 1+ c, ;                                        
: Room.c, ( room#---)                                           
 dup 10 - cm, dup 10 - cm,                                      
dup  1- 10 / over 1-  10 mod 1- 10 mod 1 + swap 10 * + c,       
dup  1- 10 / over  10 mod 1+ swap 10 * + c,                     
dup  1- 10 / over 1-  10 mod 1- 10 mod 1 + swap 10 * + c,       
dup  1- 10 / over  10 mod 1+ swap 10 * + c,                     
dup 10 + cm, dup 10 + cm,                                       
drop ;                                                          
exit                                                            
 41 load mystery 42 61 thru                                     
                                                                
════════════════════════════════════════════════════════════════   SCREEN 041
 ( Mystery  room 1-100 )                          ( 101084 dws) 
: Mys.make ( room ---) here Room.data( dp !                     
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
over room.c,  ( room#)                                          
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
( room#) Doom.file ( file#) Save-room    ;                      
: Mystery 101 1 do i mys.make loop ;                            
                                                                
════════════════════════════════════════════════════════════════   SCREEN 042
 ( Mystery  room 3      )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, coff, coff, disk, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
3 room.c,  ( room#)                                             
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
3 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 043
 ( Mystery  room 5      )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, ppie, flor, flor, door,                 
door, flor, flor, flor, disk, flor, flor, door,                 
wall, flor, flor, flor, disk, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
5 room.c,  ( room#)                                             
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
5 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 044
 ( Mystery  room 42      )                        ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, coff, disk, disk, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
42 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
42 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 045
 ( Mystery  room 23      )                        ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, disk, flor, flor, flor, door,                 
door, flor, flor, oilc, flor, flor, flor, door,                 
wall, flor, flor, oilc, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
23 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
23 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 046
 ( Mystery  room 26      )                        ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, disk, oilc, oilc, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
26 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
26 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 047
 ( Mystery  room 38     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, ppie, flor, flor, flor, door,                 
door, flor, flor, oilc, flor, flor, flor, door,                 
wall, flor, flor, oilc, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
38 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
38 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 048
 ( Mystery  room 56     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, coff, flor, flor, flor,  wall,                
door, flor, flor, oilc, flor, flor, flor, door,                 
door, flor, flor, oilc, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
56 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
56 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 049
 ( Mystery  room 59     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, disk, ppie, ppie, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
59 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
59 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 050
 ( Mystery  room 67     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, disk, disk, oilc, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
67 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
67 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 051
 ( Mystery  room 69     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, oilc, flor, flor, door,                 
door, flor, flor, flor, ppie, flor, flor, door,                 
wall, flor, flor, flor, ppie, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
69 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
69 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 052
 ( Mystery  room 82     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, coff, flor, flor, flor,  wall,                
door, flor, flor, ppie, flor, flor, flor, door,                 
door, flor, flor, ppie, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
82 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
82 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 053
 ( Mystery  room 75     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, oilc, disk, disk, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
75 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
75 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 054
 ( Mystery  room 97     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, oilc, flor, flor, flor, door,                 
door, flor, flor, coff, flor, flor, flor, door,                 
wall, flor, flor, coff, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
97 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
97 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 055
 ( Mystery  room 100    )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, oilc, disk, disk, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
90 c, 90 c, 99 c, 91 c, 99 c, 91 c, 10 c, 10 c,   ( room#)      
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
100 ( room#) Doom.file ( file#) Save-room                       
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 056
 ( Mystery  room 18     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, oilc, oilc, coff, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
18 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
18 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 057
 ( Mystery  room 20     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, disk, flor, flor,  wall,                
door, flor, flor, flor, oilc, flor, flor, door,                 
door, flor, flor, flor, oilc, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
20 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
20 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 058
 ( Mystery  room 31     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, ppie, coff, coff, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
31 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
31 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 059
 ( Mystery  room 41     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, ppie, flor, flor, flor,  wall,                
door, flor, flor, oilc, flor, flor, flor, door,                 
door, flor, flor, oilc, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
41 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
41 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 060
 ( Mystery  room 74     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, disk, flor, flor, flor, door,                 
door, flor, flor, disk, flor, flor, flor, door,                 
wall, flor, flor, ppie, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
74 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
74 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 061
 ( Mystery  room 84     )                          ( 101084 dws)
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor, door,                 
door, flor, disk, coff, coff, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
84 room.c,  ( room#)                                            
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
84 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 062
 ( Mystery  room 10     )                         ( 110584 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
100 c, 100 c, 9 c, 1 c,  9 c,  1 c, 20 c, 20 c,   ( room#)      
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
10 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 063
 ( Mystery  room 90     )                         ( 110584 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, door, wall, wall, wall,                 
80 c, 80 c, 89 c, 81 c, 89 c, 81 c, 100 c, 100 c,   ( room#)    
59 c, 60 c, 31 c, 24 c, 39 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
90 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
