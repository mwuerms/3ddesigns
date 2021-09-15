/**
 * Martin Egli
 * 2021-09-15
 */
res = 40;

cube([140, 10, 10]);

translate([-10, 0, 0])
difference() {
    cube([10, 10, 3]);
    translate([5, 5, -1])
    cylinder(d = 4, h = 5, $fn = res);
}
    

translate([140, 0, 0])
difference() {
    cube([10, 10, 3]);
    translate([5, 5, -1])
    cylinder(d = 4, h = 5, $fn = res);
}
