random_sizes = rands(1,5,200*200);
random_pos_x = rands(-1,1,200*200);
random_pos_y = rands(-1,1,200*200);

step = 10;

difference() {
   cube([200,200,5]);
    for (x = [50:step:150]) {
      for (y = [50:step:150]) {
            translate([x+random_pos_x[x+(y*200)],y+random_pos_y[x+(y*200)],0]) cylinder(h=6,r=random_sizes[x+(y*200)],$fn=20);
        }
    }
}
