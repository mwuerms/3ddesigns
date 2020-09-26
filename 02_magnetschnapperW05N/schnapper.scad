/**
 * Martin Egli
 * 2020-09-26
 */
res = 40;

module fe15() {
    color("Silver")
    translate([0,0,15/2])
    rotate([90,0,0])
    cylinder(r=15/2, h = 0.2, $fn=res);
}

module w05n() {
    color("Silver")
    translate([0,0,0])
    cube([5,5,5]);
}

module schnapper(r1=1) {
    difference() {
        union() {
            // front
            hull() {
                translate([3.05,0.5,0.5+10])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,0.5,0.5+10])
                sphere(r=r1/2, $fn = res);
                
                translate([3.05,0.5,0.5])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,0.5,0.5])
                sphere(r=r1/2, $fn = res);
            }
            // bottom
            hull() {
                translate([3.05,0.5,0.5])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,0.5,0.5])
                sphere(r=r1/2, $fn = res);
                
                translate([3.05,1.5+5.2,0.5])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,1.5+5.2,0.5])
                sphere(r=r1/2, $fn = res);
            }
            // back
            hull() {
                translate([3.05,1.5+5.2,0.5+4])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,1.5+5.2,0.5+4])
                sphere(r=r1/2, $fn = res);
                
                translate([3.05,1.5+5.2,0.5])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,1.5+5.2,0.5])
                sphere(r=r1/2, $fn = res);
            }
            // left
            hull() {
                translate([3.05,0.5,0.5+10])
                sphere(r=r1/2, $fn = res);
                translate([3.05,1.5+5.2,0.5+4])
                sphere(r=r1/2, $fn = res);
                
                
                translate([3.05,1.5+5.2,0.5])
                sphere(r=r1/2, $fn = res);
                translate([3.05,0.5,0.5])
                sphere(r=r1/2, $fn = res);
            }
            // right
            hull() {
                translate([-3.05,0.5,0.5+10])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,1.5+5.2,0.5+4])
                sphere(r=r1/2, $fn = res);
                
                
                translate([-3.05,1.5+5.2,0.5])
                sphere(r=r1/2, $fn = res);
                translate([-3.05,0.5,0.5])
                sphere(r=r1/2, $fn = res);
            }
            translate([-5.4/2, 1, 1])
            cube([5.4, 5.7, 4]);
        }
        translate([0, (1.5+5.2+1)/2, -1])
        cylinder(r=3.1/2, h = 8, $fn = res);
        translate([0, (1.5+5.2+1)/2, 5])
        cylinder(r=6/2, h = 8, $fn = res);
        translate([0, (1.5+5.2+1)/2, 5-2])
        cylinder(r1 = 3.1/2, r2= 6/2, h = 2, $fn = res);
    }
}

schnapper();
//translate([-5/2, 1.1, 5])
//w05n();
//fe15();
