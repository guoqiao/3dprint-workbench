//unit: cm

ceiling_height = 272;
wall_width = 289;
wall_height = 240;

size_a = 7;
size_b = 3.5;

layer_1_z = 60;
layer_2_z = 120;
layer_3_z = 180;

panel_width = 60;
support_length = panel_width - size_b * 2;
echo(support_length=support_length);

shelf_top_extra = size_a; // TODO
shelf_height = layer_3_z + size_a + shelf_top_extra;
echo(shelf_height=shelf_height);

shelf_width = 240;  // good for ply wood 120 x 60

ebox_large_x = 60;
ebox_large_h = 50;
ebox_large_w = 38.5;
ebox_large_z = 128;
ebox_top_z = ebox_large_z + ebox_large_h; // 178

ebox_offset = 92.5;
ebox_w = 33;
ebox_h = 40;
ebox_z = 140;

side_grid_with = 60;
column_1_x = side_grid_with - size_a;
column_2_x = shelf_width - side_grid_with;

module person() {
    color("purple") translate([shelf_width/2, panel_width + 30, 0]) cylinder(r=20, h=165);
}

module layer_1_panel() {
    color("white") translate([0,0,layer_1_z + size_a]) cube([shelf_width, panel_width, 1.6]);
}

module layer_3_panel() {
    color("white") translate([0,0,layer_3_z + size_a]) cube([shelf_width, panel_width, 1.6]);
}

module layer_2_panel_1() {
    color("white") translate([0,0,layer_2_z + size_a]) cube([side_grid_with, panel_width, 1.6]);
}

module layer_2_panel_2() {
    color("white") translate([column_2_x,0,layer_2_z + size_a]) cube([side_grid_with, panel_width, 1.6]);
}

module wall() {
    translate([0,-10,0]) cube([wall_width, 10, wall_height]);
}

module ebox_large() {
    translate([ebox_large_x, 0, ebox_top_z - ebox_large_h]) cube([ebox_large_w, 5, ebox_large_h]);
}

module ebox_small_1() {
    translate([wall_width - ebox_offset - ebox_w, 0, ebox_top_z - ebox_h]) cube([ebox_w, 5, ebox_h]);
}

module ebox_small_2() {
    translate([-(ebox_w+10),0,0]) ebox_small_1();
}

module row(width=shelf_width) {
    cube([width, size_b, size_a]);
}

module rows_back() {
    translate([0, 0, layer_3_z]) row();
    translate([0, 0, layer_2_z]) row();
    translate([0, 0, layer_1_z]) row();
}

module rows_front() {
    translate([0, panel_width-size_b, layer_3_z]) row();
    translate([0, panel_width-size_b, layer_2_z]) row(width=side_grid_with);
    translate([column_2_x, panel_width-size_b, layer_2_z]) row(width=side_grid_with);
    translate([0, panel_width-size_b, layer_1_z]) row();
}

module column() {
    color("red") translate([0, size_b * 2 + support_length]) cube([size_a, size_b, shelf_height]);
}

module columns() {
    column();
    translate([column_1_x, 0, 0]) column();
    translate([column_2_x, 0, 0]) column();
    translate([shelf_width - size_a, 0, 0]) column();
}

module support() {
    translate([0, size_b, layer_1_z]) cube([size_b, support_length, size_a]);
}

module layer_1_supports() {
    support();
}


wall();
//person();

color("white") {
    ebox_large();
    ebox_small_1();
    ebox_small_2();
}

color("blue") rows_back();
color("yellow") rows_front();

columns();
support();
layer_1_panel();
layer_3_panel();
layer_2_panel_1();
layer_2_panel_2();
