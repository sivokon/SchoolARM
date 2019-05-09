
module sm_output_to_hex_display
#(
    parameter digitCount = 6
)
(
    input  logic        clk,
	input  logic        rst_p,
    input  logic [31:0] a,
    input  logic        we,
    input  logic [31:0] wd,
	output logic [31:0] rd,
	output logic [31:0] number
);	

	logic [31:0] numberLocal;
	logic [ 6:0] numbers [digitCount - 1:0];
	
	assign number = numberLocal;
	assign rd = numberLocal;

    always_ff @(posedge clk or posedge rst_p)
		if (rst_p)
			numberLocal <= 32'b0;
        else 
			if (we)
				numberLocal <= wd;
			
endmodule
