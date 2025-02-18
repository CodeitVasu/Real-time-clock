// top level module for a real time clock

module time_counter (input clk_125MHz,rst,start,stop, output reg [1:0] min_counter,output reg clk_1Hz,done,output reg [7:0] count,output reg [26:0] counter);

//  reg [7:0] count;
//  reg [26:0] counter;
   
    always @(posedge clk_125MHz) begin
   
    if (start && !stop) begin
        if (rst) begin
            // Reset the counter and output clock
            counter <= 0;
            clk_1Hz <= 0;
            min_counter <= 2'd0;
            done <= 0;
            
        end else begin
            // Increment the counter
            if (counter == 27'd6250) begin
                // Toggle the 1 Hz clock and reset the counter
                clk_1Hz <= ~clk_1Hz;
                //flag = 1'b1;
                counter <= 0;
            end else begin
                counter <= counter + 1;
                
            end
        end
      end
    
    end
 
    always @(negedge clk_1Hz) begin
    
        if (rst) begin
            count <= 0;
            done <= 0;
        end else begin
            
            if (count == 8'b10110100) begin
                count <= 0;
            end else begin
                
                count <= count + 1;
            end
        end
    end
    
    
    always @(negedge clk_1Hz) begin
    
        if(count == 8'd180) begin
        
           // min_counter <= 0;
            done <= 1'b1;
        
        end else if (count == 8'd59 || count == 8'd119 || count == 8'd179) begin
        
            min_counter <= min_counter + 1;
        end
    
    end
    
    
   
  
endmodule    
