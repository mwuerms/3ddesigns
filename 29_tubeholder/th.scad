/** 
 * Martin Egli
 * 2022-05-04
 * Holder for 103 mm OD carton tube for "garden bomb" as opposite to "tisch bomb"
 */

module tubeholder(od_tube = 103, loc_res = 64) {
    id_hold = od_tube + 1;
    thick = 5;
    
    difference() {
        union() {
            // bottom ring
            translate([0, 0, 0])
            cylinder(d = id_hold + 2*thick, h = thick, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d = id_hold + thick, h = 50, $fn = loc_res);
            
            r = id_hold/2 + 30;
            r2 = r - thick;
            r3 = (id_hold + thick)/2-thick/2;
            for(n = [0:1:5]) {
                difference() {
                    hull() {
                        translate([0, 0, 0])
                        cylinder(d = 4*thick, h = thick, $fn = loc_res);
                        translate([r*sin(n*60), r*cos(n*60), 0])
                        cylinder(d = 4*thick, h = thick, $fn = loc_res);
                    }
                    translate([r*sin(n*60), r*cos(n*60), -1])
                    cylinder(d = 3, h = thick+2, $fn = loc_res);
                }
                hull() {
                    translate([r2*sin(n*60), r2*cos(n*60), thick/2])
                    rotate([0, 90, -n*60])
                    translate([0, 0, -thick/2-1])
                    cylinder(d = thick, h = thick+2, $fn = loc_res);
                    translate([r3*sin(n*60), r3*cos(n*60), thick/2])
                    rotate([0, 90, -n*60])
                    translate([0, 0, -thick/2-1])
                    cylinder(d = thick, h = thick+2, $fn = loc_res);
                    translate([r3*sin(n*60), r3*cos(n*60), 50-thick/2])
                    rotate([0, 90, -n*60])
                    translate([0, 0, -thick/2-1])
                    cylinder(d = thick, h = thick+2, $fn = loc_res);
                }
            }
        }
        translate([0, 0, -1])
        cylinder(d = id_hold, h = 52, $fn = loc_res);
        translate([35, -15, -2])
        cube([30, 30, 54]);
    }
    
}
tubeholder();