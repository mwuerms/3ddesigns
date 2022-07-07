/**
 * Martin Egli
 *  2022-05-25
 * glass holder for closet door thingy
 */

module holder_part(loc_res = 64) {
    union() {
        hull() {
            translate([0, 0, 2])
            cylinder(d = 15-4, h = 5-4, $fn = loc_res);
            translate([16, 0, 2])
            cylinder(d = 7.5-4, h = 5-4, $fn = loc_res);
        }
        translate([16, 0, 5-2])
        cylinder(d = 7.5-4, h = 4, $fn = loc_res);
    }
}

module holder1(loc_res = 64) {
    difference() {
        minkowski() {
            holder_part();
            sphere(d = 2, $fn = loc_res);
        }
        union() {
            translate([0, 0, -1])
            cylinder(d = 8, h = 1, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d1 = 8, d2 = 3.5, h = 3, $fn = loc_res);
            translate([0, 0, -1])
            cylinder(d = 3.5, h = 10, $fn = loc_res);
        }
    }    
}

holder1();
