screw_blablawhatervericallit(30,5);
translate([10,20,0]) screw_blablawhatervericallit(20,2.5);


module screw_blablawhatervericallit(screw_height=20,diameter=3) {
    union() {
        cylinder(h=2,r=(diameter/2)*1.9,$fn=40);
        cylinder(h=screw_height,r=diameter/2,$fn=40);
    }
}