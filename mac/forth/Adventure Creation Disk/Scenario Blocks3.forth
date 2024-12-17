════════════════════════════════════════════════════════════════   SCREEN 001
( Scenario loader)                                ( 060184 dws) 
                                                                
( load over chipwits) : this ;                                  
2 load  ( Scenario data structures)                             
 3 load ( Doom pit file creator)                                
5 48 thru  ( Load octopus scenario)                             
50 59 thru ( Boomtown)                                          
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
: oilc, oil@ c, ;    : bomb, bomb@ c, ;                         
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( doom pit file creator )                         ( 073084 dws) 
 doom.file remove   ." 1"                                       
" Macforth3:Boomtown"  Doom.file assign ?file.error  ." 3"      
(  Doom.file delete ?file.error ( )    ." 2"                    
 Doom.file create.file ?file.error     ." 4"                    
                                                                
Doom.file open                                                  
                                                                
9 ( rooms) Room.size@ * Doom.file allocate  ?file.error         
                                                                
Doom.file close ?file.error                                     
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 005
 ( Doom room 1 )                                  ( 102084 dws) 
 doom.file remove                                               
" macforth3:Octopus Garden"  Doom.file assign ?file.error  ." 3"
 room.size@ doom.file set.rec.len here Room.data( dp !          
( 0      1     2    3     4     5     6     7   )               
wall, door, wall, wall, wall, wall, door, wall,                 
wall, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, wall,                 
wall, wall, flor, flor, flor, flor, flor, wall,                 
door, flor, flor, flor, flor, flor, flor, door,                 
wall, flor, flor, flor, flor, flor, flor, wall,                 
wall, door, wall, door, wall, wall, wall, wall,                 
36 c, 42 c, 02 c, 31 c, 27 c, 08 c, 22 c, 15 c,  ( room#)       
60 c, 59 c, 40 c, 31 c, 23 c, 16 c, 03 c, 02 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
════════════════════════════════════════════════════════════════   SCREEN 006
( Octo room 2 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, door, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, wall, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
03 c, 01 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
48 c, 15 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
2 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 007
( Octo room 3 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, wall, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, wall, flor, wall, ( 47)     
( 48) door, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
04 c, 02 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
32 c, 15 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
3 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 008
( Octo room 4 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, door, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, wall, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) door, flor, flor, flor, flor, wall, flor, wall, ( 39)     
( 40) wall, flor, flor, wall, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
05 c, 03 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 31 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
4 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 009
( Octo room 5 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, wall, flor, flor, wall, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, wall, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, wall, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, door, wall, wall, door, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
04 c, 06 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
05 c, 02 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
5 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 010
( Octo room 6 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, wall, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, wall, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, wall, wall, wall, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
05 c, 07 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
61 c, 24 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
6 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 011
( Octo room 7 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, wall, flor, wall, wall, flor, wall, ( 23)     
( 24) door, flor, flor, flor, disk, wall, flor, wall, ( 31)     
( 32) wall, flor, wall, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, wall, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
06 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
7 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 012
( Octo room 8 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) door, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, door, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
01 c, 09 c, 09 c, 09 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
47 c, 08 c, 16 c, 24 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
8 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 013
( Octo room 9 )                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) door, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) door, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, door, door, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
08 c, 08 c, 08 c, 10 c, 10 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 39 c, 47 c, 02 c, 03 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
9 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 014
( Octo room 10)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, door, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
09 c, 09 c, 11 c, 11 c, 11 c, 00 c, 00 c, 00 c,  ( room#)       
60 c, 61 c, 15 c, 23 c, 31 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
10 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 015
( Octo room 11)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, door, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, door, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, door, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, door, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
10 c, 10 c, 10 c, 12 c, 12 c, 00 c, 00 c, 00 c,  ( room#)       
24 c, 32 c, 40 c, 08 c, 16 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
11 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 016
( Octo room 12)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) door, flor, flor, flor, flor, flor, flor, door, ( 15)     
( 16) door, flor, flor, flor, flor, flor, flor, door, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
11 c, 13 c, 11 c, 13 c, 13 c, 00 c, 00 c, 00 c,  ( room#)       
47 c, 32 c, 55 c, 40 c, 48 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
12 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 017
( Octo room 13)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) door, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, door, door, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
12 c, 12 c, 12 c, 14 c, 14 c, 00 c, 00 c, 00 c,  ( room#)       
15 c, 23 c, 31 c, 02 c, 03 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
13 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 018
( Octo room 14)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, door, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, disk, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
13 c, 13 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
61 c, 62 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
14 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 019
( Octo room 15)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, wall, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, door, door, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
01 c, 16 c, 16 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
59 c, 04 c, 05 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
15 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 020
( Octo room 16)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, door, door, wall, wall, (  7)     
(  8) wall, flor, flor, wall, flor, flor, wall, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, wall, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) door, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
15 c, 15 c, 17 c, 17 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
61 c, 62 c, 31 c, 39 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
16 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 021
( Octo room 17)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, wall, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, wall, wall, ( 47)     
( 48) wall, wall, flor, flor, wall, flor, flor, wall, ( 55)     
( 56) wall, wall, door, door, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
16 c, 16 c, 18 c, 18 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
40 c, 48 c, 03 c, 04 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
17 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 022
( Octo room 18)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, door, door, wall, wall, wall, (  7)     
(  8) wall, flor, wall, flor, flor, wall, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, wall, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) door, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
17 c, 17 c, 19 c, 19 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 59 c, 31 c, 39 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
18 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 023
( Octo room 19)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, wall, flor, flor, flor, flor, wall, wall, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, wall, flor, flor, flor, flor, wall, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
20 c, 18 c, 20 c, 18 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 40 c, 39 c, 48 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
19 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 024
( Octo room 20)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, door, door, wall, (  7)     
(  8) wall, flor, flor, flor, wall, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, wall, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, wall, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
21 c, 21 c, 19 c, 19 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
59 c, 60 c, 24 c, 32 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
20 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 025
( Octo room 21)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, wall, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, disk, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, disk, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, wall, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, wall, flor, flor, wall, flor, wall, ( 55)     
( 56) wall, wall, wall, door, door, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
20 c, 20 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
05 c, 06 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
21 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 026
( Octo room 22 )                                  ( 102084 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, door, wall, wall, wall, wall, (  7)     
(  8) wall, wall, wall, flor, flor, wall, wall, wall, ( 15)     
(  8) wall, wall, wall, flor, flor, wall, wall, wall, ( 15)     
(  8) wall, wall, wall, flor, flor, wall, wall, wall, ( 15)     
( 32) door, flor, flor, flor, flor, wall, wall, wall, ( 39)     
( 40) door, flor, flor, flor, flor, wall, wall, wall, ( 47)     
( 48) wall, wall, wall, wall, wall, wall, wall, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
01 c, 23 c, 23 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
57 c, 15 c, 23 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
22 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 027
( Octo room 23)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, wall, wall, wall, flor, flor, flor, door, ( 15)     
(  8) wall, wall, wall, wall, flor, flor, flor, door, ( 15)     
( 24) wall, wall, wall, wall, flor, flor, wall, wall, ( 31)     
( 32) door, flor, flor, flor, flor, flor, wall, wall, ( 39)     
( 40) door, flor, flor, flor, flor, flor, wall, wall, ( 47)     
( 48) wall, wall, wall, wall, wall, wall, wall, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
22 c, 22 c, 24 c, 24 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
32 c, 40 c, 15 c, 23 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
23 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 028
( Octo room 24)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, door, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, door, ( 23)     
( 24) wall, flor, flor, wall, wall, wall, wall, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, wall, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, wall, wall, ( 47)     
( 48) wall, wall, wall, wall, flor, flor, wall, wall, ( 55)     
( 56) wall, wall, wall, wall, door, door, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
23 c, 23 c, 25 c, 25 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
32 c, 40 c, 05 c, 06 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
24 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 029
( Octo room 25)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, door, door, wall, (  7)     
(  8) wall, wall, wall, wall, wall, flor, flor, wall, ( 15)     
( 16) door, flor, flor, wall, wall, flor, flor, wall, ( 23)     
( 24) door, flor, flor, wall, wall, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, wall, wall, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
24 c, 24 c, 26 c, 26 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
60 c, 61 c, 31 c, 39 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
25 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 030
( Octo room 26)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, wall, wall, wall, wall, wall, wall, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, wall, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, wall, wall, flor, flor, door, ( 39)     
( 40) wall, flor, disk, wall, wall, wall, wall, wall, ( 47)     
(  8) wall, wall, wall, wall, wall, wall, wall, wall, ( 15)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
25 c, 25 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
16 c, 24 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
26 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 031
( Octo room 27)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, wall, flor, flor, flor, flor, door, ( 23)     
( 24) door, flor, wall, flor, flor, wall, flor, wall, ( 31)     
( 32) door, flor, wall, flor, flor, wall, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, wall, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
01 c, 28 c, 28 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
40 c, 15 c, 23 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
27 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 032
( Octo room 28)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, door, ( 15)     
( 16) wall, flor, wall, wall, wall, flor, flor, door, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, flor, wall, wall, wall, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
27 c, 27 c, 29 c, 29 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
24 c, 32 c, 23 c, 31 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
28 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 033
( Octo room 29)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, wall, flor, flor, flor, flor, door, ( 23)     
( 24) wall, flor, wall, flor, flor, wall, flor, door, ( 31)     
( 32) door, flor, wall, flor, flor, wall, flor, wall, ( 39)     
( 40) door, flor, flor, flor, flor, wall, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
28 c, 28 c, 30 c, 30 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
32 c, 40 c, 23 c, 31 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
29 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 034
( Octo room 30)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, disk, wall, wall, wall, flor, door, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, disk, wall, wall, wall, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
29 c, 29 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
32 c, 40 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
30 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 035
( Octo room 31)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) door, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) door, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, wall, flor, flor, wall, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
32 c, 32 c, 32 c, 01 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
31 c, 39 c, 47 c, 24 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
31 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 036
( Octo room 32)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, wall, flor, flor, wall, flor, wall, ( 15)     
( 16) door, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, door, ( 47)     
( 48) wall, flor, wall, flor, flor, wall, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
33 c, 33 c, 31 c, 33 c, 31 c, 31 c, 00 c, 00 c,  ( room#)       
23 c, 31 c, 08 c, 39 c, 16 c, 24 c, 00 c, 00 c,  ( sq#) dp !    
32 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 037
( Octo room 33)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, wall, flor, flor, wall, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, door, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) door, flor, wall, flor, flor, wall, flor, wall, ( 47)     
( 48) wall, flor, wall, flor, flor, wall, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
32 c, 34 c, 32 c, 34 c, 32 c, 34 c, 00 c, 00 c,  ( room#)       
16 c, 15 c, 24 c, 23 c, 32 c, 31 c, 00 c, 00 c,  ( sq#) dp !    
33 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 038
( Octo room 34)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, wall, flor, flor, wall, flor, door, ( 15)     
( 16) wall, flor, wall, flor, flor, wall, flor, door, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, wall, flor, flor, wall, flor, wall, ( 47)     
( 48) wall, flor, wall, flor, flor, wall, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
33 c, 33 c, 35 c, 33 c, 35 c, 35 c, 00 c, 00 c,  ( room#)       
24 c, 32 c, 23 c, 40 c, 31 c, 39 c, 00 c, 00 c,  ( sq#) dp !    
34 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 039
( Octo room 35)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, wall, flor, flor, wall, flor, wall, ( 15)     
( 16) wall, flor, wall, flor, flor, wall, flor, door, ( 23)     
( 24) wall, disk, flor, flor, flor, flor, flor, door, ( 31)     
( 32) wall, flor, wall, flor, flor, wall, flor, door, ( 39)     
( 40) wall, flor, wall, flor, flor, wall, flor, wall, ( 47)     
( 48) wall, flor, wall, flor, flor, wall, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
34 c, 34 c, 34 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
24 c, 32 c, 40 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
35 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 040
( Octo room 36)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, door, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, door, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
37 c, 37 c, 01 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 59 c, 01 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
36 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 041
( Octo room 37)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, door, door, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, door, door, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
38 c, 38 c, 36 c, 36 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
60 c, 61 c, 02 c, 03 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
37 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 042
( Octo room 38)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, door, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, door, door, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
39 c, 39 c, 37 c, 37 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 59 c, 04 c, 05 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
38 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 043
( Octo room 39)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, door, door, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, door, door, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
40 c, 40 c, 38 c, 38 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
60 c, 61 c, 02 c, 03 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
39 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 044
( Octo room 40)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, door, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, door, door, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
41 c, 41 c, 39 c, 39 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
58 c, 59 c, 04 c, 05 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
40 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 045
( Octo room 41)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, disk, wall, ( 55)     
( 56) wall, wall, door, door, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
40 c, 40 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
02 c, 03 c, 00 c, 00 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
41 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 046
( Octo room 42)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, wall, wall, door, door, wall, (  7)     
(  8) wall, flor, flor, wall, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, wall, flor, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, wall, wall, wall, wall, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, door, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
43 c, 43 c, 43 c, 43 c, 01 c, 00 c, 00 c, 00 c,  ( room#)       
57 c, 58 c, 61 c, 62 c, 06 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
42 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 047
( Octo room 43)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, wall, wall, door, door, wall, (  7)     
(  8) wall, flor, flor, flor, wall, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, wall, flor, flor, wall, ( 23)     
( 24) wall, wall, wall, wall, wall, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, door, door, wall, wall, door, door, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
44 c, 44 c, 44 c, 44 c, 42 c, 42 c, 42 c, 42 c,  ( room#)       
57 c, 58 c, 61 c, 62 c, 01 c, 02 c, 05 c, 06 c,  ( sq#) dp !    
43 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 048
( Octo room 44)                                    ( 102084 dws)
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, flor, flor, flor, disk, flor, flor, wall, ( 23)     
( 24) wall, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, door, door, wall, wall, door, door, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
43 c, 43 c, 43 c, 43 c, 00 c, 00 c, 00 c, 00 c,  ( room#)       
01 c, 02 c, 05 c, 06 c, 00 c, 00 c, 00 c, 00 c,  ( sq#) dp !    
44 ( room#) Doom.file ( file#) Save-room                        
                                                                
════════════════════════════════════════════════════════════════   SCREEN 050
( Assign Boomtown)                                ( 102184 dws) 
 doom.file remove                                               
" macforth3:Boomtown"  Doom.file assign ?file.error  ." 3"      
 room.size@ doom.file set.rec.len                               
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 051
( Boomtown room 1 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, door, door, wall, wall, wall, (  7)     
(  8) wall, flor, bomb, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, bomb, disk, bomb, flor, flor, flor, wall, ( 23)     
( 24) door, flor, bomb, flor, flor, flor, flor, door, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, door, door, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
08 c, 08 c, 06 c, 02 c, 06 c, 02 c, 04 c, 04 c,  ( room#)       
57 c, 58 c, 31 c, 40 c, 39 c, 48 c, 03 c, 04 c,  ( sq#) dp !    
1 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 052
( Boomtown room 2 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, bomb, flor, door, ( 15)     
( 16) wall, flor, flor, flor, bomb, disk, bomb, door, ( 23)     
( 24) wall, flor, flor, flor, flor, bomb, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, wall, ( 39)     
( 40) door, flor, flor, flor, flor, flor, flor, wall, ( 47)     
( 48) door, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, wall, door, door, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
09 c, 09 c, 03 c, 03 c, 01 c, 01 c, 05 c, 05 c,  ( room#)       
59 c, 60 c, 40 c, 48 c, 31 c, 39 c, 02 c, 03 c,  ( sq#) dp !    
2 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 053
( Boomtown room 3 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, wall, wall, door, door, wall, (  7)     
(  8) wall, flor, flor, flor, flor, bomb, flor, door, ( 15)     
( 16) wall, flor, flor, flor, bomb, disk, bomb, door, ( 23)     
( 24) wall, flor, flor, flor, flor, bomb, flor, wall, ( 31)     
( 32) wall, flor, bomb, flor, flor, flor, flor, wall, ( 39)     
( 40) door, bomb, disk, bomb, flor, flor, flor, wall, ( 47)     
( 48) door, flor, bomb, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, door, door, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
07 c, 07 c, 07 c, 07 c, 02 c, 02 c, 06 c, 06 c,  ( room#)       
59 c, 60 c, 32 c, 40 c, 15 c, 23 c, 01 c, 02 c,  ( sq#) dp !    
3 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 054
( Boomtown room 4 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, door, door, wall, wall, wall, (  7)     
(  8) wall, flor, bomb, flor, flor, flor, flor, wall, ( 15)     
( 16) wall, bomb, disk, bomb, flor, flor, flor, wall, ( 23)     
( 24) door, flor, bomb, flor, flor, flor, flor, door, ( 31)     
( 32) door, flor, bomb, flor, flor, flor, flor, door, ( 39)     
( 40) wall, bomb, disk, bomb, flor, flor, flor, wall, ( 47)     
( 48) wall, flor, bomb, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, door, door, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
01 c, 01 c, 09 c, 05 c, 09 c, 05 c, 07 c, 07 c,  ( room#)       
59 c, 60 c, 15 c, 16 c, 23 c, 24 c, 02 c, 03 c,  ( sq#) dp !    
4 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 055
( Boomtown room 5 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, door, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, bomb, disk, bomb, wall, ( 15)     
( 16) door, flor, flor, flor, flor, bomb, flor, wall, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, flor, bomb, flor, flor, flor, flor, door, ( 47)     
( 48) wall, bomb, disk, bomb, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, wall, door, door, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
02 c, 02 c, 04 c, 04 c, 06 c, 06 c, 08 c, 08 c,  ( room#)       
61 c, 62 c, 31 c, 39 c, 24 c, 32 c, 01 c, 02 c,  ( sq#) dp !    
5 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 056
( Boomtown room 6 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, wall, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, bomb, disk, wall, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, bomb, wall, ( 23)     
( 24) door, flor, flor, flor, flor, flor, flor, door, ( 31)     
( 32) door, flor, flor, flor, flor, flor, flor, door, ( 39)     
( 40) wall, flor, flor, flor, flor, flor, bomb, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, bomb, disk, wall, ( 55)     
( 56) wall, door, door, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
03 c, 03 c, 05 c, 01 c, 05 c, 01 c, 09 c, 09 c,  ( room#)       
57 c, 58 c, 39 c, 24 c, 47 c, 32 c, 03 c, 04 c,  ( sq#) dp !    
6 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 057
( Boomtown room 7 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, door, door, wall, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, door, ( 15)     
( 16) wall, flor, flor, flor, flor, flor, flor, door, ( 23)     
( 24) wall, flor, flor, flor, bomb, flor, flor, wall, ( 31)     
( 32) door, flor, flor, bomb, disk, bomb, flor, wall, ( 39)     
( 40) door, flor, flor, flor, bomb, flor, flor, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, door, door, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
04 c, 04 c, 08 c, 08 c, 03 c, 03 c, 03 c, 03 c,  ( room#)       
59 c, 60 c, 08 c, 16 c, 15 c, 23 c, 05 c, 06 c,  ( sq#) dp !    
7 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 058
( Boomtown room 8 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, door, door, wall, wall, wall, wall, wall, (  7)     
(  8) door, flor, bomb, flor, flor, flor, flor, door, ( 15)     
( 16) door, bomb, disk, bomb, flor, flor, flor, door, ( 23)     
( 24) wall, flor, bomb, flor, flor, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, flor, flor, bomb, flor, wall, ( 39)     
( 40) wall, flor, flor, flor, bomb, disk, bomb, wall, ( 47)     
( 48) wall, flor, flor, flor, flor, bomb, flor, wall, ( 55)     
( 56) wall, door, door, wall, wall, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
05 c, 05 c, 07 c, 09 c, 07 c, 09 c, 01 c, 01 c,  ( room#)       
60 c, 61 c, 15 c, 40 c, 23 c, 48 c, 03 c, 04 c,  ( sq#) dp !    
8 ( room#) Doom.file ( file#) Save-room                         
                                                                
════════════════════════════════════════════════════════════════   SCREEN 059
( Boomtown room 9 )                               ( 102184 dws) 
here Room.data( dp !                                            
     ( 0      1     2    3     4     5     6     7   )          
(  0) wall, wall, wall, door, door, wall, wall, wall, (  7)     
(  8) wall, flor, flor, flor, flor, flor, flor, door, ( 15)     
( 16) wall, flor, flor, bomb, flor, flor, flor, door, ( 23)     
( 24) wall, flor, bomb, disk, bomb, flor, flor, wall, ( 31)     
( 32) wall, flor, flor, bomb, disk, bomb, flor, wall, ( 39)     
( 40) door, flor, flor, flor, bomb, flor, flor, wall, ( 47)     
( 48) door, flor, flor, flor, flor, flor, flor, wall, ( 55)     
( 56) wall, wall, wall, door, door, wall, wall, wall, ( 63)     
     ( 56    57    58    59    60    61    62    63)            
06 c, 06 c, 04 c, 04 c, 08 c, 08 c, 02 c, 02 c,  ( room#)       
57 c, 58 c, 24 c, 32 c, 15 c, 23 c, 01 c, 02 c,  ( sq#) dp !    
9 ( room#) Doom.file ( file#) Save-room                         
                                                                
