/**
 * Martin Egli
 * 2021-12-04
 * vibra alarm 2
 */
use <parts.scad>
use <../lib/m3screw.scad>

module elementsPutTogether() {
    translate([46, 0, 12])
    rotate([0, 180, 0])
    battery();
    translate([0, 1.5, 0])
    chargerPCB();
    translate([12, 0, 12])
    arduinoMicroProPCB();
    translate([10, -3, 21-1])
    displayPCB();
    translate([60, 3, 12])
    rotate([0, 0, 90])
    switch();
    translate([35, 11.5, 0])
    vibraMotor();
}

module elementsCut(loc_res = 32) {
    difference() {
        union() {
            // battery up to display
            translate([-1, -3, 3])
            cube([46+17, 22+6, 19]);
            // charger
            translate([-1, 1, 0])
            cube([26, 20, 4]);
            // micro USB
            hull() {
                translate([-5, 8, 2.5])
                rotate([0, 90, 0])
                cylinder(d = 4, h = 10, $fn = loc_res);
                translate([-5, 8+6.5, 2.5])
                rotate([0, 90, 0])
                cylinder(d = 4, h = 10, $fn = loc_res);
            }
            // display window
            translate([10-0.25, 1+0.25, 21])
            cube([27.5,19.5,5]);
            
            // switch cutout
            translate([60-13.3, 3-0.8, 8])
            cube([13.3, 18.6, 20]);
            translate([60-13.5+4, 3-2, 8])
            cube([6, 21, 20]);
            // vibra motor
            translate([32, 11.5, 0])
            cylinder(d = 12, h = 4, $fn = 32);
            translate([32, 5.5, 0])
            cube([18, 12, 4]);
            translate([50, 11.5, 0])
            cylinder(d = 12, h = 4, $fn = 32);
        }
    }
}

module case1(part = 0, loc_res = 32) {
    redge = 4;
    difference() {
        union() {
            difference() {
                union() {
                    hull() {
                        translate([0, -4, 0])
                        sphere(r = redge, $fn = loc_res);
                        translate([0, -4, 20])
                        sphere(r = redge, $fn = loc_res);
                        translate([63, -4, 0])
                        sphere(r = redge, $fn = loc_res);
                        translate([63, -4, 20])
                        sphere(r = redge, $fn = loc_res);
                        translate([0, 27, 0])
                        sphere(r = redge, $fn = loc_res);
                        translate([0, 27, 20])
                        sphere(r = redge, $fn = loc_res);
                        translate([63, 27, 0])
                        sphere(r = redge, $fn = loc_res);
                        translate([63, 27, 20])
                        sphere(r = redge, $fn = loc_res);
                    }
                    difference() {
                        hull() {
                            translate([63, -4, 0])
                            sphere(r = redge, $fn = loc_res);
                            translate([63, 27, 0])
                            sphere(r = redge, $fn = loc_res);
                            translate([78, -0, 0])
                            sphere(r = redge, $fn = loc_res);
                            translate([78, 23, 0])
                            sphere(r = redge, $fn = loc_res);
                        }
                        hull() {
                            translate([63+8.5, 5, -5])
                            cylinder(d = 9, h = 10, $fn = loc_res);
                            translate([63+8.5, 18, -5])
                            cylinder(d = 9, h = 10, $fn = loc_res);
                        }
                    }
                }
                elementsCut();
            }
            translate([2, -2, 0])
            cylinder(d = 4.5, h = 24, $fn = 32);
            translate([2, 24, 0])
            cylinder(d = 4.5, h = 24, $fn = 32);
            translate([60, -2, 0])
            cylinder(d = 4.5, h = 24, $fn = 32);
            translate([60, 24, 0])
            cylinder(d = 4.5, h = 24, $fn = 32);
        }
        translate([2, -2, 5]) {
            rotate([180, 0, 0])
            m3ScrewSinkHeadCut(7);
            cylinder(d = 2.5, h = 15, $fn = loc_res);
        }
        translate([2, 24, 5]){
            rotate([180, 0, 0])
            m3ScrewSinkHeadCut(7);
            cylinder(d = 2.5, h = 15, $fn = loc_res);
        }
        translate([60, -2, 5]){
            rotate([180, 0, 0])
            m3ScrewSinkHeadCut(7);
            cylinder(d = 2.5, h = 15, $fn = loc_res);
        }
        translate([60, 24, 5]){
            rotate([180, 0, 0])
            m3ScrewSinkHeadCut(7);
            cylinder(d = 2.5, h = 15, $fn = loc_res);
        }
                
        if(part == 1) {
            translate([-10, -10, -20])
            cube([100, 50, 24]);
        }
        else if(part == 0) {
            translate([-10, -10, 4])
            cube([100, 50, 50]);
        }
        //translate([-5, -10, -5])
        //cube([11, 50, 50]);
    }
}
case1(1, 32);
//elementsPutTogether();
//elementsCut();
