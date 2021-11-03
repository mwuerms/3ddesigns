/**
 * Martin Egli
 * 2021-10-27
 * laptop holder
 */

module aluPipe(len = 100, dia1 = 6, loc_res = 32) {
    color("Silver")
    translate([0, 0, 0])
    cylinder(d = dia1, h = len, $fn = loc_res);
}

module holderFromPipes() {
    // top
    translate([-150, -115, 200])
    rotate([0, 90, 0])
    aluPipe(len = 300);
    
    // right front
    translate([-150, 0, 0])
    rotate([30, 0, 0])
    aluPipe(len = 220);
    // right back
    translate([-150, -188, 0])
    rotate([-20, 0, 0])
    aluPipe(len = 202);
}

module connector1(dia1 = 6.5, loc_res = 32) {
    difference() {
        hull() {
            // top
            rotate([0, 90, 0])
            minkowski() {
                translate([-4, -4, -4])
                cube([8, 8, 40]);
                sphere(2, $fn = loc_res);
            }

            // right front
            rotate([30-180, 0, 0])
            translate([0, 0, 5])
            minkowski() {
                translate([-4, -4, -5])
                cube([8, 8, 40]);
                sphere(2, $fn = loc_res);
            }

            // right back
            rotate([-20-180, 0, 0])
            translate([0, 0, 5])
            minkowski() {
                translate([-4, -4, -5])
                cube([8, 8, 40]);
                sphere(2, $fn = loc_res);
            }
        }
        
        // holes for pipes
        // top
        rotate([0, 90, 0])
        translate([0, 0, -1])
        cylinder(d = dia1, h = 45, $fn = loc_res);
        
        // right front
        rotate([30-180, 0, 0])
        translate([0, 0, 10])
        cylinder(d = dia1, h = 45, $fn = loc_res);
        
        // right back
        rotate([-20-180, 0, 0])
        translate([0, 0, 10])
        cylinder(d = dia1, h = 45, $fn = loc_res);
    }
    
    /*
    // pointers: they cross exactly at the center: WOOHOO
    // top
    rotate([0, 90, 0])
    translate([0, 0, -10])
    cylinder(d = 0.5, h = 45, $fn = loc_res);
    
    // right front
    rotate([30-180, 0, 0])
    translate([0, 0, -10])
    cylinder(d = 0.5, h = 45, $fn = loc_res);
    
    // right back
    rotate([-20-180, 0, 0])
    translate([0, 0, -10])
    cylinder(d = 0.5, h = 45, $fn = loc_res);
    */
}

module connector2(dia1 = 6.5, loc_res = 32) {
        difference() {
        // right back
        rotate([30-180, 0, 0])
        translate([0, 0, -30])
        minkowski() {
            difference() {
                union() {
                    translate([-4, -4, -5])
                    cube([8, 8, 40]);
                    translate([-4, -4, 25])
                    rotate([-30+90, 0, 0])
                    cube([8, 10, 20]);
                    translate([-4, -14, 35])
                    rotate([-30+90+45, 0, 0])
                    cube([8, 8, 15.2]);
                    translate([-4, -23.9, 34.7])
                    rotate([-30+90+45+45, 0, 0])
                    cube([8, 8, 16]);
                }
                translate([-15, -25, 45])
                rotate([-30, 0, 0])
                cube([30, 50, 30]);
            }
            sphere(2, $fn = loc_res);
        }
    
        // right back
        rotate([30, 0, 0])
        translate([0, 0, -0])
        cylinder(d = dia1, h = 45, $fn = loc_res);
    }
            
/*
    // test plate
    translate([-50, -25, -2])
    cube([100, 100, 2]);
*/
}

module connector3(dia1 = 6.5, loc_res = 32) {
    difference() {
        // right back
        rotate([-20-180, 0, 0])
        translate([0, 0, -30])
        minkowski() {
            difference() {
                translate([-4, -4, -5])
                cube([8, 8, 40]);
                translate([-15, -15, 25])
                rotate([20, 0, 0])
                cube([30, 30, 30]);
            }
            sphere(2, $fn = loc_res);
        }
    
        // right back
        rotate([-20, 0, 0])
        translate([0, 0, -1])
        cylinder(d = dia1, h = 45, $fn = loc_res);
    }
            
    /*  
    // test plate
    translate([-15, -15, -2])
    cube([30, 30, 2]);
    */
}


holderFromPipes();

//translate([-150, -115, 200])
//mirror([0, 0, 0]) connector1(); // 1x
//mirror([1, 0, 0]) connector1(); // 1x
//translate([-150, 0, 0])
//connector2();   // 2x
//translate([-150, -188, 0])9
//connector3();   // 2x
