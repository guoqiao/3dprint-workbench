$fa = 1;  // minimal angle, default 12, minimal value 0.01
$fs = 1;  // minimal size of a fragment, default 2, minimal 0.01
// number of fragments, when fn > 0, fa and fs are ignored.
// fn > 100 not recommanded. fn < 50 advisable for performance.
$fn = 0;

// real size: 7.13~7.20mm
hole_d = 7.50;  // hole diameter
hole_h = 10;  // hole depth/height
hole_b = 3; // hole bottom thick/height

// a cell is a cube with a hole in center
cell_s = 20; // cell size for each hole, hole center distance
cell_h = hole_h + hole_b;

delta = 0.01;

module hole() {
    translate([cell_s/2, cell_s/2, hole_b]) color("red") cylinder(d=hole_d, h=hole_h+delta);
}

module holes(hole_n_x, hole_n_y) {
    for (y = [0:hole_n_y-1]) {
        for (x = [0:hole_n_x-1]) {
            translate([cell_s*x, cell_s*y, 0]) hole();
        }
    }
}

module box(hole_n_x, hole_n_y) {

    box_s_x = cell_s * hole_n_x;
    box_s_y = cell_s * hole_n_y;

    hull() {
        translate([0, 0, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
        translate([box_s_x-hole_d, 0, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
        translate([0, box_s_y-hole_d, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
        translate([box_s_x-hole_d, box_s_y-hole_d, 0]) translate([hole_d/2, hole_d/2,0]) cylinder(d=hole_d, h=cell_h);
    }
}

// use hull method on 4 existing holes to make the pool
module pool(cell_n_x, cell_n_y) {
    if (cell_n_x > 0 && cell_n_y > 0) {

        x = cell_s * (cell_n_x-1);
        y = cell_s * (cell_n_y-1);

        hull() {
            translate([0, 0, 0]) hole();
            translate([x, 0, 0]) hole();
            translate([x, y, 0]) hole();
            translate([0, y, 0]) hole();
        }
    }
}

module main(hole_n_x, hole_n_y, pool_cell_n_x, pool_cell_n_y) {

    difference() {
        box(hole_n_x, hole_n_y);
        holes(hole_n_x, hole_n_y);
        pool(pool_cell_n_x, pool_cell_n_y);
    }
}

// main(1, 1, 0, 0);  // 1 single cell, good for test
// main(6, 6, 3, 3);
main(9, 7, 9, 3);  // long pool, can hold long bit head
