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

module axis_profile_28BYJ(height_of_profile) {
    pulley_axis_diameter = 5; // eg motor axis 
    pulley_axis_cut = 3.1; // e.g. for stepper28BYJ
    translate([0,0,height_of_profile/2]) {
        intersection() {
            cylinder(h=height_of_profile+2,r=diameter2radius(pulley_axis_diameter),center=true,$fn=40);
            cube([pulley_axis_diameter,pulley_axis_cut,height_of_profile],center=true);
        }
    }
}

function diameter2radius(diameter)=diameter/2;