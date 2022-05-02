
class frame;
    bit [4:0] addr;
    bit [7:0] payload;
    bit parity

    // Dynamic methods
    function new(input addr, dat);
        this.addr = addr;
        this.payload = dat;
        genpar();     
    endfunction //new()

    function void genpar();
        this.parity = ^[this.addr, this.payload];        
    endfunction

    function bit [13:0] getframe();
        return ([this.addr, this.payload, this.parity]);        
    endfunction

    function void print();
        printf("Frame: %d \n", getframe());
    endfunction

endclass //frame

// Herencia
class tagframe extends frame;
    static int frmcount;
    int tag;

    function new(input int addr, dat);
        super.new(addr, dat);
        frmcount++;
        this.tag = frmcount;        
    endfunction //new()

    function int gettag();
        return (this.tag);
    endfunction

    function void print();
        printf("Frame %d: Adrress:%d Payload:%d Parity:%d\n", this.tag, this.addr, this.payload, this.parity);
    endfunction

    // Static methods
    static function int getcount();
        return (frmcount);       
    endfunction

endclass //tagframe extends frame

class errframe extends tagframe;
    static errcount;

    function new(input int addr, dat);
        super.new(addr, dat);
        errcount++;
    endfunction //new()

    // Static methods
    static function int geterrcount();
        return (errcount);       
    endfunction

endclass //errframe extends tagframe

class shortframe extends frame;
    bit [2:0] addr;
    bit [3:0] payload;

    function new(input int addr, dat);
        super.new(addr, dat);        
    endfunction //new()

    function bit [7:0] getframe();
        return ([this.addr, this.payload, this.parity]);        
    endfunction

endclass //shortframe extends frame

class twoframe;
    int count;
    tagframe frm1;
    tagframe frm2;

    function new(input int addr, data0, data1);
        this.frm1 = new(addr, data0);
        this.frm2 = new(addr+1, data1);
        this.count = frm2.tag;        
    endfunction //new()

endclass //twoframe

// Usage
bit [13:0] framedata;
bit [27:0] doubleframedata;
frame one = new(3, 16);
twoframe two = new(2, 3, 4);

initial begin
    @(negedeclk) 
    framedata = one.getframe();
    doubleframedata = [(two.frm1.getframe(), two.frm2.getframe())];
end