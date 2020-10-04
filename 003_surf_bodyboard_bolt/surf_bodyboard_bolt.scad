include <threads.scad>

$fa = 1;
$fs = 0.4;

metric_thread(
    diameter=9,
    pitch=1.5,
    thread_size=1.5,
    length=30,
    leadin=1,
    leadfac=2.0
);

cylinder(h=9, r1=8, r2=2);

difference() { 
    resize([40,40,10]) sphere(r=20);
    translate([0,0,11.5]) cube([40,40,20], center=true);
    translate([0,0,-11.5]) cube([40,40,20], center=true);
    translate([0,1.5,-20]) rotate([90,0,0]) cylinder(h=3, r=20);
}