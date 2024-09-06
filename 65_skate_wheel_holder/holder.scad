/**
 * Martin Egli
 * 2024-09-03
 */
module skater_wheel(col = "LightBlue", loc_res = 32) { 
    color(col) {
        // wheel
        translate([0, 0, -20/2])
        cylinder(d = 70, h = 20, $fn = loc_res);
        translate([0, 0, -24.4/2])
        cylinder(d = 27.5, h = 24.4, $fn = loc_res);
        translate([0, 0, -28/2])
        cylinder(d = 13, h = 28, $fn = loc_res);
        
        // axle
        translate([0, 0, -40/2])
        cylinder(d = 6.3, h = 40, $fn = loc_res);
        // bolt and nut, end stopps
        translate([0, 0, -40/2-4])
        cylinder(d = 12.5, h = 4, $fn = loc_res);
        translate([0, 0, 40/2])
        cylinder(d = 12.5, h = 4, $fn = loc_res);
    }
}

module axle_cut(loc_res = 32) {
    // axle
    translate([0, 0, -40/2])
    cylinder(d = 7, h = 40, $fn = loc_res);
    // bolt and nut, end stopps
    translate([0, 0, -40/2-(4+2)])
    cylinder(d = 14, h = 4+2, $fn = loc_res);
    translate([0, 0, 40/2])
    cylinder(d = 14, h = 4+2, $fn = loc_res);
}

module screw_cut(loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = 10.5, h = 10, $fn = loc_res);
    translate([0, 0, -3.5])
    cylinder(d1 = 5.2, d2 = 10.5, h = 3.5, $fn = loc_res);
    translate([0, 0, -30])
    cylinder(d = 5.2, h = 30, $fn = loc_res);
}

module holder(show_wheel = 1, loc_res = 32) {
    if(show_wheel) {
        skater_wheel(loc_res = 64);
    }
    
    difference() {
        union() {
            hull() {
                // axle holder
                translate([0, 0, -44/2])
                cylinder(d = 20, h = 44, $fn = loc_res);
                // bottom plate
                translate([-56/2, -(72/2)-15, -(44)/2])
                cube([56, 15, 44]);
            }
        }
        // cuts
        axle_cut(loc_res = loc_res);
        // middle space for the wheel
        translate([-72/2, -72/2, -29/2])
        cube([72, 72, 29]);
 
        translate([20, -37, 0])
        rotate([-90, 0, 0])
        screw_cut(loc_res = loc_res);
        translate([-20, -37, 0])
        rotate([-90, 0, 0])
        screw_cut(loc_res = loc_res);
    }
}
holder(0, 64);
