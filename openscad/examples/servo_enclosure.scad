include <servo.scad>

nothing = 0.03;
enc_height = 30;
enc_width =  50;
end_depth =  50;
wall_thickness = 2;
$fn =20;
open_lid = 0;
// sercodims
    h = 22;
    w = 22.6;
    d = 12.2;
    hw = 32;
//cap(); // bottom
//bottom();
//projection(cut=false)
translate([enc_width,0,enc_height+(40*open_lid)]) rotate([0,180,0]) lid_top(); // top / lid

module lid_top() {
   screw_points = [[4,4,0],[enc_width-4,4,0],[4,end_depth-4,0],[enc_width-4,end_depth-4,0]];
    difference() {
        cap();
        for (i = [0:len(screw_points)-1]) {
            translate(screw_points[i]) 
            translate([0,0,-nothing])
                cylinder(h=enc_height/2,r=3);
        }
        translate([(enc_width/2)+(w/2),(end_depth/2)-(d/2),h-3.5])
            rotate([0,180,0])
               translate([-0.5,-0.5,0])cube([w+1,d+1,h]);
    }
    
     for (i = [0:len(screw_points)-1]) {
        translate(screw_points[i]) {
            difference() {
                cylinder(h=enc_height/2,r=3);
                translate([0,0,-nothing]) {
                    cylinder(h=(enc_height/2)+(2*nothing),r=1.6); 
                }
            }
        } 


    }
 /*
    translate([(enc_width/2)+(w/2),(end_depth/2)-(d/2),h-3.5])
        rotate([0,180,0])
            servo_MG90s();
 */
}

module bottom() {
   screw_points = [[4,4,0],[enc_width-4,4,0],[4,end_depth-4,0],[enc_width-4,end_depth-4,0]];
    difference() {
        cap();
        for (i = [0:len(screw_points)-1]) {
            translate(screw_points[i]) 
            translate([0,0,-nothing])
                cylinder(h=enc_height/2,r=3);
        }
    }
    
     for (i = [0:len(screw_points)-1]) {
        translate(screw_points[i]) {
            difference() {
                cylinder(h=enc_height/2,r=3);
                translate([0,0,-nothing]) {
                    cylinder(h=(enc_height/2)+(2*nothing),r=1.6); 
                }
            }
        } 
    }
}

module cap() {
    difference() {
        round_cube([enc_width,end_depth,enc_height/2],3);
        translate([wall_thickness,wall_thickness,(wall_thickness)])
            round_cube([  enc_width-(2*wall_thickness),
                        end_depth-(2*wall_thickness),
                        (enc_height/2)
                        ],2.5);
    }    
}
//round_cube([enc_width,end_depth,enc_height/2],2);

module round_cube(size,edgeradius) {
   echo(size[0],size[1],size[2]);
   translate([edgeradius,edgeradius,0]) minkowski() {
        cube([  size[0]-(2*edgeradius),
                size[1]-(2*edgeradius),
                size[2]/2] );
        cylinder(r=edgeradius,h=size[2]/2);
  }
}

