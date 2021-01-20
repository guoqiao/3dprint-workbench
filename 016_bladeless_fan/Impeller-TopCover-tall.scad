$fn=100;

d_inner = 65.40;
r_inner = d_inner/2;
wall_thick = 2.10;
r_outer = r_inner + wall_thick;

depth = 33;


module TopCover() {
    import("Impeller-TopCover.STL");
}

module Bottom() {
    translate([0,-12,0])
    scale([1,2.5,1])
    difference() {
        TopCover();
        translate([0,8,0]) cube([100, 100,100]);
    }
}

TopCover();
Bottom();