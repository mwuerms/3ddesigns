/**
 * Martin Egli
 * 2021-12-18
 */
module star(loc_res = 32) {
    difference() {
        union() {
        cylinder(d1 = 40, d2 = 30, h = 3, $fn = loc_res);    
        for(n = [0:1:4])
            linear_extrude(2)
            rotate([0, 0, n*360/5])
            polygon([[-14, 0], [0, 40], [14, 0]]);
    }
        minkowski() {
            translate([-13.5, -3.5, 2])
            linear_extrude(3)
            text("CHEF", size = 7);
            cylinder(d = 0.75, h = 0.1, $fn = 6);
        }
    }
}

module helper_star(loc_res = 32) {
    difference() {
        union() {
        cylinder(d1 = 40, d2 = 30, h = 3, $fn = loc_res);    
        for(n = [0:1:4])
            linear_extrude(2)
            rotate([0, 0, n*360/5])
            polygon([[-14, 0], [0, 40], [14, 0]]);
    }
        /*minkowski() {
            translate([-13.5, -3.5, 2])
            linear_extrude(3)
            text("CHEF", size = 7);
            cylinder(d = 0.75, h = 0.1, $fn = 6);
        }*/
        translate([-10, 5, 2])
        linear_extrude(3)
        text("HILFS", size = 5);
        translate([-13.5, -2.5, 2])
        linear_extrude(3)
        text("TAGES", size = 6);
        translate([-10, -10, 2])
        linear_extrude(3)
        text("CHEF", size = 5);
    }
}
//star();
helper_star();
