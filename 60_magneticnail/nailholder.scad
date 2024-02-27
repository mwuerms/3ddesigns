/**
 * Martin Egli
 * 2024-02-27
 * a magnetic nail for holding some concluded tasks to savely store them away
 */

module magnet555N(loc_res = 32) {
    color("Silver")
    translate([-5/2, -5/2, -(5/2-0.1)])
    cube([5, 5, 5-0.2]);
    color("Green")
    translate([-5/2, -5/2, -(5/2)])
    cube([5, 5, 0.1]);
    color("Red")
    translate([-5/2, -5/2, +(5/2-0.1)])
    cube([5, 5, 0.1]);
}

module magnet4x555Cut(loc_res = 32) {
    difference() {
        union() {
            translate([-10/2, -10/2, -5/2-1])
            cube([10, 10, 5+1]);
            translate([-10/2, -10/2, -5/2-1])
            cylinder(d = 1, h = 5+1, $fn = loc_res);
            translate([-10/2, +10/2, -5/2-1])
            cylinder(d = 1, h = 5+1, $fn = loc_res);
            translate([+10/2, -10/2, -5/2-1])
            cylinder(d = 1, h = 5+1, $fn = loc_res);
            translate([+10/2, +10/2, -5/2-1])
            cylinder(d = 1, h = 5+1, $fn = loc_res);
        }
        translate([-5/2, -10/2, 0])
        sphere(d = 1, $fn = loc_res);
        translate([+5/2, -10/2, 0])
        sphere(d = 1, $fn = loc_res);
        translate([-5/2, +10/2, 0])
        sphere(d = 1, $fn = loc_res);
        translate([+5/2, +10/2, 0])
        sphere(d = 1, $fn = loc_res);
        translate([-10/2, -5/2, 0])
        sphere(d = 1, $fn = loc_res);
        translate([-10/2, +5/2, 0])
        sphere(d = 1, $fn = loc_res);
        translate([+10/2, -5/2, 0])
        sphere(d = 1, $fn = loc_res);
        translate([+10/2, +5/2, 0])
        sphere(d = 1, $fn = loc_res);
    }
}

module nail(loc_res = 32) {
    color("Silver")
    translate([0, 0, 0])
    cylinder(d = 6, h = 1, $fn = loc_res);
    color("Silver")
    translate([0, 0, 0])
    cylinder(d = 2, h = 20, $fn = loc_res);
    color("Silver")
    translate([0, 0, 20])
    cylinder(d1 = 2, d2 = 0, h = 4, $fn = loc_res);
    
}

module nailCut(loc_res = 32) {
    translate([0, 0, -10])
    cylinder(d = 7, h = 10+1, $fn = loc_res);
    translate([0, 0, 0])
    cylinder(d = 2.2, h = 20, $fn = loc_res);
}

module nailholder(show_components = 1, loc_res = 32) {
    if(show_components) {
        translate([-5/2, -5/2, 2.4])
        rotate([180, 0, 0])
        magnet555N();
        translate([+5/2, -5/2, 2.4])
        rotate([0, 0, 0])
        magnet555N();
        translate([-5/2, +5/2, 2.4])
        rotate([0, 0, 0])
        magnet555N();
        translate([+5/2, +5/2, 2.4])
        rotate([180, 0, 0])
        magnet555N();
        
        translate([0, 0, 6])
        rotate([8, 0, 0])
        nail();
    }
    
    difference() {
        hull() {
            translate([0, 0, 0]) 
            cylinder(d = 20, h = 0.01, $fn = loc_res);
            translate([0, 0, 6+1])
            rotate([8, 0, 0])
            cylinder(d = 20, h = 0.01, $fn = loc_res);
            translate([0, 0, 6+1])
            rotate([8, 0, 0])
            cylinder(d = 20-4, h = 1, $fn = loc_res);
        }
        
        translate([0, 0, 2.4])
        magnet4x555Cut();
        translate([0, 0, 6])
        rotate([8, 0, 0])
        nailCut();
    }
}

nailholder(0, loc_res = 32);