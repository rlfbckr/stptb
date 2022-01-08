/*
  honeycomb generator
  ralf baecker 2020
*/


nothing = 0.01; // avoid z-fighting
comb_size=50; // diameter 
comb_height=30; // height
comb_thickness = 1; // wall thickness

color("Grey") combgrid(20,20);

module combgrid(w,h) {
    comb_tri_height = (comb_size/2) * sqrt(3);
    for (ih = [0:h]) {
        translate([ih*((comb_size*1.5)),ih%2*comb_tri_height,0])
        for (iw = [0:w]) {
            translate([0,iw*2*comb_tri_height,0]) comb();
        }
    }
}

module comb() {
    difference() {
        cylinder(h=comb_height,r=comb_size,$fn=6);
        translate([0,0,-nothing])
            cylinder(h=comb_height+2*nothing,r=comb_size-(comb_thickness/2),$fn=6);
    }
}

