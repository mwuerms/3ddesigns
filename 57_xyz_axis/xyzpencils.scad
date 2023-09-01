/**
 * Martin Egli
 * 2023-09-01
 * xyz-axis using pencils
 */

module pencil(col = "Red", len = 20, dia = 7.5, loc_res = 6) {
    color(col)
    translate([0, 0, 0])
    cylinder(d = dia, h = len, $fn = loc_res);
}


module xyzaxis() {
    // x-axis
    translate([15, 0, 0])
    rotate([0, 90, 0])
    pencil("Red", 40);
    // y-axis
    translate([0, 15, 0])
    rotate([0, 90, 90])
    pencil("Green", 40);
    // z-axis
    translate([0, 0, 15])
    rotate([0, 0, 0])
    pencil("Blue", 40);
}

module xyzaxis_holder(loc_res = 32) {
    
    difference() {
        union() {
            // x-axis
            hull() {
                translate([0, 0, 0])
                rotate([0, 90, 0])
                pencil("Red", 10, 13, loc_res);
                translate([0, 0, 0])
                rotate([0, 90, 0])
                pencil("Red", 25, 9.0, loc_res);
            }
            // y-axis
            hull() {
                translate([0, 0, 0])
                rotate([0, 90, 90])
                pencil("Green", 10, 13, loc_res);
                translate([0, 0, 0])
                rotate([0, 90, 90])
                pencil("Green", 25, 9, loc_res);
            }
            // z-axis
            hull() {
                translate([0, 0, 0])
                rotate([0, 0, 0])
                pencil("Blue", 10, 13, loc_res);
                translate([0, 0, 0])
                rotate([0, 0, 0])
                pencil("Blue", 25, 9.0, loc_res);
            }
            translate([0, 0, 0])
            sphere(d = 13, $fn = loc_res);
        }
        // x-axis
        hull() {
            translate([15, 0, 0])
            rotate([0, 90, 0])
            pencil("Red", 40, 7.7);
            translate([5, 0, 0])
            rotate([0, 90, 0])
            pencil("Red", 40, 7.0);
        }
        // y-axis
        hull() {
            translate([0, 15, 0])
            rotate([0, 90, 90])
            pencil("Green", 40, 7.7);
            translate([0, 5, 0])
            rotate([0, 90, 90])
            pencil("Green", 40, 7.0);
        }
        // z-axis
        hull() {
            translate([0, 0, 15])
            rotate([0, 0, 0])
            pencil("Blue", 40, 7.7);
            translate([0, 0, 5])
            rotate([0, 0, 0])
            pencil("Blue", 40, 7.0);
        }
    }
}

*xyzaxis();
xyzaxis_holder(64);
