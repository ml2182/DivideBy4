## Implementing a synchronous counter using a FSM

I wanted produce a SystemVerilog program to test one of my Tripos exam answer. In this question, I had to use J-K bistables to implement a divide by 4 counter, where it will increment the output when the input is 0 and decrement the output when the input is 1.

## Digital Circuit Design
<img width="295" height="179" alt="image" src="https://github.com/user-attachments/assets/c10640ca-62db-4d47-96d7-a68c18cecfc4" />

## Analysis
I created a counter which responded to the inputs correctly. However, due to the design of the digital circuit, I ran into an error because the input of the B Bistable is the output of the A Bistable. This caused 2 clock cycle delay as it would take 1 clock cycle to update the first Bistable and another to update the second. I figured that you could remove this delay if you change line 57 in the IntegratedDesign.sv to use combinational logic. However, I do not know whether that would lead it to be an asynchronous system. 
<img width="1236" height="161" alt="image" src="https://github.com/user-attachments/assets/3a2afaaf-99a5-4780-bb5e-24872eb1770a" />

## Conclusion
In this I learnt importance of analysing the simulation at a clock cycle level, writing thorough Test Benches to debug the code effectively and the challenges of building syncronous systems.

## Follow up
I want to redo this, with FPGA design in mind. This is because J-K bistables are not used in FPGA design and I want to remove the 2 cycle delay.

## Folder structure
- `src/` — HDL source files
- `scripts/` — TCL automation scripts
