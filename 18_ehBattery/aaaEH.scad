/**
 * Martin Egli
 * 2021-11-12
 */

module aaaBattery(loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = 10.5, h = 43, $fn = loc_res);
    translate([0, 0, 43])
    cylinder(d = 4, h = 1, $fn = loc_res);
}

module magnetS0608N(loc_res = 32) {
    color("Silver")
    translate([0, 0, 0])
    cylinder(d = 6, h = 8, $fn = loc_res);
}

module ehPartA(loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 2])
            cylinder(d = 6.2+1, h = 43-4, $fn = loc_res);
            translate([0, 0, 2])
            cylinder(d = 10, h = (43-10)/2-2, $fn = loc_res);
            translate([0, 0, 2+(43-10)/2+10-2])
            cylinder(d = 10, h = (43-10)/2-2, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 6.2, h = 45, $fn = loc_res);
        translate([10/2-0.5, -0.5, -1])
        cube([1, 1, 45]);
    }
}

module ehPartB(loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = 10, h = 2, $fn = loc_res);
}
//aaaBattery();
//magnetS0608N();
ehPartA(128);
//ehPartB(128);
