/**
 * Martin Egli
 * 2020-09-28
 */
res = 50;

module holderD() {
    difference() {
        hull() {
            translate([0,0,1])
            cylinder(d=10, h=8, $fn=res);
            translate([0,0,0])
            cylinder(d=8, h=10, $fn=res);
        
            translate([0, -5, 1])
            cube([30, 10, 8]);
            translate([0, -4, 0])
            cube([30, 8, 10]);
            translate([30, -4, 1])
            cube([1, 8, 8]);
        }
        // 6 mm pipe
        translate([0,0,-1])
        cylinder(d=6, h=12, $fn=res);
        
        translate([2, -1, -1])
        cube([10, 2, 12]);
        
        // M3 screw and nut cut out
        translate([7,6,5])
        rotate([90,0,0]) {
        cylinder(d=3, h = 12, $fn= res);
            translate([0,0,1])
            cylinder(d1=6, d2=3, h = 2, $fn= res);
            
            translate([0,0,9])
            cylinder(d=6.5, h = 2, $fn= 6);
        }
        
        // 6 mm pipe
        translate([15,0,5])
        rotate([0,90,0])
        cylinder(d=6, h = 16, $fn= res);        
        
        // M3 screw and nut cut out
        translate([23,6,5])
        rotate([90,0,0]) {
            cylinder(d=3, h = 12, $fn= res);
            translate([0,0,1])
            cylinder(d1=6, d2=3, h = 2, $fn= res);
            
            translate([0,0,9])
            cylinder(d=6.5, h = 2, $fn= 6);
        }
        // cut in half
        //translate([-5, 0, -5])
        //cube(40);
    }
}

module holderEAll() {
    difference() {
        union() {
            hull() {
                translate([0,0,1])
                cylinder(d=10, h=2, $fn=res);
                translate([-10.5,0,1])
                cylinder(d=10, h=2, $fn=res);
                translate([0,0,0])
                cylinder(d=8, h=1, $fn=res);
                translate([-10.5,0,0])
                cylinder(d=8, h=1, $fn=res);
            }
            
            // 6 mm axis top
            translate([0,0,0])
            cylinder(d=6, h=7.5, $fn=res);
            // 6 mm axis bottom
            translate([0,0,8.5])
            cylinder(d=6, h=7.5, $fn=res);
            
            hull() {
                translate([0,0,13])
                cylinder(d=10, h=2, $fn=res);
                translate([-10.5,0,13])
                cylinder(d=10, h=2, $fn=res);
                translate([0,0,15])
                cylinder(d=8, h=1, $fn=res);
                translate([-10.5,0,15])
                cylinder(d=8, h=1, $fn=res);
            }
            
            translate([-10.5,0,1])
            cylinder(d=10, h=14, $fn=res);
            
            hull(){
                translate([-10.5,0,0]) {
                    translate([0,0,0])
                    cylinder(d=8, h=1, $fn=res);
                    translate([0,0,1])
                    cylinder(d=10, h=14, $fn=res);
                    translate([0,0,15])
                    cylinder(d=8, h=1, $fn=res);
                }
                
                translate([-20.5,0,0]) {
                    translate([0,0,0])
                    cylinder(d=8, h=1, $fn=res);
                    translate([0,0,1])
                    cylinder(d=10, h=14, $fn=res);
                    translate([0,0,15])
                    cylinder(d=8, h=1, $fn=res);
                }
            }
            
            
            hull(){
                translate([-20.5,0,0]) {
                    translate([0,0,0])
                    cylinder(d=8, h=1, $fn=res);
                    translate([0,0,1])
                    cylinder(d=10, h=14, $fn=res);
                    translate([0,0,15])
                    cylinder(d=8, h=1, $fn=res);
                }
                
                translate([-20.5-(20*cos(75)),(20*sin(75)),0]) {
                    translate([0,0,0])
                    cylinder(d=4, h=1, $fn=res);
                    translate([0,0,1])
                    cylinder(d=6, h=14, $fn=res);
                    translate([0,0,15])
                    cylinder(d=4, h=1, $fn=res);
                }
            }
        }
    
        // M3 screw and nut cut out
        translate([0,0,-1]) {
        //rotate([90,0,0]) {
            cylinder(d=3, h = 18, $fn= res);
            translate([0,0,1])
            cylinder(d1=6, d2=3, h = 2, $fn= res);
            
            translate([0,0,15])
            cylinder(d=6.5, h = 2, $fn= 6);
        }
        // M3 screw and nut cut out
        translate([-10.5,0,-1]) {
        //rotate([90,0,0]) {
            cylinder(d=3, h = 18, $fn= res);
            translate([0,0,1])
            cylinder(d1=6, d2=3, h = 2, $fn= res);
            
            translate([0,0,15])
            cylinder(d=6.5, h = 2, $fn= 6);
        }
    }
}

module holderELeft() {
    difference() {
        translate([0,0,-8])
        holderEAll();
        translate([-35, -35, 0])
        cube(70);
    }
}

module holderERight() {
    difference() {
        translate([0,0,-8])
        holderEAll();
        translate([-35, -35, -70])
        cube(70);
    }
}

//holderD();
//translate([0,0,-3]) holderEAll();
//translate([0,0,-2]) holderELeft();
//translate([0,0,+2]) holderERight();