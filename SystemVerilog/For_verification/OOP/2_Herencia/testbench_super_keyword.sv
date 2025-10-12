class Packet;
    int addr;

    function new(int addr);
        this.addr = addr;
    endfunction

    function void display();
        $display("[Packet] addr=%h", addr);
    endfunction

endclass

class subPacket extends Packet;
    int data;

    function new(int data, int addr);
        super.new (addr);
        this.data = data;
    endfunction

    function void display();
        $display("[subPacket] data=%0h", data);
        $display("[subPacket] addr=%0h", super.addr);
    endfunction
endclass

module main;
    Packet pack;
    subPacket subpack;

    initial begin
        pack = new(32'hDEAD_FFFF);
        subpack = new(32'hC0DE_CAFE, 32'hDEAD_C0DE);
        pack.display();
        subpack.display();
    end
endmodule