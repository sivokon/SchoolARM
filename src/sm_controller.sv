module sm_controller
(	
	input  logic         clk, 
	input  logic         reset,
    input  logic [31:12] Instr, 
    input  logic [3:0]   ALUFlags, 
    output logic [1:0]   RegSrc, 
    output logic         RegWrite, 
    output logic [1:0]   ImmSrc, 
    output logic         ALUSrc, 
    output logic [1:0]   ALUControl, 
    output logic         MemWrite, 
	output logic         MemtoReg,
    output logic         PCSrc,
	output logic         WD3Src,
	output logic         SrcASrc
); 
        
    logic [1:0] FlagW; 
    logic PCS, RegW, MemW;
    
    decoder decoder(Instr[27:26], Instr[25:20], Instr[15:12], 
        FlagW, PCS, RegW, MemW, 
        MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, WD3Src, SrcASrc);
        
    condlogic cl(clk, reset, Instr[31:28], ALUFlags,
        FlagW, PCS, RegW, MemW,
        PCSrc, RegWrite, MemWrite); 
        
endmodule