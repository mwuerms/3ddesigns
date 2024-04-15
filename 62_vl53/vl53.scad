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

module vl53l1xSensorCover(th1 = 1.6+0.4, loc_res = 32*4*2) {
    difference() {
        cylinder(d = 30, h = th1, $fn = loc_res);
        vl53l1xSensorCut();
        translate([-10, -10, 1])
        linear_extrude(10)
        text("0.4 mm", size = 4);
    }
}
*vl53l1xSensorPCB();

vl53l1xSensorCover(); // print 1 x
