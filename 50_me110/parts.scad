/**
 * Martin Egli
 * 2022-10-30
 * 12 cm ventilator to suck solder fumes
 */

module vent12cm(col = "Gray", loc_res = 32) {
    distxy = (110+100.5)/2;
    distxy2 = distxy/2;

    color(col) {
        difference() {
            union() {    
                hull() {
                    translate([+distxy2, +distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                    translate([+distxy2, -distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                    translate([-distxy2, +distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                    translate([-distxy2, -distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                }
            }
            // M4 holes
            translate([+distxy2, +distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            translate([+distxy2, -distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            translate([-distxy2, +distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            translate([-distxy2, -distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            // center hole for vent
            translate([0, 0, -1])
            cylinder(d=120-2-2, h=25+2, $fn = loc_res);
        }
        translate([0, 0, 0])
        cylinder(d=40, h=4, $fn = loc_res);
        translate([0, 0, 5])
        cylinder(d=40, h=20, $fn = loc_res);

        r1 = (20-2);
        for(n=[0:1:3]) {
            hull() {
                translate([r1*sin(n*90+45), r1*cos(n*90+45), 0])
                cylinder(d=4, h=4, $fn = loc_res);
                translate([r1*sin(n*90+45)+64*sin(n*90+(45+90)), r1*cos(n*90+45)+64*cos(n*90+(45+90)), 0])
                cylinder(d=4, h=4, $fn = loc_res);
            }
        }
    }
}

module filter(col = "Gray", loc_res = 32) {
    color(col)
    translate([-130/2, -130/2, 0])
    cube([130, 130, 11]);
}