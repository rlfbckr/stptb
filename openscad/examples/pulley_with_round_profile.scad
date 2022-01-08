pulley_width = 35; // mmm
pulley_axis_diameter = 5; // eg motor axis 
pilley_axis_cut = 3.1; //e.g. for stepper28BYJ
pulley_outer_diameter = 30; // outer diamter of the pulley
pulley_wall_height = 5;
pulley_wall_thickness = 2;

$fn=50;


difference() {
    difference() {
        cylinder(h=pulley_width,r=((pulley_outer_diameter)/2)+pulley_wall_height,center=true);
        rotate_extrude(convexity = 10)
            translate([((pulley_outer_diameter)/2)+pulley_wall_height, 0, 0])
                circle(r = (pulley_width/2)-(2*pulley_wall_thickness), $fn = 100);
    }
//    axis_profile_round();
    axis_profile_28BYJ();
} 

module axis_profile_round() {
    cylinder(h=pulley_width+2,r=pulley_axis_diameter/2,center=true);
    
}

module axis_profile_28BYJ() {
    intersection() {
        cylinder(h=pulley_width+2,r=pulley_axis_diameter/2,center=true,$fn=40);
        cube([pulley_axis_diameter,pilley_axis_cut,pulley_width+2],center=true);
    }
    
}


