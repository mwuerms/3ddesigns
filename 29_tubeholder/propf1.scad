/**
 * Martin Egli
 * 2022-05-27
 * to close a PET bottle
 */

module pfropf1(loc_res = 64) {
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 30, h = 4, $fn = loc_res);
            translate([0, 0, 4])
            cylinder(d1 = 21+1.5, d2= 21-1.5, h = 15, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 7.7, h = 30, $fn = loc_res);
    }
}


pfropf1();