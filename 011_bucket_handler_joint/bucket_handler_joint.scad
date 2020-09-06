$fa = 1;  // minimal angle, default 12, minimal value 0.01
$fs = 1;  // minimal size of a fragment, default 2, minimal 0.01
// number of fragments, when fn > 0, fa and fs are ignored.
// fn > 100 not recommanded. fn < 50 advisable for performance.
$fn = 0;

Z = 4;
X = 12;
Y = 1;

module hole() {
    translate([0,0,-Z]) cylinder(r=1.5, h=Z*3);
}

module holes() {
    translate([sqrt(3) * Y, Y, 0]) hole();
    translate([2 * X - sqrt(3) * Y, Y, 0]) hole();
    translate([X, sqrt(3) * X - 2 * Y, 0]) hole();
}


module corner() {
    cylinder(r=5, h=Z);
}

module base() {
    hull() {
        corner();
        translate([X * 2, 0, 0]) corner();
        translate([X, sqrt(3) * X, 0]) corner();
    }
}


module main() {
    difference() {
        base();
        holes();
    }
}

main();
