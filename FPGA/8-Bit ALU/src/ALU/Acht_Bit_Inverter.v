`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:55:51 03/01/2013
// Design Name:   ALU
// Module Name:   G:/Dropbox/Hobby/Programme/FPGA/ALU/Acht_Bit_Inverter.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Acht_Bit_Inverter;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg F0;
	reg F1;
	reg F2;
	reg F3;

	// Outputs
	wire [7:0] Q;
	wire Carry;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.Q(Q), 
		.F0(F0), 
		.F1(F1), 
		.F2(F2), 
		.F3(F3), 
		.Carry(Carry)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		F0 = 0;
		F1 = 0;
		F2 = 0;
		F3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

