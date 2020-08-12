$fa = 1;
$fs = 0.4;
//$fn = 0;

d = 10;
h = 5;
w = 20;
r_hole = 1;
hole_offset = 3;

module mycube(){
    cube([d + h, h, w]);
}

difference() {
    mycube();
    translate([h+d/2,-2,w/4]) rotate([-90,0,0]) cylinder(r=r_hole,h=30);
    translate([h+d/2,-2,3*w/4]) rotate([-90,0,0]) cylinder(r=r_hole,h=30);
}

translate([-d,d,0]) mycube();

translate([h,0,0]) rotate([0,0,90]) mycube();

