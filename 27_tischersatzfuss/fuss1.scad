/**
 * Martin Egli
 * Tisch Fuss
 */

module fuss1(ra1 = 5, hi1 = 13, loc_res = 32) {
    ra2 = ra1 + 2;
    hi2 = hi1 + 3;
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(r = ra2, h = hi2, $fn = loc_res);
            translate([30, 0, 0])
            cylinder(r = ra2, h = hi2, $fn = loc_res);
            translate([0, 30, 0])
            cylinder(r = ra2, h = hi2, $fn = loc_res);
        }
        translate([0, 0, hi1])
        hull() {
            translate([0, 0, 0])
            cylinder(r = ra1, h = hi1, $fn = loc_res);
            translate([30, 0, 0])
            cylinder(r = ra1, h = hi1, $fn = loc_res);
            translate([0, 30, 0])
            cylinder(r = ra1, h = hi1, $fn = loc_res);
        }
    }
}
fuss1();
