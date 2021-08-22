/**
 * Martin Egli
 * 2021-08-22
 * tip kick replacement hat
 */
res = 50;

module hat(dout = 7, din = 4.5, dhole = 1.5, hhole = 3) {
    translate([0, 0, hhole])
    cylinder(d = dout, h = 2, $fn = res);
    difference() {
        translate([0, 0, 0])
        cylinder(d = din, h = hhole, $fn = res);
        translate([0, 0, -1])
        cylinder(d = dhole, h = hhole + 1, $fn = res);
    }
}

hat();
