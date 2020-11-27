cheeseholes = 50;
cheeseholes_min_size = 10;
cheeseholes_max_size = 30;
cheeseblock_dim = [100,100,100];

seed = 2;
random_cheesehole_positions = rands(0,cheeseblock_dim[0],3*cheeseholes);
random_cheesehole_size = rands(cheeseholes_min_size,cheeseholes_max_size,cheeseholes);

$fn = 20;

color("yellow") difference() {
    cube(cheeseblock_dim);
    for(i = [0:cheeseholes]) {
        translate([random_cheesehole_positions[(i*3)+0], random_cheesehole_positions[(i*3)+1],random_cheesehole_positions[(i*3)+2]]) {
            sphere(r = random_cheesehole_size[i],center=true);
        }
    }
}