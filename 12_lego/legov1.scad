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
            translate([0, 0, 0])
            cylinder(d = 6.5, h = 1, $fn = loc_res);
            
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
            a1 =20;
            for(n = [0:1:40]) {
                translate([5*cos(-a1+n), 5*sin(-a1+n), -6*sin(90-20+n)+2.15*4.5])
                sphere(d = 1, $fn = loc_res);
            }
            /*translate([5*cos(+a1), 5*sin(+a1), 4.5])
            sphere(d = 1.5, $fn = loc_res);
            translate([5*cos(-a1), 5*sin(-a1), 4.5])
            sphere(d = 1.5, $fn = loc_res);*/
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
        rad1 = 0.5;
        // lower
        translate([-8/2+rad1, -15/2+rad1, 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([-8/2+rad1, +15/2-rad1, 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+8/2-rad1, -15/2+rad1, 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+8/2-rad1, +15/2-rad1, 0+rad1])
        sphere(r = rad1, $fn = loc_res);
        
        // upper
        translate([-8/2+rad1, -11/2+rad1, 13-rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([-8/2+rad1, +11/2-rad1, 13-rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+8/2-rad1, -11/2+rad1, 13-rad1])
        sphere(r = rad1, $fn = loc_res);
        translate([+8/2-rad1, +11/2-rad1, 13-rad1])
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
    cube([8, 15, 2]);
}

module legoArm(loc_res = 20, show_origin = 1) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    hull() {
    translate([0, 5.5/2, 0])
    sphere(d = 5.5, $fn = loc_res);
    translate([0, 5.5/2, -9+5.5])
    sphere(d = 5.5, $fn = loc_res);
    }
}
module legoFigure(loc_res = 20, show_origin = 1) {
    if(show_origin) {
        translate([0, 0, 0])
        sphere(d = 1, $fn = loc_res);
    }
    translate([0, 0, 16+13])
    legoHead(loc_res, show_origin, 1);
    translate([0, 0, 16])
    legoBody(loc_res, show_origin);
    translate([0, 0, 0])
    legoLegs(loc_res, show_origin);
}
//legoFigure(20, 0);
legoArm();
