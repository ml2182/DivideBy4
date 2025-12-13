## Implementing a synchronous counter using a FSM

I wanted produce a SystemVerilog program to test one of my Tripos exam answer. In this question, I had to use J-K bistables to implement a divide by 4 counter, where it will increment the output when the input is 0 and decrement the output when the input is 1.

## Digital Circuit Design

## Conclusion
In this I learnt the challenges of timing errors, as when I used "always_ff @(posedge clk)" in the Integrated Design file it led to a delay of a clock cycle before it would respond to the new input. I ended up using combinational logic to remove this delay. In addition, I learnt the importance of analysing the simulation at a clock cycle level and writing thorough Test Benches to debug the code effectively.

## Follow up
I want to redo this, with FPGA design in mind. As in FPGA, J-K bistables are not used.

## Folder structure
- `src/` — HDL source files
- `scripts/` — TCL automation scripts
