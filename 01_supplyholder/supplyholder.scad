/**
 * Martin Egli
 * 2020-09-06
 * Holder for hp zbook supply
 */
res = 20;

module side(w1 = 12) {
    difference() {
        hull() {
            translate([-12,-w1/2, 0])
            sphere(r = 3, $fn = res);
            translate([-12,+w1/2, 0])
            sphere(r = 3, $fn = res);

            translate([16,-w1/2, 0])
            sphere(r = 3, $fn = res);
            translate([16,+w1/2, 0])
            sphere(r = 3, $fn = res);
        }

        translate([+6,0,-4])
        cylinder(r = 3.5/2, h = 8, $fn = res);
        translate([+6,0,-4])
        cylinder(r1 = 8/2, r2 = 3.5/2, h = 3, $fn = res);
        translate([+6,0,2.5])
        cylinder(r1 = 3.5/2, r2 = 4.5/2, h = 0.5, $fn = res);

        translate([-6,0,-4])
        cylinder(r = 3.5/2, h = 8, $fn = res);
        translate([-6,0,-4])
        cylinder(r1 = 8/2, r2 = 3.5/2, h = 3, $fn = res);
        translate([-6,0,2.5])
        cylinder(r1 = 3.5/2, r2 = 4.5/2, h = 0.5, $fn = res);
    }

    hull() {
        translate([16,-w1/2, 0])
        sphere(r = 3, $fn = res);
        translate([16,+w1/2, 0])
        sphere(r = 3, $fn = res);

        translate([16,-w1/2, -31])
        sphere(r = 3, $fn = res);
        translate([16,+w1/2, -31])
        sphere(r = 3, $fn = res);
    }

    hull() {
        translate([16,-w1/2, -31])
        sphere(r = 3, $fn = res);
        translate([16,+w1/2, -31])
        sphere(r = 3, $fn = res);

        translate([16+52+6,-w1/2, -31])
        sphere(r = 3, $fn = res);
        translate([16+52+6,+w1/2, -31])
        sphere(r = 3, $fn = res);
    }

    hull() {
        translate([16+52+6,-w1/2, -31+12])
        sphere(r = 3, $fn = res);
        translate([16+52+6,+w1/2, -31+12])
        sphere(r = 3, $fn = res);

        translate([16+52+6,-w1/2, -31-3])
        sphere(r = 3, $fn = res);
        translate([16+52+6,+w1/2, -31-3])
        sphere(r = 3, $fn = res);
    }
}
side();