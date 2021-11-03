/**
 * Martin Egli
 * 2021-11-01
 * Handschuherweiterung für die Garderobe
 */
use<../lib/m3screw.scad>;
use<../lib/m5screw.scad>;

module baseGard(loc_res = 256) {
    translate([0, 250/2, 250/2])
    rotate([0, 90, 0])
    
    difference() {
        translate([0, 0, 0])
        cylinder(r = 250+15, h = 15, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(r = 250, h = 15+2, $fn = loc_res);
        
        translate([0, 0, -1])
        cube([301, 301, 17]);
        translate([-300, -300, -1])
        cube([301, 301, 17]);
        translate([-300, 0, -1])
        cube([301, 301, 17]);
    }
}

module simpleGarderobeBase(wid = 16) {
    translate([-wid/2, -50, -wid/2])
    cube([wid, 100, wid]);
}

module plateA(show_final = 0, loc_res = 32) {
    difference() {
        translate([0, 0, 0])
        cube([40, 40, 6]);
    
        translate([5, 5, -1])
        m3CylinderHeadScewNutCut(14);
        translate([5, 40-5, 17])
        rotate([180, 0, 0])
        m3CylinderHeadScewNutCut(14);
        translate([40-5, 40-5, -1])
        m3CylinderHeadScewNutCut(14);
        translate([40-5, 5, 17])
        rotate([180, 0, 0])
        m3CylinderHeadScewNutCut(14);
    }
    
    translate([15, 20, -15])
    rotate([90, 0, 90])
    minkowski() {
        difference() {
            union() {
                translate([-20+2, 0, 2])
                cube([40-4, 20-2, 10-4]);
                translate([0, 0, 2])
                cylinder(d = 40-4, h = 10-4, $fn = loc_res);
            }
            translate([0, 0, -1])
            cylinder(d = 25+2, h = 12, $fn = loc_res);
        }
        if(show_final) {
            sphere(r = 2, $fn = loc_res);
        }
    }
}
module plateB() {
    difference() {
        translate([0, 0, 0])
        cube([40, 40, 6]);
        
        translate([5, 5, -11])
        m3CylinderHeadScewNutCut(14);
        translate([5, 40-5, 7])
        rotate([180, 0, 0])
        m3CylinderHeadScewNutCut(14);
        translate([40-5, 40-5, -11])
        m3CylinderHeadScewNutCut(14);
        translate([40-5, 5, 7])
        rotate([180, 0, 0])
        m3CylinderHeadScewNutCut(14);
    }
}

module plateC() {
    difference() {
        translate([0, 0, 0])
        cube([11, 40, 16]);
        
        translate([5, 5, -10])
        m3CylinderHeadScewNutCut(40);
        translate([5, 40-5, 30])
        rotate([180, 0, 0])
        m3CylinderHeadScewNutCut(40);
    
        translate([-1, 20, 8])
        rotate([0, 90, 0])
        rotate([0, 0, 90])
        m5CylinderHeadScewNutCut(20);
        
        /* // see inside for screw length
        translate([0, 10, -1])
        cube([20, 10, 20]);
        */
    }
}

module arcQuadrant(middle_dia = 30+8, wid = 16, show_quad = 1, loc_res = 32) {
    difference() {
        translate([0, 0, 0])
        cylinder(r = middle_dia, h = wid, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(r = middle_dia-wid, h = wid+2, $fn = loc_res);
        
        if(show_quad != 1) {
            translate([0, 0, -1])
            cube([(middle_dia+wid/2), (middle_dia+wid/2), wid+2]);
        }
        if(show_quad != 2) {
            translate([-(middle_dia+wid/2), 0, -1])
            cube([(middle_dia+wid/2), (middle_dia+wid/2), wid+2]);
        }
        if(show_quad != 3) {
            translate([-(middle_dia+wid/2), -(middle_dia+wid/2), -1])
            cube([(middle_dia+wid/2), (middle_dia+wid/2), wid+2]);
        }
        if(show_quad != 4) {
            translate([0, -(middle_dia+wid/2), -1])
            cube([(middle_dia+wid/2), (middle_dia+wid/2), wid+2]);
        }
    }
}

module armD(loc_res = 32) {
    difference() {
        translate([0, -(30-8), 0])
        arcQuadrant(30+8, 16, 1);
            
        translate([-1-9, 8, 8])
        rotate([0, 90, 0])
        rotate([0, 0, 90])
        m5CylinderHeadWasherScewNutCut(20);
        
        /* // see inside for screw length
        translate([0, 10, -1])
        cube([20, 10, 20]);
        */
    
    }
    /* // testing M5 x 20 mm screw
    translate([-1-7, 8, 8])
    rotate([0, 90, 0])
    rotate([0, 0, 90])
    m5TestingCylinderScrew();
    */
    
    hull() {
    translate([(30-8), -(30-8)-100, 0])
    cube([16, 100, 16]);
    
    translate([(30-8)+4, -(30-8)-100-6, 4])
    cube([8, 8, 8]);
    }
    
}

/*
simpleGarderobeBase();
translate([-20, 0, 16/2])
plateB();
translate([-20, 0, -16/2-6])
plateA(0);

translate([9+1, 0, -8]) {
    plateC();
    translate([11, 12, 0])
    armD();
}
*/

armD();
