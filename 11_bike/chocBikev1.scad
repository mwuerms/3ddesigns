/**
 * Martin Egli
 * 2021-09-22
 * chocolate bike
 */

res = 20;
module minkowskiBike(loc_res = 5) {
    minkowski()
    {
        scale([0.5, 0.5, 1])
        linear_extrude(0.01)
        import(file="bike1.dxf");
        // a bit complexer outline
        union() {
            translate([0, 0, 0])
            cylinder(r1 = 1.5, r2 = 1.2, h = 0.5, $fn = loc_res);
            translate([0, 0, 0.5])
            cylinder(r1 = 1.2, r2 = 0.5, h = 0.5, $fn = loc_res);
        }
    }
}

//minkowskiBike(6);

module bottomPlate(xyratio = 1) {
    translate([53, 5, 0])
    rotate([0, 180, 0])
    mirror([0, 0,  1])
    scale([xyratio, xyratio, 1])
    import(file = "chocBikev1.stl");
   
    rad1 = 5;
    difference() {
        minkowski() {
            translate([4.3-2+rad1, 3.7-2+rad1, -1])
            cube([50.2+4-2*rad1, 32+4-2*rad1, 1]);
            cylinder(r1 = rad1, r2 = rad1, h = 2, $fn = res);
        }
        minkowski() {
            translate([4.3-2+rad1, 3.7-2+rad1, 0])
            cube([50.2+4-2*rad1, 32+4-2*rad1, 1]);
            cylinder(r1 = 3, r2 = rad1, h = 2, $fn = res);
        }
    }
}

module case(xyratio = 1) {
    rad1 = 5;
    difference() {
        minkowski() {
            translate([4.3-2+rad1, 3.7-2+rad1, -1])
            cube([50.2+4-2*rad1, 32+4-2*rad1, 5]);
            cylinder(r1 = rad1+2, r2 = rad1+2, h = 2, $fn = res);
        }
        minkowski() {
            translate([4.3-2+rad1, 3.7-2+rad1, -1.5])
            cube([50.2+4-2*rad1, 32+4-2*rad1, 5+1]);
            cylinder(r1 = rad1, r2 = rad1, h = 2, $fn = res);
        }
    }
}
//bottomPlate(1);
case(1);