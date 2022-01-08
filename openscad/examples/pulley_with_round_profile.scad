use <helper.scad>

/*
  pully generator with fillet
  ralf baecker 2020
*/

inner_height = 30;
inner_radius = 20;
wall_height = 3;
wall_thickness = 2;
fillet = 1; // 1= with fillet | 0 = no fillet


difference() {
    union() {
        translate([0,0,wall_thickness]) {
            if (fillet == 1) {
                // with fillet
                fillet_cylinder(inner_height-(wall_thickness*2), // height of cylinder
                                inner_radius, // radius of inner cylinder
                                wall_height*0.8, // top radius
                                wall_height*0.8, // bottom radius
                                90); // number of faces
            } else {
                // no fillet
                cylinder(h=inner_height-(2*wall_thickness), r= inner_radius,$fn=100);
            }
        }
        // walls
        cylinder(h=wall_thickness, r= inner_radius+ (2*wall_height),$fn=100);
        translate([0,0,inner_height-wall_thickness]) cylinder(h=wall_thickness, r= inner_radius+ (2*wall_height),$fn=100);
    }
     axis_profile_28BYJ(inner_height+2);
     //cylinder(h=inner_height+2, r= 5,$fn=100);
}





