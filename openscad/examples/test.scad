inner_height = 30;
inner_radius = 20;
wall_height = 3;
wall_thickness = 2;
fillet = 1;

difference() {
    union() {
        translate([0,0,wall_thickness]) {
            if (fillet == 1) {
                // with fillet
                fillet_cylinder(inner_height-(wall_thickness*2),inner_radius,wall_height*1,wall_height*1,100);
            } else {
                // no fillet
                cylinder(h=inner_height-(2*wall_thickness), r= inner_radius,$fn=100);
            }
        }
        cylinder(h=wall_thickness, r= inner_radius+ (2*wall_height),$fn=100);
        translate([0,0,inner_height-wall_thickness]) cylinder(h=wall_thickness, r= inner_radius+ (2*wall_height),$fn=100);
    }
    cylinder(h=inner_height+2, r= 5,$fn=100);
}



 






module fillet_cylinder( cylinder_height=20,  cylinder_radius=1, fillet_radius_bottom=1, fillet_radius_top=1,  nfaces=50 ) {
    /* created by Kevin Lam on Dec 3, 2016 */
    union() {      
        cylinder(cylinder_height, r=cylinder_radius, $fn=nfaces, false);
        
        if (fillet_radius_bottom > 0) {
            difference() {
                cylinder(fillet_radius_bottom, r=cylinder_radius+fillet_radius_bottom, $fn=nfaces, false);
                translate([0, 0, fillet_radius_bottom])
                rotate_extrude($fn=nfaces)
                    translate([cylinder_radius+fillet_radius_bottom, 0, 0])
                        circle(fillet_radius_bottom, $fn=nfaces);
            }
        }
        
        if (fillet_radius_top>0) {
            difference() {
                translate([0,0,cylinder_height-fillet_radius_top])
                cylinder(fillet_radius_top, r=cylinder_radius+fillet_radius_top, $fn=nfaces, false);
                
                translate([0, 0, cylinder_height-fillet_radius_top])
                rotate_extrude($fn=nfaces)
                    translate([cylinder_radius+fillet_radius_top, 0, 0])
                        circle(fillet_radius_top, $fn=nfaces);
            }
        }
    }
}