/**
 * Martin Egli
 * 2021-05-19
 */

res = 50;

module bv_domino(l, b, t, d1 = 3, number = 1) {
    difference() {
        /*if(bev == 0) {
            translate([0, 0, 0])
            cube([l,b,t]);
        }
        else {
            hull() {
                translate([0, bev, bev])
                cube([l,b-2*bev,t-2*bev]);
                translate([bev, 0, bev])
                cube([l-2*bev,b,t-2*bev]);
                translate([bev, bev, t-bev])
                cube([l-2*bev,b-2*bev,1]);
                translate([bev, bev, 0])
                cube([l-2*bev,b-2*bev,1]);
            }
        }*/
        // body
        hull() {
            translate([d1/2, d1/2, 0])
            cylinder(d = d1, h = t, $fn = res);
            translate([l-d1/2, d1/2, 0])
            cylinder(d = d1, h = t, $fn = res);
            translate([l-d1/2, b-d1/2, 0])
            cylinder(d = d1, h = t, $fn = res);
            translate([d1/2, b-d1/2, 0])
            cylinder(d = d1, h = t, $fn = res);
        }
        // line
        hull() {
            translate([l/2, 3, t])
            sphere(d = 2, $fn = res);
            translate([l/2, b-3, t])
            sphere(d = 2, $fn = res);
        }
        // bv logo
        translate([5, b-2.5, t-2])
        rotate([0, 0, -90])
        scale([0.3, 0.3, 3]) {
            difference() {
                translate([0,0,0])
                linear_extrude(height = 1, center = false, convexity= 3)
                import(file = "bvLogo1.dxf");

                translate([0,0,-0.5])
                linear_extrude(height = 2, center = false, convexity= 3)
                import(file = "bvLogo2.dxf");
            }
        }
        // 5 dots
        // middle
        xmiddle = l/2+(l/2)/2;
        ymiddle = b/2;
        dotdia = 7;
        dotdepth = 2;
        if((number == 1) || (number == 3) || (number == 5)) {
            translate([xmiddle, ymiddle, t+dotdepth])
            sphere(d = dotdia, $fn = res);
        }
        if((number == 2) || (number == 3) || (number == 4) || (number == 5) || (number == 6)) {
            translate([xmiddle+b*0.25, ymiddle+b*0.25, t+dotdepth])
            sphere(d = dotdia, $fn = res);
        }
        if((number == 6)) {
            translate([xmiddle+b*0, ymiddle+b*0.25, t+dotdepth])
            sphere(d = dotdia, $fn = res);
        }
        if((number == 4) || (number == 5) || (number == 6)) {
            translate([xmiddle+b*0.25, ymiddle-b*0.25, t+dotdepth])
            sphere(d = dotdia, $fn = res);
        }
        if((number == 4) || (number == 5) || (number == 6)) {
            translate([xmiddle-b*0.25, ymiddle+b*0.25, t+dotdepth])
            sphere(d = dotdia, $fn = res);
        }
        if((number == 6)) {
            translate([xmiddle-b*0, ymiddle-b*0.25, t+dotdepth])
            sphere(d = dotdia, $fn = res);
        }
        if((number == 2) || (number == 3) || (number == 4) || (number == 5) || (number == 6)) {
            translate([xmiddle-b*0.25, ymiddle-b*0.25, t+dotdepth])
            sphere(d = dotdia, $fn = res);
        }
    }
}
// dots for 1, 2, 3, 4, 5, 6
bv_domino(56, 28, 13, 4, 6);
