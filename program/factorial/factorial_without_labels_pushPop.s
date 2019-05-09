		    add		r10, r10, #0     
		    add		sp, sp, #100
    	    add		r1, r10, #4      
		    bl		#0    
		    b		#80            
		    
            push    { r1, lr }      
		    add		r2, r10, #2       
		    subs	r3, r1, r2       
		    bpl		#4           
		    
		    add		r0, r10, #1    
		    mov		pc, lr        
            add		r1, r1, #-1   
		    bl		#-36        
		    
		    pop     { r1 }  
		    add		r2, r1, #0    
		    add		r3, r0, #0    
		    bl		#4        
		    
		    pop     { lr }    
		    mov		pc, lr        
		    
            add 	r0, r10, #0   
            subs	r12, r10, r3       
		    bpl		#8            
		    add		r0, r0, r2        
		    add		r3, r3, #-1       
		    b		#-24            
           	mov		pc, lr            
		
   
