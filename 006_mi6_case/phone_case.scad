$fn = 10;

phone_height = 145.17;
phone_width = 70.49;
phone_thickness = 7.45;
phone_corner_radis = 10;

module mycylinder(){
    color("red") cylinder(d=2,h=2);
}

module mycube(){
    color("yellow") cube([10,10,10]);
}

minkowski(){
    mycylinder();
    mycube();
}