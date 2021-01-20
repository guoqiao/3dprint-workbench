PI=3.141592653589793;

module t(v){translate(v) children();}
module tx(n){translate([n,0,0]) children();}
module ty(n){translate([0,n,0]) children();}
module tz(n){translate([0,0,n]) children();}


module r(v){rotate(v) children();}
module rx(n){rotate([n,0,0]) children();}
module ry(n){rotate([0,n,0]) children();}
module rz(n){rotate([0,0,n]) children();}


module Pipe(h,R,r,center=true){
    difference(){
        cylinder(h=h,r=R,center=center);
        tz(-0.01) cylinder(h=h+0.02,r=r,center=center);
    }
}
