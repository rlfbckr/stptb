// parameter

star_edges = 30;
star_min = 4;
star_max = 20;

ex_height = 40;

// generate star shape polygon

star_shape =[
  for (i =[0:(star_edges*1)])
      if (i%2 == 0) [sin(i  *(360/ star_edges))*star_min, cos(i  *(360/ star_edges))*star_min]
      else [sin(i  *(360/ star_edges))*star_max, cos(i  *(360/ star_edges)) * star_max]

];

echo(star_shape);
//polygon(star_shape);

color("White") {
    linear_extrude(height=ex_height) {
        polygon(star_shape);
    }
}

color("Green") {
    translate([100,0,0]) {
        linear_extrude(height=ex_height,twist=90, convexity = 10,center=false) {
            polygon(star_shape);
        }
    }
}

color("Blue") {
    translate([-100,0,0]) {
        linear_extrude(height=ex_height,twist=340, convexity = 10,center=false) {
            translate([20,0,0]) polygon(star_shape);
        }
    }
}
