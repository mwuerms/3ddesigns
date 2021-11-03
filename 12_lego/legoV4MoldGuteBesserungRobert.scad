/**
 * Martin Egli
 * 2021-09-27
 * cast a lego mini figure from choclate
 */
res = 20;


module legoV4Mold(part = 1, loc_res = 32, dia1 = 3) {
    difference()
    {
        hull() {
            translate([0, -27, -5])
            rotate([0, 90, 0])
            cylinder(d = 8, h = 20, $fn = loc_res);
            translate([0, +27, -5])
            rotate([0, 90, 0])
            cylinder(d = 8, h = 20, $fn = loc_res);
            translate([0, -27, 85])
            rotate([0, 90, 0])
            cylinder(d = 8, h = 20, $fn = loc_res);
            translate([0, +27, 85])
            rotate([0, 90, 0])
            cylinder(d = 10, h = 20, $fn = loc_res);
        }
        
        import("legoV4GuteBesserungRobertFigure1.stl");
        
        // back
        translate([-30, -40, -10])
        cube([30, 80, 100]);
        
        if(part != 1) {
            // 1
            translate([0, -40, -10])
            cube([10, 40, 100]);
        }
        if(part != 2) {
            // 2
            translate([0,   0, -10])
            cube([10, 40, 100]);
        }
        if(part != 3) {
            //3
            translate([10, -40, -10])
            cube([10, 20, 100]);
        }
        if(part != 4) {
            //4
            translate([10, -20, -10])
            cube([10, 20, 100]);
        }
        if(part != 5) {
            //5
            translate([10,   0, -10])
            cube([10, 20, 100]);
        }
        if(part != 6) {
            //6
            translate([10,  20, -10])
            cube([10, 20, 100]);
        }
        
        // M3 holes
        translate([-2.5, 18, 0])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 40, $fn = loc_res);
        translate([-2.5, -18, 0])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 40, $fn = loc_res);
        translate([-2.5,  24, 14])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 40, $fn = loc_res);
        translate([-2.5, -24, 14])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 40, $fn = loc_res);
        translate([-2.5, 16, 66])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 40, $fn = loc_res);
        translate([-2.5, -16, 66])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 40, $fn = loc_res);
        
        translate([5, 40, -3])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 80, $fn = loc_res);
        translate([5, 40, 84])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 80, $fn = loc_res);
        
        translate([15, 40, 10])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 80, $fn = loc_res);
        translate([15, 40, 70])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 80, $fn = loc_res);
    }
}

legoV4Mold(6);
