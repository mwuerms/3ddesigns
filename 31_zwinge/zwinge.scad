/**
 * Martin Egli
 * 2022-07-07
 */

module h40x10(len = 150) {
    cube([40-0.5, len, 10-0.5]);
}
module h10x40(len = 150) {
    cube([10-0.5, len, 40-0.5]);
}

module h10x25(len = 150) {
    cube([10-0.5, len, 25-0.5]);
}
module zwinge1(len = 100, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            h10x40(len);
            translate([10, 0, 0])
            h40x10(len);
            translate([10, 0, 10])
            h40x10(len/2-5);
            translate([10, len/2+5, 10])
            h40x10(len/2-5);
            translate([10, 0, 20])
            h40x10(len);

            translate([50, 0, 0])
            h10x25(len);
        }
        #translate([-15, len/2, 15])
        rotate([0, 90, 0])
        cylinder(d = 8, h = 100, $fn = loc_res);
        #translate([55, len/2, 15])
        rotate([0, 90, 0])
        cylinder(r = 5.7, h = 10, $fn = 6);
        
        #translate([30, 1/4*len, -5])
        cylinder(d = 8, h = 50, $fn = loc_res);
        #translate([30, 3/4*len, -5])
        cylinder(d = 8, h = 50, $fn = loc_res);
    }
}

module zwinge2(len = 100, loc_res = 32) {
    difference() {
        union() {
            translate([10, 0, 0])
            h10x40(len);
            translate([0, 0, 0])
            h10x25(len);
            
            #translate([-1.5, len/2, 15])
            rotate([0, 90, 0])
            cylinder(d = 12, h = 1, $fn = loc_res);
            
            #translate([-10, len/2, 15])
            rotate([0, 90, 0])
            cylinder(r = 5.7, h = 10, $fn = 6);
        }
        #translate([-10, len/2, 15])
        rotate([0, 90, 0])
        cylinder(d = 8, h = 40, $fn = loc_res);
    }
}

translate([100, 0, 0])
zwinge1();

translate([-0, 0, 0])
zwinge2();