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
    // middle "leg"
    translate([-4, -0.5, 0]) {
        cube([7, 2, 2]);
        cube([4.5, 2, 11]);
    }
    
    translate([0, -8+0.5, 16-2-4+1])
    rotate([-90, 0, 0])
    cylinder(r = 4, h = 15, $fn = loc_res);
    
    translate([-4, -8+0.5, 16-2])
    cube([8, 15, 2.2]);
}

module legoArmsWide(loc_res = 20, show_origin = 1, wid1 = 2, complex_hand = 1) {
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
                    //sphere(d = 4.0, $fn = loc_res);
                    rotate([0, -50, 0])
                    cylinder(d = 4, h = 4, $fn = loc_res);
                    translate([4, 5.7-wid1, -5-5])
                    //sphere(d = 4.0, $fn = loc_res);
                    rotate([0, -50, 0])
                    cylinder(d = 4, h = 4, $fn = loc_res);
                }
            }
            translate([2, 1-wid1, -12])
            rotate([0, 50, 0])
            cube([7, 9+wid1, 7]);
        }
        if(complex_hand) {
            // complex hand
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
        else /* !complex_hand */ {
            // simple hand
            translate([3.5, 5.75, -9.5])
            rotate([0, 50, 0])
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
        }
    }
}

module legoFigure(loc_res = 20, show_origin = 1, show_face = 1, complex_hand = 1, arm_angle = 0) {
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
    
    // left arm
    translate([0, 6, 16+10])
    rotate([0, arm_angle, 0])
    mirror([0, 0, 0])
    legoArmsWide(loc_res, show_origin, 1, complex_hand);
    // right arm
    translate([0, -6, 16+10])
    rotate([0, arm_angle, 0])
    mirror([0, 1, 0])
    legoArmsWide(loc_res, show_origin, 1, complex_hand);
    
}

// testing
//legoHead();
//legoArmsWide();
//legoLegs();
   
// normal figure
//scale([2, 2, 2])
//legoFigure(32, 0, 1, 1, 22);
//legoFigure(10, 0, 1, 0, 22);

// outline + 1mm
/*minkowski() {
    scale([2, 2, 2])
    legoFigure(10, 0, 0, 0, 22);
    sphere(d = 1.3, $fn = 20);
}
*/
