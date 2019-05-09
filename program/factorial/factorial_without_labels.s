		add		r10, r10, #0     
		add		sp, sp, #100
    	add		r1, r10, #4      
		bl		#0      
		b		#96            
		
    	add		sp, sp, #-8       
		str		r1, [sp, #4]      
		str		lr, [sp, #0]      
		add		r2, r10, #2       
		subs	r3, r1, r2       
		bpl		#8              
		
		add		r0, r10, #1   
		add		sp, sp, #8    
		mov		pc, lr        
  		add		r1, r1, #-1   
		bl		#-48         
		
		ldr		r1, [sp, #4]  
		add		r2, r1, #0    
		add		r3, r0, #0    
		bl		#8        
		
		ldr		lr, [sp, #0]  
		add		sp, sp, #8    
		mov		pc, lr        
		
    	add		r0, r10, #0   
    	subs	r12, r10, r3       
		bpl		#8            
		add		r0, r0, r2        
		add		r3, r3, #-1       
		b		#-24            
     	mov		pc, lr            
		
