`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2025 17:15:40
// Design Name: 
// Module Name: Integrated Design
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

module IntegratedDesign(
    input  logic       clk,
    input  logic       reset,
    input  logic       signal_in,   // 0 = up, 1 = down
    output logic [1:0] signal_out
);

    logic J_A, K_A;
    logic J_B, K_B;
   
    logic Q_A = 0;
    logic Q_B = 0;

    JKBistable A (
        .clk   (clk),
        .reset (reset),
        .J     (J_A),
        .K     (K_A),
        .Q     (Q_A)
    );

    JKBistable B (
        .clk   (clk),
        .reset (reset),
        .J     (J_B),
        .K     (K_B),
        .Q     (Q_B)
    );

    always_comb begin
        J_A = 1'b1;
        K_A = 1'b1;
        J_B = Q_A ^ signal_in;
        K_B = Q_A ^ signal_in;
    end
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            signal_out = 2'b00;
        end else begin
        signal_out = {Q_B, Q_A};
        end
    end

endmodule
    