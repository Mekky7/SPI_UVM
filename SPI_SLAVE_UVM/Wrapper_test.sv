package  Wrapper_test_pkg;

	import Wrapper_env::* ;
	import uvm_pkg::*;
	import Wrapper_config_obj::*;
	import sequences::*;
	
	`include "uvm_macros.svh"

	class Wrapper_test extends uvm_test ;
		`uvm_component_utils (Wrapper_test) ;

		Wrapper_env my_env ;
		virtual Wrapper_if Wrapper_test_vif ;
		Wrapper_config_obj Wrapper_config_obj_test ;
		Wrapper_main_seq main_seq ;
		Wrapper_reset_seq reset_seq;

		function new(string name  = "Wrapper_test", uvm_component parent = null );
			super.new(name,parent); 	
		endfunction

		function void build_phase(uvm_phase phase);
			super.build_phase(phase); 
			Wrapper_config_obj_test = Wrapper_config_obj::type_id::create("Wrapper_config_obj_test",this) ;
			my_env = Wrapper_env::type_id::create("my_env",this) ;
			main_seq = Wrapper_main_seq::type_id::create("main_seq",this) ;
			reset_seq = Wrapper_reset_seq::type_id::create("reset_seq",this) ;
			if(!uvm_config_db#(virtual Wrapper_if) :: get(this, "", "Wrapper_IF",Wrapper_config_obj_test.Wrapper_config_vif))
				`uvm_fatal("run_phase","ERROR in getting virtual interface");

			uvm_config_db#(Wrapper_config_obj)::set(this, "*", "CFG",Wrapper_config_obj_test);	

		endfunction

		task run_phase (uvm_phase phase);
			super.run_phase(phase);
			phase.raise_objection(this);
			`uvm_info ("run_phase","RESET_ASSERTED ",UVM_LOW);
			reset_seq.start(my_env.agt.sqr);
			`uvm_info ("run_phase","RESET_DEASSERTED ",UVM_LOW);
			`uvm_info("run_phase","Started generating stimulus",UVM_LOW);
			main_seq.start(my_env.agt.sqr) ;
			`uvm_info ("run_phase","Stimulus generation ended ",UVM_LOW); 
			phase.drop_objection(this) ;
		endtask
			
	endclass

endpackage 