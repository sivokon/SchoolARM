
module sm_matrix
(
    input             clk,
    input             rst_p,
    input      [31:0] dataMemory_address,
    input             dataMemory_writeEnable,
    input      [31:0] dataMemory_writeData,
    output     [31:0] dataMemory_readData,
	output     [31:0] numberHex
);

    logic [ 1:0] deviceSelect;
    logic [31:0] memoryRead;
    logic [31:0] hexMemoryRead;

	// RAM   0b0000000000 - 0b1111111111
    assign deviceSelect[0] = ( dataMemory_address [ 11:10 ] == 2'b00);
    // HEX MEMORY   0b010000000000 - 0b010000001111
    assign deviceSelect[1] = ( dataMemory_address [ 11:4  ] == 8'b01000000);

	mux2 #(32) mux(memoryRead, hexMemoryRead, deviceSelect[1], dataMemory_readData);

    logic memoryWriteEnable;	
	logic hexMemoryWriteEnable;
	assign memoryWriteEnable    = dataMemory_writeEnable & deviceSelect[0];
	assign hexMemoryWriteEnable = dataMemory_writeEnable & deviceSelect[1];

    data_memory data_memory
    (
        .clk             ( clk                        ),
        .write_enable    ( memoryWriteEnable          ),
        .adress          ( dataMemory_address         ),
        .write_data      ( dataMemory_writeData       ),
        .read_data       ( memoryRead                 )
    );

	sm_output_to_hex_display output_to_hex_display
	(
		.clk     ( clk                     ),
		.rst_p   ( rst_p                   ),
        .a       ( dataMemory_address      ),
        .we      ( hexMemoryWriteEnable    ),
        .wd      ( dataMemory_writeData    ),
		.rd      ( hexMemoryRead           ),
		.number  ( numberHex               )
	);

endmodule






