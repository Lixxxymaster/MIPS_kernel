module PWM_generator (PWM_in, PWM_out , clk , rst_n, counter);

input clk, rst_n; 
input [7:0] PWM_in;
input [7:0] counter; 
output  PWM_out; 


reg PWM_out_r;


always @ (posedge clk, negedge rst_n) begin
    if(~rst_n) PWM_out_r <= 0'bz;
    else begin
        if (PWM_in >= counter) PWM_out_r <= 0;
        else PWM_out_r <= 1;
    end
end

counter_8bit counter_8bit_inst(.clk(clk),
                                .rst_n(rst_n),
                                .counter(counter)                       
                                );

assign PWM_out = PWM_out_r;

endmodule

