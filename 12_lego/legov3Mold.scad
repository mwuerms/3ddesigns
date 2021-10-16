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
            //import(file = "legov3x2hull.stl");
            scale([2, 2, 2])
            import(file = "legov3hull.stl");
            // funnel at top
            translate([0, 0, 79])
            cylinder(d1 = 10, d2 = 20, h = 6, $fn = loc_res);
            
            hull() {
                translate([-12, 1.5, 4-0.64])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-4, 1.5, 4-0.64])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            
                translate([-12, 1.5, 76])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-4, 1.5, 76])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            }
            hull() {
                translate([-1.5, 22, 4-0.64])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-1.5, -22, 4-0.64])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            
                translate([-1.5, 22, 76])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-1.5, -22, 76])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            }
            hull() {
                translate([-1.5, 28, 4-0.64])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-1.5, -28, 4-0.64])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            
                translate([-1.5, 28, 45])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
                
                translate([-1.5, -28, 45])
                rotate([0, 90, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);
            }
            hull() {
                translate([12, 19+1.5, 4-0.64])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, 19+1.5, 1+.34])
                rotate([90, 0, 0])
                cylinder(d = 4, h = 3, $fn = loc_res);

                translate([12, 19+1.5, 76])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, 19+1.5, 79])
                rotate([90, 0, 0])
                cylinder(d = 2, h = 3, $fn = loc_res);
            }
            hull() {
                translate([12, -19+1.5, 4-0.64])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, -19+1.5, 1+.34])
                rotate([90, 0, 0])
                cylinder(d = 4, h = 3, $fn = loc_res);

                translate([12, -19+1.5, 76])
                rotate([90, 0, 0])
                cylinder(d = 8, h = 3, $fn = loc_res);

                translate([1, -19+1.5, 79])
                rotate([90, 0, 0])
                cylinder(d = 2, h = 3, $fn = loc_res);
            }
            // hand leg plate
            translate([4, -19, 3+1.5+15.2])
            cube([12, 38, 3]); 
            // leg plate
            translate([4, -19, 3+1.5])
            cube([12, 38, 3]); 
            // bottom stand
            hull() {
                translate([-14, -24, -1.3])
                cylinder(d = 8, h = 3, $fn = loc_res);
                translate([-14, +24, -1.3])
                cylinder(d = 8, h = 3, $fn = loc_res);
                translate([+14, -24, -1.3])
                cylinder(d = 8, h = 3, $fn = loc_res);                
                translate([+14, +24, -1.3])
                cylinder(d = 8, h = 3, $fn = loc_res);
            }
        }
        //import("legov3x2.stl");
        scale([2, 2, 2])
        import("legov3.stl");
        // funnel hole
        translate([0, 0, 70])
        cylinder(d = 10, h = 12, $fn = loc_res);
        translate([0, 0, 81])
        cylinder(d1 = 10, d2 = 20, h = 6, $fn = loc_res);
        
        // M3 holes
        translate([-12, 2.5, 10])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        translate([-12, 2.5, 45])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        translate([-13, 2.5, 70])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        
        translate([-2.5, 24, 14])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        translate([-2.5, -24, 14])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        translate([-2.5, 27, 36])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        translate([-2.5, -27, 36])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        translate([-2.5, 14, 66])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        translate([-2.5, -14, 66])
        rotate([0, 90, 0])
        cylinder(d = dia1, h = 5, $fn = loc_res);
        
        translate([8, 24, 10])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 48, $fn = loc_res);
        translate([12, 24, 45])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 48, $fn = loc_res);
        translate([13, 24, 70])
        rotate([90, 0, 0])
        cylinder(d = dia1, h = 48, $fn = loc_res);
        
        translate([12, 10, -2.5])
        cylinder(d = dia1, h = 35, $fn = loc_res);
        translate([12, -10, -2.5])
        cylinder(d = dia1, h = 35, $fn = loc_res);
        
    }
}
        
// quadrant 1
module legoMold(part = 1) {
    difference() {
        translate([0, 0, 0])
        import("legov3MoldHull3.stl");
        // show part 1
        if(part == 1) {
            
            // 2
            translate([0, 19, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -19-36, -5])
            cube([26, 36, 100]);
            // 6
            translate([0, -19, -5])
            cube([27, 38, 5+4.5+1.5]);
            // 7
            translate([0, -19, 4.5+1.5])
            cube([26, 38, 15.2]);
        }
        // show part 2
        else if(part == 2) {
            // 1
            translate([0, -19, 4.5+1.5+15.2])
            cube([26, 38, 100-25]);

            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -19-36, -5])
            cube([26, 36, 100]);
            // 6
            translate([0, -19, -5])
            cube([27, 38, 5+4.5+1.5]);
            // 7
            translate([0, -19, 4.5+1.5])
            cube([26, 38, 15.2]);
        }
        // show quadrant 3
        else if(part == 3) {
            // 1
            translate([0, -19, 4.5+1.5+15.2])
            cube([26, 38, 100-25]);
            // 2
            translate([0, 19, -5])
            cube([26, 36, 100]);

            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -19-36, -5])
            cube([26, 36, 100]);
            // 6
            translate([0, -19, -5])
            cube([27, 38, 5+4.5+1.5]);
            // 7
            translate([0, -19, 4.5+1.5])
            cube([26, 38, 15.2]);
        }
        // show part 4
        else if(part == 4) {
            // 1
            translate([0, -19, 4.5+1.5+15.2])
            cube([26, 38, 100-25]);
            // 2
            translate([0, 19, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);

            // 5
            translate([0, -19-36, -5])
            cube([26, 36, 100]);
            // 6
            translate([0, -19, -5])
            cube([27, 38, 5+4.5+1.5]);
            // 7
            translate([0, -19, 4.5+1.5])
            cube([26, 38, 15.2]);
        }
        // show part 5
        else if(part == 5) {
            // 1
            translate([0, -19, 4.5+1.5+15.2])
            cube([26, 38, 100-25]);
            // 2
            translate([0, 19, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);

            // 6
            translate([0, -19, -5])
            cube([27, 38, 5+4.5+1.5]);
            // 7
            translate([0, -19, 4.5+1.5])
            cube([26, 38, 15.2]);
        }
        // show part 5
        else if(part == 6) {
            // 1
            translate([0, -19, 4.5+1.5+15.2])
            cube([26, 38, 100-25]);
            // 2
            translate([0, 19, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -19-36, -5])
            cube([26, 36, 100]);

            // 7
            translate([0, -19, 4.5+1.5])
            cube([26, 38, 15.2]);
        }
        else /*if(part == 7)*/ {
            // 1
            translate([0, -19, 4.5+1.5+15.2])
            cube([26, 38, 100-25]);
            // 2
            translate([0, 19, -5])
            cube([26, 36, 100]);
            // 3
            translate([-26, 0, -5])
            cube([26, 36, 100]);
            // 4
            translate([-26, -36, -5])
            cube([26, 36, 100]);
            // 5
            translate([0, -19-36, -5])
            cube([26, 36, 100]);
            // 6
            translate([0, -19, -5])
            cube([27, 38, 5+4.5+1.5]);

        }
    }
/*
// 1
translate([0, -19, 4.5+1.5+15.2])
cube([26, 38, 100-25]);
// 2
translate([0, 19, -5])
cube([26, 36, 100]);
// 3
translate([-26, 0, -5])
cube([26, 36, 100]);
// 4
translate([-26, -36, -5])
cube([26, 36, 100]);
// 5
translate([0, -19-36, -5])
cube([26, 36, 100]);
// 6
translate([0, -19, -5])
cube([27, 38, 5+4.5+1.5]);
// 7
translate([0, -19, 4.5+1.5])
cube([26, 38, 15.2]);
*/
}

// molds
legoMold(7);
//legoHull();
