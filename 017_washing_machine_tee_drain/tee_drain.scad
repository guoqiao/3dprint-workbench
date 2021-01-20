$fn=100;

wall_thick = 1;

top_d1 = 20; // bigger pipe external diameter
top_d2 = 18; // smaller pipe external diameter

top_r1 = top_d1/2;
top_r2 = top_d2/2;

top_r = top_r1 + wall_thick;
top_d = top_r * 2;
top_h = 20;

middle_h = 10;

bottom_r = 5;
bottom_h = 20;

module shape(r, h, offset) {
    hull(){
        translate([-offset,0,0]) cylinder(r=r, h=h);
        translate([offset,0,0]) cylinder(r=r, h=h);
    }
}

module top(){
    difference() {
        shape(top_r, top_h, top_r);
        translate([-top_r,0,-0.01]) cylinder(r=top_r1, h=top_h+0.02);
        translate([top_r,0,-0.01]) cylinder(r=top_r2, h=top_h+0.02);
    }
}

module middle(){
    translate([0,0,-middle_h+0.01])
    difference(){
        shape(top_r, middle_h, top_r);
        translate([0,0,wall_thick+0.01]) shape(top_r1, middle_h-wall_thick, top_r1);
    }
}

module bottom(){
    bottom_wall_thick = 1;
    translate([0,0,-middle_h-bottom_h+0.01])
    difference(){
        cylinder(r=bottom_r, h=bottom_h);
        translate([0,0,-0.01]) cylinder(r=bottom_r-bottom_wall_thick, h=bottom_h+0.02);
    }
}

top();
middle();
bottom();