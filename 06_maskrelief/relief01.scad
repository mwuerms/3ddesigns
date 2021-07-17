/**
 * Martin Egli
 * 2021-06-23
 * a relife strip for corona masks
 */

res = 50;

module grip01(th = 0.6, wid = 15) {
    hull() {
        translate([0, 0, 0])
        cylinder(d = 10, h = th, $fn = res);
        translate([wid*cos(60), wid*sin(60), 0])
        cylinder(d = 10, h = th, $fn = res);
    }
    hull() {
        translate([0, 0, 0])
        cylinder(d = 10, h = th, $fn = res);
        translate([wid*cos(-60), wid*sin(-60), 0])
        cylinder(d = 10, h = th, $fn = res);
    }
}

module relief01(th = 0.6) {
    hull() {
        translate([-100+5, 0, 0])
        cylinder(d = 10, h = th, $fn = res);
        translate([100-5, 0, 0])
        cylinder(d = 10, h = th, $fn = res);
    }
    translate([-100, 0, 0])
    grip01(th);
    translate([-80, 0, 0])
    grip01(th);
    translate([-60, 0, 0])
    grip01(th);
    
    hull() {
        translate([-40, 0, 0])
        grip01(th);
        translate([40, 0, 0])
        mirror([1, 0, 0])
        grip01(th);
    }
    
    translate([100, 0, 0])
    mirror([1, 0, 0])
    grip01(th);
    translate([80, 0, 0])
    mirror([1, 0, 0])
    grip01(th);
    translate([60, 0, 0])
    mirror([1, 0, 0])
    grip01(th);
    
    
}

relief01();