// dimensions

enc_width=100;
enc_depth=100;
enc_height = 90;
enc_wallwidth=2;
enc_hole_dist =4;

$fn=30;


module case_top() {
     union() {
        difference() {
            cube([enc_width,enc_depth,enc_height/2]);
            translate([(enc_wallwidth),(enc_wallwidth),enc_wallwidth*-2])
                cube([enc_width-(enc_wallwidth*2),enc_depth-(enc_wallwidth*2),enc_height/2-(enc_wallwidth*2)+0.001]);
            translate([enc_hole_dist,enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
            translate([enc_width-enc_hole_dist,enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
            translate([enc_hole_dist,enc_depth-enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
            translate([enc_width-enc_hole_dist,enc_depth-enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
        }

        translate([enc_hole_dist,enc_hole_dist,0])
            screwhole_top();
        translate([enc_width-enc_hole_dist,enc_hole_dist,0])
            screwhole_top();
    
        translate([enc_hole_dist,enc_depth-enc_hole_dist,0])
            screwhole_top();
        translate([enc_width-enc_hole_dist,enc_depth-enc_hole_dist,0])
            screwhole_top();
    }    
}

module case_bottom() {
    union() {
        difference() {
            cube([enc_width,enc_depth,enc_height/2]);
            translate([(enc_wallwidth),(enc_wallwidth),enc_wallwidth*2])
                cube([enc_width-(enc_wallwidth*2),enc_depth-(enc_wallwidth*2),enc_height/2-(enc_wallwidth*2)+0.001]);
            translate([enc_hole_dist,enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
            translate([enc_width-enc_hole_dist,enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
            translate([enc_hole_dist,enc_depth-enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
            translate([enc_width-enc_hole_dist,enc_depth-enc_hole_dist,0])
                cylinder(h=enc_height/2,r=enc_hole_dist);
        }

        translate([enc_hole_dist,enc_hole_dist,0]) screwhole_bottom();
        translate([enc_width-enc_hole_dist,enc_hole_dist,0]) screwhole_bottom();
    
        translate([enc_hole_dist,enc_depth-enc_hole_dist,0]) screwhole_bottom();
        translate([enc_width-enc_hole_dist,enc_depth-enc_hole_dist,0]) screwhole_bottom();
    } 
}

module screwhole_bottom() {
    difference() {
       cylinder(h=enc_height/2,r=enc_hole_dist);
       cylinder(h=(enc_height/2)+2,r=1.6);
       cylinder(h=1.6,r=3,$fn=6);
    }    
}
module screwhole_top() {
    difference() {
        cylinder(h=enc_height/2,r=enc_hole_dist);
        cylinder(h=(enc_height/2)+2,r=1.6);
        translate([0,0,(enc_height/2)-2])
            cylinder(h=2+0.01,r=2.5,$fn=40);
    }    
}


// draw together
translate([0,0,0])
    case_bottom();
translate([0,0,(enc_height/2) +40])
    case_top();


