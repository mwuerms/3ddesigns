/**
 * Martin Egli
 * 2021-04-07
 */
res = 200;

module main_part() {
    difference() {
        union() {
            hull() {
                translate([0, 0, 0])
                cylinder(d = 36, h = 2, $fn = res);
                translate([0, 0, 1])
                cylinder(d = 40, h = 16, $fn = res);
                translate([0, 0, 18])
                cylinder(d = 36, h = 2, $fn = res);
            }
            translate([0, 0, 20])
            cylinder(d = 20, h = 7, $fn = res);
        }
        translate([0, 0, -1])
        cylinder(d = 18, h = 29, $fn = res);

        rad1 = 22.5;
        nmax = 10;
        for(n = [0:1:(nmax-1)]) {
            translate([rad1 * cos(360/nmax*n), rad1 * sin(360/nmax*n), -1])
            cylinder(d = 10, h = 22, $fn = res);
        }

        translate([0, 0, 21]) {
            nmax = 6;
            for(n = [0:1:(nmax-1)]) {
                rotate([0, 0, 360/nmax * n])
                difference() {
                    rotate([35,0,0])
                    cube(13);
                    translate([0, -14, 0])
                    cube(14);
                }
            }
        }
    }
}

module additional_blade() {
difference() {
        translate([0, 0, 0])
        cylinder(d = 29, h = 16, $fn = res);
        translate([0, 0, 7])
        cylinder(d = 29-2, h = 29, $fn = res);
        translate([0, 0, -1])
        cylinder(d = 20, h = 29, $fn = res);

        translate([0, 0, 7]) {
            nmax = 6;
            for(n = [0:1:(nmax-1)]) {
                rotate([0, 0, 360/nmax * n])
                difference() {
                    rotate([35,0,0])
                    cube(16);
                    translate([0, -16, 0])
                    cube(16);
                }
            }
        }
    }
}

//main_part();
additional_blade();
