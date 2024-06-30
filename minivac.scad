/**
 * Martin Egli
 * 2024-04-14
 */

module origin(col = "Red", h1 = 10, loc_res = 4) {
    color(col)
    cylinder(d1 = 0, d2 = 1, h = h1, $fn = loc_res);
}
module button1(show_origin = 1, col = "Green", loc_res = 32) {
    if(show_origin) {
        origin();
    }
    color(col) {
        difference() {
            union() {
                difference() {
                    union() {
                        // button
                        hull() {
                            translate([-1, -14/2, 0])
                            cube([1, 14, 3.5]);
                            translate([-1, -(14-5)/2, 0])
                            cube([1, (14-5), 6]);
                            translate([-(24.7-7), 0, 0])
                            cylinder(d = (14-5), h = 6, $fn = loc_res);
                            translate([-(24.7-7), 0, 0])
                            cylinder(d = 14, h = 3.5, $fn = loc_res);
                        }
                        // main part
                        hull() {
                            translate([-27.5, -18/2, -2.6])
                            cube([4, 18, 2.6]);
                            translate([-29.5, -18/2, -5])
                            cube([2, 18, 2]);
                        }
                        hull() {
                            translate([-29.5, -18/2, -5])
                            cube([2, 18, 2]);
                            translate([-43.5, -18/2, -6])
                            cube([3, 18, 2]);
                        }
                        // latch
                        hull() {
                            translate([-(43.5-2.9), -18/2, -6])
                            cube([0.1, 18, 8]);
                            translate([-43.5, -18/2, -6])
                            cube([3, 18, 7]);
                        }
                        hull() {
                            translate([-(27.5-4), -18/2, -2.6])
                            cube([4, 18, 2.6]);
                            translate([-2, -18/2, -4.4])
                            cube([2, 18, 4.4]);
                        }
                    }

                    // cut out to make part hollow
                    // button
                    translate([0, 0, -2])
                    hull() {
                        translate([-(2+1), -(14-4)/2, -0.5])
                        cube([1, (14-4), 3.5+0.5]);
                        translate([-(2+1), -(14-5-4)/2, -0.5])
                        cube([1, (14-5-4), 6+0.5]);
                        translate([-(24.7-7), 0, -0.5])
                        cylinder(d = (14-5-4), h = 6+0.5, $fn = loc_res);
                        translate([-(24.7-7), 0, -0.5])
                        cylinder(d = 14-4, h = 3.5+0.5, $fn = loc_res);
                    }
                    // main body
                    translate([-(27.5-2), -(18-4)/2, -6])
                    cube([(27.5-4), (18-4), 4]);
                }
                // spring holder, measured d = 12.4 -> 0.8 mm wall thickness, not enough -> 1 mm
                translate([-(24-12.4/2),0,-6])
                cylinder(d = (10.8+2), h = 10, $fn = loc_res*2);
            }
            // spring holder bore: 10.8 mm
            translate([-(24-12.4/2),0,-(6+1)])
            cylinder(d = 10.8, h = 10+1, $fn = loc_res*2);
        }
        // pivot at the back
        translate([7, -23.8/2, -(11-3/2)])
        rotate([-90, 0, 0])
        // with temper
        hull() {
            translate([0, 0, +0.4])
            cylinder(d = 3, h = 23.0, $fn = loc_res*2);
            translate([0, 0, +0.0])
            cylinder(d = 2.2, h = 23.8, $fn = loc_res*2);
        }
        // connect to pivot
        hull() {
            translate([-3, -12/2, -3])
            cube([3, 12, 3]);
            translate([-3/2, -12/2, -4.4])
            rotate([-90, 0, 0])
            cylinder(d = 3, h = 12, $fn = loc_res);
        }
        hull() {
            translate([-3/2, -12/2, -4.4])
            rotate([-90, 0, 0])
            cylinder(d = 3, h = 12, $fn = loc_res);
            translate([7, -12/2, -(11-3/2)])
            rotate([-90, 0, 0])
            cylinder(d = 3, h = 12, $fn = loc_res);
        }
    }
}

button1();
//button1(0, "LightBlue", 64); // print 1x