`timescale 1ns / 1ps

// reset only resets the clock after completion of 4 minutes

module clock_Expt(clk,sec,min,done,rst, start, stop);

    input clk;
    input rst, stop, start;
    output reg sec, done = 0;
    output reg [1:0] min = 0;
    
     reg [26:0] count = 0;
     reg [5:0] sec_counter = 0;

        always @(posedge clk)
        begin
        
        if (start & !stop) begin 
          //  if (!rst) begin
            
                if (count==27'd62500000) begin
                
                     sec <= ~sec;
                     count <= 0;
                
                end else begin
                
                     count <= count + 1;  
                
                end
            

            
         end else begin
         
                count <= count;      
                
         end
        
        
        end
        
        
        
        
        always @(posedge sec)
        
            begin
             
            if (!done) begin
            
                if (sec_counter==6'd60) begin
            
            
                    if (min == 2'd3) begin
                    
                        min <= 0;
                        done <= 1;
                        
                        end else begin
            
                           min <= min + 1;
                
                         end
                         
                    sec_counter <= 0;
            
                 end else begin
                
                    sec_counter <= sec_counter + 1;
                
            
                    end      
                end else begin
                
                    if (rst) begin
                     
                     done <= 0;
    
                     count <= count;
                    
                    end else begin
                    
                    count <= count;
                    
                    end
                
                end
             
                
             
            end
   
endmodule
