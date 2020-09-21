//unit: cm

size_a = 7;
size_b = 3.5;

panel_width = 76;
support_length = panel_width - size_b * 2;

ceiling_height = 272;
wall_width = 289;
wall_height = 240;

shelf_height = 230;  //?
shelf_width = 270;  //?
left_offset = 200;
bottom_row_height = 70;


ebox_large_x = 60;
ebox_large_h = 50;
ebox_large_w = 38.5;
ebox_large_z = 128;
ebox_top_z = ebox_large_z + ebox_large_h; // 178

ebox_offset = 92.5;
ebox_w = 33;
ebox_h = 40;

column_left_offset = 80;
column_right_offset = ebox_large_x - size_a;

module person() {
    color("purple") translate([shelf_width/2, panel_width + 30, 0]) cylinder(r=20, h=165);
}

module wall() {
    translate([0,-10,0]) cube([wall_width, 10, wall_height]);
}

module door() {
    color("white") translate([0,0,bottom_row_height+size_a]) cube([200, 76, 3.5]);
}

module ebox_large() {
    color("yellow") translate([ebox_large_x, 0, ebox_top_z - ebox_large_h]) cube([ebox_large_w, 5, ebox_large_h]);
}

module ebox_small_1() {
    color("yellow") translate([wall_width - ebox_offset - ebox_w, 0, ebox_top_z - ebox_h]) cube([ebox_w, 5, ebox_h]);
}

module ebox_small_2() {
    translate([-(ebox_w+10),0,0]) ebox_small_1();
}

module row(width=shelf_width) {
    color("blue") cube([width, size_b, size_a]);
}

module rows_back() {
    translate([0, 0, shelf_height - size_a]) row();
    translate([0, 0, ebox_large_z + ebox_large_h]) row();
    translate([0, 0, ebox_large_z - size_a - 3]) row(); // panel thickness 2
    translate([0, 0, bottom_row_height]) row();
}

module rows_front() {
    color("green") translate([0, size_b + support_length, 0]) rows_back();
}

module column() {
    color("red") translate([0, size_b * 2 + support_length]) cube([size_a, size_b, shelf_height]);
}

module columns() {
    column();
    translate([ebox_large_x - size_a, 0, 0]) column();
    translate([shelf_width - column_left_offset, 0, 0]) column();
    translate([shelf_width - size_a, 0, 0]) column();
}

wall();
// person();

ebox_large();
ebox_small_1();
ebox_small_2();
rows_back();

rows_front();
door();
columns();
