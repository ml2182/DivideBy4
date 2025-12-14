`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2025 17:51:40
// Design Name: 
// Module Name: tb_Divide_By_Four
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


module tb_Divide_By_Four;
logic clk;
logic reset;
logic signal_in;
logic [1:0] signal_out;
logic [1:0] temp;
IntegratedDesign uut (
            .clk(clk),
            .reset(reset),
            .signal_in(signal_in),
            .signal_out(signal_out));
initial begin
    clk = 0;
    temp = signal_out;
    signal_in = 0;
    #20 reset = 1;
    #5 reset=0;
    temp = signal_out;
    @(posedge clk);
    #30 // because it is synchronous there is a clock cycle delay
    if (signal_out == 2'b01) begin
        $display ("Correctly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out);
    end else begin
        $display ("Incorrectly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out); 
    end
    temp = signal_out;
    #20
    if (signal_out == 2'b10) begin
        $display ("Correctly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out);
    end else begin
        $display ("Incorrectly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out); 
    end
    temp = signal_out;
    #20
    if (signal_out == 2'b11) begin
        $display ("Correctly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out);
    end else begin
        $display ("Incorrectly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out); 
    end
    temp = signal_out;
    #20
    if (signal_out == 2'b00) begin
        $display ("Correctly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out);
    end else begin
        $display ("Incorrectly Counts Up, Time = %0t, Old = %b, New = %b",$time, temp, signal_out); 
    end
    #10
    
    signal_in = 1;
    #10
    temp = signal_out;
    #20
    if (signal_out == 2'b00) begin
        $display ("Correctly Counts Down, Time = %0t, Old = %b, New = %b",$time, temp, signal_out);
    end else begin
        $display ("Incorrectly Counts Down, Time = %0t, Old = %b, New = %b",$time, temp, signal_out); 
    end
    
end
always begin
    #10 clk = ~clk; // 50MHz clock
end

                      
endmodule
