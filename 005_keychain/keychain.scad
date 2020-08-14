$fa = 1;
$fs = 0.5;
$fn = 100;

name = "Allen"; 

color("white") translate([0,-5,0]) linear_extrude(height=5) text(name);


L = 40;

difference() {
    hull(){
        cylinder(h=2, d=16);
        translate([L,0,0]) cylinder(h=2, d=16);
    }
    
    translate([L,0,-2]) cylinder(h=5, d=14);  
}
