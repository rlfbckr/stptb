// parameter

star_edges = 10;
star_min = 3;
star_max = 20;

// generate star shape polygon
star_shape =[
  for (i =[0:(star_edges*1)])
      if (i%2 ==0) [sin(i  *(360/ star_edges))*star_min, cos(i  *(360/ star_edges))*star_min]
      else [sin(i  *(360/ star_edges))*star_max, cos(i  *(360/ star_edges))*star_max]

];

echo(shape);

color("Red") {
    linear_extrude(height=ex_height) {
        polygon(star_shape);
    }
}

color("Yellow") {
    translate([100,0,0]) {
        linear_extrude(height=ex_height,twist=90, convexity = 10,center=false) {
            polygon(star_shape);
        }
    }
}

color("Blue") {
    translate([-100,0,0]) {
        linear_extrude(height=ex_height,twist=2*360, convexity = 10,center=false) {
            translate([30,0,0]) polygon(star_shape);
        }
    }
}
