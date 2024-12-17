════════════════════════════════════════════════════════════════   SCREEN 001
( Scenario loader)                                ( 060184 dws) 
                                                                
( load over chipwits) : this ;                                  
2 load  ( Scenario data structures)                             
( 3 load ( Doom pit file creator)                               
5 58 thru  ( Load Peace Path scenario)                          
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
" MacForth3:Memory Lanes"  Doom.file assign ?file.error  ." 3"  
( Doom.file delete ?file.error ( )    ." 2"                     
 Doom.file create.file ?file.error     ." 4"                    
                                                                
Doom.file open                                                  
                                                                
54 ( rooms) Room.size@ * Doom.file allocate  ?file.error        
                                                                
Doom.file close ?file.error                                     
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
 ( Template  room 1 )                             ( 101084 dws) 
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
( Peace room 1 )                                  ( 101084 dws) 
 doom.file remove                                               
" Macforth3:Peace Paths"  Doom.file assign ?file.error  ." 3"   
room.size@ doom.file set.rec.len here Room.data( dp !           
( 0      1     2    3     4     5     6     7   )               
wall, wall, door, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  door,                
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, wall, wall, wall, wall,                 
03 c, 03 c, 03 c, 53 c, 53 c, 53 c, 02 c, 00 c,  ( room#)       
58 c, 59 c, 60 c, 16 c, 24 c, 32 c, 03 c, 00 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
════════════════════════════════════════════════════════════════   SCREEN 006
 ( Template  room 2 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, wall, flor, flor, flor, flor, wall, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, wall, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
01 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
59 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
2 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
 ( Template  room 3 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, door, wall,  wall,                
door, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, door, door, door, wall, wall, wall,                 
04 c, 05 c, 05 c, 05 c, 01 c, 01 c, 01 c, 00 c,  ( room#)       
61 c, 15 c, 23 c, 31 c, 02 c, 03 c, 04 c, 00 c,  ( sq#) dp !    
3 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
 ( Template  room 4 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, wall, flor, flor,  wall,                
wall, flor, flor, flor, wall, flor, flor, wall,                 
wall, flor, flor, flor, wall, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, door, wall, wall,                 
03 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
05 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
4 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
 ( Template  room 5 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  door,                
wall, flor, flor, flor, flor, flor, flor,  door,                
door, flor, flor, flor, flor, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
03 c, 03 c, 07 c, 03 c, 07 c, 07 c, 00 c, 00 c,  ( room#)       
08 c, 16 c, 31 c, 24 c, 39 c, 47 c, 00 c, 00 c,  ( sq#) dp !    
5 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 010
 ( Template  room 6 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, wall, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, wall, wall, wall, wall,                 
07 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
03 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
6 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 011
 ( Template  room 7 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, door, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, door, door, door, wall,                 
06 c, 05 c, 05 c, 05 c, 09 c, 09 c, 09 c, 00 c,  ( room#)       
59 c, 24 c, 32 c, 40 c, 04 c, 05 c, 06 c, 00 c,  ( sq#) dp !    
7 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 012
 ( Template  room 8 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, wall, flor, flor, flor, flor, wall, wall,                 
wall, wall, flor, flor, flor, flor, wall, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, door, wall, wall, wall, wall, wall,                 
11 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
02 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
8 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 013
 ( Template  room 9 )                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, door, door, door,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
07 c, 07 c, 07 c, 11 c, 11 c, 11 c, 10 c, 00 c,  ( room#)       
60 c, 61 c, 62 c, 23 c, 31 c, 39 c, 48 c, 00 c,  ( sq#) dp !    
9 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 014
 ( Template  room 10)                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, wall, wall, flor,  wall,                
wall, flor, flor, flor, wall, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, wall, wall,                 
wall, flor, flor, flor, flor, flor, wall, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
09 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
55 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
10 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 015
 ( Template  room 11)                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, door, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
door, flor, flor, flor, flor, flor, flor,  door,                
door, flor, flor, flor, flor, flor, flor, door,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, wall, wall, wall, wall,                 
08 c, 13 c, 09 c, 13 c, 09 c, 13 c, 09 c, 00 c,  ( room#)       
58 c, 23 c, 16 c, 31 c, 24 c, 39 c, 32 c, 00 c,  ( sq#) dp !    
11 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 016
 ( Template  room 12)                             ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
wall, wall, wall, wall, wall, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, wall, flor, wall, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, wall, door, wall, wall, wall,                 
13 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
04 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
12 ( room#) Doom.file ( file#) Save-room                        
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 017
 ( Peace Paths  room 13)                          ( 101084 dws) 
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, door, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  door,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
12 c, 11 c, 15 c, 11 c, 15 c, 11 c, 15 c, 00 c,  ( room#)       
60 c, 16 c, 31 c, 24 c, 39 c, 32 c, 47 c, 00 c,  ( sq#) dp !    
13 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 018
( Peace Paths  room 14)                           ( 101084 dws) 
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, wall, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
15 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
01 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
14 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 019
( Peace Paths  room 15)                           ( 101084 dws) 
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, door, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, door, door, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
14 c, 18 c, 13 c, 13 c, 13 c, 17 c, 17 c, 17 c,  ( room#)       
57 c, 31 c, 24 c, 32 c, 40 c, 01 c, 02 c, 03 c,   ( sq#) dp !   
15 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 020
( Peace Paths  room 16)                           ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) door, flor, wall, wall, wall, wall, wall, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
17 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
39 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
16 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 021
( Peace Paths  room 17)                           ( 101084 dws) 
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, door, door, door, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
15 c, 15 c, 15 c, 19 c, 19 c, 16 c, 19 c, 00 c,  ( room#)       
57 c, 58 c, 59 c, 31 c, 39 c, 32 c, 47 c, 00 c,  ( sq#) dp !    
17 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 022
( Peace Paths  room 18)                           ( 101084 dws) 
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, wall,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, wall, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
15 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
24 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
18 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 023
( Peace Paths  room 19)                           ( 101084 dws) 
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, door, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
21 c, 17 c, 21 c, 17 c, 21 c, 17 c, 20 c, 00 c,  ( room#)       
31 c, 24 c, 39 c, 32 c, 47 c, 40 c, 03 c, 00 c,  ( sq#) dp !    
19 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 024
( Peace Paths  room 20)                           ( 101084 dws) 
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, door, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, wall, flor,  wall,  ( 23)   
( 24) wall, wall, flor, flor, flor, wall, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
19 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
59 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
20 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 025
( Peace Paths  room 21)                           ( 101084 dws) 
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, door, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) door, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
22 c, 19 c, 23 c, 19 c, 23 c, 19 c, 23 c, 00 c,  ( room#)       
57 c, 24 c, 39 c, 32 c, 47 c, 40 c, 55 c, 00 c,  ( sq#) dp !    
21 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 026
( Peace Paths  room 22)                           ( 101084 dws) 
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
21 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
01 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
22 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 027
( Peace Paths  room 23)                          ( 101084 dws)  
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, wall, wall, door,  wall,  (  7)   
(  8) door, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) door, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, door,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
24 c, 25 c, 25 c, 25 c, 21 c, 21 c, 21 c, 00 c,  ( room#)       
62 c, 15 c, 23 c, 31 c, 32 c, 40 c, 48 c, 00 c,  ( sq#) dp !    
23 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 028
( Peace Paths  room 24)                          ( 101084 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, wall, flor, flor, wall, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, wall, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, wall, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, door, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
23 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
06 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
24 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 029
( Peace Paths  room 25)                          ( 101084 dws)  
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, door, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  door,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  door,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, door, door, door, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
26 c, 23 c, 23 c, 23 c, 27 c, 27 c, 27 c, 00 c,  ( room#)       
59 c, 08 c, 16 c, 24 c, 04 c, 05 c, 06 c, 00 c,  ( sq#) dp !    
25 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 030
( Peace Paths  room 26)                          ( 101084 dws)  
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, wall, wall, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, wall, flor, wall,   ( 55)   
( 56) wall, wall, wall, door, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
25 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
03 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
26 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 031
( Peace Paths  room 27)                          ( 101084 dws)  
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, door, door, door,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, door, door, door, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
25 c, 25 c, 25 c, 28 c, 29 c, 29 c, 29 c, 00 c,  ( room#)       
60 c, 61 c, 62 c, 24 c, 02 c, 03 c, 04 c, 00 c,  ( sq#) dp !    
27 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 032
( Peace Paths  room 28)                          ( 101084 dws)  
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, wall, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, wall, wall, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
27 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
28 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 033
( Peace Paths  room 29)                          ( 101084 dws)  
here Room.data( dp !                                            
(       0      1     2    3     4     5     6     7   )         
(  0) wall, wall, door, door, door, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, door, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
27 c, 27 c, 27 c, 31 c, 31 c, 31 c, 30 c, 00 c,  ( room#)       
58 c, 59 c, 60 c, 24 c, 32 c, 40 c, 02 c, 00 c,  ( sq#) dp !    
29 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 034
( Peace Paths  room 30)                          ( 101084 dws)  
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, door, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, wall, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, wall, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, wall, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
29 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
30 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 035
( Peace Paths  room 31)                          ( 101084 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, door, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
29 c, 33 c, 29 c, 33 c, 29 c, 33 c, 32 c, 00 c,  ( room#)       
31 c, 24 c, 39 c, 32 c, 47 c, 40 c, 06 c, 00 c,  ( sq#) dp !    
31 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 036
( Peace Paths  room 32)                          ( 101084 dws)  
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, wall, wall, wall, door,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, wall, wall,   ( 39)   
( 40) wall, flor, flor, wall, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, wall, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
31 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
62 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
32 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 037
( Peace Paths  room 33)                          ( 101084 dws)  
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, door, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
34 c, 31 c, 35 c, 31 c, 35 c, 31 c, 00 c, 00 c,  ( room#)       
59 c, 31 c, 24 c, 39 c, 32 c, 47 c, 00 c, 00 c,  ( sq#) dp !    
33 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 038
( Peace Paths  room 34)                          ( 101084 dws)  
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, wall, wall, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, wall, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, door, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
33 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
03 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
34 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 039
( Peace Paths  room 35)                          ( 101084 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, door,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
33 c, 33 c, 37 c, 37 c, 37 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 39 c, 24 c, 32 c, 40 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
35 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 040
( Peace Paths  room 36)                          ( 101084 dws)  
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, wall, flor, wall, wall, wall,   ( 55)   
( 56) wall, door, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
37 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
01 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
36 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 041
( Peace Paths  room 37)                          ( 101084 dws)  
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  door,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  door,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) door, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
36 c, 39 c, 39 c, 39 c, 35 c, 35 c, 35 c, 38 c,  ( room#)       
57 c, 08 c, 16 c, 24 c, 39 c, 47 c, 55 c,  01 c,  ( sq#) dp !   
37 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 042
( Peace Paths  room 38)                          ( 101084 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, door, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, wall, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, wall, wall, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
37 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
57 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
38 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 043
( Peace Paths  room 39)                          ( 101084 dws)  
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) door, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) door, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, door, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
37 c, 37 c, 37 c, 41 c, 41 c, 41 c, 40 c, 00 c,  ( room#)       
15 c, 23 c, 31 c, 24 c, 32 c, 40 c, 04 c, 00 c,  ( sq#) dp !    
39 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 044
( Peace Paths  room 40)                          ( 101084 dws)  
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, door, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, wall, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, wall, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
39 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
60 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
40 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 045
( Peace Paths  room 41)                          ( 101084 dws)  
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, door, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
44 c, 39 c, 43 c, 39 c, 43 c, 39 c, 43 c, 42 c,  ( room#)       
60 c, 31 c, 24 c, 39 c, 32 c, 47 c, 40 c, 01 c,  ( sq#) dp !    
41 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 046
( Peace Paths  room 42)                          ( 101084 dws)  
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, wall, wall, wall,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
41 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
57 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
42 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 047
( Peace Paths  room 43)                          ( 101084 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
41 c, 45 c, 41 c, 45 c, 41 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 24 c, 39 c, 32 c, 47 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
43 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 048
( Peace Paths  room 44)                          ( 101084 dws)  
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, wall, wall, wall, wall, wall, flor,  wall,  ( 15)   
( 16) wall, flor, wall, wall, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, wall, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, wall, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, door, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
41 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
04 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
44 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 049
( Peace Paths  room 45)                          ( 101084 dws)  
here Room.data( dp !                                            
       ( 0      1     2    3     4     5     6     7   )        
(  0) wall, wall, wall, wall, wall, wall, door,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  door,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, door, door, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
46 c, 48 c, 43 c, 43 c, 47 c, 47 c, 47 c, 00 c,  ( room#)       
62 c, 09 c, 31 c, 39 c, 01 c, 02 c, 03 c, 00 c,  ( sq#) dp !    
45 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 050
( Peace Paths  room 46)                          ( 101084 dws)  
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, door, wall,   ( 63)   
45   (  56    57    58    59    60    61    62    63)           
45 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
06 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
46 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 051
 ( Peace Paths  room 47)                          ( 101084 dws) 
here Room.data( dp !                                            
      ( 0      1     2    3     4     5     6     7   )         
(  0) wall, door, door, door, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, door, door, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
45 c, 45 c, 45 c, 50 c, 52 c, 49 c, 49 c, 49 c,  ( room#)       
57 c, 58 c, 59 c, 31 c, 24 c, 01 c, 02 c, 03 c,  ( sq#) dp !    
47 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 052
 ( Peace Paths  room 48)                          ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) door, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, wall, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
45 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
15 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
48 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 053
 ( Peace Paths  room 49)                          ( 101084 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, door, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) door, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) door, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
47 c, 47 c, 47 c, 51 c, 51 c, 51 c, 54 c, 00 c,  ( room#)       
57 c, 58 c, 59 c, 39 c, 47 c, 55 c, 01 c, 00 c,  ( sq#) dp !    
49 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 054
 ( Peace Paths  room 50)                          ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, door,   ( 31)   
( 32) wall, flor, flor, flor, wall, wall, wall, wall,   ( 39)   
( 40) wall, flor, flor, flor, wall, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
47 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
24 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
50 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 055
 ( Peace Paths  room 51)                          ( 101084 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, door,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, door,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, door,   ( 55)   
( 56) wall, door, door, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
49 c, 49 c, 49 c, 53 c, 53 c, 00 c, 00 c, 00 c,  ( room#)       
32 c, 40 c, 48 c, 01 c, 02 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
51 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 056
 ( Peace Paths  room 52)                          ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, wall, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
47 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
52 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 057
 ( Peace Paths  room 53)                          ( 101084 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) door, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) door, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) door, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
51 c, 51 c, 01 c, 01 c, 01 c, 00 c, 00 c, 00 c,  ( room#)       
57 c, 58 c, 23 c, 31 c, 39 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
53 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 058
 ( Peace Paths  room 54)                          ( 101084 dws) 
here Room.data( dp !                                            
( 0      1     2    3     4     5     6     7   )               
(  0) wall, door, wall, wall, wall, wall, wall,  wall,  (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor,  wall,  ( 23)   
( 24) wall, flor, flor, flor, flor, wall, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, wall, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
49 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
57 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
54 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 060
( Memory Lanes file)                                            
 doom.file remove                                               
" Macforth3:Memory Lanes"  Doom.file assign ?file.error  ." 3"  
room.size@ doom.file set.rec.len                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 061
 ( Memory Lanes room 1 )                          ( 101584 dws) 
here Room.data( dp !                                            
wall, wall, door, door, door, wall, wall,  wall,                
wall, flor, flor, flor, flor, flor, flor,  wall,                
wall, flor, flor, flor, flor, flor, flor,  door,                
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, wall, door, wall, wall, wall, wall,                 
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 062
 ( Memory Lanes room 2 )                          ( 101584 dws) 
 here Room.data( dp !                                           
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall,   (  7)   
(  8) wall, flor, flor, flor, flor, flor, flor, wall,   ( 15)   
( 16) wall, flor, flor, flor, flor, flor, flor, wall,   ( 23)   
( 24) wall, flor, flor, flor, flor, flor, flor, wall,   ( 31)   
( 32) wall, flor, flor, flor, flor, flor, flor, wall,   ( 39)   
( 40) wall, flor, flor, flor, flor, flor, flor, wall,   ( 47)   
( 48) wall, flor, flor, flor, flor, flor, flor, wall,   ( 55)   
( 56) wall, door, wall, wall, wall, wall, wall, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#)         
00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
2 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 068
 ( Memory Lanes room 8 )                          ( 110584 dws) 
 here Room.data( dp !                                           
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, wall, wall, door, door, wall,   (  7)   
(  8) wall, flor, flor, wall, wall, flor, flor, wall,   ( 15)   
(  8) wall, flor, flor, wall, wall, flor, flor, wall,   ( 15)   
(  8) wall, flor, flor, wall, wall, flor, flor, wall,   ( 15)   
(  8) wall, flor, flor, wall, wall, flor, flor, wall,   ( 15)   
(  8) wall, flor, flor, wall, wall, flor, flor, wall,   ( 15)   
(  8) wall, flor, flor, wall, wall, flor, flor, wall,   ( 15)   
( 56) wall, door, door, wall, wall, door, door, wall,   ( 63)   
     (  56    57    58    59    60    61    62    63)           
09 c, 09 c, 10 c, 10 c, 07 c, 07 c, 07 c, 07 c,  ( sq#)         
61 c, 62 c, 57 c, 58 c, 01 c, 02 c, 05 c, 06 c,  ( sq#) dp !    
8 ( room#) Doom.file ( file#) Save-room                         
                                                                
