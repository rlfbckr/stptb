pulley_width = 20; // mmm
pulley_axis_diameter = 5; // eg motor axis 
pilley_axis_cut = 3.1; // e.g. for stepper28BYJ
pulley_outer_diameter = 45; // outer diamter of the pulley
pulley_wall_height = 5;
pulley_wall_thickness = 1;

$fn=90;
explosion = 1;

difference() {
    union() {
        cylinder(h=pulley_width,r=(pulley_outer_diameter-2)/2,center=true);
        translate([0,0,(pulley_width-pulley_wall_thickness)/2]) cylinder(h=pulley_wall_thickness,r=(pulley_outer_diameter/2)+pulley_wall_height,center=true);
    }
    axis_profile_28BYJ();
} 

translate([0,0,-50*explosion]) {
    difference() {
        union() {
            difference() {
                cylinder(h=pulley_width,r=(pulley_outer_diameter)/2,center=true);
                cylinder(h=pulley_width,r=(pulley_outer_diameter-1.8)/2,center=true);
         
            }
            translate([0,0,-(pulley_width-pulley_wall_thickness)/2]) cylinder(h=pulley_wall_thickness,r=(pulley_outer_diameter/2)+pulley_wall_height,center=true);
        }
         axis_profile_28BYJ();
    }
}


module axis_profile_round() {
    cylinder(h=pulley_width+2,r=pulley_axis_diameter/2,center=true);
    
}

module axis_profile_28BYJ() {
    intersection() {
        cylinder(h=pulley_width+10,r=pulley_axis_diameter/2,center=true,$fn=40);
        cube([pulley_axis_diameter,pilley_axis_cut,pulley_width+2],center=true);
    }
    
}
