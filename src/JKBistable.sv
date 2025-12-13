`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2025 16:25:47
// Design Name: 
// Module Name: DivideBy4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module JKBistable(
    input logic clk, // clock cycle of 50MHz
    input logic reset,
    input logic J,
    input logic K,
    output logic Q);
    
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 1'b0;
    end else begin 
    unique case({J,K})
    2'b00: Q <= Q;
    2'b01: Q <= 1'b0;
    2'b10: Q <= 1'b1;
    2'b11: Q <= ~Q;
    default: Q <= 1'b0;
    endcase
    end
end

     

endmodule
