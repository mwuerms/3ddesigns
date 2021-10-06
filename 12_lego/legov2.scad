/**
 * Martin Egli
 * 2021-09-27
 * cast a lego mini figure from choclate
 */
res = 20;

module legoHead(loc_res = 20, show_origin = 1, show_face = 1) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    difference()
    {
        union() 
        {
            // lower receiver
            translate([0, 0, -0.2])
            cylinder(d = 6.5, h = 1.5, $fn = loc_res);
            
            minkowski()
            {
                translate([0, 0, 2+1])
                cylinder(d = 10-2-2, h = 8.5-2-2, $fn = loc_res);
                
                sphere(r = 2, $fn = loc_res);
            }
            // upper plug
            translate([0, 0, 0])
            cylinder(d = 5, h = 11, $fn = loc_res);
        }
        if(show_face) {
            // eyes
            a1 = 25;
            translate([5*cos(+a1), 5*sin(+a1), 6.5])
            sphere(d = 1, $fn = loc_res);
            translate([5*cos(-a1), 5*sin(-a1), 6.5])
            sphere(d = 1, $fn = loc_res);
            
            // mouth
            /* too much stuff, does not work
            a2 =20;
            for(n = [0:1:40]) {
                translate([5*cos(-a2+n), 5*sin(-a2+n), -6*sin(90-20+n)+2.15*4.5])
                sphere(d = 1, $fn = loc_res);
            }*/
            /*translate([5*cos(+a1), 5*sin(+a1), 4.5])
            sphere(d = 1.5, $fn = loc_res);
            translate([5*cos(-a1), 5*sin(-a1), 4.5])
            sphere(d = 1.5, $fn = loc_res);*/
        
        translate([4.7, 0, 6])
        rotate([0, 90, 0])
        minkowski() {
            difference() {
                translate([0, 0, 0])
                cylinder(d = 5, h = 0.1, $fn = 50);
                translate([0, 0, -0.5])
                cylinder(d = 4.9, h = 2, $fn = 50);
                
                translate([-5, -2.5, -0.5])
                cube([5, 5, 2]);
                
                translate([-0, -2.5, -0.5])
                cube([3, 1, 3]);
                translate([-0, 1.5, -0.5])
                cube([3, 1, 3]);
            }
            sphere(d = 1, $fn = 32);
            }
        }
    }
}

module legoBody(loc_res = 20, show_origin = 1) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    hull()
    {
        rad1 = 1;
        // lower
        translate([-(8/2-rad1), -(15/2-rad1), 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([-(8/2-rad1), +(15/2-rad1), 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+(8/2-rad1), -(15/2-rad1), 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+(8/2-rad1), +(15/2-rad1), 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        
        // upper
        translate([-(8/2-rad1), -(11/2-rad1), 13-rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([-(8/2-rad1), +(11/2-rad1), 13-rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+(8/2-rad1), -(11/2-rad1), 13-rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+(8/2-rad1), +(11/2-rad1), 13-rad1])
        sphere(r = rad1, $fn = loc_res);
    }
}

module legoLegs(loc_res = 20, show_origin = 1) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    // left leg
    translate([-4, 0.5, 0]) {
        cube([8, 7, 3]);
        cube([5.5, 7, 11]);
    }
    // right leg
    translate([-4, -8+0.5, 0]) {
        cube([8, 7, 3]);
        cube([5.5, 7, 11]);
    }
    
    translate([0, -8+0.5, 16-2-4+1])
    rotate([-90, 0, 0])
    cylinder(r = 4, h = 15, $fn = loc_res);
    
    translate([-4, -8+0.5, 16-2])
    cube([8, 15, 2.2]);
}

module legoArms(loc_res = 20, show_origin = 1) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    // left arm
    translate([0, -2, 0]) {
        difference() {
            union () {
                hull() {
                    translate([0, 5.5/2, 0])
                    sphere(d = 5.5, $fn = loc_res);
                    translate([0, 5, -5])
                    sphere(d = 5.0, $fn = loc_res);
                }
                hull() {
                    translate([0, 5, -5])
                    sphere(d = 5.0, $fn = loc_res);
                    translate([4, 5.7, -5-5])
                    sphere(d = 4.0, $fn = loc_res);
                }
            }
            //translate([0, -4, -10])
            //legoBody(loc_res, show_origin);
            
            translate([2, 1, -12])
            rotate([0, 50, 0])
            cube([7, 7, 7]);
        }
        // hand
        translate([3.5, 5.75, -9.5])
        rotate([0, 50, 0])
        difference() {
            union() {
                translate([0, 0, 0])
                rotate([0, 90, 0])
                cylinder(d = 3, h= 5, $fn = loc_res);
                translate([5/2+2, 0, -3/2])
                rotate([0, 0, 0])
                cylinder(d = 5, h= 4, $fn = loc_res);
            }
            translate([4, 3, 1])
            difference() {
                translate([0, -6, -6])
                cube([6, 6, 6]);
                translate([0, 0.5, 0])
                rotate([90, 0, 0])
                cylinder(d = 5.2, h= 7, $fn = loc_res);
            }
            translate([6.6, -3, 0.5])
            cube([3, 6, 3]);
        }
    }
}

module legoArmsWide(loc_res = 20, show_origin = 1, wid1 = 2) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    // left arm
    translate([0, -2, 0]) {
        difference() {
            union () {
                hull() {
                    translate([0, 5.5/2, 0])
                    sphere(d = 5.5, $fn = loc_res);
                    translate([0, 5.5/2-wid1, 0])
                    sphere(d = 5.5, $fn = loc_res);
                    translate([0, 5, -5])
                    sphere(d = 5.0, $fn = loc_res);
                    translate([0, 5-wid1, -5])
                    sphere(d = 5.0, $fn = loc_res);
                }
                hull() {
                    translate([0, 5, -5])
                    sphere(d = 5.0, $fn = loc_res);
                    translate([0, 5-wid1, -5])
                    sphere(d = 5.0, $fn = loc_res);
                    translate([4, 5.7, -5-5])
                    sphere(d = 4.0, $fn = loc_res);
                    translate([4, 5.7-wid1, -5-5])
                    sphere(d = 4.0, $fn = loc_res);
                }
            }
            translate([2, 1-wid1, -12])
            rotate([0, 50, 0])
            cube([7, 9+wid1, 7]);
        }
        // hand
        translate([3.5, 5.75, -9.5])
        rotate([0, 50, 0])
        difference() {
            union() {
                hull() {
                    translate([0, 0, 0])
                    rotate([0, 90, 0])
                    cylinder(d = 3, h= 5, $fn = loc_res);
                    translate([0, -wid1, 0])
                    rotate([0, 90, 0])
                    cylinder(d = 3, h= 5, $fn = loc_res);
                }
                hull() {
                    translate([5/2+2, 0, -3/2])
                    rotate([0, 0, 0])
                    cylinder(d = 5, h= 4, $fn = loc_res);
                    translate([5/2+2, -wid1, -3/2])
                    rotate([0, 0, 0])
                    cylinder(d = 5, h= 4, $fn = loc_res);
                }
            }
            translate([4, 3-wid1, 1])
            difference() {
                translate([0, -6-wid1, -6])
                cube([6, 6+2+wid1, 6]);
                translate([0, 0.5+wid1, 0])
                rotate([90, 0, 0])
                cylinder(d = 5.2, h= 9+wid1, $fn = loc_res);
            }
            translate([6.6, -3-2.5-wid1, 0.5])
            cube([3, 9+wid1, 3]);
        }
    }
}

module legoFigure(loc_res = 20, show_origin = 1, show_face = 1, arm_angle = 0) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    translate([0, 0, 16+13])
    legoHead(loc_res, show_origin, show_face);
    translate([0, 0, 16])
    legoBody(loc_res, show_origin);
    translate([0, 0, 0])
    legoLegs(loc_res, show_origin);
    /* no arms
    // left arm
    translate([0, 6, 16+10])
    rotate([0, arm_angle, 0])
    mirror([0, 0, 0])
    legoArmsWide(loc_res, show_origin, 1);
    // right arm
    translate([0, -6, 16+10])
    rotate([0, arm_angle, 0])
    mirror([0, 1, 0])
    legoArmsWide(loc_res, show_origin, 1);
    */
}

module legoHull(loc_res = 32) {
    difference()
    {
        union() {
            import(file = "legov21hullNoArms.stl");
            // arm sleves
            hull() {
                translate([0, 7, 27])
                sphere(d = 8, $fn = loc_res);
                translate([-2, 8, 18])
                sphere(d = 8, $fn = loc_res);
                translate([2, 9, 12])
                sphere(d = 8, $fn = loc_res);
            }
            hull() {
                translate([0, -7, 27])
                sphere(d = 8, $fn = loc_res);
                translate([-2, -8, 18])
                sphere(d = 8, $fn = loc_res);
                translate([2, -9, 12])
                sphere(d = 8, $fn = loc_res);
            }
            translate([-10, -1.5, -0.64])
            cube([20, 3, 41]);
            translate([-1.5, -16, -0.64])
            cube([3, 32, 41]);
            /*translate([-10, -15, -0.64])
            cube([20, 30, 41]);
            translate([0, 0, -0.64])
            cylinder(d = 15, h = 41, $fn = 20);*/
            /*hull() {
                translate([0, 7, -0.64])
                cylinder(d = 15, h = 30, $fn = 20);
                translate([0, -7, -0.64])
                cylinder(d = 15, h = 30, $fn = 20);
            }*/
        }
        import("legov21.stl");
        translate([0, 0, 36])
        cylinder(d = 5, h = 10, $fn = 32);
        
        // 1mm screw holes
        translate([6, -3, 6])
        rotate([0, 90, 90])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([8, -3, 20])
        rotate([0, 90, 90])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([8, -3, 34])
        rotate([0, 90, 90])
        cylinder(d = 1, h = 6, $fn = 20);

        translate([-7, -3, 6])
        rotate([0, 90, 90])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([-7, -3, 20])
        rotate([0, 90, 90])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([-8, -3, 34])
        rotate([0, 90, 90])
        cylinder(d = 1, h = 6, $fn = 20);        
        
        translate([-3, 11, 6])
        rotate([0, 90, 0])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([-3, 14, 20])
        rotate([0, 90, 0])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([-3, 8, 34])
        rotate([0, 90, 0])
        cylinder(d = 1, h = 6, $fn = 20);

        translate([-3, -11, 6])
        rotate([0, 90, 0])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([-3, -14, 20])
        rotate([0, 90, 0])
        cylinder(d = 1, h = 6, $fn = 20);
        translate([-3, -8, 34])
        rotate([0, 90, 0])
        cylinder(d = 1, h = 6, $fn = 20);
        
        // "cutting edge XD hehe"
        translate([-3, -19, -5])
        rotate([20, 0, 0])
        cube([6, 10, 20]);
        translate([-3, 19-10, -5])
        rotate([-20, 0, 0])
        cube([6, 10, 20]);
        
        translate([-3, 19-3, 20])
        rotate([20, 0, 0])
        cube([6, 10, 23]);
     
        translate([-3, -20-6, 22])
        rotate([-20, 0, 0])
        cube([6, 10, 25]);   
    }
}
        
// quadrant 1
module hullQuadrant(quad = 1) {
    difference() {
        translate([0, 0, 0])
        legoHull();
        // show quadrant 1
        if(quad == 1) {
            // 2
            translate([-26, 0, -5])
            cube([26, 26, 50]);
            // 3
            translate([-26, -20, -5])
            cube([26, 26, 50]);
            // 4
            translate([0, -26, -5])
            cube([26, 26, 50]);
        }
        // show quadrant 2
        else if(quad == 2) {
            // 1
            translate([0, 0, -5])
            cube([26, 26, 50]);
            // 3
            translate([-26, -26, -5])
            cube([26, 26, 50]);
            // 4
            translate([0, -26, -5])
            cube([26, 26, 50]);
        }
        // show quadrant 3
        else if(quad == 3) {
            // 1
            translate([0, 0, -5])
            cube([26, 26, 50]);
            // 2
            translate([-26, 0, -5])
            cube([26, 26, 50]);
            // 4
            translate([0, -26, -5])
            cube([26, 26, 50]);
        }
        // show quadrant 4
        else /* if(quad == 4) */ {
            // 1
            translate([0, 0, -5])
            cube([26, 26, 50]);
            // 2
            translate([-26, 0, -5])
            cube([26, 26, 50]);
            // 3
            translate([-26, -26, -5])
            cube([26, 26, 50]);
        }
    }
}

// molds
scale([3, 3, 3])
hullQuadrant(1);
//hullQuadrant(2);
//hullQuadrant(3);
//hullQuadrant(4);


// testing
//legoHead();
//legoArms();
//legoArmsWide();
//legoLegs();
   
// normal figure
//legoFigure(32, 0, 1, 22);
//legoFigure(12, 0, 1, 22);

// outline + 1mm
/*minkowski() {
    legoFigure(10, 0, 0, 22);
    sphere(d = 1.3, $fn = 20);
}
*/
