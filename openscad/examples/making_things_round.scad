
$fn=50;
// https://www.youtube.com/watch?v=3qMNuoTHNHs

color("Yellow") minkowski() {
  cube([10,10,1]);
  cylinder(r=4,h=1);
}


translate([50,0,0]) {
    color("Magenta") minkowski() {
       cube([10,10,10]);
       sphere(r=4);
    }    
}

translate([-50,0,0]) {
   color("Blue") hull() {
        sphere(r=4);
        translate([20,20,0])
            sphere(r=4);
        translate([20,20,20])
            sphere(r=4);
        translate([20,30,40])
            sphere(r=4);
        translate([-20,30,40])
            sphere(r=4);
    }    
}