$fn = 100;

d = 14.6;
r = d/2;
R = r+1;
h = 10;
E = 0.01;

difference() {
    cylinder(r=R, h=h);
    translate([0,0,-E]) cylinder(r=r, h=h+2*E);
}