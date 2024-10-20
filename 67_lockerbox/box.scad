/**
 * Martin Egli
 * 2024-10-20
 */

module lock(col = "Silver", loc_res = 32) {
    color(col) {
        difference() {
            union() {
                translate([0, 0, 0])
                cylinder(d1 = 22.5, d2 = 17, h = 3, $fn = loc_res);
                translate([0, 0, -13.5])
                cylinder(d = 17.5, h = 13.5, $fn = loc_res);
                translate([0, 0, -16.5])
                cylinder(d = 16, h = 16.5, $fn = loc_res);
                translate([0, 0, -(16.5+2)])
                difference() {
                    hull() {
                        translate([0, 0, 0])
                        cylinder(d = 15, h = 2, $fn = loc_res);
                        translate([32.5, 0, 0])
                        cylinder(d = 12.5, h = 2, $fn = loc_res);
                    }
                    hull() {
                        translate([32.5, 0, -0.5])
                        cylinder(d = 0.1, h = 2+1, $fn = loc_res);
                        translate([32.5, 6.8, -0.5])
                        cylinder(d = 0.1, h = 2+1, $fn = loc_res);
                        translate([32.5-8.5, 6.8, -0.5])
                        cylinder(d = 0.1, h = 2+1, $fn = loc_res);
                        translate([32.5-6.0, 0, -0.5])
                        cylinder(d = 0.1, h = 2+1, $fn = loc_res);
                    }
                    
                }
                translate([0, 0, -(16.5+2+1)])
                cylinder(d = 13, h = 1, $fn = loc_res);
                translate([0, 0, -(16.5+2+1+3)])
                cylinder(d = 8, h = 3, $fn = loc_res);
            }
            //  cuts
            translate([-2/2, -9/2, 3-1])
            cube([2, 9, 2]);
            translate([-20/2, 16/2, -16.6])
            cube([20, 2, 16.6]);
            translate([-20/2, -(16/2+2), -16.6])
            cube([20, 2, 16.6]);
        }
        // M22 nut
        translate([0, 0, -(8+4.5)])
        cylinder(d = 25, h = 4.5, $fn = 6);
    }
}
//lock();

module lock_cut(loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, -16])
            cylinder(d = 17.6, h = 16, $fn = loc_res);
        }
        translate([-20/2, 16/2, -16.6])
        cube([20, 2, 16.6]);
        translate([-20/2, -(16/2+2), -16.6])
        cube([20, 2, 16.6]);
    }
}
//lock_cut();

module lock_mounting_plate(col = "Blue", loc_res = 32) {
    color(col)
    difference() {
        union() {
            hull() {
                translate([-16, -16, -4])
                cylinder(d = 8, h = 4, $fn = loc_res);
                translate([-16, +16, -4])
                cylinder(d = 8, h = 4, $fn = loc_res);
                translate([+16, -16, -4])
                cylinder(d = 8, h = 4, $fn = loc_res);
                translate([+16, +16, -4])
                cylinder(d = 8, h = 4, $fn = loc_res);
            }
            translate([+(17.5/2+6/2), 0, -4])
            cylinder(d = 6, h = 8, $fn = loc_res);
            translate([-(17.5/2+6/2), 0, -4])
            cylinder(d = 6, h = 8, $fn = loc_res);
        }
        // lock cut
        translate([0, 0, 1])
        lock_cut();
        // screw czts
        translate([-16, -16, -5])
        cylinder(d = 3, h = 6, $fn = loc_res);
        translate([-16, +16, -5])
        cylinder(d = 3, h = 6, $fn = loc_res);
        translate([+16, -16, -5])
        cylinder(d = 3, h = 6, $fn = loc_res);
        translate([+16, +16, -5])
        cylinder(d = 3, h = 6, $fn = loc_res);
    }
}
*translate([0, 0, -4])
lock_mounting_plate();
//lock();

module box_lid(col = "LightGreen", loc_res = 32) {
    difference() {
        color(col)
        // 1 x 200 x 150 x 4 mm 
        translate([-(150-45), -200/2, -4])
        cube([150, 200, 4]);
        
        translate([0, 0, 1])
        lock_cut();
    }
}

module box_front(col = "LightBlue", loc_res = 32) {
    color(col) {
        // 1 x 200 x 80 x 4 mm
        translate([45-4, -200/2, -84])
        cube([4, 200, 80]);
        
        // 3 x  200 x 19 x 4 mm
        translate([45-23, -200/2, -2*4])
        cube([19, 200, 4]);
        translate([45-23, -200/2, -3*4])
        cube([19, 200, 4]);
        translate([45-23, -200/2, -4*4])
        cube([19, 200, 4]);
    }
}

module box_bottom(col = "RoyalBlue", loc_res = 32) {
    color(col)
    // 1 x 200 x 150 x 4 mm 
    translate([-(150-45), -200/2, -88])
    cube([150, 200, 4]);
}

module box_side1(col = "LightCoral", loc_res = 32) {
    color(col)
    // 1 x 154 x 88 x 4 mm
    translate([-150+(45-4), -(200/2+4), -88])
    cube([154, 4, 88]);
}
module box_side2(col = "LightCoral", loc_res = 32) {
    color(col)
    // 1 x 154 x 88 x 4 mm
    translate([-150+(45-4), +(200/2), -88])
    cube([154, 4, 88]);
}

module box(show_compoments = 1, loc_res = 32) {
    if(show_compoments) {
        translate([0, 0, 0])
        lock();
        translate([0, 0, -4])
        lock_mounting_plate();
    }
    box_lid();
    box_front();
    box_bottom();
    box_side1();
    box_side2();
}

box();
