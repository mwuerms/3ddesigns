/**
 * Martin Egli
 * 2022-10-11
 */
module k750foot_v1_0(loc_res = 32) {
    difference() {
        union() {
            difference() {
                union() {
                    translate([0, 0, 0])
                    rotate([-90, 0, 0])
                    cylinder(d = 4, h = 7.5, $fn = loc_res);
                    difference() {
                        hull() {
                            translate([-(28-2), -1.5, 0])
                            cube([28-2-16, 9, 2]);
                            translate([-(12), 0, 0])
                            cube([6, 7.5, 2]);
                        }
                        translate([-28-2.18, -2, 3])
                        rotate([0, 90-8, 0])
                        cube([6, 11, 4]);
                    }
                    translate([-(6), 0, 0])
                    cube([6, 7.5, 2]);
                }

                translate([0, -1, 0])
                rotate([-90, 0, 0])
                cylinder(d = 2, h = 9.5, $fn = loc_res);

                translate([0, -1, -2])
                rotate([-90, 0, 0])
                cylinder(d = 3, h = 9.5, $fn = loc_res);
            }
            translate([1.5*cos((90+45)), 0, -1.5*sin((90+45))])
            rotate([-90, 0, 0])
            cylinder(d = 1, h = 7.5, $fn = loc_res);
            translate([1.5*cos((90-45)), 0, -1.5*sin((90-45))])
            rotate([-90, 0, 0])
            cylinder(d = 1, h = 7.5, $fn = loc_res);
            }
    
        translate([-3, 2, -3])
        cube([6, 3.5, 3]);
        
        #translate([-3*sqrt(2)/2, 2, 3.7])
        rotate([0, 45, 0])
        cube([3, 3.5, 3]);
    }
}

k750foot_v1_0();

translate([-55, 0, 0])
mirror([1, 0, 0])
k750foot_v1_0();
