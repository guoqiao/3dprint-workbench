$fa = 12;  // minimal angle, default 12, minimal value 0.01
$fs = 2;  // minimal size of a fragment, default 2, minimal 0.01
// number of fragments
// when fn > 0, fa and fs are ignored.
// fn > 100 not recommanded. fn < 50 advisable for performance.
$fn = 0;

// real size: 7.15~7.20mm
d_hole = 7.50;  // hole diameter
h_hole = 15;  // how deep is the hole
h_hole_bottom = 3; // hole bottom height

s_cube = 20;
h_cube = h_hole + h_hole_bottom;

r_sphere = 5;

n_x = 1;  // how many holes on x axis
n_y = 1;  // how many holes on y axis

s_box_x = s_cube * n_x;
s_box_y = s_cube * n_y;

delta = 0.01;

module hole() {
    translate([s_cube/2, s_cube/2, h_hole_bottom]) color("red") cylinder(d=d_hole, h=h_hole+delta);
}

module matrix() {
    for (y = [0:n_y-1]) {
        for (x = [0:n_x-1]) {
            translate([s_cube*x, s_cube*y, 0]) hole();
        }
    }
}


module box() {
    cube([s_box_x, s_box_y, h_cube]);
}

module rbox() {
    hull() {
        for (i = [0:1]) {
            for (j = [0:1]) {
                translate([s_box_x*i, s_box_y*j, 0]) cylinder(d=d_hole, h=h_cube);
            }
        }
    }
}

module main() {
    difference() {
        box();
        matrix();
    }
}

main();
