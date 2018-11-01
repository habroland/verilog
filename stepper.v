// create module
	module stepper (
	input wire clk, // 50MHz input clock
	input wire run, // signal to engage motor
	input wire dir, // direction of motor
	output reg [3:0] motor // motor-driving signal
	);

// create a binary counter
	reg [2:0] cnt; // 3-bit counter

initial begin

cnt <= 3'b000; // start at zero

end

always @(posedge clk) begin
if (run) begin
if (dir) cnt <= cnt + 3'b001; // count up
else cnt <= cnt - 3'b001; // count down
end
end

//assign outputs to drive the motor
always @(cnt) begin
 case(cnt)
  0:motor=4'b1000;
  1:motor=4'b1100;
  2:motor=4'b0100;
  3:motor=4'b0110;
  4:motor=4'b0010;
  5:motor=4'b0011;
  6:motor=4'b0001;
  default:motor=4'b1001;
 endcase
end


endmodule
