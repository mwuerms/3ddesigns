/**
 * Martin Egli
 * 2023-02-12
 * holder for toothbrushes
 */

// v2.0
// phillips sonicare HX367W1 220926, adult
// simplified re-design, bottom is not a circle
module tbrush1(loc_res = 32) {
    color("LightBlue")
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 26, h = 130, $fn = loc_res);
            translate([0, 0, 130])
            cylinder(d1 = 26, d2 = 19, h = 20, $fn = loc_res);
            translate([0, 0, 150])
            sphere(d = 19, $fn = loc_res);
            translate([0, 0, 150])
            cylinder(d = 8.5, h = 40, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 6.2, h = 8.2+1, $fn = loc_res);
    }
}

// phillips sonicare HX6910 110318, adult
// simplified re-design, bottom is not a circle
module tbrush2(loc_res = 32) {
    color("LightGreen")
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d1 = 31, d2 = 29, h = 130, $fn = loc_res);
            translate([0, 0, 130])
            cylinder(d1 = 29, d2 = 19, h = 30, $fn = loc_res);
            translate([0, 0, 160])
            sphere(d = 19, $fn = loc_res);
            translate([0, 0, 160])
            cylinder(d = 8.5, h = 40, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 6.2, h = 8.2+1, $fn = loc_res);
    }
}

// phillips sonicare HX6910 110318, child
// simplified re-design, bottom is not a circle
module tbrush3(loc_res = 32) {
    color("HotPink")
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d1 = 35, d2 = 31, h = 155, $fn = loc_res);
            translate([0, 0, 155])
            cylinder(d1 = 31, d2 = 18, h = 5, $fn = loc_res);
            translate([0, 0, 160])
            cylinder(d1 = 18, d2 = 9, h = 13, $fn = loc_res);
            translate([0, 0, 160+13])
            cylinder(d1 = 9, d2 = 7,h = 40, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 6.2, h = 8.2+1, $fn = loc_res);
    }
}

module charging_dock1(loc_res = 32) {
    color("LightGray") // instead of white
    union() {
        translate([0, 0, 0])
        cylinder(d1 = 6.5, d2 = 6.0, h = 7.7, $fn = loc_res);
        translate([0, 0, -22])
        cylinder(d = 40, h = 22, $fn = loc_res);
        translate([-40/2, 0, -22])
        cube([40, 31, 22]);
    }
}

module tbholder1(loc_res = 32) {
    // base plate
    union() {
        hull() {
            difference() {
                hull() {
                    translate([0, 0, -12])
                    cylinder(d = 40, h = 11, $fn = loc_res);
                    translate([-40/2, 0, -12])
                    cube([40, 25, 11]);
                }
                translate([0, 0, -3])
                rotate([5, 0, 0])
                cylinder(d = 60, h = 8, $fn = loc_res);
            }
            difference() {
                hull() {
                    translate([0, 0, -13])
                    cylinder(d = 38, h = 13, $fn = loc_res);
                    translate([-38/2, 0, -13])
                    cube([38, 24, 13]);
                }
                translate([0, 0, -2])
                rotate([5, 0, 0])
                cylinder(d = 60, h = 8, $fn = loc_res);
            }
        }
        // middle pin
        translate([0, 0, -2])
        rotate([5, 0, 0])
        union() {
            translate([0, 0, 0])
            cylinder(d = 5.8, h = 7, $fn = loc_res);
            translate([0, 0, 7])
            cylinder(d1 = 5.8, d2 = 5.8-2, h = 1, $fn = loc_res);
        }
    }
    // upper holder
    translate([0, 0, 190]) { //190
        hull() {
            translate([-26/2, 23, 0])
            cube([26, 2, 6]);
            translate([0, 14, -0])
            cylinder(d=14, h = 6, $fn = loc_res);
        }
        difference() {
            translate([0, 0, -0])
            cylinder(d = 26, h = 6, $fn = loc_res);
            translate([0, 0, -1])
            cylinder(d = 14, h = 15, $fn = loc_res);
            translate([0, 0, -1])
            rotate([0, 0, 110])
            cube([16, 16, 12]);
            translate([-16, 0, -1])
            cube([16, 16, 12]);
        }
        translate([-(14/2)-2.5, -3.1, 0])
        cylinder(d = (26-14)/2, h = 6, $fn = loc_res);
    }
    
    // back connector ans mounting holes
    difference() {
        hull() {
            translate([0, 0, 190])
            hull() {
                translate([-26/2, 23, 0])
                cube([26, 2, 6]);
                translate([-22/2, 21, 0])
                cube([22, 3, 6]);
            }
            translate([0, 0, -10])
            hull() {
                translate([-40/2, 23, 0])
                cube([40, 2, 16]);
                translate([-38/2, 21, 0])
                cube([38, 3, 16]);
            }
        }
            
        // mounting holes
        translate([0, 20, 40]) {
            rotate([-90, 0, 0])
            cylinder(d = 3.5, h = 10, $fn = loc_res);
            rotate([-90, 0, 0])
            cylinder(d2 = 3.5, d1= 9, h = 3, $fn = loc_res);
        }
        translate([0, 20, 150]) {
            rotate([-90, 0, 0])
            cylinder(d = 3.5, h = 10, $fn = loc_res);
            rotate([-90, 0, 0])
            cylinder(d2 = 3.5, d1= 9, h = 3, $fn = loc_res);
        }
    }
}

// 18/2 = 4.5 -> 4.4 cm
module tbholder2(wid = 44, loc_res = 32) {
    // base plate
    difference() {
        hull() {
            translate([-wid/2, -wid/2, -10])
            cube([wid, wid-1, 9]);
            translate([-wid/2+1, -wid/2, -10])
            cube([wid-2, wid, 9]);
            translate([-wid/2+1, -wid/2, -10])
            cube([wid-2, wid-1, 10]);
        }
        // middle pin
        translate([0, 0, -12])
        cylinder(d = 6, h = 20, $fn = loc_res);
    }
    difference() {
        union() {
            translate([-wid/2, -wid/2, -wid])
            cube([wid, 4, wid-4]);
            
            hull() {
                translate([-wid/2, -wid/2, -wid])
                cube([2, 4, wid-6]);
                translate([-wid/2, wid/2-4-1, -10])
                cube([2, 4, 4]);
            }
            hull() {
                translate([wid/2-2, -wid/2, -wid])
                cube([2, 4, wid-6]);
                translate([wid/2-2, wid/2-4-1, -10])
                cube([2, 4, 4]);
            }
        }
        translate([-(wid/2+4), -10, -16])
        rotate([90, 0, 90])
        cylinder(d = 3, h = wid+6, $fn = loc_res);
        translate([-(wid/2+4), -10, -28])
        rotate([90, 0, 90])
        cylinder(d = 3, h = wid+6, $fn = loc_res);
    
        translate([10, -17, -16])
        rotate([90, 0, 0]) {
            cylinder(d = 3.4, h = 16, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d2 = 3, d1 = 8, h = 3, $fn = loc_res);
        }
        translate([-10, -17, -16])
        rotate([90, 0, 0]) {
            cylinder(d = 3.4, h = 16, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d2 = 3, d1 = 8, h = 3, $fn = loc_res);
        }
        translate([0, -17, -32])
        rotate([90, 0, 0]) {
            cylinder(d = 3.4, h = 16, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d2 = 3, d1 = 8, h = 3, $fn = loc_res);
        }
    }
}

module tbrush1_test() {
    tbholder1();
    difference() {
        tbrush1();
        *cube(100);
    }
}

module tbrush1_test2() {
    tbholder2();
    difference() {
        tbrush1();
        *cube(100);
    }
}

module tbrush2_test() {
    tbholder1();
    tbrush2();
}

module tbrush3_test() {
    tbholder1();
    tbrush3();
}
/*
*translate([ 50, 0, 0])
tbrush1_test();
*translate([100, 0, 0])
tbrush2_test();
*translate([150, 0, 0])
tbrush3_test();
*translate([-50, 0, 0])
charging_dock1();

*tbholder1();

translate([0, 0, -20])
linear_extrude(20)
polygon([[0, 0], [180, 0], [130, 200], [0, 200]]);

translate([0*40+25, 25, 0])
tbrush3();
translate([1*40+25, 25, 0])
tbrush3();
translate([2*40+25, 25, 0])
tbrush3();
translate([3*40+25, 25, 0])
tbrush3();

translate([40, 100, 20])
rotate([0, 0, 90])
charging_dock1();

translate([40, 150, 20])
rotate([0, 0, 90])
charging_dock1();
*/

*translate([  0, 0, 0])
tbrush1_test2();

tbholder2();