h = 22;
w = 22.6;
d = 12.2;
hw = 32;

 translate([0,30,0]) servo_MG90s();

function getcenter() = w/2;

module servo_MG90s() {

    color("Orange") {
         difference() {
            union() {
                cube([w,d,h]);
                translate([-4.5,0,h-3])
                    cube([hw,d,2.5]);
                translate([w-(d/2),d/2,h])
                    cylinder(h=6,r=d/2);
            }
            translate([-2,d/2,h])
                cylinder(h=25,r=1,$fn=20,center=true);
            translate([w+2,d/2,h])
                cylinder(h=25,r=1,$fn=20,center=true);
        }
    } 
}