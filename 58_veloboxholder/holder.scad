/** 
 * Martin Egli
 * 2023-09-10
 * holder for velo box ("velochörbli") in front of bike
 */

module velobox(dia1 = 8, dia2 = 5.5, loc_res = 32) {
    // large left: -
    translate([-51/2, 0, 0]) {
        rotate([-90, 0, 90])
        rotate_extrude(angle = 180, $fn = 2*loc_res)
        translate([-36/2, 0, 0])
        circle(d = dia1, $fn = loc_res);
        
        translate([0, -36/2, -55])
        linear_extrude(55)
        circle(d = dia1, $fn = loc_res);
        translate([0, +36/2, -25])
        linear_extrude(25)
        circle(d = dia1, $fn = loc_res);
    }
    // large right: +
    translate([+51/2, 0, 0]) {
        rotate([-90, 0, 90])
        rotate_extrude(angle = 180, $fn = 2*loc_res)
        translate([-36/2, 0, 0])
        circle(d = dia1, $fn = loc_res);
        
        translate([0, -36/2, -55])
        linear_extrude(55)
        circle(d = dia1, $fn = loc_res);
        translate([0, +36/2, -25])
        linear_extrude(25)
        circle(d = dia1, $fn = loc_res);
    }
    // connector^ smaller
    translate([0, -36/2, 0]) {
        translate([0, 0, -23])
        rotate([90, 0, 0])
        rotate_extrude(angle = 180, $fn = 2*loc_res)
        translate([-40/2, 0, 0])
        circle(d = dia2, $fn = loc_res);

        translate([-40/2, 0, -23])
        linear_extrude(26)
        circle(d = dia2, $fn = loc_res);
        translate([+40/2, 0, -23])
        linear_extrude(26)
        circle(d = dia2, $fn = loc_res);
    }
    
}

module velobox_generic(loc_res = 32) {
    color("DarkGray")
    velobox(8, 5.5, loc_res);
}

module velobox_cutout(loc_res = 32) {
    velobox(9, 7, loc_res);
}




module holder1(part = 1, col = "LightGreen", loc_res = 32) {
    color(col) {
        difference() {
            union() {
                // left: -
                translate([-51/2, -10, 10])
                hull() {
                    translate([0, 0, -5])
                    sphere(d = 20, $fn = loc_res);
                    translate([0, 0, -35])
                    sphere(d = 20, $fn = loc_res);
                    
                    translate([0, -15, -5])
                    sphere(d = 20, $fn = loc_res);
                    translate([0, -15, -35])
                    sphere(d = 20, $fn = loc_res);
                }
                // right: +
                translate([+51/2, -10, 10])
                hull() {
                    translate([0, 0, -5])
                    sphere(d = 20, $fn = loc_res);
                    translate([0, 0, -35])
                    sphere(d = 20, $fn = loc_res);
                    
                    translate([0, -15, -5])
                    sphere(d = 20, $fn = loc_res);
                    translate([0, -15, -35])
                    sphere(d = 20, $fn = loc_res);
                }
                translate([-51/2, -35, -25])
                cube([51, 25, 30]);
            }
            velobox_cutout();
                
            if(part != 1) {
                translate([-40, -18, -40])
                cube([80, 25, 60]);
            }
            else {
                translate([-40, -45, -40])
                cube([80, 27, 60]);
            }
        }
    }
}

velobox_generic();
holder1(2);

