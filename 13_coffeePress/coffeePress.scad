/**
 * Martin Egli
 * 2021-09-29
 */
res = 40;
rad1 = 1;

minkowski()
{
    difference() {
        translate([0, 0, rad1])
        cylinder(d = 60-2*rad1, h = 10-2*rad1, $fn = res);
        translate([0, 0, rad1+2])
        cylinder(d = 60-2*rad1-4, h = 10-2*rad1, $fn = res);

    }
    sphere(r = rad1, $fn = res);
}




rad2 = 3;
minkowski()
{
    union() {
        translate([0, 0, rad2])
        cylinder(d = 10-2*rad2, h = 20-2*rad2, $fn = res);
        translate([0, 0, rad2+15])
        cylinder(d = 20-2*rad2, h = 10-2*rad2, $fn = res);
    }
    sphere(r = rad2, $fn = res);
}