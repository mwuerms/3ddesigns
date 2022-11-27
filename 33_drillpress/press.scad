/**
 * Martin Egli
 * 2022-08-12
 */

module drill_holder_cut(loc_res = 32) {
    translate([0, 0, -6])
    cylinder(d = 49, h = 6, $fn = loc_res);
    translate([0, 0, 0])
    cylinder(d2 = 53, d1 = 49, h = 30, $fn = loc_res);
    translate([0, 0, 30])
    cylinder(d = 53, h = 6, $fn = loc_res);
    
    translate([-55/2, -7, 30-9])
    cube([55, 14, 9+6]);
}

difference() {
    translate([0, 0, 10])
    cylinder(d = 53+10, h = 20, $fn = loc_res);
    drill_holder_cut();
    translate([-0.5, 23, -6])
    cube([1, 10, 42]);
}
