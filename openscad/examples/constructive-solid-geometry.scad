/*

    Constructive_solid_geometry
    https://en.wikipedia.org/wiki/Constructive_solid_geometry

    Boolean opperations on solid objects
*/

//$fn=50;

cube([20,20,20]);
cylinder(r=4,h=40,center=true);


// difference
translate([50,0,0]) {
     difference() {
        cube([20,20,20]);
        translate([10,10,10]) cylinder(r=4,h=40,center=true);
    }
    translate([0,0,40] ) rotate([90,0,0]) color("White") text("difference()",size=3);
}

// union
translate([100,0,0]) {
    union() {
        cube([20,20,20]);
        translate([10,10,10]) cylinder(r=4,h=40,center=true);
    }
    translate([0,0,40] ) rotate([90,0,0]) color("White") text("union()",size=3);
}

// intersection
translate([150,0,0]) {
    intersection() {
        cube([20,20,20]);
        translate([10,10,10]) cylinder(r=4,h=40,center=true);
    }
    translate([0,0,40] ) rotate([90,0,0]) color("White") text("intersection()",size=3);

}




