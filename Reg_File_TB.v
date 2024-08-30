module Reg_File_TB();

reg          WrEn_TB, RdEn_TB;
reg          CLK_TB, RST_TB;
reg  [7:0]   Address_TB;
reg  [15:0]  WrData_TB; 
wire [15:0]  RdData_TB;

Reg_File DUT (
.WrEn(WrEn_TB),
.RdEn(RdEn_TB),
.CLK(CLK_TB),
.RST(RST_TB),
.Address(Address_TB),
.WrData(WrData_TB),
.RdData(RdData_TB)
);

always #5 CLK_TB = ~CLK_TB;

initial begin
	CLK_TB = 0;
	RST_TB = 1;
	WrEn_TB = 0;
	RdEn_TB = 0;
	Address_TB = 0;
	WrData_TB = 0;

	#10

	WrEn_TB = 1;
	RdEn_TB = 0;
	Address_TB = 5;
	WrData_TB = 16'b1111111111111111;

	#10

	Address_TB = 0;
	WrData_TB = 16'b1110001110001010;

	#10

	Address_TB = 1;
	WrData_TB = 16'b0000000011111111;

	#10

	Address_TB = 2;
	WrData_TB = 16'b1111111100000000;

	#10

	Address_TB = 3;
	WrData_TB = 16'b1010101010101010;

	#10

	Address_TB = 4;
	WrData_TB = 16'b1111100000111110;

	#10

	Address_TB = 6;
	WrData_TB = 16'b0000111100001111;

	#10

	Address_TB = 7;
	WrData_TB = 16'b1100110011001100;

	#10

	WrEn_TB = 0;
	RdEn_TB = 1;
	Address_TB = 5;

	#10

	if (RdData_TB == 16'b1111111111111111) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);	
	end

	Address_TB = 0;

	#10

	if (RdData_TB == 16'b1110001110001010) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);	
	end

	Address_TB = 1;

	#10

	if (RdData_TB == 16'b0000000011111111) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);	
	end

	Address_TB = 2;

	#10

	if (RdData_TB == 16'b1111111100000000) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);
	end

	Address_TB = 3;

	#10

	if (RdData_TB == 16'b1010101010101010) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);	
	end

	Address_TB = 4;

	#10

	if (RdData_TB == 16'b1111100000111110) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);
	end

	Address_TB = 6;

	#10

	if (RdData_TB == 16'b0000111100001111) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);	
	end

	Address_TB = 7;

	#10

	if (RdData_TB == 16'b1100110011001100) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);
	end

	RST_TB = 0;

	#1

	RST_TB = 1;
	Address_TB = 0;

	#10

	if (RdData_TB == 0) begin
		$display("Successfull Reset");
	end
	else begin
		$display("Failed Reset");
	end

	Address_TB = 5;

	#10

	if (RdData_TB == 0) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);
	end

	Address_TB = 0;

	#10

	if (RdData_TB == 0) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);
	end
	
	WrEn_TB = 1;
	RdEn_TB = 0;
	Address_TB = 5;	

	#10

	WrEn_TB = 0;
	RdEn_TB = 1;

	#10

	if (RdData_TB == 16'b1100110011001100) begin
		$display("Successfull read then write in Address: 0x%0h",Address_TB);
	end
	else begin
		$display("Failed read then write in Address: 0x%0h",Address_TB);
	end

	#50
	$finish;
end

endmodule