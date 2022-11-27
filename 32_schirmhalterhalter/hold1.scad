/**
 * Martin Egli
 * 2022-08-03
 */

loc_res = 32;
translate([0, 0, 0])
cylinder(d = 5, h = 20, $fn = loc_res);
translate([0, 0, 0])
cylinder(d = 10, h = 11, $fn = loc_res);
hull() {
    translate([0, 0, 0])
    cylinder(d = 10, h = 3, $fn = loc_res);
    translate([40, 0, 0])
    cylinder(d = 10, h = 3, $fn = loc_res);
}
hull() {
    translate([40, 0, 0])
    cylinder(d = 10, h = 3, $fn = loc_res);
    translate([40, 40, 0])
    cylinder(d = 10, h = 3, $fn = loc_res);
}
