$fn = 100;

d = 14.6;
r = 8.7;
R = r+1;
h = 12;
E = 0.01;

difference() {
    cylinder(r=R, h=h);
    translate([0,0,-E]) cylinder(r=r, h=h+2*E);
}