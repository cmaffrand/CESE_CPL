// Regular methods

class base;
    function new();        
    endfunction //new()

    function void iam();
        printf("I am a base class\n");
    endfunction //iam()
endclass //base

class parent extends base;
    function new();
        super.new();
    endfunction //new()

    function void iam();
        printf("I am a parent class\n");
    endfunction //iam()
endclass //parent extends base

class child extends parent;
    function new();
        super.new();
    endfunction //new()

    function void iam();
        printf("I am a child class\n");
    endfunction //iam()
endclass //child extends parent

// Virtual Methods

class basev;
    function new();        
    endfunction //new()

    virtual function void iam();
        printf("I am a base class\n");
    endfunction //iam()
endclass //basev

class parentv extends basev;
    function new();
        super.new();
    endfunction //new()

    virtual function void iam();
        printf("I am a parent class\n");
    endfunction //iam()
endclass //parentv extends basev

class childv extends parentv;
    function new();
        super.new();
    endfunction //new()

    virtual function void iam();
        printf("I am a child class\n");
    endfunction //iam()
endclass //childv extends parentv

// Virtual Classes

virtual class basevirtual;
    pure virtual function new();
    pure virtual function void iam();
endclass //basevirt

class parentvirtual extends basevirtual;
    function new();        
    endfunction //new()

    virtual function void iam();
        printf("I am a parent class\n");
    endfunction //iam()
endclass //parentvirtual extends basevirtual

class childvirtual extends parentvirtual;
    function new();
        super.new();
    endfunction //new()

    virtual function void iam();
        printf("I am a child class\n");
    endfunction //iam()
endclass //childvirtual extends parentvirtual

// USAGE

base b1;
parent p1 = new();
child c1 = new();
basev bv1;
parentv pv1 = new();
childv cv1 = new();
// basevirtual bvir1; Cant be instantiated
parentvirtual pvir1 = new();
childvirtual cvir1 = new();

initial begin
    b1.iam();
    p1.iam();
    c1.iam();
    b1 = p1;
    b1.iam(); // Shows B1 implementation of iam() but the handler is pointing to P1 (parent)
    p1 = c1;
    p1.iam(); // Shows P1 implementation of iam() but the handler is pointing to C1 (child)

    // Virtual methods
    bv1.iam();
    pv1.iam();
    cv1.iam();
    bv1 = pv1;
    bv1.iam(); // Shows PV1 implementation of iam() and is pointing to PV1 (parentv)
    pv1 = cv1;
    pv1.iam(); // Shows CV1 implementation of iam() and is pointing to CV1 (childv)

    // Virtual classes
    pvir1.iam();
    cvir1.iam();
    pvir1 = cvir1;
    pvir1.iam(); // Shows CVIR1 implementation of iam() and is pointing to CVIR1 (childvirtual)
end
