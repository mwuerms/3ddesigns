/**
 * Martin Egli
 * 2021-03-17
 * ME103
 * calibration example
 */
res = 20;
project_text = "ME103,v1";

translate([0, 0, 0])
difference() {
    cube([100, 10, 10]);

    translate([95, 8, 9])
    linear_extrude(2)
    text("100", 1, $fn = res);

    translate([1, 5.5, 9])
    rotate([0, 0, -90])
    linear_extrude(2)
    text("10", 1, $fn = res);

    translate([1, 6, 8])
    rotate([90, 0, -90])
    linear_extrude(2)
    text("10", 1, $fn = res);

    translate([1, 1, 9])
    linear_extrude(2)
    text(project_text, 1, $fn = res);
}

translate([0, 10, 0])
difference() {
    cube([50, 10, 20]);
    
    translate([45, 8, 19])
    linear_extrude(2)
    text("50", 1, $fn = res);

    translate([1, 5.5, 19])
    rotate([0, 0, -90])
    linear_extrude(2)
    text("10", 1, $fn = res);

    translate([1, 6, 18])
    rotate([90, 0, -90])
    linear_extrude(2)
    text("20", 1, $fn = res);
}

translate([0, 20, 0])
difference() {
    cube([20, 10, 30]);
    
    translate([15, 8, 29])
    linear_extrude(2)
    text("20", 1, $fn = res);

    translate([1, 5.5, 29])
    rotate([0, 0, -90])
    linear_extrude(2)
    text("10", 1, $fn = res);

    translate([1, 6, 28])
    rotate([90, 0, -90])
    linear_extrude(2)
    text("30", 1, $fn = res);
}

translate([0, 30, 0])
difference() {
    cube([10, 10, 40]);
    
    translate([4.5, 8, 39])
    linear_extrude(2)
    text("10", 1, $fn = res);

    translate([1, 5.5, 39])
    rotate([0, 0, -90])
    linear_extrude(2)
    text("10", 1, $fn = res);

    translate([1, 6, 38])
    rotate([90, 0, -90])
    linear_extrude(2)
    text("40", 1, $fn = res);
}

difference() {
    union() {
        translate([0, -5, 0])
        cube([40, 5, 5]);
        translate([60, -5, 0])
        cube([40, 5, 5]);

        translate([0, -10, 0])
        cube([20, 5, 5]);
        translate([80, -10, 0])
        cube([20, 5, 5]);

        translate([0, -15, 0])
        cube([10, 5, 5]);
        translate([90, -15, 0])
        cube([10, 5, 5]);
    }

    translate([1, -7, 4])
    rotate([0, 0, -90])
    linear_extrude(2)
    text("15", 1, $fn = res);

    translate([38, -2, 4])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("20", 1, $fn = res);

    translate([18, -7, 4])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("60", 1, $fn = res);

    translate([8, -12, 4])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("80", 1, $fn = res);

    translate([1, -7, 3])   
    rotate([90, 0, -90])
    linear_extrude(2)
    text("5", 1, $fn = res);
}

difference() {
    translate([0, 0, 0])
    cube([100, 40, 5]);

    translate([77, 19, 4])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("d = 20, -18", 1, $fn = res);

    translate([92, 33, -1])
    cylinder(d = 12, h = 12, $fn = res);
    translate([80, 35, 4])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("d = -12", 1, $fn = res);

    translate([95, 18, -1])
    cylinder(d = 8, h = 12, $fn = res);
    translate([93, 23, 4])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("d = -8", 1, $fn = res);

    translate([45, 30, -1])
    cylinder(d = 18, h = 12, $fn = res);
    translate([36, 23, 4])
    rotate([0, 0, 90])
    linear_extrude(2)
    text("d = -18", 1, $fn = res);

    translate([28, 30 -1])
    cylinder(d = 14, h = 12, $fn = res);
    translate([36, 33, 4])
    rotate([0, 0, 90])
    linear_extrude(2)
    text("d = -14", 1, $fn = res);
}

difference() {
    translate([60, 20, 0])
    cylinder(d = 10, h = 10, $fn = res);
    translate([58, 19, 9])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("d = 10", 1, $fn = res);
}

difference() {
    translate([65, 32, 0])
    cylinder(d = 15, h = 15, $fn = res);
    translate([63, 31, 14])
    rotate([0, 0, 0])
    linear_extrude(2)
    text("d = 15", 1, $fn = res);
}

difference() {
    translate([80, 20, 0])
    cylinder(d = 20, h = 10, $fn = res);

    translate([80, 20, 5])
    cylinder(d = 18, h = 6, $fn = res);
}

translate([45, 20, 10]) {
    difference() {
        translate([0, 0, 0])
        rotate([-90, 0, 0])
        cylinder(d = 5, h = 5, $fn = res);
        translate([1.5, 5, 0])
        rotate([90, 0, 180])
        text("d = 5", 1, $fn = res);
    }
}

translate([35, 20, 12]) {
    difference() {
        translate([0, 0, 0])
        rotate([-90, 0, 0])
        cylinder(d = 10, h = 5, $fn = res);
        translate([1.5, 5, 0])
        rotate([90, 0, 180])
        text("d = 10", 1, $fn = res);
    }
}

