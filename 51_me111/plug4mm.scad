
/**
 * Martin Egli
 * 2022-11-01
 */

module plug4mm(loc_res = 32) {
    color("Silver")
    translate([0, 0, -4])
    cylinder(d = 4, h = 4, $fn = loc_res);
    color("Red")
    translate([0, 0, 0])
    cylinder(d1 = 7, d2 = 8, h = 24, $fn = loc_res);
}

module plug4mm_cut(loc_res = 32) {
    translate([0, 0, -4])
    cylinder(d = 4.4, h = 4, $fn = loc_res);
    translate([0, 0, 0])
    cylinder(d1 = 7.2, d2 = 8.2, h = 24, $fn = loc_res);
}

module plug4mm_holder(loc_res = 32) {
    difference() {
        hull() {
            translate([0, +10, -2])
            cylinder(d = 12, h = 8, $fn = loc_res);
            translate([0, -10, -2])
            cylinder(d = 12, h = 8, $fn = loc_res);
        }
        translate([0, +10, 0])
        plug4mm_cut(loc_res);
        translate([0, -10, 0])
        plug4mm_cut(loc_res);
    }
}

// print
plug4mm_holder(64); // 1x

