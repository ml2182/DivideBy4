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
IntegratedDesign uut (
            .clk(clk),
            .reset(reset),
            .signal_in(signal_in),
            .signal_out(signal_out));
initial begin
    clk = 0;
    reset = 1;
    signal_in = 0;
    repeat (2) @(posedge clk);
    reset = 0;
    @(posedge clk);  
    // Count up
    check_count(2'b01, "count up 0->1");
    check_count(2'b10, "count up 1->2");
    check_count(2'b11, "count up 2->3");
    check_count(2'b00, "count up 3->0");

    // Count down
    signal_in = 1;
    check_count(2'b11, "count down 0->3");
    check_count(2'b10, "count down 3->2");
    check_count(2'b01, "count down 2->1");
    check_count(2'b00, "count down 1->0");

    $display("Test completed");
    $finish;
end
task check_count(input[1:0] expected, input string msg); 
    begin
    @(posedge clk);   // wait for current edge 
    if (signal_out === expected) 
        $display("PASS: %s at %0t, value=%b", msg, $time, signal_out);
    else
        $display("FAIL: %s at %0t, expected=%b got=%b",msg, $time, expected, signal_out);
    end

endtask
always begin
    #10 clk = ~clk; // 50MHz clock
end

                      
endmodule
