/**
 * Martin Egli
 * 2021-09-27
 * cast a lego mini figure from choclate
 */

module plug(len = 5, dia = 5.5*1.5, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = dia, h = len, $fn = loc_res);
    translate([0, 0, len])
    cylinder(d2 = dia-1, d1 = dia, h = 1, $fn = loc_res);
    translate([0, 0, 0])
    cylinder(d = 15, h = 2, $fn = loc_res);
}

module plugCut(dia = 5.5*1.5, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = dia+0.1, h = 10, $fn = loc_res);
    translate([0, 0, 10])
    cylinder(d2 = dia-1, d1 = dia+0.1, h = 1, $fn = loc_res);
    translate([0, 0, -10])
    cylinder(d = 15+2, h = 12, $fn = loc_res);
}

module headMold(cut_quad = 1, loc_res = 32) {
    difference() {
        union () {
            translate([0, 0, 0])
            import("legoFig1HeadHull1.5.stl");
            
            translate([-30/2, -3/2, -3])
            cube([30, 3, 20]);
            
            translate([-3/2, -30/2, -3])
            cube([3, 30, 20]);
        }
        
        translate([0, 0, 0])
        import("legoFig1Head1.5.stl");
        
        translate([0, 0, 10])
        cylinder(d = 5*1.5, h = 10, $fn = loc_res);
        
        translate([0, 0, -3.3])
        plugCut();

        // M3 holes
        translate([-11, -11, 7])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([11, -11, 7])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([-11, -11, 7])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([-11, 11, 7])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
    
        if(cut_quad != 1) {
            // quadrant 1
            translate([0, 0, -5])
            cube([20, 20, 30]);
        }
        if(cut_quad != 2) {
            // quadrant 2
            translate([-20, 0, -5])
            cube([20, 20, 30]);
        }
        if(cut_quad != 3) {
            // quadrant 3
            translate([-20, -20, -5])
            cube([20, 20, 30]);
        }
        if(cut_quad != 4) {
            // quadrant 4
            translate([0, -20, -5])
            cube([20, 20, 30]);
        }
    }
}
module bodyMold(cut_quad = 1, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            import("legoFig1BodyHull1.5.stl");
            translate([-30/2, -3/2, -3])
            cube([30, 3, 26]);
            translate([-3/2, -36/2, -3])
            cube([3, 36, 26]);
        }
        
        translate([0, 0, 0])
        import("legoFig1Body1.5.stl");
        
        translate([0, 0, 10])
        cylinder(d = 5*1.5, h = 20, $fn = loc_res);
        
        translate([0, 0, -3])
        plugCut();
        
        translate([0, (10-1)*1.5, 10*1.5])
        rotate([90, 0, 0])
        plugCut();
        
        translate([0, (-10+1)*1.5, 10*1.5])
        rotate([-90, 0, 0])
        plugCut();
        
        // M3 holes
        translate([-11, -11, 10])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([11, -11, 10])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([-11, -15, 4])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([-11, 15, 4])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        
        if(cut_quad != 1) {
            // quadrant 1
            translate([0, 0, -5])
            cube([20, 20, 30]);
        }
        if(cut_quad != 2) {
            // quadrant 2
            translate([-20, 0, -5])
            cube([20, 20, 30]);
        }
        if(cut_quad != 3) {
            // quadrant 3
            translate([-20, -20, -5])
            cube([20, 20, 30]);
        }
        if(cut_quad != 4) {
            // quadrant 4
            translate([0, -20, -5])
            cube([20, 20, 30]);
        }
    }
}

module armMold(cut_quad = 1, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            rotate([0, 25, 0])
            import("legoFig1ArmHull21.5.stl");

            translate([-3/2, -5, -30])
            cube([3, 20, 40]);
            translate([-10, 5-3/2, -30])
            cube([20, 3, 40]);
        }
        translate([0, 0, 0])
        rotate([0, 25, 0])
        import("legoFig1Arm1.5.stl");
        
        rotate([90, 0, 0])
        cylinder(d = 5*1.5, h = 10, $fn = loc_res);
        
        // M3 holes
        translate([-6, -11, 6])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([6, -11, -8])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([-11, -1, -12])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([-11, 12, -12])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        
        if(cut_quad != 1) {
            // quadrant 1
            translate([0, 5, -31])
            cube([20, 20, 42]);
        }
        if(cut_quad != 2) {
            // quadrant 2
            translate([-20, 5, -31])
            cube([20, 20, 42]);
        }
        if(cut_quad != 3) {
            // quadrant 3
            translate([-20, -20+5, -31])
            cube([20, 20, 42]);
        }
        if(cut_quad != 4) {
            // quadrant 4
            translate([0, -20+5, -31])
            cube([20, 20, 42]);
        }
    }
}

module legsMold(cut_quad = 1, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            import("legoFig1LegsHull1.5.stl");
            
            translate([-30/2, -6-3/2, -1])
            cube([30, 3, 28]);
            translate([-30/2, +6-3/2, -1])
            cube([30, 3, 28]);
            
            translate([0, -4.5-3/2, 9])
            cube([15, 12, 3]);
            
            translate([-3/2, -36/2, -1])
            cube([3, 36, 28]);
            translate([-3/2, -36/2, -1])
            cube([3, 36, 28]);
        }
        
        translate([0, 0, 0])
        import("legoFig1Legs1.5.stl");
        
        translate([0, 0, 20])
        cylinder(d = 5*1.5, h = 10, $fn = loc_res);
        
        // M3 holes
        translate([-11, -11, 10])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([11, -11, 6])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([11, -11, 20])
        rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        
        translate([11, 0, 0])
        //rotate([-90, 0, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        
        translate([-11, -15, 14])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        translate([-11, 15, 14])
        rotate([0, 90, 0])
        cylinder(d = 3.2, h = 22, $fn = loc_res);
        
        if(cut_quad != 1) {
            // quadrant 1
            translate([0, 6, -5])
            cube([20, 20, 40]);
        }
        if(cut_quad != 2) {
            // quadrant 2
            translate([-20, 6, -5])
            cube([20, 20, 40]);
        }
        if(cut_quad != 3) {
            // quadrant 3
            translate([-20, -6, -5])
            cube([20, 12, 40]);
        }
        if(cut_quad != 4) {
            // quadrant 4
            translate([-20, -20-6, -5])
            cube([20, 20, 40]);
        }
        if(cut_quad != 5) {
            // quadrant 5
            translate([0, -20-6, -5])
            cube([20, 20, 40]);
        }
        if(cut_quad != 6) {
            // quadrant 6
            translate([0, -6, -5])
            cube([20, 12, 5+9+3/2]);
        }
        if(cut_quad != 7) {
            // quadrant 7
            translate([0, -6, 9+3/2])
            cube([20, 12, 24.5]);
        }
    }
}


//0headMold(4);
//bodyMold(4);
//mirror([0, 1, 0])
//armMold(4);
legsMold(1);

//plug(7);
