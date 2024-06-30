/**
 * Martin Egli
 * 2024-06-27
 * measure outside M1:1 im mm
 */

// origin: lower left edge
// numbers in mm
module scene() {
    // ceiling
    color("White")
    translate([40, 40, 2750])
    cube([1800-40, 1800-40-1, 80]);
    color("Gray") {
        translate([40, 40, 2745])
        cube([1800-40, 80, 80]);
        translate([40, 40, 2745])
        cube([80, 1800-40, 80]);
        translate([40, 1800-80, 2745])
        cube([1800-40, 80, 80]);
    }
    // left wall
    color("LightGray") {
        // window
        translate([615, -200, 170])
        cube([25, 200, 2030]);
        translate([615, -200, 2200])
        cube([1800-615, 200, 25]);
        // wooden wall
        translate([0, -10, 170])
        cube([610, 10, 2055]);
        translate([0, -10, 170+2058])
        cube([610, 10, 610]);
        translate([615, -10, 170+2058])
        cube([1800-615, 10, 610]);
    }
    // concrete
    color("Silver") {
        translate([0, -200, 0])
        cube([640, 200, 170]);
        hull() {
            translate([0, -200, 0])
            cube([640, 200, 90]);
            translate([0, -200, 0])
            cube([640, 240, 50]);
        }
        hull() {
            translate([640, -200, 0])
            cube([1800-615, 1, 60]);
            translate([640, -200, 0])
            cube([1800-615, 240, 40]);
        }
    }
    // back wall
    // concrete
    color("Silver") {
        translate([-10, 0, 0])
        cube([10, 15*260, 170]);
        hull() {
            translate([-10, 0, 0])
            cube([10, 15*260, 90]);
            translate([-10, 0, 0])
            cube([50, 15*260, 50]);
        }
        hull() {
            translate([640, -200, 0])
            cube([640, 1, 60]);
            translate([640, -200, 0])
            cube([640, 240, 40]);
        }
        translate([-10, -10, 0])
        cube([5, 15*260-10, 2750]);
        translate([-10, -10, 0])
        cube([10, 10, 2750]);
    }
    module yellow_brick(col = "Bisque") {
        color(col)
        cube([8, 250, 140]);
    }
    // yellow bricks
    for(n = [0:1:14]) {
        for(m = [0:1:17]) {
            if((m % 2) == 0) {
                translate([2, n*260, m*150+180])
                yellow_brick();
            }
            else {
                translate([2, n*260-130, m*150+180])
                yellow_brick();
            }
        }
    }
    // metal construction
    module pilar(col1 = "Gray", col2 = "Silver") {
        color(col2) {
            translate([-40, -40, 0])
            cube([2*40+80, 2*40+80, 180]);
            hull() {
                translate([-40, -40, 0])
                cube([2*40+80, 2*40+80, 90]);
                translate([-(40+50), -(40+50), 0])
                cube([2*40+80+2*50, 2*40+80+2*50, 50]);
            }
        }
        color(col1) {
            translate([0, 0, 0])
            cube([80, 80, 2800]);
        }
    }
    translate([40, 40, 0])
    pilar();
    translate([40, 1800-80, 0])
    pilar();
    // floor


    color("Silver") {
        difference() {
            translate([610, 0, -10])
            cube([1380, 710, 14]);
            translate([610+170, 0, -11])
            cube([1380-2*170, 710-170, 16]);
        }
    }
    color("Gray") {
        translate([610+170, 0, -10])
        cube([1380-2*170, 710-170, 13]);
    }
    color("DarkGray") {
        translate([-10, -10, -10])
        cube([2000, 2000, 10]);
    }
}
scene();
