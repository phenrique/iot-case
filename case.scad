$fn = 90;

larg = 65;
prof = 55;
alt = 22;
alt_tampa = 1.4;

parede = 2;

// Dimensões de corte
x_dht = 15.6;
y_dht = 20.6;
r_mic = 5.2;
x_USB = 18;
y_USB = 6;

pos_mic = [ 21, 1, -5 ];
pos_dht = [ -21, 4, -5 ];

main();

module main()
{
    tampa();
    //case();
}


module case(){

    difference()
    {
    caixa();
    usb();
}
}


module caixa(){

difference() {
    minkowski()
    {
        cube([ larg, prof, alt ], center = true);
        cube(size = parede, center = true);
        //cylinder(r = parede, h = 1);
    }
    translate([ 0, 0, parede ]) cube([ larg, prof, alt ], center = true);
}
}

module tampa(){
difference() {
    minkowski()
    {
        cube([ larg, prof, alt_tampa ], center = true);
        cube(size = parede, center = true);
        //cylinder(r = parede, h = 1);
    }
    dht();
    mic();

}
}

module usb()
{
    translate([ 0, -25, 0.5 ]) rotate([ 90, 0, 0 ]) cube([ x_USB, y_USB, 20 ], center = true);
}

module mic()
{
    translate(pos_mic) cylinder(h = 20, r = r_mic, center = true);
}

module dht()
{
    translate(pos_dht) cube([ x_dht, y_dht, 20 ], center = true);
}
