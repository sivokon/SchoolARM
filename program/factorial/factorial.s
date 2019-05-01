		    add		r10, r10, #0     
		    add		sp, sp, #100
    	    add		r1, r10, #4      
		    bl		factorial    
		    b		end            
		    
factorial   add     sp, sp, #-8       
		    str		r1, [sp, #4]      
		    str		lr, [sp, #0]      
		    add		r2, r10, #2       
		    subs	r3, r1, r2       
		    bpl		continue           
		    
		    add		r0, r10, #1   
		    add		sp, sp, #8    
		    mov		pc, lr        
continue    add		r1, r1, #-1   
		    bl		factorial        
		    
		    ldr		r1, [sp, #4]  
		    add		r2, r1, #0    
		    add		r3, r0, #0    
		    bl		multiply        
		    
		    ldr		lr, [sp, #0]  
		    add		sp, sp, #8    
		    mov		pc, lr        
		    
multiply    add 	r0, r10, #0   
cycle       subs	r12, r10, r3       
		    bpl		finish            
		    add		r0, r0, r2        
		    add		r3, r3, #-1       
		    b		cycle            
finish     	mov		pc, lr            
		
end
