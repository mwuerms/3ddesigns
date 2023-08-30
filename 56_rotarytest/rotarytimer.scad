/**
 * Martin Egli
 * 2023-08-29
 */
use <parts.scad>

// - pcbs, electronics ------------------------------------

// lower pcb, holding LEDs
module pcb01(show_components = 1, pcb_th = 1, loc_res = 32) {
    color("Green") {
        difference() {
            translate([0, 0, 0])
            cylinder(d = 46, h = pcb_th, $fn = loc_res);
            translate([0, 0, -1])
            cylinder(d = 7.5, h = pcb_th+2, $fn = loc_res);
        }
    }
    if(show_components) {
        nb_steps = 9;
        for(n = [0:1:nb_steps-1]) {
            translate([20*cos(n*360/nb_steps), 20*sin(n*360/nb_steps), 0])
            rotate([180, 0, n*360/nb_steps])
            ledSK6812();
        }
    }
}

/** middle pcb, holding 
 *  + buttons, sensorschalter
 *  + usb connector
 *  + MCU
 *  + battery
 */
module pcb02(show_components = 1, pcb_th = 1, loc_res = 32) {
    color("Green") {
        difference() {
            translate([0, 0, 0])
            cylinder(d = 46, h = pcb_th, $fn = loc_res);
            translate([0, 0, -1])
            en12hs_cutout(4);
        }
    }
    if(show_components) {
        // taster
        translate([18, -5/2, -5])
        cube([5, 5, 5]);
    }
}

// - 3d printing ---------------------------------
module partA_bottom(loc_res = 32, outer_res = 16) {
    difference() {
        union() {
            // middle mounting hole
            translate([0, 0, 1])
            difference() {
                translate([0, 0, -1])
                cylinder(d = 9, h = 4, $fn = loc_res);
                // middle cut out
                difference() {
                    translate([0, 0, -2])
                    cylinder(d = 6.4, h = 6, $fn = loc_res);
                    translate([1.5, -3, -3])
                    cube([6, 6, 8]);
                }
            }
            difference() {
                hull() {
                    translate([0, 0, -1])
                    cylinder(d = 48, h = 1, $fn = outer_res);
                    translate([0, 0, 0])
                    cylinder(d = 50, h = 6, $fn = outer_res);
                }
                translate([0, 0, 1])
                hull() {
                    translate([0, 0, -1])
                    cylinder(d = 48-2, h = 1, $fn = loc_res);
                    translate([0, 0, 0])
                    cylinder(d = 50-2, h = 6, $fn = loc_res);
                }
            }
        }
        // look inside
        *translate([0, 0, -10])
        cube(40);
    }
}

module partB_top(loc_res = 32, outer_res = 16) {
    difference() {
        // hull
        union() {
            difference() {
                hull() {
                    translate([0, 0, 1])
                    cylinder(d = 45, h = 1, $fn = outer_res);
                    translate([0, 0, -11.5])
                    cylinder(d = 50, h = 12.5, $fn = outer_res);
                }
                translate([0, 0, -1])
                hull() {
                    translate([0, 0, 1])
                    cylinder(d = 48-2, h = 1, $fn = outer_res);
                    translate([0, 0, -11.5])
                    cylinder(d = 50-2, h = 12.5, $fn = outer_res);
                }
            }
        }
        // display hole, from oled1_28ZollRound --> 32.5 mm hole
        translate([0, 0, 0])
        cylinder(d = 32.5, h = 3, $fn = loc_res);
        
        // usb connector
        hull() {
            translate([23, -2, -(10+1.5/2)])
            rotate([0, 90, 0])
            cylinder(d = 1.5, h = 4, $fn = loc_res);
            translate([23, 2, -(10+1.5/2)])
            rotate([0, 90, 0])
            cylinder(d = 1.5, h = 4, $fn = loc_res);
            translate([23, -2, -(10+1.5/2)-2])
            rotate([0, 90, 0])
            cylinder(d = 1.5, h = 4, $fn = loc_res);
            translate([23, 2, -(10+1.5/2)-2])
            rotate([0, 90, 0])
            cylinder(d = 1.5, h = 4, $fn = loc_res);
        }
        // look inside
        *translate([0, 0, -20])
        cube(40);
    }
}

module puttogether(loc_res = 32) {
    rotate([180, 0, 0])
    en12hs(0);
    translate([0, 0, -(6+7)])
    pcb01(0);
    translate([0, 0, 0])
    pcb02(0);
    
    translate([0, 0, -18])
    partA_bottom();
    
    translate([0, 0, 0])
    partB_top();
}

**puttogether();

// printing
*partA_bottom(64);
*partB_top(64);
*pcb01(0);
pcb02(0);

