// create module
module DE10Nano (
	input wire clk, // 50MHz input clock
	input wire [3:0] SW, // Slide switches
	input wire [1:0] KEY, // Push buttons
	output wire [7:0] LED, // LEDs ouput
	inout wire [35:0] GPIO_0,
	inout wire [35:0] GPIO_1,
	inout wire [15:0] Arduino_IO,
	output wire Arduino_Reset_n
	);

slowerClock newClock(
		.refclk(clk),   //  refclk.clk
		.outclk_0(myclk) // outclk0.clk
	);
	

stepper stepper1(.clk(myclk), .run(SW[0]), .dir(SW[1]), .motor({GPIO_1[35],GPIO_1[33],GPIO_1[31],GPIO_1[29]}));
stepper stepper2(.clk(myclk), .run(SW[2]), .dir(SW[3]), .motor({GPIO_1[25],GPIO_1[23],GPIO_1[21],GPIO_1[19]}));
	
////Debugging
//// create a binary counter
//	reg [31:0] cnt; // 32-bit counter


//initial begin
//
//cnt <= 32'h00000000; // start at zero
//
//end
//
//always @(posedge clk) begin
//
//cnt <= cnt + 1; // count up
//
//end
//
////assign LED to 25th bit of the counter to blink the LED at a few Hz
//assign LED[0] = cnt[30];
//assign LED[1] = cnt[29];
//assign LED[2] = cnt[28];
//assign LED[3] = cnt[27];
//assign LED[4] = cnt[26];
//assign LED[5] = cnt[25];
//assign LED[6] = cnt[24];
//assign LED[7] = cnt[23];
endmodule