$fn=100;

h = 30;

hole_offset = 8;
hole_r = 2;
hole_R = 4;

r = 25;  // inner radius
thick = 2;
R = r + thick;


module Pipe(){
    difference(){
        cylinder(h=h, r=R, center=true);
        cylinder(h=h+0.02, r=r, center=true);
    }
}

module HoleBig(){
    translate([r,0,0]) rotate([0,90,0]) cylinder(h=thick+0.02, r=hole_R);
}

module HoleSmall(){
    translate([-r,0,0]) rotate([0,-90,0]) cylinder(h=thick+0.02, r=hole_r);
}

module Holes(){
    translate([0,0,hole_offset]) HoleBig();
    translate([0,0,-hole_offset]) HoleBig();
    translate([0,0,hole_offset]) HoleSmall();
    translate([0,0,-hole_offset]) HoleSmall();
}


difference(){
    Pipe();
    Holes();
}