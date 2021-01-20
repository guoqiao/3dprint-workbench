
$fn=100;

width = 150;
height = 50;
thick = 1;
delta = 0.01;
hole_distance = 130;
text_left_offset = 14;
text_bottom_offset = 10;

module hole(){
    cylinder(r=2,h=thick+2*delta);
}

module holes() {
    hole();
    translate([hole_distance, 0, 0]) hole();
}

module number(){
    translate([text_left_offset,text_bottom_offset,-delta]) linear_extrude(thick*3) {
        text("37",font="CrashNumberingGothic:style=bold", size=32);
    }

}

module street(){
    color("yellow") translate([text_left_offset,text_bottom_offset,2]) linear_extrude(thick) {
        translate([44,0]) text("Craigs Way",font="Plat Nomor", size=14);
    }
}

module plate(){
    minkowski(){
        sphere(r=1);
        cube([width, height, thick]);
    }

}

difference(){
    union(){
        plate();
        street();
    }
    #number();
    translate([10,45,-delta]) holes();
}