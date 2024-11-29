════════════════════════════════════════   SCREEN 009
( CHAR.COPY)                            
                                        
: CHAR.COPY  ( BANK# CHARBASE# --)      
 ( SEE P134 MEM MAP)                    
 56334 C@  254 AND 56334 C!             
 1 C@  251 AND 1 C!                     
 2DUP                                   
 2048 * ( CHARBASE)                     
 SWAP 16384 * + ( BOTTOM OF SET)        
 256 0 DO  ( CHARACTERS)                
  8 0 DO ( BYTES/CHAR)                  
    DUP                                 
    J 8 * I + ( BYTE INDEX)             
    DUP >R                              
    53248 + C@    (  ROM CHARSET)       
    SWAP R> + C!  ( RAM CHARSET)        
  LOOP                                  
 LOOP DROP                              
 1 C@ 4 OR 1 C!                         
 56334 C@ 1 OR 56334 C!                 
 CHARBASE BANK ;                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 010
( CHAR.COPY)                            
                                        
: CHAR.COPY  ( BANK# CHARBASE# --)      
 ( SEE P134 MEM MAP)                    
 56334 C@  254 AND 56334 C!             
 1 C@  251 AND 1 C!                     
 2DUP                                   
 2048 * ( CHARBASE)                     
 SWAP 16384 * + ( BOTTOM OF SET)        
 256 0 DO  ( CHARACTERS)                
  8 0 DO ( BYTES/CHAR)                  
    DUP                                 
    J 8 * I + ( BYTE INDEX)             
    DUP >R                              
    53248 + C@    (  ROM CHARSET)       
    SWAP R> + C!  ( RAM CHARSET)        
  LOOP                                  
 LOOP DROP                              
 1 C@ 4 OR 1 C!                         
 56334 C@ 1 OR 56334 C!                 
 DROP DROP  ;                           
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 029
( S.SQUARE.XY OBJ.PUT)                  
: S.SQUARE.XY ( SQ# ---X/Y)             
  DUP 8 MOD 24 * 7 + 24 + ( X)          
  SWAP 8 / 16 * 40 + 50 + ( Y) ;        
 ( SEE P 140 C64 PROG REF)              
                                        
: ROOM.PUT ( OBJ# SQ# ---)              
  ROOM.DATA( + C! ;                     
                                        
: OBJ.PUT ( ---)                        
  50 S.SQUARE.XY S1 S-POSITION          
  ON S-ENABLE  ( BRICK)                 
  29 S.SQUARE.XY S2 S-POSITION          
  ON S-ENABLE ( BRICK)                  
  34 S.SQUARE.XY S6 S-POSITION          
  ON S-ENABLE   1 22 ROOM.PUT           
  22 S.SQUARE.XY S5 S-POSITION          
  ON S-ENABLE ( COFFEE)                 
  1 34 ROOM.PUT                         
  34 S.SQUARE.XY S8 S-POSITION          
  ON S-ENABLE                           
  1 12 ROOM.PUT                         
  12 S.SQUARE.XY S7 S-POSITION          
  ON S-ENABLE ;                         
════════════════════════════════════════   SCREEN 035
 ( SLIDE)                               
                                        
                                        
 : SLIDE ( X/YDELTAS---)                
   8 0 DO 2DUP                          
                                        
   ROBOT.Y @ + DUP ROBOT.Y !            
   SWAP ROBOT.X @ + DUP ROBOT.X !       
   SWAP                                 
   CW.POSITION                          
    MOVE.SOUND 1 WAIT                   
   LOOP DROP DROP ;                     
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
════════════════════════════════════════   SCREEN 036
 ( CW.SLIDE)                            
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
 : CW.SLIDE ( ---)                      
   ROBOT.ORIENTATION @                  
   CASE N OF 0 -2 SLIDE ;;              
        NE OF 3 -2 SLIDE ;;             
        E OF 3 0 SLIDE ;;               
        SE OF 3 2 SLIDE ;;              
        S OF 0 2 SLIDE ;;               
        SW OF -3 2 SLIDE ;;             
        W OF -3 0 SLIDE ;;              
        NW OF -3 -2 SLIDE ;;            
   ENDCASE                              
   ;                                    
════════════════════════════════════════   SCREEN 081
 ( COFFEE OBJ)                          
 4 BASE !                               
                                        
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
 1111 1111 1110 DECIMAL                 
                                        
 OBJ.STUFF                              
                                        
 CREATE PIE$ OBJ$,                      
════════════════════════════════════════   SCREEN 100
( SPRITES -- HEAD0)                     
4 BASE !                                
S-DEF HEAD0                             
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
════════════════════════════════════════   SCREEN 101
( SPRITES -- HEAD1)                     
4 BASE !                                
S-DEF HEAD1                             
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
════════════════════════════════════════   SCREEN 102
( SPRITES -- HEAD2)                     
4 BASE !                                
S-DEF HEAD2                             
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
════════════════════════════════════════   SCREEN 103
( SPRITES -- HEAD3)                     
4 BASE !                                
S-DEF HEAD3                             
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
════════════════════════════════════════   SCREEN 104
( SPRITES -- HEAD4)                     
4 BASE !                                
S-DEF HEAD4                             
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
════════════════════════════════════════   SCREEN 105
( SPRITES -- HEAD5)                     
4 BASE !                                
S-DEF HEAD5                             
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
════════════════════════════════════════   SCREEN 106
( SPRITES -- HEAD6)                     
4 BASE !                                
S-DEF HEAD6                             
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
════════════════════════════════════════   SCREEN 107
( SPRITES -- HEAD7)                     
4 BASE !                                
S-DEF HEAD7                             
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
════════════════════════════════════════   SCREEN 108
( SPRITES -- FEET0)                     
4 BASE !                                
S-DEF FEET0                             
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
════════════════════════════════════════   SCREEN 109
( SPRITES -- FEET1)                     
4 BASE !                                
S-DEF FEET1                             
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
════════════════════════════════════════   SCREEN 110
( SPRITES -- FEET2)                     
4 BASE !                                
S-DEF FEET2                             
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
════════════════════════════════════════   SCREEN 111
( SPRITES -- FEET3)                     
4 BASE !                                
S-DEF FEET3                             
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
════════════════════════════════════════   SCREEN 112
( SPRITES -- FEET4)                     
4 BASE !                                
S-DEF FEET4                             
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
════════════════════════════════════════   SCREEN 113
( SPRITES -- FEET5)                     
4 BASE !                                
S-DEF FEET5                             
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
════════════════════════════════════════   SCREEN 114
( SPRITES -- FEET6)                     
4 BASE !                                
S-DEF FEET6                             
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
════════════════════════════════════════   SCREEN 115
( SPRITES -- FEET7)                     
4 BASE !                                
S-DEF FEET7                             
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
════════════════════════════════════════   SCREEN 116
( PIE.S)                                
4 BASE !                                
S-DEF PIE.S                             
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
════════════════════════════════════════   SCREEN 117
( COFFEE.S)                             
4 BASE !                                
S-DEF COFFEE.S                          
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
════════════════════════════════════════   SCREEN 118
( BRICK.S)                              
4 BASE !                                
S-DEF BRICK.S                           
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
════════════════════════════════════════   SCREEN 119
( COFFEE2.S)                            
4 BASE !                                
S-DEF COFFEE2.S                         
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