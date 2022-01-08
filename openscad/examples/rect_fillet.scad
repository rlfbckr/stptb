
union() {
    cube([100,20,100]);
    cube([100,100,20]);

    translate([0,20,20]) fillet(100,20);
}

module fillet(length =100, radius = 50){
    difference() {
        cube([length,radius,radius]);
        translate([0,radius,radius])rotate([0,90,0])cylinder(h=length,r=radius,$fn=60);
    }
}