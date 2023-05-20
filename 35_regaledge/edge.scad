/**
 * Martin Egli
 * 2023-05-16
 */

module edge(loc_res = 32, th1 = 2, th2 = 4) {
    difference() {
        union() {
            hull() {
                translate([-12, 0, 12])
                rotate([90, 0, 0])
                cylinder(d = 5, h = th1, $fn = loc_res);
                translate([-12, 0, -24])
                rotate([90, 0, 0])
                cylinder(d = 5, h = th1, $fn = loc_res);
                translate([-6, 0, -24])
                rotate([90, 0, 0])
                cylinder(d = 5, h = th1, $fn = loc_res);
                translate([24, 0, 12])
                rotate([90, 0, 0])
                cylinder(d = 5, h = th1, $fn = loc_res);
                translate([24, 0, 6])
                rotate([90, 0, 0])
                cylinder(d = 5, h = th1, $fn = loc_res);
            }
            hull() {
                translate([-5.5, th2, 13.5])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
                translate([23.5, th2, 13.5])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
            }
            hull() {
                translate([8, th2, 13.5-6-2])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
                translate([23.5, th2, 13.5-6-2])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
            }            
            hull() {
                translate([-13.5, th2, 5.5])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
                translate([-13.5, th2, -23.5])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
            }
            hull() {
                translate([-(13.5-6-2), th2, -8])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
                translate([-(13.5-6-2), th2, -23.5])
                rotate([90, 0, 0])
                cylinder(d = 2, h = th2, $fn = loc_res);
            }
        }
    
    
        union() {
            translate([0, 5, 0])
            rotate([90, 0, 0])
            cylinder(d = 2.5, h = 10, $fn = loc_res);
            translate([0, -(th1-2.1), 0])
            rotate([90, 0, 0])
            cylinder(d1 = 2.5, d2 = 6.5, h = 2.2, $fn = loc_res);
        }
        
    }
}

module puttogether(loc_res = 32) {
    translate([-13/2, 0, -13/2]) {
        color("Red")
        translate([-6, 0, -20])
        cube([6, 20, 50]);
        
        color("Blue")
        translate([0, 0, 13])
        cube([40, 20, 6]);
        
        color("Green")
        cube([13, 20, 13]);
    }
    edge(loc_res);
}

*puttogether();
edge(128);
