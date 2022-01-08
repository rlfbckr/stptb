
step = 10;

difference() {
   cube([200,200,5]);
    for (x = [30:step:170]) {
      for (y = [30:step:170]) {
            translate([x,y,0]) cylinder(h=6,r=10,$fn=20);
        }
    }
}

