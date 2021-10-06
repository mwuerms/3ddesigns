/**
 * Martin Egli
 * 2021-09-27
 * cast a lego mini figure from choclate
 */
res = 20;

module legoHull(loc_res = 32, dia1 = 3) {
    difference()
    {
        union() {
            import(file = "legov3hull.stl");
            // funnel at top
            translate([0, 0, 80])
            cylinder(d1 = 10, d2 = 24, h = 6, $fn = loc_res);
            
            hull() {
                translate([-6, 1.5, 4-0.65])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-4, 1.5, 4-0.65])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            
                translate([-6, 1.5, 36])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-4, 1.5, 36])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            }

            hull() {
                translate([-1.5, 11, 4-0.65])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-1.5, -11, 4-0.65])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            
                translate([-1.5, 11, 36])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-1.5, -11, 36])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            }
            hull() {
                translate([6, 9+1.5, 4-0.65])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, 9+1.5, 1+.35])
                rotate([90, 0, 0])
                cylinder(d = 4, h = 3, $fn = loc_res);

                translate([6, 9+1.5, 36])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, 9+1.5, 39])
                rotate([90, 0, 0])
                cylinder(d = 2, h = 3, $fn = loc_res);
            }
            hull() {
                translate([6, -9+1.5, 4-0.65])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, -9+1.5, 1+.35])
                rotate([90, 0, 0])
                cylinder(d = 4, h = 3, $fn = loc_res);

                translate([6, -9+1.5, 36])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, -9+1.5, 39])
                rotate([90, 0, 0])
                cylinder(d = 2, h = 3, $fn = loc_res);
            }
            
        }
        import("legov3x2.stl");
        translate([0, 0, 36])
        cylinder(d = 10, h = 10, $fn = loc_res);
        translate([0, 0, 81])
        cylinder(d1 = 10, d2 = 24, h = 6, $fn = loc_res);
        
        // M3 holes
        translate([-7, 2.5, 10])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);

        translate([-7, 2.5, 30])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        
        translate([-2.5, 12, 6])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);

        translate([-2.5, -12, 6])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);

        translate([-2.5, 12, 34])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);

        translate([-2.5, -12, 34])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        
        
        translate([7, 12.5, 10])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 25, $fn = loc_res);

        translate([7, 12.5, 30])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 25, $fn = loc_res);
    }
}
        
// quadrant 1
module legoMold(part = 1) {
    difference() {
        translate([0, 0, 0])
        import("legov3MoldHull.stl");
        // show part 1
        if(part == 1) {
            // 2
            translate([0, 18, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -18-36, -5])
            cube([26, 36, 100]);
        }
        // show part 2
        else if(part == 2) {
             // 1
            translate([0, -18, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -18-36, -5])
            cube([26, 36, 100]);

        }
        // show quadrant 3
        else if(part == 3) {
            // 1
            translate([0, -18, -5])
            cube([26, 36, 100]);
            // 2
            translate([0, 18, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -18-36, -5])
            cube([26, 36, 100]);

        }
        // show part 4
        else if(part == 4) {
            // 1
            translate([0, -18, -5])
            cube([26, 36, 100]);
            // 2
            translate([0, 18, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -18-36, -5])
            cube([26, 36, 100]);
        }
        // show part 5
        else /* if(part == 5) */
        {
            // 1
            translate([0, -18, -5])
            cube([26, 36, 100]);
            // 2
            translate([0, 18, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
        }
    }
    /*
// 1
translate([0, -18, -5])
cube([26, 36, 100]);
// 2
translate([0, 18, -5])
cube([26, 36, 100]);
// 3
translate([-26, 0, -5])
cube([26, 36, 100]);
// 4
translate([-26, -36, -5])
cube([26, 36, 100]);
// 5
translate([0, -18-36, -5])
cube([26, 36, 100]);
*/
}

// molds
legoMold(5);
//legoHull();
