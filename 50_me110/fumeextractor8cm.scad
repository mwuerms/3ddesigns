/**
 * Martin Egli
 * 2022-10-30
 * 12 cm ventilator to suck solder fumes
 */
use <parts.scad>

module part2a(col = "Orange", loc_res = 32) {
    distxy = (77.5+65)/2;
    rad_edge = (80-distxy)/2;
    distxy2 = distxy/2;
    hi1 = 1;
    distxy3 = distxy2-1;
    distxy4 = distxy2;
    edge_rad = rad_edge;
    distz = 12;
    
    // mounting holes for M3 or M4 screws
    m_holes = 3.2; // 4.5
    color(col) {
        difference() {
            // outer shell
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
            // inner shell
            translate([0, 0,-1])
            hull() {
                translate([+distxy2, +distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
                translate([+distxy2, -distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
                translate([-distxy2, +distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
                translate([-distxy2, -distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
            }
        }    
        // add honey comb cover
        translate([0, 0, 0]) {
            difference() {
                union() {
                    difference() {
                        hull() {
                            translate([+distxy2, +distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi1, $fn = loc_res);
                            translate([+distxy2, -distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi1, $fn = loc_res);
                            translate([-distxy2, +distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi1, $fn = loc_res);
                            translate([-distxy2, -distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi1, $fn = loc_res);
                            }
                        // honeycomb grill
                        honey_th = 3;
                        honey_rad = 7.5;// good: 8.3;
                        honey_dia = 8;
                        for(n = [-10:1:10]) {
                            for(m = [-10:1:10]) {
                                xmov = n*honey_rad*sin(60);
                                ymov = n*honey_rad*cos(60);
                                translate([xmov, m*honey_rad+ymov, -1])
                                cylinder(d = honey_dia, h = honey_th+2, $fn = 6);
                            }
                        }
                    }
                    translate([+distxy2, +distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                    translate([+distxy2, -distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                    translate([-distxy2, +distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                    translate([-distxy2, -distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                }
                // M3/4 holes
                translate([+distxy2, +distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
                translate([+distxy2, -distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
                translate([-distxy2, +distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
                translate([-distxy2, -distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
            }
        }
    }
}

module part2b(col = "Red", show_screws = 1, loc_res = 32) {
    distxy = (77.5+65)/2;
    rad_edge = (80-distxy)/2;
    distxy2 = distxy/2;
    hi1 = 12;
    hi2 = 1;
    distxy3 = distxy2;
    distxy4 = distxy2;
    edge_rad = rad_edge;
    distz = 12;
    echo(distxy);
    // mounting holes for M3 or M4 screws
    m_holes = 3.2; // 4.5
    color(col) {
        difference() {
            // outer shell
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
                // M5 mounting nut
                hull() {
                    translate([+distxy2, -distxy2, 0])
                    cylinder(r=rad_edge, h=hi1, $fn = loc_res);
                    translate([40-2.5, -(40-2.5), 6])
                    rotate([0, 0, -45])
                    rotate([0, 90, 0])
                    rotate([0, 0, 30]) {
                        cylinder(d = hi1, h = 6-1, $fn = loc_res);
                        cylinder(d = hi1-2, h = 6, $fn = loc_res);
                    }
                }
            }
            // inner shell cut out
            translate([0, 0, -1])
            hull() {
                translate([+distxy2, +distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
                translate([+distxy2, -distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
                translate([-distxy2, +distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
                translate([-distxy2, -distxy2, 0])
                cylinder(r=rad_edge-1, h=hi1+2, $fn = loc_res);
            }
            // M5 mounting nut + hole
            translate([40-5, -(40-5), 6])
            rotate([0, 0, -45])
            rotate([0, 90, 0])
            rotate([0, 0, 30])
            m5Nut_cut(len = 7.5);
        }    
        // add honey comb cover
        translate([0, 0, hi1-hi2]) {
            difference() {
                union() {
                    difference() {
                        hull() {
                            translate([+distxy2, +distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi2, $fn = loc_res);
                            translate([+distxy2, -distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi2, $fn = loc_res);
                            translate([-distxy2, +distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi2, $fn = loc_res);
                            translate([-distxy2, -distxy2, 0])
                            cylinder(r=rad_edge-1, h=hi2, $fn = loc_res);
                            }
                        // honeycomb grill
                        honey_th = 3;
                        honey_rad = 7.5;// good: 8.3;
                        honey_dia = 8;
                        for(n = [-10:1:10]) {
                            for(m = [-10:1:10]) {
                                xmov = n*honey_rad*sin(60);
                                ymov = n*honey_rad*cos(60);
                                translate([xmov, m*honey_rad+ymov, -1])
                                cylinder(d = honey_dia, h = honey_th+2, $fn = 6);
                            }
                        }
                    }
                    translate([+distxy2, +distxy2, 0])
                    cylinder(r=rad_edge, h=hi2, $fn = loc_res);
                    translate([+distxy2, -distxy2, 0])
                    cylinder(r=rad_edge, h=hi2, $fn = loc_res);
                    translate([-distxy2, +distxy2, 0])
                    cylinder(r=rad_edge, h=hi2, $fn = loc_res);
                    translate([-distxy2, -distxy2, 0])
                    cylinder(r=rad_edge, h=hi2, $fn = loc_res);
                }
                // M3/4 holes
                translate([+distxy2, +distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
                translate([+distxy2, -distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
                translate([-distxy2, +distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
                translate([-distxy2, -distxy2, -1])
                cylinder(d=m_holes, h=hi1+2, $fn = loc_res);
            }
        }
    }
    if(show_screws) {
        // show M5 Nut
        translate([40+2, -(40+2), 6])
        rotate([0, 0, -45])
        rotate([0, 90, 0])
        rotate([0, 0, 30])
        m5Nut();

        translate([40, -(40), 6])
        rotate([0, 0, -45])
        rotate([0, 90, 0])
        rotate([0, 0, 30])
        m5ballhead_screw();
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

module part5a(col = "LightGreen", show_screw = 1, loc_res = 32) {
    color(col) {
        difference() {
            union() {
                hull() {
                    translate([0, 0, 3])
                    cylinder(d = 10, h = 3, $fn = loc_res);
                    translate([0, 16, 3])
                    cylinder(d = 10, h = 3, $fn = loc_res);
                }
                translate([0, 8, 1])
                cylinder(d = 7, h = 5, $fn = loc_res);
            }
            // ball cut out
            translate([0, 0, 0]) {
                sphere(d = 9.2, $fn = loc_res);
                translate([0, 0, -7])
                cylinder(d = 5, h = 16, $fn = loc_res);
            }
            translate([0, 16, 0]) {
                sphere(d = 9.2, $fn = loc_res);
                translate([0, 0, -7])
                cylinder(d = 5, h = 16, $fn = loc_res);
            }
            translate([0, 8, 6])
            m3Sinkhead_cut();
        }
    }
    if(show_screw) {
        translate([0, -(25-9/2), 0])
        rotate([-90, 0, 0])
        m5ballhead_screw();
        
        translate([0, (25-9/2)+16, 0])
        rotate([90, 0, 0])
        m5ballhead_screw();
        
        *translate([0, 8, 6])
        m3Sinkhead_cut();
    }
}

// lower part, holding M3 nut
module part5b(col = "LightGreen", show_screw = 1, loc_res = 32) {
    color(col) {
        difference() {
            union() {
                hull() {
                    translate([0, 0, -6])
                    cylinder(d = 10, h = 3, $fn = loc_res);
                    translate([0, 16, -6])
                    cylinder(d = 10, h = 3, $fn = loc_res);
                }
                translate([0, 8, -6])
                cylinder(d = 7, h = 5, $fn = loc_res);
            }
            // ball cut out
            translate([0, 0, 0]) {
                sphere(d = 9.2, $fn = loc_res);
                translate([0, 0, -7])
                cylinder(d = 5, h = 6, $fn = loc_res);
            }
            translate([0, 16, 0]) {
                sphere(d = 9.2, $fn = loc_res);
                translate([0, 0, -7])
                cylinder(d = 5, h = 6, $fn = loc_res);
            }
            translate([0, 8, -9+2])
            m3Nut_cut();
        }
    }
    if(show_screw) {
        translate([0, -(25-9/2), 0])
        rotate([-90, 0, 0])
        m5ballhead_screw();
        
        translate([0, (25-9/2)+16, 0])
        rotate([90, 0, 0])
        m5ballhead_screw();
        
        *translate([0, 8, -9+2])
        m3Nut_cut();
    }
}

module part6(loc_res = 32) {
    difference() {
        union() {
            cylinder(d = 5.5, h = 4, $fn = loc_res);
            cylinder(r = 4.375, h = 2, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 3.3, h = 4+2, $fn = loc_res);
    }
}

module put_together(loc_res = 32) {
    translate([0, 0, -11-2])
    vent8cm("orange");

    translate([0, 0, 4+4])
    filter8cm("LightBlue");

    translate([0, 0, 14+2])
    rotate([180, 0, 0])
    part2b(show_screws = 0);
    
    translate([0, 0, 22+2])
    part2a();
    
    translate([+71.25/2, +71.25/2, 2])
    rotate([180, 0, 0])
    part6();
    translate([-71.25/2, +71.25/2, 2])
    rotate([180, 0, 0])
    part6();
    translate([+71.25/2, -71.25/2, 2])
    rotate([180, 0, 0])
    part6();
    translate([-71.25/2, -71.25/2, 2])
    rotate([180, 0, 0])
    part6();
}

module stand1(col = "LightBlue", show_screw = 1, loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, -5]) {
                hull() {
                    translate([+3, -9, 0]) {
                        cylinder(d = 6, h = 9, $fn = loc_res);
                        cylinder(d = 3, h = 10, $fn = loc_res);
                    }
                    translate([+3, +9, 0]) {
                        cylinder(d = 6, h = 9, $fn = loc_res);
                        cylinder(d = 3, h = 10, $fn = loc_res);
                    }
                    translate([-3, -9, 0]) {
                        cylinder(d = 6, h = 9, $fn = loc_res);
                        cylinder(d = 3, h = 10, $fn = loc_res);
                    }
                    translate([-3, +9, 0]) {
                        cylinder(d = 6, h = 9, $fn = loc_res);
                        cylinder(d = 3, h = 10, $fn = loc_res);
                    }
                }
                // bottom stand
                hull() {
                    translate([+5, -9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                    translate([+5, +9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                    translate([-5, -9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                    translate([-5, +9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                }
                // side stands
                hull() {
                    translate([+5, -9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                    translate([+(3+20), -(9+60), 0])
                    cylinder(d = 6, h = 1.5, $fn = loc_res);
                }
                hull() {
                    translate([+5, +9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                    translate([+(3+20), +(9+60), 0])
                    cylinder(d = 6, h = 1.5, $fn = loc_res);
                }
                hull() {
                    translate([-5, -9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                    translate([-(3+40), -(9+40), 0])
                    cylinder(d = 6, h = 1.5, $fn = loc_res);
                }
                hull() {
                    translate([-5, +9, 0])
                    cylinder(d = 10, h = 1.5, $fn = loc_res);
                    translate([-(3+40), +(9+40), 0])
                    cylinder(d = 6, h = 1.5, $fn = loc_res);
                }
            }
        }
        // cut in half
        translate([-2/2, -30/2, -6])
        cube([2, 30, 20]);
        // cut out screws
        translate([0, 0, (25-9/2)])
        rotate([180, 0, 0])
        m5ballhead_screw_cut();
        
        translate([4, 7.5, 0])
        rotate([0, 90, 0])
        m3Sinkhead_cut();
        
        translate([-6.5, 7.5, 0])
        rotate([0, 90, 0])
        m3Nut_cut();
        
        translate([4, -7.5, 0])
        rotate([0, 90, 0])
        m3Sinkhead_cut();
        
        translate([-6.5, -7.5, 0])
        rotate([0, 90, 0])
        m3Nut_cut();
        // additional round cut at the bottom
        translate([0, 0, -6])
        cylinder(d = 5, h = 4, $fn = loc_res);
    }
    if(show_screw) {
        translate([0, 0, (25-9/2)])
        rotate([180, 0, 0])
        m5ballhead_screw();
        
        translate([4, 7.5, 0])
        rotate([0, 90, 0])
        m3Sinkhead_cut();
        
        translate([-6.5, 7.5, 0])
        rotate([0, 90, 0])
        m3Nut_cut();
        
        translate([4, -7.5, 0])
        rotate([0, 90, 0])
        m3Sinkhead_cut();
        
        translate([-6.5, -7.5, 0])
        rotate([0, 90, 0])
        m3Nut_cut();
    }
}

module put_together_stand(loc_res = 32) {
    translate([-10, 0, 75])
    rotate([0, 90, 0]) 
    rotate([0, 0, -45]) {
        put_together();
    }
    stand1();
}
*put_together_stand();


// Printing
*part2a("Green", 64*2);    // 1x
*part2b("Green", 64*2);    // 1x
//part3("Green", 64);    // 1x
//part4("Green", 64);    // 4x
*part5a(show_screw = 0, loc_res = 64); // 1 x
*part5b(show_screw = 0, loc_res = 64); // 1 x
*part6(loc_res = 64); // 4 x

stand1(show_screw = 0, loc_res = 64);