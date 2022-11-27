/**
 * Martin Egli
 * 2021-03-24
 */
res = 100;

module plate(w1 = 18, h2 = 11, r1 = 4) {
    hull() {
        translate([-(w1/2-4), -(11/2-4), 0])
        cylinder(r = r1, h = 1, $fn = res);
        translate([+(w1/2-4), -(11/2-4), 0])
        cylinder(r = r1, h = 1, $fn = res);
        translate([+(w1/2-4), +(11/2-4), 0])
        cylinder(r = r1, h = 1, $fn = res);
        translate([-(w1/2-4), +(11/2-4), 0])
        cylinder(r = r1, h = 1, $fn = res);
    }
    translate([-(18-4)/2, -(11-4)/2, 1])
    cube([18-4, 11-4, 2]);
    translate([-3, 3.5, 1])
    cube([6, 2, 2]);
}

plate();