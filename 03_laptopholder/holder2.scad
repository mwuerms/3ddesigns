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
            cylinder(d=6.2, h = 2, $fn= 6);
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
            cylinder(d=6.2, h = 2, $fn= 6);
        }
        
        //translate([-5, 0, -5])
        //cube(40);
    }
}

holderD();

