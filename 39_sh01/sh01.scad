/**
 * Martin Egli
 * 2021-03-25
 */
res = 100;

module side_plate(th = 2) {
    difference(){
        union() {
            // side plate
            translate([-37/2, -37/2, 0])
            cube([37, 37, 2]);

            // bolting together
            translate([-25/2, -25/2, 2])
            cylinder(d = 4, h = 25, $fn = res);
            translate([+25/2, -25/2, 2])
            cylinder(d = 4, h = 25, $fn = res);    

            translate([-25/2, -25/2-1, 2])
            cube([24, 2, 25]);
            translate([-25/2-1, -25/2-1, 2])
            cube([2, 24, 25]);

        }

        // cut holes
        translate([-5, -5, -1])
        cube([10, 10, 4]);

        // MSR175+ mounting screws
        translate([-8/2, -20/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+8/2, -20/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-8/2, +20/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+8/2, +20/2, -1])
        cylinder(d = 2, h = 4, $fn = res);

        // bolting together
        translate([-25/2, -25/2, -1])
        cylinder(d = 2, h = 4+25, $fn = res);
        translate([+25/2, -25/2, -1])
        cylinder(d = 2, h = 4+25, $fn = res);
        translate([-25/2, +25/2, -1])
        cylinder(d = 2, h = 4+25, $fn = res);
        translate([+25/2, +25/2, -1])
        cylinder(d = 2, h = 4+25, $fn = res);

        // mounting to mount plate
        translate([-32/2, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-32/2, -32/2/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-32/2, 0, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-32/2, +32/2/2, -1])
        cylinder(d = 2, h = 4, $fn = res);

        translate([-32/2, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-32/2/2, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([0, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+32/2/2, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);

        translate([+32/2, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+32/2, +32/2/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+32/2, 0, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+32/2, -32/2/2, -1])
        cylinder(d = 2, h = 4, $fn = res);

        translate([+32/2, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+32/2/2, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([0, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-32/2/2, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
    }
}

module mount_plate(th = 2) {
    difference(){
        union() {
            // side plate
            translate([-25/2, -37/2, 0])
            cube([25, 37, 2]);
        }

        // mounting holes to pendulum
        translate([5, 0, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-5, +5, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([-5, -5, -1])
        cylinder(d = 2, h = 4, $fn = res);

        // mounting holes for side plate
        translate([-32/2/2, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([0, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+32/2/2, +32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);

        translate([-32/2/2, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([0, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
        translate([+32/2/2, -32/2, -1])
        cylinder(d = 2, h = 4, $fn = res);
    }
}


side_plate();
translate([15, 0, 25/2+2])
rotate([0, 90, 0])
mount_plate();

//side_plate();
//mount_plate();
