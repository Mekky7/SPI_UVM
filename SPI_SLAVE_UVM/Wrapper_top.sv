import Wrapper_test_pkg::* ;
import uvm_pkg::*;
`include "uvm_macros.svh"

module top();

	bit clk ;
	initial begin
		forever #2 clk=~clk ;
	end

	Wrapper_if  Wrap_if(clk);
	spi_wrapper DUT(Wrap_if.MOSI , Wrap_if.MISO, Wrap_if.SS_n, Wrap_if.clk, Wrap_if.rst_n);

	initial begin
		uvm_config_db#(virtual Wrapper_if)::set(null,"uvm_test_top","Wrapper_IF",Wrap_if);
		run_test("Wrapper_test") ;
	end
	
endmodule 	