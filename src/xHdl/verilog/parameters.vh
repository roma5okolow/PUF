`ifndef parameters 
`define parameters

    parameter C_LENGTH = 3; // the length of the chain of multiplexers 

    parameter C_DFF_TYPE = //"GENERIC"; // how to generate dff; using always@()
                           "PRIMITIVE";                    //using primitive template
`endif