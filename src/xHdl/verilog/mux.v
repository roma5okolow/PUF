`timescale 1ns / 1ps

module mux(
    input ia,
    input ib,
    input isel,
    output oout
    );
    assign oout = isel ? ia : ib;
endmodule
