$fa = 1;
$fs = 1;
//$fn=50;

// Ball-and-socket joint for an articulated mirror stuck to a wall

part = "makeBoth"; // [makeBall:Ball,makeSocket:Socket,makeBoth:Both,assembled:Assembled]

// Diameter of Ball
ballSize = 15;

// Oversize for Socket
ballSlop = 1;

// Thickness of socket walls
socketThickness = 2.5;

// Thickness of Flange
flangeThickness = 2.5;

// Diameter of Flange
flangeDiameter = 40;

// Length of neck extension
neckLength = 11.5;

module ball()
{
    sphere(d=ballSize);
}

module socket()
{
    difference()
    {
        translate([0,0,flangeThickness+neckLength-ballSize*.25]) sphere(d=ballSize+(socketThickness*2));

        // cut off top of ball
        translate([0,0,flangeThickness+neckLength]) cylinder(d=2*ballSize,h=2*ballSize);

        // add socket hole
        translate([0,0,flangeThickness+neckLength-ballSize*.25]) sphere(d=ballSize+ballSlop);

        // second sphere to bevel the lip
        translate([0,0,flangeThickness+neckLength+ballSize*.15]) sphere(d=ballSize+ballSlop);

        // make sure bottom stays flat
        translate([0,0,-flangeDiameter]) cube(flangeDiameter*2,center=true);
    }
}

// ball();
socket();
