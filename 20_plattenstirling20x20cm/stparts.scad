/**
 * Martin Egli
 * 2021-11-17
 * parts for platten stirling
 */

use <../lib/m3screw.scad>

module aluSheet(xwid = 200, ywid = 200, th = 1) {
    color("Silver")
    translate([0, 0, 0])
    cube([xwid, ywid, th]);
}

module heatExchangerSimple(xwid = 200, ywid = 200, th = 15, loc_res = 32) {
    wall_th = 3;
    m3_clear = 3;
    nb_screws = 6;
    m3_dist = (xwid-2*m3_clear)/(nb_screws-1);
    indent_rad = 4;
    
    difference() {
        union() {
            difference() {
                translate([0, 0, 0])
                cube([xwid, ywid, th]);
                
                hull() {
                    translate([(wall_th+indent_rad), (wall_th+indent_rad), (wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                    translate([xwid-(wall_th+indent_rad), (wall_th+indent_rad), (wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                    translate([xwid-(wall_th+indent_rad), ywid+(wall_th+indent_rad), (wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                    translate([(wall_th+indent_rad), ywid+(wall_th+indent_rad), (wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                    
                    translate([(wall_th+indent_rad), (wall_th+indent_rad), th+(wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                    translate([xwid-(wall_th+indent_rad), (wall_th+indent_rad), th+(wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                    translate([xwid-(wall_th+indent_rad), ywid+(wall_th+indent_rad), th+(wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                    translate([(wall_th+indent_rad), ywid+(wall_th+indent_rad), th+(wall_th+indent_rad)])
                    sphere(r = indent_rad, $fn = loc_res);
                }
            }
            for(n = [0: 1: nb_screws-1]) {
                translate([n*m3_dist+m3_clear, m3_clear, 0])
                cylinder(d = 6, h = th, $fn = loc_res);
            }
            for(n = [0: 1: nb_screws-1]) {
                translate([m3_clear, n*m3_dist+m3_clear, 0])
                cylinder(d = 6, h = th, $fn = loc_res);
            }
            for(n = [0: 1: nb_screws-1]) {
                translate([n*m3_dist+m3_clear, 5*m3_dist+m3_clear, 0])
                cylinder(d = 6, h = th, $fn = loc_res);
            }
            for(n = [0: 1: nb_screws-1]) {
                translate([5*m3_dist+m3_clear, n*m3_dist+m3_clear, 0])
                cylinder(d = 6, h = th, $fn = loc_res);
            }
        }
        for(n = [0: 1: nb_screws-1]) {
            translate([n*m3_dist+m3_clear, m3_clear, 22])
            rotate([180, 0, 0])
            m3SinkHeadScewNutCut(20);
        }
        for(n = [0: 1: nb_screws-1]) {
            translate([m3_clear, n*m3_dist+m3_clear, 22])
            rotate([180, 0, 0])
            m3SinkHeadScewNutCut(20);
        }
        for(n = [0: 1: nb_screws-1]) {
            translate([n*m3_dist+m3_clear, 5*m3_dist+m3_clear, 22])
            rotate([180, 0, 0])
            m3SinkHeadScewNutCut(20);
        }
        for(n = [0: 1: nb_screws-1]) {
            translate([5*m3_dist+m3_clear, n*m3_dist+m3_clear, 22])
            rotate([180, 0, 0])
            m3SinkHeadScewNutCut(20);
        }
    }
}

heatExchangerSimple();
*translate([0, 0, 15])
aluSheet();