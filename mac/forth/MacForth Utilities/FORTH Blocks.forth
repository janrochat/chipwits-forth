════════════════════════════════════════════════════════════════   SCREEN 000
( MacFORTH Version 2.1 )                          ( 021485 DFC) 
                                                                
This file contains the standard utilities for MacFORTH Level 2.1
                                                                
The following utilities are included in source form:            
  Memory Dump Utility:                                          
     DUMP and +DUMP            -- Load block  8                 
                                                                
  Multiple Block Copying and clearing:                          
     COPY.BLOCKS CLEAR.BLOCKS  -- Load block 10                 
                                                                
  Block Transfer Between Files:                                 
     XFER.BLOCKS               -- Load block 12                 
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 001
( FORTH Blocks Load Block )                       ( 040885 dws) 
  ( display the apple and options menu )                        
  FORTH DEFINITIONS   SET.FENCE                                 
 8000 MINIMUM.VOCAB   18192 MINIMUM.OBJECT ." ABCWork1" cr      
 ( APPLE.MENU)    OPTIONS.MENU    SYS.WINDOW WINDOW             
   ." Bending System..."                                        
  4 load ." Fix functs" cr                                      
   FIND EDIT.WINDOW         ( if editor has been snapshot, )    
   IFTRUE       3 LOAD      ( Just reconfigure Editor    )      
   OTHERWISE    INCLUDE" EDITOR BLOCKS"    IFEND                
   2 load ( Custom)                                             
INIT.CURSOR                                                     
set.fence                                                       
here 1+ ," dws" initials 3 cmove -4 allot                       
   ABORT ( go back to ok -- )                                   
                                                                
════════════════════════════════════════════════════════════════   SCREEN 002
( Custom routines)                                ( 091785 dws) 
: ub use" Utility Blocks" ;                                     
: is constant ;                                                 
: var variable ;                                                
exit <<<                                                        
8 load  ." Dump" cr                                             
: recall include" dramforth2:recall blocks" ;                   
: FB use" forth blocks" ;                                       
: dd use" dramforth2:dramadink" ;                               
: ass " assembler" get.vocab dup non.purgable ' assembler !  ;  
: ass- ' assembler @ purgable  room  ;                          
                                                                
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 003
( Editor Load From Snapshotted System )           ( 010785 DFC) 
                                                                
 FORTH DEFINITIONS                                              
                                                                
 cr  ." Reconfiguring Editor..."                                
                                                                
 2048 MINIMUM.OBJECT                                            
 EDIT.WINDOW ADD.WINDOW  ( add  EDITOR window )                 
                                                                
                                                                
  EDIT.WINDOW  RE.EDIT                                          
   ( Regenerate the edit menus and text edit record)            
                                                                
                                                                
                                                                
                                                                
════════════════════════════════════════════════════════════════   SCREEN 004
( Func repairs)                                   ( 060985 dws) 
                                                                
HEX                                                             
                                                                
: Repair.func ( offset---| fix function bug)                    
  [compile] ' 6+ W@ token>addr + A0 swap c! ;                   
                                                                
DECIMAL                                                         
                                                                
10 repair.func L>FUNC>W                                         
 8 repair.func L>func>L                                         
10 repair.func W>func>L                                         
                                                                
                                                                
                                                                
                                                                
