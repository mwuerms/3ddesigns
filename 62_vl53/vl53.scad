/**
 * Martin Egli
 * 2024-04-15
 */
module vl53l1xSensorPCB(loc_res = 32) {
    //sensor
    color("Gray")
    translate([-5/2, -2.5/2, 0])
    cube([5.0, 2.5, 1.55]);
    translate([-3/2-1/2, -2/2, 1.55])
    cube([1.0, 2.0, 0.05]);
    translate([+3/2-1/2, -2/2, 1.55])
    cube([1.0, 2.0, 0.05]);
    // pcb 14 x 10 x 1.6 mm
    color("Green")
    translate([-14/2, -10/2, -1.6])
    cube([14, 10, 1.6]);
}

module vl53l1xSensorCut(loc_res = 32) {
    translate([-5.2/2, -2.7/2, -1])
    cube([5.2, 2.7, 1.6+1]);
    translate([-5.2/2, -2.7/2, -1])
    cylinder(d = 1, h = 1.6+1, $fn = loc_res);
    translate([-5.2/2, +2.7/2, -1])
    cylinder(d = 1, h = 1.6+1, $fn = loc_res);
    translate([+5.2/2, -2.7/2, -1])
    cylinder(d = 1, h = 1.6+1, $fn = loc_res);
    translate([+5.2/2, +2.7/2, -1])
    cylinder(d = 1, h = 1.6+1, $fn = loc_res);
    // windows
    translate([-3/2-1.8/2, -1.9/2, 1.5])
    cube([1.8, 1.9, 4]);
    translate([+3/2-1.8/2, -1.9/2, 1.5])
    cube([1.8, 1.9, 4]);
}

module vl53l1xSensorCut_J5050(loc_res = 32) {
    vl53l1xSensorCut();
    // J5050 is 14 x 10.5, X-axis centered, but y-axis NOT centred
    // cut 14.2 x 12 mm centered piece
    translate([-14.2/2, -12.2/2, -3])
    cube([14.2, 12.2, 3]);
    // edges
    translate([-14.2/2, -12.2/2, -3])
    cylinder(d = 1, h = 3, $fn = loc_res);
    translate([-14.2/2, +12.2/2, -3])
    cylinder(d = 1, h = 3, $fn = loc_res);
    translate([+14.2/2, -12.2/2, -3])
    cylinder(d = 1, h = 3, $fn = loc_res);
    translate([+14.2/2, +12.2/2, -3])
    cylinder(d = 1, h = 3, $fn = loc_res);
}

module vl53l1xSensorCover_1_1(th1 = 1.6+0.2, loc_res = 32*4*2) {
    difference() {
        translate([0, 0, -2])
        cylinder(d = 30, h = th1+2, $fn = loc_res);
        vl53l1xSensorCut_J5050();
        translate([-10, -10, th1-0.2])
        linear_extrude(10)
        text("0.2 mm", size = 4);
    }
}
module glas1_5_220adapter(th2 = 2, loc_res = 32*16) {
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 30, h = th2, $fn = loc_res);
            hull() {
                translate([0, 0, 0])
                cylinder(d = 10, h = th2, $fn = loc_res);
                translate([-30, 0, 0])
                cylinder(d = 10, h = th2, $fn = loc_res);
            }
        }
        translate([0, 0, -1])
        cylinder(d = 22.5, h = th2+2, $fn = loc_res);
    }
}
vl53l1xSensorPCB();
*glas1_5_220adapter(); // print 2 x
vl53l1xSensorCover_1_1();  // print 1 x
