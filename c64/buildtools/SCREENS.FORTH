( LINEWIDTH: 40 )
( ----------- Screen 79/249 ----------- )
( JOYSTICK MENU LOAD SCREEN)            
( START FORTH INTERRUPT)                
( TAKEN FROM 'CW JOY+MENU SCREEN.FORTH')                                        
172 175 THRU ( VARS & SPRITE)           
                                        
 ( G.M.I   CHAR.COPY)( SKIP G.M.I.)                    
                                        
 240 242 THRU ( BOUNCER)                
 178 189 THRU  ( JOYSTICK STUFF)        
                                        
 200 207 THRU  ( MENU STUFF)            
                                        
 250 254 THRU ( MENU TEST)              
                                        
 260 260  THRU     ( FRAME)             
 279 284 THRU ( MACHINE LANG PROGS)     
 FORTH   A-REMOVE                       
 : IT ;                                 
                                      
 ( 319 329 GAME & WORKSHOP SCREENS)     
 ( 310 -311 ARE SCENARIO SAVERS) 
( ----------- Screen 80/250 ----------- )
( CHIPWIT GAME LOADER)                  
( MODIFIED FROM 'CW GAME SCREENS.FORTH')                                        
( FORGET IT : IT ; ) FORTH              
172 182 THRU
255 LOAD
183 195 THRU
246 254 THRU
256 265 THRU
330 338 THRU
266 275 THRU
320 329 THRU
276 290 THRU

196 208 THRU
313 319 THRU
311 312 THRU 
291 307 THRU

209 240 THRU
308 310 THRU
241 245 THRU             
" S0:GAME" DOS SAVE-FORTH "GAME" 