/**
 * Martin Egli
 * 2021-04-03
 */

res = 200;

module small_knife_holder(len = 45, angle = 20) {
    difference() {
        translate([0, 0, 0])
        cube([len, 15, 30]);
        translate([-5, -1, .5])
        rotate([angle, 0, 0])
        cube([len+10, 70, 30]);

        len1 = len/2;
        for (n = [0:1:1]) {
            translate([len1/2+n*len1, 10, -2])
            rotate([angle, 0, 0])
            cylinder(d = 6.5, h = 5.8, $fn = res);
        }
    }
}

module knife_holder(len = 50, angle = 20) {
    difference() {
        translate([0, 0, 0])
        cube([len, 30, 30]);
        translate([-5, -1, 3])
        rotate([angle, 0, 0])
        cube([len+10, 70, 30]);

        len1 = len/5;
        for (n = [0:1:4]) {
            translate([len1/2+n*len1, 15, -2])
            rotate([angle, 0, 0])
            cylinder(d = 6.5, h = 8.5, $fn = res);
        }
    }
}

small_knife_holder();
//knife_holder(100, 20);
//knife_holder(150, 20);
