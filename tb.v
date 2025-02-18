// Testing the top level module for the real time clock


module time_tb();
    reg clk_125MHz,rst,start,stop;
    wire [7:0] count;
    wire [1:0] min_counter;
    wire [26:0] counter;
    wire clk_1Hz;
    wire done;
    
    time_counter t0(clk_125MHz,rst,start,stop,min_counter,clk_1Hz,done,count,counter);
     begin
        always begin
        #4; // 125 MHz clock period = 8 ns (half period = 4 ns)
        clk_125MHz = ~clk_125MHz;
        
        end
        
    
    initial begin
        // Initialize inputs
        clk_125MHz = 0;
        start = 1;
        rst = 1;
        stop = 0;
        // Apply reset
        #200; // Wait for 20 ns
        
        rst = 0;
        start =1;
        stop = 0;

        // Simulate for a long time to observe the 1 Hz clock
        #20000000; // Simulate for 1 second (1,000,000,000 ns)
        
       

        // End simulation
        $stop;
    end
   end     
        

endmodule
