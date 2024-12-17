════════════════════════════════════════════════════════════════   SCREEN 001
( Load Labeler)                                                 
                                                                
2 load                                                          
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( Label)                                          ( 102485    ) 
                                                                
: Label ( ---)                                                  
Printer on                                                      
10 0 do do.events drop loop                                     
begin 9 0 do                                                    
  ."    Inga M. Velde"  cr                                      
  ."    121 So. Washington Avenue  #610"   cr                   
  ."    Minneapolis, MN 55401 "  cr   cr                        
  cr cr  mouse.button if leave then loop  page                  
mouse.button until                                              
Printer off ;                                                   
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
( Func repairs)                                   ( 060985 dws) 
                                                                
HEX                                                             
                                                                
: Repair.func ( offset---| fix function bug)                    
  [compile] ' 6+ W@ token>addr + A0 swap c! ;                   
                                                                
DECIMAL                                                         
                                                                
10 repair.func L>FUNC>W                                         
 8 repair.func L>func>L                                         
10 repair.func W>func>L                                         
                                                                
                                                                
                                                                
                                                                
