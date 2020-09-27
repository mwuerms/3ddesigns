/**
 * Martin Egli
 * 2020-09-27
 */
res = 20;
 
module holderA() {
         difference() {
         rotate([-(90-55), 0, 0]) {
             difference() {
                 hull() {
                     translate([-5,-4,0])
                     cube([10, 8, 32]);
                     translate([-4,-5,0])
                     cube([8, 10, 32]);
                     translate([-4,-4,32])
                     cube([8, 8, 1]);
                 }
                 // from top
                 // alupipe, 6 mm
                 translate([0,0,32-15])
                 cylinder(d=6.1, h=15, $fn = res);
                 translate([0,0,32])
                 cylinder(d1=6.1, d2= 7, h=1, $fn = res);
                 
                 // M3 screw
                 translate([0,6,25])
                 rotate([90,0,0])
                 cylinder(d=3, h=12,$fn=res);
                 
                 translate([0,5,25])
                 rotate([90,0,0])
                 cylinder(d2=3, d1=6, h=2,$fn=res);
                 
                 // from side
                 // alupipe, 6 mm
                 translate([-6,0,12])
                 rotate([0,90,0])
                 cylinder(d=6.1, h=15, $fn = res);
                 translate([-5,0,12])
                 rotate([0,90,0])
                 cylinder(d2=6.1, d1= 7, h=1, $fn = res);
                 translate([5,0,12])
                 rotate([0,-90,0])
                 cylinder(d2=6.1, d1= 7, h=1, $fn = res);
                 
                 // M3 screw
                 translate([0,6,12])
                 rotate([90,0,0])
                 cylinder(d=3, h=12,$fn=res);
                 
                 translate([0,5,12])
                 rotate([90,0,0])
                 cylinder(d2=3, d1=6, h=2,$fn=res);
             }
         }
         translate([-10, -10, -3.5])
         cube([20, 20, 5]);
    }
}
module holderB() {
}
module holderC() {
     difference() {
         rotate([-(90-74), 0, 0]) {
             difference() {
                 hull() {
                     translate([-5,-4,0])
                     cube([10, 8, 20]);
                     translate([-4,-5,0])
                     cube([8, 10, 20]);
                     translate([-4,-4,20])
                     cube([8, 8, 1]);
                 }
                 // alupipe, 6 mm
                 translate([0,0,20-15])
                 cylinder(d=6.1, h=15, $fn = res);
                 translate([0,0,20])
                 cylinder(d1=6.1, d2= 7, h=1, $fn = res);
                 
                 // M3 screw
                 translate([0,6,12])
                 rotate([90,0,0])
                 cylinder(d=3, h=12,$fn=res);
                 
                 translate([0,5,12])
                 rotate([90,0,0])
                 cylinder(d2=3, d1=6, h=2,$fn=res);
             }
         }
         translate([-10, -10, -1.5])
         cube([20, 20, 3]);
    }
}


holderA();
//holderB();
//holderC();
 
 