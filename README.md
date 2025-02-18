# Real-time-clock

-A lab project in verilog during my 8th semester in the course EE560 (Reconfigurable computing) at IIT Mandi.
-The project includes a verilog code which records the time upto 3 minutes along with a start, stop and a reset. 
-The same was implemented on FPGA BASYS-3 board.

 FPGA on-board clock has a frequency of 125 MHz. Using the on board clock, design a real-time clock.
 • The circuit should start its operation only when start=‘1’, else the circuit is OFF.
 • The rereal-timelock should have an output sec, which will be blinking for every second.
 • The real time clock should have an output min, to count the minutes of the real-time clock.
 • The clock should stop after reaching its maximum output (min). The clock can be started again after a
 reset only. A done signal can be used to indicate the timer reached its maximum value. After pressing reset
 rst only, the clock should work again.
 • There should be a stop as input to the real time clock. When stop is pressed clock should stay in the idle
 state. The clock should stop counting the seconds upon stop.
 • The totop modules given below.

 
 module clock_Expt(clk,sec,min,done,rst, start, stop);
 input clk;
 input rst, stop, start;
 output reg sec, done;
 output reg [1:0] min;


 





