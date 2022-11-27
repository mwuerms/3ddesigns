/**
 * Martin Egli
 * 2021-03-16
 * ME100
 */
res = 100;
project_text = "ME100, v2";

translate([0, 0, 0])
difference() {
    union() {
        translate([0, 0, 0])
        cylinder(d = 21-0.2, h = 6, $fn = res);
        translate([0, 0, 6])
        cylinder(d1 = 32, d2 = 36-0.2, h = 2, $fn = res);
    }
    translate([0, 0, -1])
    cylinder(d = 17.5, h = 10, $fn = res);
}

translate([0, 0, 8])
difference() {
    union() {
        translate([0, 0, 0])
        cylinder(d = 36-0.2, h = 7, $fn = res);
        translate([0, 0, 7])
        cylinder(d1 = 40, d2 = 44-0.2, h = 2, $fn = res);
        translate([0, 0, 9])
        cylinder(d = 44-0.2, h = 3, $fn = res);
        translate([0, 0, 12])
        cylinder(d = 48, h = 3, $fn = res);
    }
    translate([0, 0, -1])
    cylinder(d = 27.5, h = 12, $fn = res);
    translate([0, 0, 10])
    cylinder(d = 28, h = 10, $fn = res);

    translate([-7, 18, 14])
    linear_extrude(2)
    text(project_text, 2, $fn = res);    
}
