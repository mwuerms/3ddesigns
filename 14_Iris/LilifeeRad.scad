/**
 * Martin & Iris Egli
 * 2021-10-03
 * Rad für Lilifee-Kutsche
 */
res = 32;
difference() {
    translate([0, 0, 0])
    cylinder(d = 21, h = 8, $fn = res);
    translate([0, 0, -1])
    cylinder(d = 2, h = 10, $fn = res);
}
