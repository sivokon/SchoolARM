module board_top
(
	input            ADC_CLK_10,       //    Clock 50 MHz
    input    [ 1:0]  KEY,              //    Pushbutton[1:0]
    input    [ 5:0]  SW,               //    Toggle Switch[5:0]
    output   [ 9:0]  LEDR,
	
	output logic [  7:0 ]    HEX0,
    output logic [  7:0 ]    HEX1,
    output logic [  7:0 ]    HEX2,
    output logic [  7:0 ]    HEX3,
    output logic [  7:0 ]    HEX4,
    output logic [  7:0 ]    HEX5
);
		
    wire          clk;
    wire          clkIn     =  ADC_CLK_10;
    wire          rst_p     =  ~KEY[0];
    wire          clkEnable =  SW [0];
    wire [  3:0 ] clkDevide =  4'b0110;
    wire [  3:0 ] regAddr   =  SW [4:1];
    wire [ 31:0 ] regData;
    
	logic [31:0] numberHex;
	
    sm_top sm_top
	(		
		.clkIn      ( clkIn     ),
        .rst_p      ( rst_p     ),
        .clkDevide  ( clkDevide ),
        .clkEnable  ( clkEnable ),
        .clk        ( clk       ),
        .regAddr    ( regAddr   ),
        .regData    ( regData   ),
		.numberHex  ( numberHex )
	);
	
	assign LEDR[9:0] = regData[9:0];
	
	wire [ 31:0 ] h7segment = numberHex;
	 	 
    assign HEX0 [7] = 1'b1;
    assign HEX1 [7] = 1'b1;
    assign HEX2 [7] = 1'b1;
    assign HEX3 [7] = 1'b1;
    assign HEX4 [7] = 1'b1;
    assign HEX5 [7] = 1'b1;

    sm_hex_display digit_5 ( h7segment [23:20] , HEX5 [6:0] );
    sm_hex_display digit_4 ( h7segment [19:16] , HEX4 [6:0] );
    sm_hex_display digit_3 ( h7segment [15:12] , HEX3 [6:0] );
    sm_hex_display digit_2 ( h7segment [11: 8] , HEX2 [6:0] );
    sm_hex_display digit_1 ( h7segment [ 7: 4] , HEX1 [6:0] );
    sm_hex_display digit_0 ( h7segment [ 3: 0] , HEX0 [6:0] );
	
endmodule