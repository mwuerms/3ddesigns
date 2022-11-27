/**
 * Martin Egli
 * 2021-03-25
 * lego box corner, v1
 */
res = 200;

module rounded_side(dia1 = 58*2, h1 = 40) {
    difference() {
        union() {
            difference() {
                translate([0, 0, 0])
                cylinder(d = dia1, h = h1, $fn = res);
                
                translate([0, 0, -1])
                cylinder(d = dia1-12, h = 4+1, $fn = res);
                translate([0, 0, 4])
                cylinder(d = dia1-24, h = 2, $fn = res);
                translate([0, 0, 6])
                cylinder(d = dia1-4, h = h1, $fn = res);

                translate([-dia1/2, 0, -1])
                cube([dia1/2, dia1/2, h1+2]);
                translate([0, -dia1/2, -1])
                cube([dia1/2, dia1/2, h1+2]);
                translate([0, 0, -1])
                cube([dia1/2, dia1/2, h1+2]);

            }
            translate([-dia1/2, 4, 0])
            cube([2, 4, h1]);
            translate([-(dia1/2-6), 4, 4]) {
                cube([2, 4, h1-4]);
                cube([6, 4, 2]);
            }

            difference() {
                union() {
                    translate([-dia1/2, 0, 0])
                    cube([4, 8, h1]);
                    translate([-(dia1/2-4), 4, 4])
                    cube([4, 4, h1-4]);
                    translate([-(dia1/2-4), 0, 4])
                    cube([8, 8, 2]);
                    translate([-(dia1/2-2), 0, 0])
                    cube([4, 8, 4]);
                    
                    translate([-(dia1/2-4), 4, 4])
                    cylinder(d = 8, h = h1-4, $fn = res);
                }
                translate([-(dia1/2-2), 3, -1])
                cube([4, 7, h1+2]);
            }

            difference() {
                union() {
                    translate([0, -dia1/2, 0])
                    cube([8, 4, h1]);
                    translate([4, -(dia1/2-4), 4])
                    cube([4, 4, h1-4]);
                    translate([0, -(dia1/2-4), 4])
                    cube([8, 8, 2]);
                    translate([0, -(dia1/2-2), 0])
                    cube([8, 4, 4]);
                    
                    translate([4, -(dia1/2-4), 4])
                    cylinder(d = 8, h = h1-4, $fn = res);
                }
                translate([3, -(dia1/2-2), -1])
                cube([7, 4, h1+2]);
            }
        }
        // holes for nails
        translate([0, 0, 2])
        rotate([90, 0, -0*90/8])
        cylinder(d = 1.5, h = dia1, $fn = res);
        translate([0, 0, 2])
        rotate([90, 0, -2*90/8])
        cylinder(d = 1.5, h = dia1, $fn = res);
        translate([0, 0, 2])
        rotate([90, 0, -4*90/8])
        cylinder(d = 1.5, h = dia1, $fn = res);
        translate([0, 0, 2])
        rotate([90, 0, -6*90/8])
        cylinder(d^= 1.5, h = dia1, $fn = res);
        translate([0, 0, 2])
        rotate([90, 0, -8*90/8])
        cylinder(d = 1.5, h = dia1, $fn = res);
    }
}

rounded_side();