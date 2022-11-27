/**
 * Martin Egli
 * 2021-04-02
 */
res = 200;


translate([-23, 0, 2])
linear_extrude(height = 2)
text("14000", size = 12, font="Liberation Sans:style=Bold", $fn = res);
translate([-23, -12, 2])
linear_extrude(height = 2)
text("20.7 km", size = 9, font="Liberation Sans:style=Bold", $fn = res);

difference() {
    translate([0, 0, 0])
    cylinder(d = 57, h = 4, $fn = res);
    translate([0, 0, 2])
    cylinder(d = 52, h = 3, $fn = res);
}
for(n = [0:1:3])
translate([60/2*cos(45+n*90), 60/2*sin(45+n*90), 0])
difference() {
    translate([0, 0, 0])
    cylinder(d = 7, h = 2, $fn = res);
    translate([0, 0, -.5])
    cylinder(d = 3, h = 3, $fn = res);
}