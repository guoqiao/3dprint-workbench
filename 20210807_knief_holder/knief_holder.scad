$fa = 1;  // minimal angle, default 12, minimal value 0.01
$fs = 1;  // minimal size of a fragment, default 2, minimal 0.01
// number of fragments, when fn > 0, fa and fs are ignored.
// fn > 100 not recommended. fn < 50 advisable for performance.
$fn = 0;


x = 135.6;
y = 45.5;
z = 15; 
E = 1;

r = 3;
d = r * 2;

X = 12;
Y = (y - 5*d)/2;

l1 = (x - 3 * X) * 0.7;
l2 = (x - 3 * X) * 0.3;

module corner(h=z){
    cylinder(r=r, h=h, center=false);
}

module HoleCorner(){
    translate([0, 0, -E]) corner(h=z + 2 * E);
}

module main(){
    translate([r, r, 0]) hull() {
        corner();
        translate([x-d,0,0]) corner();
        translate([0,y-d,0]) corner();
        translate([x-d,y-d,0]) corner();
    }
}

module hole(l=x - 2 * X) {
    translate([X,r+Y,0]) hull() {
        HoleCorner();
        translate([l,0,0]) HoleCorner();
    }
}

module holes() {
    hole();
    translate([0,2*d,0]) hole();
    translate([0,4*d,0]) hole(l=l1);
    translate([l1+X,4*d,0]) hole(l=l2);
}

difference() {
    main();
    holes();
}