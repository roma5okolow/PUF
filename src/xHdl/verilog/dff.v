`timescale 1ns / 1ps

module dff #(
    parameter C_DFF_TYPE = "PRIMITIVE"
    )(
    input id,
    input iclk,
    output reg oq
    );
    
    wire odff;
    
    generate
    if (C_DFF_TYPE == "GENERIC") begin: dff_generic
        always @(posedge iclk) begin
            oq <= id;
        end
    end
    endgenerate
    
    generate
    if (C_DFF_TYPE == "PRIMITIVE") begin: dff_primitive
           FDRE #(
              .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
           ) FDRE_inst (
              .Q(odff),      // 1-bit Data output
              .C(iclk),      // 1-bit Clock input
              .CE(1'b1),    // 1-bit Clock enable input
              .R(1'b0),      // 1-bit Synchronous reset input
              .D(id)       // 1-bit Data input
           );
           always@(*)
            oq <= odff;
    end
    endgenerate
endmodule
