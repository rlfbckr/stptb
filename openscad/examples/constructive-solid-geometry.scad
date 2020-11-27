/*
    Constructive solid geometry introduction
    Boolean opperations on solid objects

    ralf baecker 2020
   
    https://en.wikipedia.org/wiki/Constructive_solid_geometry

*/

//$fn=50; //faces 

cube([20,20,20]);
cylinder(r=4,h=40,center=true);


// difference
translate([50,0,0]) {
     difference() {
        cube([20,20,20]);
        translate([10,10,10]) rotate([90,0,0]) cylinder(r=4,h=40,center=true);
    }
    // text
    translate([0,0,40] ) rotate([90,0,0]) color("White") text("difference()",size=3);
}

// union
translate([100,0,0]) {
    union() {
        cube([20,20,20]);
        translate([10,10,10]) rotate([90,0,0]) cylinder(r=4,h=40,center=true);
    }
    // text
    translate([0,0,40] ) rotate([90,0,0]) color("White") text("union()",size=3);
}

// intersection
translate([150,0,0]) {
    intersection() {
        cube([20,20,20]);
        translate([10,10,10]) rotate([90,0,0]) cylinder(r=4,h=40,center=true);
    }
    // text
    translate([0,0,40] ) rotate([90,0,0]) color("White") text("intersection()",size=3);
}




