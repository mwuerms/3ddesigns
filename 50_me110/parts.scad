/**
 * Martin Egli
 * 2022-10-30
 * 12 cm ventilator to suck solder fumes
 */

module vent8cm(col = "Gray", loc_res = 32) {
    distxy = (77.5+65)/2;
    rad_edge = (80-distxy)/2;
    distxy2 = distxy/2;
    hi1 = 11;
    
    color(col) {
        difference() {
            union() {    
                hull() {
                    translate([+distxy2, +distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                    translate([+distxy2, -distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                    translate([-distxy2, +distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                    translate([-distxy2, -distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                }
            }
            // M4 holes
            translate([+distxy2, +distxy2, -1])
            cylinder(d=4.5, h=hi1+2, $fn = loc_res);
            translate([+distxy2, -distxy2, -1])
            cylinder(d=4.5, h=hi1+2, $fn = loc_res);
            translate([-distxy2, +distxy2, -1])
            cylinder(d=4.5, h=hi1+2, $fn = loc_res);
            translate([-distxy2, -distxy2, -1])
            cylinder(d=4.5, h=hi1+2, $fn = loc_res);
            
            translate([+distxy2, +distxy2, hi1-2])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            translate([+distxy2, -distxy2, hi1-2])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            translate([-distxy2, +distxy2, hi1-2])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            translate([-distxy2, -distxy2, hi1-2])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            
            translate([+distxy2, +distxy2, -1])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            translate([+distxy2, -distxy2, -1])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            translate([-distxy2, +distxy2, -1])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            translate([-distxy2, -distxy2, -1])
            cylinder(d=6.4, h=2+1, $fn = loc_res);
            
            // center hole for vent
            translate([0, 0, -1])
            cylinder(d=77, h=hi1+2, $fn = loc_res);
        }
        // vent in the middle, no blades though
        translate([0, 0, 0])
        cylinder(d=30, h=2, $fn = 2*loc_res);
        translate([0, 0, 2.5])
        cylinder(d=30, h=(10.5-2.5), $fn = 2*loc_res);
        
        // vent holder
        r1 = (30-5)/2;
        for(n=[0:1:3]) {
            translate([r1*sin(n*90+45), r1*cos(n*90+45)])
            rotate([0, 0, -45-n*90])
            hull() {
                translate([0, 0, 0])
                cylinder(d = 5, h = 2, $fn = loc_res);
                translate([38, 0, 0])
                cylinder(d = 5, h = 2, $fn = loc_res);
            }
        }
    }
}
*vent8cm();

module vent12cm(col = "Gray", loc_res = 32) {
    distxy = (110+100.5)/2;
    distxy2 = distxy/2;

    color(col) {
        difference() {
            union() {    
                hull() {
                    translate([+distxy2, +distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                    translate([+distxy2, -distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                    translate([-distxy2, +distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                    translate([-distxy2, -distxy2, 0])
                    cylinder(r=7.5, h=25, $fn = loc_res);
                }
            }
            // M4 holes
            translate([+distxy2, +distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            translate([+distxy2, -distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            translate([-distxy2, +distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            translate([-distxy2, -distxy2, -1])
            cylinder(d=4.5, h=25+2, $fn = loc_res);
            // center hole for vent
            translate([0, 0, -1])
            cylinder(d=120-2-2, h=25+2, $fn = loc_res);
        }
        translate([0, 0, 0])
        cylinder(d=40, h=4, $fn = loc_res);
        translate([0, 0, 5])
        cylinder(d=40, h=20, $fn = loc_res);

        r1 = (20-2);
        for(n=[0:1:3]) {
            hull() {
                translate([r1*sin(n*90+45), r1*cos(n*90+45), 0])
                cylinder(d=4, h=4, $fn = loc_res);
                translate([r1*sin(n*90+45)+64*sin(n*90+(45+90)), r1*cos(n*90+45)+64*cos(n*90+(45+90)), 0])
                cylinder(d=4, h=4, $fn = loc_res);
            }
        }
    }
}

module filter8cm(col = "Gray") {
    wid1 = 75;
    color(col)
    translate([-wid1/2, -wid1/2, 0])
    cube([wid1, wid1, 10]);
}
*filter8cm();

module filter(col = "Gray", loc_res = 32) {
    color(col)
    translate([-130/2, -130/2, 0])
    cube([130, 130, 11]);
}

module m5Nut(loc_res = 32) {
    difference() {
        cylinder(d = 9, h = 4, $fn = 6);
        translate([0, 0, -1])
        cylinder(d = 5, h = 6, $fn = loc_res);
    }
}
*m5Nut();

module m5Nut_cut(len = 4+1, loc_res = 32) {
    cylinder(d = 9.6, h = len, $fn = 6);
    cylinder(d = 5, h = len+4, $fn = loc_res);
}
*m5Nut_cut();

module m5ballhead_screw(m5_dia = 5, len = 22, loc_res = 32) {
    difference() {
        union() {
            cylinder(d = m5_dia, h = len, $fn = loc_res);
            translate([0, 0, 25-9/2])
            sphere(d = 9, $fn = loc_res);
        }
        translate([0, 0, 25-1])
        cylinder(d = 3, h = 3, $fn = 6);
     
    }
}
*m5ballhead_screw();

module m3Nut(loc_res = 32) {
    difference() {
        cylinder(d = 6, h = 2.5, $fn = 6);
        translate([0, 0, -1])
        cylinder(d = 3, h = 6, $fn = loc_res);
    }
}
*m3Nut();

module m3Nut_cut(len = 2.5+1, loc_res = 32) {
    cylinder(d = 6.3, h = len, $fn = 6);
    cylinder(d = 3.2, h = len+10, $fn = loc_res);
}
*m3Nut_cut();

module m3Sinkhead_cut(len = 4, loc_res = 32) {
    cylinder(d = 6.2, h = len, $fn = loc_res);
    translate([0, 0, -2])
    cylinder(d1 = 3.2, d2 = 6.2, h = 2, $fn = loc_res);
    translate([0, 0, -(len+10)])
    cylinder(d = 3.2, h = len+10, $fn = loc_res);
}
m3Sinkhead_cut();