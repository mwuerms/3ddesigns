/**
 * Martin Egli
 * 2022-10-30
 * 12 cm ventilator to suck solder fumes
 */
use <parts.scad>

module part1(col = "LightGreen", loc_res = 32) {
    distxy = (110+100.5)/2;
    distxy2 = distxy/2;
    distxy3 = 132/2 - 15/2 +3;
    distz = 12;

    color(col) {
        difference() {
            union() {   
                hull() { 
                    hull() {
                        translate([+distxy2, +distxy2, 0])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                        translate([+distxy2, -distxy2, 0])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                        translate([-distxy2, +distxy2, 0])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                        translate([-distxy2, -distxy2, 0])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                    }

                    hull() {
                        translate([+distxy3, +distxy3, distz])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                        translate([+distxy3, -distxy3, distz])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                        translate([-distxy3, +distxy3, distz])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                        translate([-distxy3, -distxy3, distz])
                        cylinder(r=7.5, h=0.1, $fn = loc_res);
                    }
                }
                // holder
                hull() {
                    translate([132/2+distz*3/4, 20/2, distz/2])
                    rotate([90, 0, 0])
                    cylinder(d = distz, h = 20, $fn = loc_res);
                    translate([0, 20/2, distz/2])
                    rotate([90, 0, 0])
                    cylinder(d = distz, h = 20, $fn = loc_res);
                }
            }
            // M3 holes
            translate([+distxy2, +distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
            translate([+distxy2, -distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
            translate([-distxy2, +distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
            translate([-distxy2, -distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
            // M3 hole for holder
            #translate([132/2+distz*3/4, 20/2+1, distz/2])
            rotate([90, 0, 0])
            cylinder(d = 3, h = 20+2, $fn = loc_res);
            // center hole for vent
            translate([0, 0, -1])
            cylinder(d1=120-2-2, d2 = (120-2-2)+16, h=distz+2, $fn = loc_res);
        }
        // honeycomb separator
        honey_th = 2;
        honey_rad = 10;
        honey_dia = 10-0.5;
        translate([0, 0, distz-honey_th]) {
            difference() {
                translate([0, 0, 0])
                cylinder(d = (120-2-2)+16, h=honey_th+0.1, $fn = loc_res);
                for(n = [-7:1:7]) {
                    for(m = [-7:1:7]) {
                        xmov = n*honey_rad*sin(60);
                        ymov = n*honey_rad*cos(60);
                        translate([xmov, m*honey_rad+ymov, -1])
                        cylinder(d = honey_dia, h = honey_th+2, $fn = 6);
                    }
                }
            }
        }
    }
}

module part2(col = "Red", loc_res = 32) {
    distxy = (110+100.5)/2;
    distxy2 = distxy/2;
    distxy3 = 132/2 - 15/2 +3;
    distxy4 = 132/2 - 15/2 +1;
    edge_rad = (15-2)/2;
    distz = 12;

    color(col) {
        difference() {
            union() {
                difference() {
                    union() {    
                        hull() {
                            translate([+distxy3, +distxy3, 0])
                            cylinder(r=7.5, h=distz, $fn = loc_res);
                            translate([+distxy3, -distxy3, 0])
                            cylinder(r=7.5, h=distz, $fn = loc_res);
                            translate([-distxy3, +distxy3, 0])
                            cylinder(r=7.5, h=distz, $fn = loc_res);
                            translate([-distxy3, -distxy3, 0])
                            cylinder(r=7.5, h=distz, $fn = loc_res);
                        }
                    }
                    // center hole for vent
                    hull() {
                            translate([+distxy4, +distxy4, -1])
                            cylinder(r=edge_rad, h=distz+2, $fn = loc_res);
                            translate([+distxy4, -distxy4, -1])
                            cylinder(r=edge_rad, h=distz+2, $fn = loc_res);
                            translate([-distxy4, +distxy4, -1])
                            cylinder(r=edge_rad, h=distz+2, $fn = loc_res);
                            translate([-distxy4, -distxy4, -1])
                            cylinder(r=edge_rad, h=distz+2, $fn = loc_res);
                        }
                    
                }
            
                // honeycomb grill
                honey_th = 2;
                honey_rad = 11;
                honey_dia = 11.5;
                translate([0, 0, distz-honey_th]) {
                    difference() {
                        hull() {
                            translate([+distxy4, +distxy4, 0])
                            cylinder(r=edge_rad, h=honey_th, $fn = loc_res);
                            translate([+distxy4, -distxy4, 0])
                            cylinder(r=edge_rad, h=honey_th, $fn = loc_res);
                            translate([-distxy4, +distxy4, 0])
                            cylinder(r=edge_rad, h=honey_th, $fn = loc_res);
                            translate([-distxy4, -distxy4, 0])
                            cylinder(r=edge_rad, h=honey_th, $fn = loc_res);
                        }
                        for(n = [-10:1:10]) {
                            for(m = [-10:1:10]) {
                                xmov = n*honey_rad*sin(60);
                                ymov = n*honey_rad*cos(60);
                                translate([xmov, m*honey_rad+ymov, -1])
                                cylinder(d = honey_dia, h = honey_th+2, $fn = 6);
                            }
                        }
                    }
                }
                // screw mounts
                translate([0, 0, distz-honey_th]) {
                    union() {
                        translate([+distxy2, +distxy2, 0])
                        cylinder(d=10, honey_th, $fn = loc_res);
                        translate([+distxy2, -distxy2, 0])
                        cylinder(d=10, honey_th, $fn = loc_res);
                        translate([-distxy2, +distxy2, 0])
                        cylinder(d=10, honey_th, $fn = loc_res);
                        translate([-distxy2, -distxy2, 0])
                        cylinder(d=10, honey_th, $fn = loc_res);
                    }
                }
            }
            // M3 holes
            translate([+distxy2, +distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
            translate([+distxy2, -distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
            translate([-distxy2, +distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
            translate([-distxy2, -distxy2, -1])
            cylinder(d=3, h=distz+20, $fn = loc_res);
        }
    }
}

// stand
module part3(col = "Violet", loc_res = 32) {
    distxy = (110+100.5)/2;
    distxy2 = distxy/2;
    distxy3 = 132/2 - 15/2 +3;
    distz = 12;

    color(col) {
        difference() {
            union() {   
                // holder
                hull() {
                    translate([0, -20/2, distz/2])
                    rotate([90, 0, 0])
                    cylinder(d = distz, h = 10, $fn = loc_res);
                    translate([2*distz, -20/2, distz/2])
                    rotate([90, 0, 0])
                    cylinder(d = distz, h = 10, $fn = loc_res);
                }
                hull() {
                    translate([0, 20, distz/2])
                    rotate([90, 0, 0])
                    cylinder(d = distz, h = 10, $fn = loc_res);
                    translate([2*distz, 20, distz/2])
                    rotate([90, 0, 0])
                    cylinder(d = distz, h = 10, $fn = loc_res);
                }
                hull() {
                    translate([2*distz, +(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = 14, h = distz/2, $fn = loc_res);
                    translate([2*distz+3, -(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = distz/2, h = distz/2/2, $fn = loc_res);
                }
                hull() {
                    translate([2*distz+3, +(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = distz/2, h = distz/2/2, $fn = loc_res);
                    translate([2*distz, -(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = 14, h = distz/2, $fn = loc_res);
                }
                hull() {
                    translate([2*distz, +(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = 14, h = distz/2, $fn = loc_res);
                    translate([2*distz+3, +50, 35])
                    rotate([0, 90, 0])
                    cylinder(d = 6, h = distz/2/2, $fn = loc_res);
                }
                hull() {
                    translate([2*distz, +(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = 14, h = distz/2, $fn = loc_res);
                    translate([2*distz+3, +50, -35])
                    rotate([0, 90, 0])
                    cylinder(d = 6, h = distz/2/2, $fn = loc_res);
                }
                hull() {
                    translate([2*distz, -(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = 14, h = distz/2, $fn = loc_res);
                    translate([2*distz+3, -50, 35])
                    rotate([0, 90, 0])
                    cylinder(d = 6, h = distz/2/2, $fn = loc_res);
                }
                hull() {
                    translate([2*distz, -(20-5), distz/2])
                    rotate([0, 90, 0])
                    cylinder(d = 14, h = distz/2, $fn = loc_res);
                    translate([2*distz+3, -50, -35])
                    rotate([0, 90, 0])
                    cylinder(d = 6, h = distz/2/2, $fn = loc_res);
                }
            }
            // M3 screw
            translate([0, 25, distz/2])
            rotate([90, 0, 0])
            cylinder(d = 3, h = 50, $fn = loc_res);
            translate([0, 25, distz/2])
            rotate([90, 0, 0])
            cylinder(d = 7, h = 5+2, $fn = loc_res);
            translate([0, 25-45+2, distz/2])
            rotate([90, 0, 0])
            cylinder(d = 6.5, h = 2+2, $fn = 6);
        }
    }

}

module part4(col = "Violet", loc_res = 32) {
    color(col) {
        difference() {
            union() {
                translate([0, 0, -2])
                cylinder(d = 3.8, h = 3, $fn = loc_res);
                translate([0, 0, 0])
                cylinder(d = 7, h = 2, $fn = loc_res);
            }
            translate([0, 0, -3])
            cylinder(d = 2.5, h = 10, $fn = loc_res);
        }
    }
}

module put_together(loc_res = 32) {
    translate([0, 0, 0])
    vent12cm("orange");

    translate([0, 0, 26])
    part1();

    translate([0, 0, 40])
    filter("LightBlue");

    translate([0, 0, 55])
    part2();

    translate([120, 0, 26])
    part3();
}

//put_together();


// Printing
//part1("Green", 64);    // 1x
//part2("Green", 64);    // 1x
//part3("Green", 64);    // 1x
part4("Green", 64);    // 4x
