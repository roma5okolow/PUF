`timescale 1ns / 1ps

module delay_line #(
    parameter C_LENGTH = 3
    )(
    input ipulse,
    input [2 * C_LENGTH - 1 : 0] ichallenge,
    output oout_1,
    output oout_2
);

    (* dont_touch = "yes" *) wire [2 * C_LENGTH + 1 : 0] net;  // shina
    
    assign net[0] = ipulse;
    assign net[1] = ipulse;
    
    generate
    genvar i;
    for (i = 1; i <= C_LENGTH; i = i + 1)
    begin
        mux inst_mux_1(
            .ia(net[i * 2 - 2]),
            .ib(net[i * 2 - 1]),
            .isel(ichallenge[i - 1]),
            .oout(net[i * 2])
        );
        mux inst_mux_2(
            .ia(net[i * 2 - 1]),
            .ib(net[i * 2 - 2]),
            .isel(ichallenge[i - 1]),
            .oout(net[i * 2 + 1])
        );
    end
    endgenerate
    
    assign oout_1 = net[C_LENGTH * 2];
    assign oout_2 = net[C_LENGTH * 2 + 1];
endmodule
