class randclass;
    rand bit[1:0] p1;
    randc bit[1:0] p2;
    randc bit[7:0] p3;
    bit parity;
    bit lastvalues [3:0];

    constraint p1_not_zero { p1 != 2'b00; }
    constraint p2_distribution { p2 dist {[0:1]:=2, [2:3]:=1 } ; } 
    // Los valores 0 y 1 tienen el doble de posbilidad de ocurrir que los valores 2 y 3

    constraint p3_distribution { p3 dist {0:=5, [1:7]:=3, [8:255]:/14 } ; }
    // El valor 0 tiene un posibilidad de oucrrencia de 5/40
    // Los valores 1 a 7 tienen un posibilidad de oucrrencia CADA UNO de 3/40
    // Los valores 8 a 255 tienen un posibilidad de oucrrencia COMO CONJUNTO de 14/40

    function new();
        this.p1 = randomize();
        this.p2 = randomize(); 
        this.p3 = randomize();  
    endfunction //new()

    function void post_randomize();
        this.parity = ^[(this.p1 , this.p2)];
    endfunction //post_randomize()

    function void pre_randomize();
        this.lastvalues = [(this.p1 , this.p2)];
    endfunction //pre_randomize()
endclass //randclass

class newrandclass extends randclass;

    constraint p1_not_zero {} 
    // Hereda los constraints de randclass.
    // si no lo quiero pongo constraint p1_not_zero {} 
    //o bien puedo modificarlo con constraint p1_not_zero {p1 != 2'b01;} 
    // Pero me queda una inconsistencia en el nombre por eso se elimina
    // y se crea una nueva contraint p1_not_zero.
    constraint p1_not_one { p1 != 2'b01;}

    function new();   
        super.new();     
    endfunction //new()
endclass //newrandclass extends randclass

// USAGE OF RANDMIZATION

rand randclass r;

initial begin    

    r.new();
    $display("%d", r.p1);
    $display("%d", r.p2);

    if (!r.randomize()) $display ("Randomization failed");
    $display("%d", r.p1);
    $display("%d", r.p2);

    r.rand_mode(0);
    r.p2.rand_mode(1);
    if (!r.randomize()) $display ("Randomization failed");
    $display("%d", r.p1);
    $display("%d", r.p2); // Solo randomiza p2

end