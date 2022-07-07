/**
 * Martin Egli
 * 2021-12-01
 * see: https://de.aliexpress.com/item/32683969234.html
 */

use <../lib/m3screw.scad>

module dps3005(loc_res = 32) {
        color("DarkGray") {
        translate([0, 0, 0])
        cube([72, 39, 37]);
        translate([-(79-72)/2, -(43-39)/2, 34])
        cube([79, 43, 3]);
        translate([60, 22, 37])
        cylinder(d = 10, h = 11, $fn = loc_res);
    }
}

module switch_RD15131121() {
    color("DarkGray") {
        translate([0, 0, 0])
        cube([19, 6.5, 15]);
        translate([-1, -1.5, 15])
        cube([21, 9.5, 2]);
        translate([3, -1.5+(9.5-4.5)/2, 15.5])
        rotate([0, 20, 0])
        cube([8, 4.5, 4]);
    }
}

module switch_RD15131121_Cut() {
    translate([0, 0, 0])
    cube([19.5, 6.5, 15]);
}

module dps3005_Cut(loc_res = 32) {
    translate([0, 0, 0])
    cube([72, 39, 37]);
    translate([-2, 13, 0])
    cube([76, 13, 35]);
}

module jack(col = "Black", jack_dia = 6, loc_res = 32) {
    color(col)
    translate([0, 0, 0])
    cylinder(d = jack_dia + 2, h = 3, $fn = loc_res);
    color("Silver")
    translate([0, 0, -10])
    cylinder(d = jack_dia, h = 13.1, $fn = loc_res);
}

module jack_Cut(jack_dia = 6, loc_res = 32) {
    translate([0, 0, -10])
    cylinder(d = jack_dia, h = 13.1, $fn = loc_res);
}


module caseFront(show_elements = 1, loc_res = 32) {
    if(show_elements) {
        translate([10, 20+10, 0])
        dps3005();
        translate([1*72/8+10, 10, 34])
        jack("Black");
        translate([3*72/8+10, 10, 34])
        jack("Red");
        translate([5*72/8+10, 10, 34])
        jack("Black");
        translate([7*72/8+10, 10, 34])
        jack("Red");
        
        translate([5*72/8+10, 18, 34-15])
        switch_RD15131121();
        translate([1*72/8+10, 18, 34-15])
        switch_RD15131121();
        
    }
    
    edge_rad = 4;
    wall_th = 2.5;
    thread_dia = 2.5;
    xlen = 72+2*10;
    ylen = 39+10+20+10;
    xpos1 = edge_rad;
    ypos1 = edge_rad;
    xpos2 = xlen-edge_rad;
    ypos2 = ylen-edge_rad;
    difference() {
        hull() {
            translate([xpos1, ypos1, 0]) {
                translate([0, 0, 0])
                cylinder(r = edge_rad, h = 1, $fn = loc_res);
                translate([0, 0, 35-edge_rad])
                sphere(r = edge_rad, $fn = loc_res);
            }
            translate([xpos2, ypos1, 0]) {
                translate([0, 0, 0])
                cylinder(r = edge_rad, h = 1, $fn = loc_res);
                translate([0, 0, 35-edge_rad])
                sphere(r = edge_rad, $fn = loc_res);
            }
            translate([xpos2, ypos2, 0]) {
                translate([0, 0, 0])
                cylinder(r = edge_rad, h = 1, $fn = loc_res);
                translate([0, 0, 35-edge_rad])
                sphere(r = edge_rad, $fn = loc_res);
            }
            translate([xpos1, ypos2, 0]) {
                translate([0, 0, 0])
                cylinder(r = edge_rad, h = 1, $fn = loc_res);
                translate([0, 0, 35-edge_rad])
                sphere(r = edge_rad, $fn = loc_res);
            }
        }
        
        // elements
        translate([10, 20+10, 0])
        dps3005_Cut();
        translate([1*72/8+10, 10, 35])
        jack_Cut();
        translate([3*72/8+10, 10, 35])
        jack_Cut();
        translate([5*72/8+10, 10, 35])
        jack_Cut();
        translate([7*72/8+10, 10, 35])
        jack_Cut();
        // text
        translate([1*72/8+14, 8, 34.5])
        linear_extrude(1)
        text("12V", size = 4);
        translate([5*72/8+15.5, 8, 34.5])
        linear_extrude(1)
        text("adj", size = 4);
        translate([5*72/8+10, 18, 34-10])
        switch_RD15131121_Cut();
        translate([1*72/8+10, 18, 34-10])
        switch_RD15131121_Cut();
            
        difference() {
            hull() {
                translate([wall_th, wall_th, -1]) {
                    cube([xlen-2*wall_th, ylen-2*wall_th, 34-wall_th]);
                    translate([2, 2, ])
                    cube([xlen-2*wall_th-4, ylen-2*wall_th-4, 34-wall_th+2]);
                }
            }
            translate([xpos1, ypos1, -2])
            cylinder(r = edge_rad, h = 34+4, $fn = loc_res);
            translate([xpos2, ypos1, -2])
            cylinder(r = edge_rad, h = 34+4, $fn = loc_res);
            translate([xpos2, ypos2, -2])
            cylinder(r = edge_rad, h = 34+4, $fn = loc_res);
            translate([xpos1, ypos2, -2])
            cylinder(r = edge_rad, h = 34+4, $fn = loc_res);
        }
        translate([xpos1, ypos1, -2])
        cylinder(d = thread_dia, h = 20, $fn = loc_res);
        translate([xpos2, ypos1, -2])
        cylinder(d = thread_dia, h = 20, $fn = loc_res);
        translate([xpos2, ypos2, -2])
        cylinder(d = thread_dia, h = 20, $fn = loc_res);
        translate([xpos1, ypos2, -2])
        cylinder(d = thread_dia, h = 20, $fn = loc_res);
    }
}

module caseBack(show_elements = 1, loc_res = 32) {
    if(show_elements) {
        
    }
    
    edge_rad = 4;
    wall_th = 2.5;
    thread_dia = 2.5;
    xlen = 72+2*10;
    ylen = 39+10+20+10;
    xpos1 = edge_rad;
    ypos1 = edge_rad;
    xpos2 = xlen-edge_rad;
    ypos2 = ylen-edge_rad;
    difference() {
            union() {
            difference() {
                hull() {
                    translate([xpos1, ypos1, 0]) {
                        sphere(r = edge_rad, $fn = loc_res);
                    }
                    translate([xpos2, ypos1, 0]) {
                        sphere(r = edge_rad, $fn = loc_res);
                    }
                    translate([xpos2, ypos2, 0]) {
                        sphere(r = edge_rad, $fn = loc_res);
                    }
                    translate([xpos1, ypos2, 0]) {
                        sphere(r = edge_rad, $fn = loc_res);
                    }
                }
                translate([-1, -1, 0])
                cube([xlen+2, ylen+2, edge_rad+1]);
                
                translate([xpos1, ypos1, 10])
                rotate([180, 0, 0])
                m3SinkHeadScewNutCut(10);
                translate([xpos2, ypos1, 10])
                rotate([180, 0, 0])
                m3SinkHeadScewNutCut(10);
                translate([xpos2, ypos2, 10])
                rotate([180, 0, 0])
                m3SinkHeadScewNutCut(10);
                translate([xpos1, ypos2, 10])
                rotate([180, 0, 0])
                m3SinkHeadScewNutCut(10);
            }
            difference() {
                hull() {
                    translate([wall_th, wall_th, 0]) {
                        cube([xlen-2*wall_th, ylen-2*wall_th, 2]);
                    }
                }
                translate([xpos1, ypos1, -2])
                cylinder(r = edge_rad, h = 6, $fn = loc_res);
                translate([xpos2, ypos1, -2])
                cylinder(r = edge_rad, h = 6, $fn = loc_res);
                translate([xpos2, ypos2, -2])
                cylinder(r = edge_rad, h = 6, $fn = loc_res);
                translate([xpos1, ypos2, -2])
                cylinder(r = edge_rad, h = 6, $fn = loc_res);
                difference() {
                    hull() {
                        translate([wall_th+1, wall_th+1, -1]) {
                            cube([xlen-2*wall_th-2, ylen-2*wall_th-2, 4]);
                        }
                    }
                    translate([xpos1, ypos1, -2])
                    cylinder(r = edge_rad+1, h = 6, $fn = loc_res);
                    translate([xpos2, ypos1, -2])
                    cylinder(r = edge_rad+1, h = 6, $fn = loc_res);
                    translate([xpos2, ypos2, -2])
                    cylinder(r = edge_rad+1, h = 6, $fn = loc_res);
                    translate([xpos1, ypos2, -2])
                    cylinder(r = edge_rad+1, h = 6, $fn = loc_res);
                }
            }
        }
        /*hull() {
            translate([xlen/2, 0, -5])
            cylinder(d = 8, h = 10, $fn = loc_res);
            translate([xlen/2, 6, -5])
            cylinder(d = 8, h = 10, $fn = loc_res);
        }*/
        hull() {
            translate([xlen/2-9, 4.75, -5])
            cylinder(d = 2.5, h = 10, $fn = loc_res);
            translate([xlen/2+9, 4.75, -5])
            cylinder(d = 2.5, h = 10, $fn = loc_res);
        }
    }
}
//caseFront(0);

//translate([0, 0, -20])
caseBack();
