$fa = 0.1;  // minimal angle, default 12, minimal value 0.01
$fs = 0.1;  // minimal size of a fragment, default 2, minimal 0.01
$fn = 0;

joint_r = 2.6;
joint_h = 4;

module _cylinder() {
    cylinder(r=joint_r, h=joint_h);
}

module _cube() {
    cube([joint_r*2, joint_r*2, joint_h]);
}

module joint() {
    color("green") _cube();
}

module head() {
    translate([6616.91, -22.31, 0]) import("soundwave_head.stl");
    translate([-joint_r, 0, -joint_h]) joint();
}

module torso() {
    translate([6518.21, -24.30, 0]) import("soundwave_torso.stl");
}


module legs() {
    translate([0, 0, 16.5]) rotate([-90, 0, 0]) translate([6675.87, -19.42, -61.23]) import("soundwave_legs.stl");
}

module main() {
    translate([0, 0, 40]) head();
    torso();
}

difference() {
    legs();
    translate([0,0,-10]) cube([100, 100, 20], center=true);
}
