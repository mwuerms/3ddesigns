/**
 * Martin Egli
 * 2024-09-07
 */
module axle_cut(loc_res = 32) {
    color("Red") {
        translate([0, 0, -2])
        cylinder(d = 14, h = 4+2, $fn = loc_res);
        translate([0, 0, -2])
        cylinder(d = 7, h = 40+2, $fn = loc_res);
    }
}

module screw_cut(loc_res = 32) {
    translate([0, 0, -10])
    cylinder(d = 8, h = 10, $fn = loc_res);
    translate([0, 0, 0])
    cylinder(d1 = 8, d2 = 3.8, h = 3, $fn = loc_res);
    translate([0, 0, 0])
    cylinder(d = 3.8, h = 20, $fn = loc_res);
}
*screw_cut();

module bender1(col = "Green", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 28, h = 8, $fn = loc_res);
            
            translate([1, -15, 0])
            cube([70, 15, 8]);
            
            translate([15, 0, -(20-8)])
            cube([71-15, 2, 20]);
            translate([0, -15, 0])
            cube([20, 17, 8]);
        }    
        // cut
        axle_cut(loc_res = loc_res);
        // 3.5 mm holes
        translate([20, -7, 7])
        rotate([180, 0, 0])
        screw_cut(loc_res = loc_res);
        translate([40, -7, 7])
        rotate([180, 0, 0])
        screw_cut(loc_res = loc_res);
        translate([60, -7, 7])
        rotate([180, 0, 0])
        screw_cut(loc_res = loc_res);
    }
}

module bender2(col = "blue", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 8.2])
            cylinder(d = 30, h = 8, $fn = loc_res);
            
            translate([-(71), -15, 0])
            cube([70-14, 15, 8+8.2]);
            
            translate([-(71), 0, -(20-8)])
            cube([71-15, 2, 20+8.2]);
            translate([-20, -15, 8.2])
            cube([20, 17, 8]);
        }    
        // cut
        axle_cut(loc_res = loc_res);
        // 3.5 mm holes
        translate([-20, -7, 7])
        rotate([180, 0, 0])
        screw_cut(loc_res = loc_res);
        translate([-40, -7, 7])
        rotate([180, 0, 0])
        screw_cut(loc_res = loc_res);
        translate([-60, -7, 7])
        rotate([180, 0, 0])
        screw_cut(loc_res = loc_res);
    }
}
module puttogether(loc_res = 32) {
    *rotate([90, 0, 0])
    axle_cut(loc_res = loc_res);
    
    *color("LightBlue")
    translate([0, 0, -20])
    cube([100, 100, 20]);
    *color("LightGreen")
    translate([-100, 0, -20])
    cube([100, 100, 20]);
    
    translate([0, 0, 0])
    rotate([90, 0, 0])
    bender1();
    translate([0, 0, 0])
    rotate([90, 0, 0])
    bender2();
    
}
*puttogether();

// print parts
bender1(loc_res = 128); // 1 x
*bender2(loc_res = 128); // 1 x

*mirror([0, 0, 1])
bender1(loc_res = 128); // 1 x mirrored
*mirror([0, 0, 1])
bender2(loc_res = 128); // 1 x mirrored