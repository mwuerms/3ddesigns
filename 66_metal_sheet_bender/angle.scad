/**
 * Martin Egli
 * 2024-09-17
 */

module angle_stop(ang = 30, loc_res = 32) {
    r1 = 0.5;
    r2 = 30;
    r3 = 6;
    h1 = 20;
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(r = r1, h = h1, $fn = loc_res);
            translate([r2*cos(0), r2*sin(0), 0])
            cylinder(r = r1, h = h1, $fn = loc_res);
            translate([r2*cos(ang), r2*sin(ang), 0])
            cylinder(r = r1, h = h1, $fn = loc_res);
        }

        translate([3/4*r2*cos(ang/2), 3/4*r2*sin(ang/2), -1])
        cylinder(r = 1/7*r2, h = h1+2, $fn = loc_res);
    }
}
*angle_stop(ang = 30, loc_res = 64);
angle_stop(ang = 25, loc_res = 64);
