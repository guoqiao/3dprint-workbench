$fa = 1;  // minimal angle, default 12, minimal value 0.01
$fs = 1;  // minimal size of a fragment, default 2, minimal 0.01
// number of fragments
// when fn > 0, fa and fs are ignored.
// fn > 100 not recommanded. fn < 50 advisable for performance.
$fn = 0;

// real size: 7.13~7.20mm
hole_d = 7.50;  // hole diameter
hole_h = 10;  // hole depth/height
hole_b = 3; // hole bottom thick/height

cell_s = 20; // cell size for each hole, hole center distance
cell_h = hole_h + hole_b;

hole_n_x = 9;  // how many holes on x axis
hole_n_y = 6;  // how many holes on y axis

box_s_x = cell_s * hole_n_x;
box_s_y = cell_s * hole_n_y;
box_h = cell_h;

delta = 0.01;

module hole() {
    translate([cell_s/2, cell_s/2, hole_b]) color("red") cylinder(d=hole_d, h=hole_h+delta);
}

module matrix() {
    for (y = [0:hole_n_y-1]) {
        for (x = [0:hole_n_x-1]) {
            translate([cell_s*x, cell_s*y, 0]) hole();
        }
    }
}

module box() {
    cube([box_s_x, box_s_y, cell_h]);
}

module rbox() {
    hull() {
        translate([0, 0, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
        translate([box_s_x-hole_d, 0, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
        translate([0, box_s_y-hole_d, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
        translate([box_s_x-hole_d, box_s_y-hole_d, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
    }
}

module pool() {
    hull() {
        hole();
        translate([cell_s*(hole_n_x-1), 0, 0]) hole();
        translate([cell_s*(hole_n_x-1), cell_s, 0]) hole();
        translate([0, cell_s, 0]) hole();
    }
}

module main() {
    difference() {
        rbox();
        matrix();
        pool();
    }
}

main();
