`timescale 1ns / 1ps

module tb();
    parameter C_LENGTH = 3;

    reg ipulse;
    reg [C_LENGTH - 1:0] ichallenge;
    wire oresponse;
    
    arbiter_puf #(
        .C_DFF_TYPE("PRIMITIVE"),
        .C_LENGTH(C_LENGTH)
        ) inst_arbiter_puf(
        .ipulse(ipulse),
        .ichallenge(ichallenge),
        .oresponse(oresponse)
    );
    
    integer i;

    always #5 ipulse = ~ipulse;
    
    initial begin
        ipulse = 0;
        ichallenge = {C_LENGTH{1'b1}};
        
        #10;
        
        for (i = 0; i < C_LENGTH * C_LENGTH; i = i + 1) begin
            @(posedge ipulse);
            ichallenge = ichallenge + 1;
        end
        
        #10;
        
        $stop;
    end

endmodule
