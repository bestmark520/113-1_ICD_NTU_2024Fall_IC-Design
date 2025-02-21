module stack ( //DO NOT modify interface      
    input         clk,
    input         rst_n,  // 如果是0就重置所有狀態
    input  [7:0]  data_in,
    input  [1:0]  cmd,
    output reg [2:0]  sp,  // full、empty、error，<= 3'd0，目前堆疊到第幾層
    output reg [7:0]  data_out,
    output reg        empty,  // 0或1，<= 1'b1
    output reg        full,  // 0或1，<= 1'b0
    output reg        error  // 0或1，<= 1'b0
);
    
    // 定義 8x8 記憶體模組，因為每個堆疊的元素佔8-bit
    reg [7:0] stack_mem [7:0];  // stack_men[3] = 第四層
    integer i;

    // 用verilog實現的功能最後會被合成成電路
    // Sequential Part
    always @(posedge clk or negedge rst_n) begin  // 這就是一個D型的Flip-Flop
        if (~rst_n) begin    // 檢查如果 rst_n + Not 是1的話
            // Reset Operation
            sp <= 3'd0;    // <=，非阻塞賦值，等到整個 always 區塊執行完畢後，才會將結果更新到左邊的寄存器
            data_out <= 8'd0;
            empty <= 1'b1;
            full <= 1'b0;
            error <= 1'b0;
            for (i = 0; i < 8; i = i + 1) begin
                stack_mem[i] <= 8'd0;  // 清空全部給0
            end
        end
        else begin
            // Normal Operation
            case (cmd)  // case會被合成為多工器MUX和邏輯閘
                2'b00: begin    // command1，No operation
                    data_out <= 8'd0;
                    error <= 1'b0;
                end
                
                2'b01: begin    // command2，Clear，動作跟上面重置一樣
                    sp <= 3'd0;
                    data_out <= 8'd0;
                    empty <= 1'b1;
                    full <= 1'b0;
                    error <= 1'b0;
                    for (i = 0; i < 8; i = i + 1) begin
                        stack_mem[i] <= 8'd0;
                    end
                end
                
                2'b10: begin    // command3，Push
                    if (full) begin
                        error <= 1'b1;  //如果full下用push，error給1
                        data_out <= 8'd0;
                    end
                    else begin
                        stack_mem[sp] <= data_in;
                        sp <= sp + 1;
                        empty <= 1'b0;
                        full <= (sp == 3'd7);  //如果sp=7的話，再push就full
                        error <= 1'b0;
                        data_out <= 8'd0;
                    end
                end
                
                2'b11: begin    // command4，Pop
                    if (empty) begin
                        error <= 1'b1;
                        data_out <= 8'd0;
                    end
                    else begin
                        data_out <= stack_mem[sp - 3'd1];  // 先讀取當前 sp-1 位置的數據
                        sp <= sp - 3'd1;
                        full <= 1'b0;
                        empty <= (sp == 3'd1);  //如果sp=1的話再pop就empty了
                        error <= 1'b0;
                    end  //對應 begin內的if else
                end  //  對應begin，整個code有4個
            endcase  // 對應case
        end  // 對應if else
    end  // 對應always

endmodule  // 對應最上面的module

/*
sp <= 3'd0;的原因：
在程式的過程中sp會一直+1，當加到8時表示滿了
當 sp = 3'd7 時, full = 1, empty = 0, error = 0
當 sp = 3'd0 時, full = 0, empty = 1, error = 0
當遇到無效操作時, error = 1, full 和 empty 可能為 0 或 1

empty <= (sp == 3'd1)語法：
只要有 empty <= (某個條件成立是true) ，當條件成立時，empty = 1，否則維持原本的值
*/