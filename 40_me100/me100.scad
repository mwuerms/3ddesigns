/**
 * Martin Egli
 * 2021-03-16
 * ME100
 */
res = 100;

translate([0, 0, 0])
difference() {
    union() {
        translate([0, 0, 0])
        cylinder(d = 19.5, h = 6, $fn = res);
        translate([0, 0, 6])
        cylinder(d1 = 30.5, d2 = 34.5, h = 2, $fn = res);
    }
    translate([0, 0, -1])
    cylinder(d = 17.5, h = 10, $fn = res);
}

translate([0, 0, 8])
difference() {
    union() {
        translate([0, 0, 0])
        cylinder(d = 34.5, h = 7, $fn = res);
        translate([0, 0, 7])
        cylinder(d1 = 39.5, d2 = 43.5, h = 2, $fn = res);
        translate([0, 0, 9])
        cylinder(d = 43.5, h = 3, $fn = res);
        translate([0, 0, 12])
        cylinder(d = 48, h = 3, $fn = res);
    }
    translate([0, 0, -1])
    cylinder(d = 30.5, h = 13, $fn = res);
    translate([0, 0, 12])
    cylinder(d = 33, h = 4, $fn = res);

    translate([-7, 18, 14])
    linear_extrude(2)
    text("ME100", 3, $fn = res);    
}
