nothing = 0.02;
height = 0.5;
thickness = 0.5;
$fn=20;


//element(5,1);

for ( k = [1:5]) {
    this_er = k*0.4;
    this_r = k*9;
    this_umfang = 2*PI*this_r;
    step_size = 360/(this_umfang/(this_er*2));
    echo(k,step_size);
    
    for ( j = [0:step_size:360]) {
        rotate([0,0,j])
            translate([this_r,0,0]) 
                element(this_er,height);
    }
}


module element(this_radius,this_height) {
    difference() {
        cylinder(r=this_radius,h=this_height);
        translate([0,0,-nothing])
            cylinder(r=this_radius-thickness,h=this_height+(2*nothing));
    }    
}



