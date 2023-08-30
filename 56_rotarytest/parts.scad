/**
 * Martin Egli
 * 2023-08-29
 */

// PEC12R-2220F-S0024
module pec12r_pcbcut(hi1 = 3, loc_res = 32) {
    // 1
    translate([-2.5, 7, 0])
    cylinder(d = 1, h = hi1, $fn = loc_res);
    // 2
    translate([+2.5, 7, 0])
    cylinder(d = 1, h = hi1, $fn = loc_res);
    // A
    translate([-2.5, -7, 0])
    cylinder(d = 1, h = hi1, $fn = loc_res);
    // B
    translate([0, -7, 0])
    cylinder(d = 1, h = hi1, $fn = loc_res);
    // C
    translate([+2.5, -7, 0])
    cylinder(d = 1, h = hi1, $fn = loc_res);
    // case shield
    translate([-13.2/2, 0, 0])
    cylinder(d = 2.5, h = hi1, $fn = loc_res);
    // case shield
    translate([+13.2/2, 0, 0])
    cylinder(d = 2.5, h = hi1, $fn = loc_res);
}
module pec12r(show_cutout = 1, loc_res = 32) {
    if(show_cutout) {
        translate([0, 0, -2])
        pec12r_pcbcut(hi1 = 2);
    }
    color("DarkGray")
    translate([-12.4/2, -13.4/2, 0])
    cube([12.4, 13.4, 6.0]);
    color("LightGray")
    translate([-12.4/2, -13.4/2, 6.0])
    cube([12.4, 13.4, 0.1]);
    color("DarkGray")
    translate([0, 0, 6.0])
    cylinder(d = 7, h = 2, $fn = loc_res);
    color("DarkGray")
    translate([0, 0, 0])
    cylinder(d = 6, h = 15, $fn = loc_res);
}

module en12hs_cutout(hi1 = 3, loc_res = 32) {
    pec12r_pcbcut(hi1, loc_res);
}

// EN12-HS11AF18
module en12hs(show_cutout = 1, loc_res = 32) {
    if(show_cutout) {
        translate([0, 0, -2])
        en12hs_cutout(hi1 = 2);
    }
    color("LightGreen")
    translate([-12.4/2, -13.4/2, 0])
    cube([12.4, 13.4, 5.9]);
    color("LightGray")
    translate([-12.4/2, -13.4/2, 5.9])
    cube([12.4, 13.4, 0.1]);
    color("LightGray")
    translate([0, 0, 6.0])
    cylinder(d = 7, h = 5, $fn = loc_res);
    color("DarkGray")
    difference() {
        hull() {
            translate([0, 0, 0])
            cylinder(d = 6, h = 17.5, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d = 5.5, h = 18, $fn = loc_res);
        }
        translate([1.5, -3, 18-5])
        cube([6, 6, 6]);
    }
}
en12hs();

module led0505(loc_res = 32) {
    difference() {
        union() {
            color("White")
            translate([-5/2, -5/2, 0])
            cube([5, 5, 1.6]);
            color("Gray")
            translate([0, 0, 1.5])
            cylinder(d = 4, h = 0.2, $fn = loc_res);
        }
        translate([5/2, -5/2-1.5, 1.6-0.2])
        rotate([0, 0, 45])
        cube([2, 2, 0.3]);
    }
}

module ledWS2812B(loc_res = 32) {
    led0505(loc_res);
}

module ledSK6812(loc_res = 32) {
    led0505(loc_res);
}