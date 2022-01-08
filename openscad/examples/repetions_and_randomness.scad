
// create some random numbers 
random_sizes = rands(0.2,3.5,200*200);
 
random_pos_x = rands(-2,2,200*200);
random_pos_y = rands(-2,2,200*200);

step = 10;

 difference() {
   cube([200,200,5]);
    for (x = [10:step:190]) {
      for (y = [10:step:190]) {
            translate([x+random_pos_x[x+(y*200)],y+random_pos_y[x+(y*200)],0])
                cylinder(h=6,r=random_sizes[x+(y*200)],$fn=20);
        }
    }
 }