/**
 * Martin Egli
 * 2021-10-16
 * pcb vise
 */

module curveElem(rad1 = 5, w = 1, th = 2, quad = 1, loc_res = 32) {
    difference () {
        translate([0, 0, 0])
        cylinder(r = rad1 + w/2, h = th, $fn = loc_res);
        translate([0, 0, -0.5])
        cylinder(r = rad1 - w/2, h = th + 1, $fn = loc_res);
        
        if(quad == 1) {
            // 2
            translate([-(rad1+w), 0, -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 3
            translate([-(rad1+w), -(rad1+w), -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 4
            translate([0, -(rad1+w), -0.5])
            cube([rad1+w, rad1+w, th+1]);
        }
        else if(quad == 2) {
            // 1
            translate([0, 0, -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 3
            translate([-(rad1+w), -(rad1+w), -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 4
            translate([0, -(rad1+w), -0.5])
            cube([rad1+w, rad1+w, th+1]);
        }
        else if(quad == 3) {
            // 1
            translate([0, 0, -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 2
            translate([-(rad1+w), 0, -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 4
            translate([0, -(rad1+w), -0.5])
            cube([rad1+w, rad1+w, th+1]);
        }
        else /* if(quad == 4) */ {
            // 1
            translate([0, 0, -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 2
            translate([-(rad1+w), 0, -0.5])
            cube([rad1+w, rad1+w, th+1]);
            // 3
            translate([-(rad1+w), -(rad1+w), -0.5])
            cube([rad1+w, rad1+w, th+1]);
        }
    }
}

module lineElem(L = 5, w = 1, th = 2) {
    translate([-w/2, 0, 0])
    cube([w, L, th]);
}

module spring1(w = 1, th = 2) {
    translate([0, 0, 0])
    curveElem(5, w, th, 3);
    translate([0, 0, 0])
    curveElem(5, w, th, 4);
    translate([5, 0, 0])
    lineElem(5, w, th);
    translate([10, 5, 0])
    curveElem(5, w, th, 2);
    translate([10, 5, 0])
    curveElem(5, w, th, 1);
    translate([15, -10, 0])
    lineElem(15, w, th);
    translate([20, -10, 0])
    curveElem(5, w, th, 3);
    translate([20, -10, 0])
    curveElem(5, w, th, 4);
    translate([25, -10, 0])
    lineElem(15, w, th);
    translate([30, 5, 0])
    curveElem(5, w, th, 2);
    translate([30, 5, 0])
    curveElem(5, w, th, 1);
    translate([35, 0, 0])
    lineElem(5, w, th);
    translate([40, 0, 0])
    curveElem(5, w, th, 3);
    translate([40, 0, 0])
    curveElem(5, w, th, 4);
}

module spring(w = 1, th = 2) {
    translate([0, 0, 0])
    curveElem(3, w, th, 3);
    translate([0, -6, 0])
    curveElem(3, w, th, 2);
    translate([0, 0, 0])
    curveElem(3, w, th, 4);
    translate([3, 0, 0])
    lineElem(6, w, th);
    translate([6, 6, 0])
    curveElem(3, w, th, 2);
    translate([6, 6, 0])
    curveElem(3, w, th, 1);
    translate([9, -12, 0])
    lineElem(18, w, th);
    translate([12, -12, 0])
    curveElem(3, w, th, 3);
    translate([12, -12, 0])
    curveElem(3, w, th, 4);
    translate([15, -12, 0])
    lineElem(6, w, th);
    translate([18, -6, 0])
    curveElem(3, w, th, 2);
    translate([18, -6, 0])
    curveElem(3, w, th, 1);
    translate([18, 0, 0])
    curveElem(3, w, th, 4);
}

module partA1(loc_res = 32) {
    translate([-3+1, -60, 0]) {
        difference() {
            cube([20, 120, 22]);
            translate([10, 20, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20, -0.5])
            cylinder(d = 7.2, h = 4.5, $fn = 6);
            translate([10, 20+40, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20+40, -0.5])
            cylinder(d = 7.2, h = 4.5, $fn = 6);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 7.2, h = 4.5, $fn = 6);
        
            translate([-1, 60, 11])
            rotate([0, 90, 0])
            cylinder(d = 6.2, h = 22, $fn = loc_res);    
        }
    }
}

module partA2(loc_res = 32) {
    translate([-3+1, -60, 0]) {
        difference() {
            cube([20, 120, 22]);
            translate([10, 20, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20, -0.5])
            cylinder(d = 7.2, h = 4.5, $fn = 6);
            translate([10, 20+40, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20+40, -0.5])
            cylinder(d = 7.2, h = 18.5, $fn = 6);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 7.2, h = 4.5, $fn = 6);
        
            translate([-1, 60, 11])
            rotate([0, 90, 0])
            cylinder(d = 6.5, h = 22, $fn = loc_res);
        }
    }
}

module partA3(loc_res = 32) {
    translate([-3+1, -60, 0]) {
        difference() {
            cube([20, 120, 22]);
            translate([10, 20, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20, -0.5])
            cylinder(d = 7.2, h = 4.5, $fn = 6);
            translate([10, 20+40, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20+40, -0.5])
            cylinder(d = 7.2, h = 18.5, $fn = 6);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 3.2, h = 22+1, $fn = loc_res);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 7.2, h = 4.5, $fn = 6);
        
            translate([-1, 60, 11])
            rotate([0, 90, 0])
            cylinder(d = 6.5, h = 22, $fn = loc_res);    

            hull() {
                translate([-1, 85, -1])
                rotate([0, 90, 0])
                cylinder(d = 2, h = 22, $fn = loc_res);    
                translate([-1, 85, 11])
                rotate([0, 90, 0])
                cylinder(d = 2, h = 22, $fn = loc_res);    
            }
            hull() {
                translate([-1, 85, 11])
                rotate([0, 90, 0])
                cylinder(d = 2, h = 22, $fn = loc_res);    
                translate([-1, 35, 11])
                rotate([0, 90, 0])
                cylinder(d = 2, h = 22, $fn = loc_res);    
            }
            translate([10, 20+40+15, -0.5])
            cylinder(d = 6.5, h = 22+1, $fn = loc_res);
            translate([10, 20+40+15, -0.5])
            cylinder(d = 12.5, h = 4.5, $fn = 6);
        }
    }
}

module partB(loc_res = 32) {
    translate([-3+1, -60, 0]) {
        difference() {
            cube([20, 120, 2]);
            translate([10, 20, -0.5])
            cylinder(d = 3.2, h = 2+1, $fn = loc_res);
            translate([10, 20+40, -0.5])
            cylinder(d = 3.2, h = 2+1, $fn = loc_res);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 3.2, h = 2+1, $fn = loc_res);
        }
    }
}

module partC(loc_res = 32) {
    translate([-3+1, -60, 0]) {
        difference() {
            cube([20, 120, 8]);
            translate([10, 20, -0.5])
            cylinder(d = 3.2, h = 8+1, $fn = loc_res);
            translate([10, 20, 8-2.5])
            cylinder(d1 = 3.2, d2 = 8, h = 2+1, $fn = loc_res);
            translate([10, 20+40, -0.5])
            cylinder(d = 3.2, h = 8+1, $fn = loc_res);
            translate([10, 20+40, 8-2.5])
            cylinder(d1 = 3.2, d2 = 8, h = 2+1, $fn = loc_res);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 3.2, h = 8+1, $fn = loc_res);
            translate([10, 20+40+40, 8-2.5])
            cylinder(d1 = 3.2, d2 = 8, h = 2+1, $fn = loc_res);

            translate([17, -10, 4])
            rotate([0, 45, 0])
            cube([10, 140, 10]);
        }
    }
}

module partD(loc_res = 32) {
    translate([-3+1, -60, 0]) {
        difference() {
            cube([20, 120, 2]);
            translate([10, 20, -0.5])
            cylinder(d = 3.2, h = 2+1, $fn = loc_res);
            translate([10, 20+40, -0.5])
            cylinder(d = 3.2, h = 2+1, $fn = loc_res);
            translate([10, 20+40+40, -0.5])
            cylinder(d = 3.2, h = 2+1, $fn = loc_res);
        }
    }
    translate([20, 40, 0])
    mirror([0, 0, 0])
    spring(2, 2);
    translate([20, -40, 0])
    mirror([0, 1, 0])
    spring(2, 2);
    translate([23+20-3, -60, 0]) {
        difference() {
            cube([20, 120, 2]);
            translate([10, 20, -0.5])
            // senkkopf
            cylinder(d1 = 3.2, d2 = 7, h = 2+1, $fn = loc_res);
            translate([10, 20+40, -0.5])
            cylinder(d1 = 3.2, d2 = 7, h = 2+1, $fn = loc_res);
            translate([10, 20+40+40, -0.5])
            cylinder(d1 = 3.2, d2 = 7, h = 2+1, $fn = loc_res);
            translate([10, 20+40+15, -0.5])
            cylinder(d = 6.5, h = 22+1, $fn = loc_res);
        }
    }
}

//partA1(); // 1x
//partA2(); // 1x
partA3(); // 1x
//partB();  // 1x
//partC();  // 2x
//partD();    // 1x
