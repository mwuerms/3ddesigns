/**
 * Martin Egli
 * 2022-03-16
 */
//https://openhome.cc/eGossip/OpenSCAD/SectorArc.html
module sector(r = 10, h = 10, a0 = 45, a1 = 135, step_width = 1) {
    points = [
        for(a = [a0:step_width:a1]) [r * cos(a), r * sin(a)]
    ];
    linear_extrude(h)
    polygon(concat([[0, 0]], points));
    
}

module baloondisk(diao = 95, diai = 21, loc_res = 32) {
    hi1 = 4;
    difference() {
        translate([0, 0, 0])
        cylinder(d = diao, h = hi1, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(d = diai, h = hi1+2, $fn = loc_res);
        
        #translate([-(diao), -hi1/2-2, -1])
        cube([diao, hi1+4, hi1+2]);
        //#translate([10, 0, -1])
        //sector(r=95/2+10, h = 4+2, a0 = 180-5, a1 = 180+5);
        
    }
    translate([40*cos(180+15), 40*sin(180+15), hi1])
    cylinder(d = 10, h = hi1+2, $fn = loc_res);
    translate([40*cos(180-15), 40*sin(180-15), hi1])
    cylinder(d = 10, h = hi1+2, $fn = loc_res);
}

module baloondisk2(diao = 95, diai = 21, loc_res = 32) {
    hi1 = 5;
    hi2 = 8;
    
    difference() {
        translate([0, 0, 0])
        cylinder(d = diao, h = hi1+hi2, $fn = loc_res);
        
        translate([0, 0, hi1])
        cylinder(d = diao-6, h = hi1+hi2+4, $fn = loc_res);
        difference() {
            union() {
                hole_dia = 5;
                space_rad = hole_dia+0.5;
                nb_edges = 6;
                for(m=[-10:1:10]) {
                    for(n = [-10:1:10]) {
                        translate([m*space_rad*cos(30), m*space_rad*sin(0+30)+n*space_rad, -1])
                        cylinder(d = hole_dia, h = hi1+2, $fn = nb_edges);
                    }
                }
            }
            difference() {
                translate([0, 0, -2])
                cylinder(d = diao+30, h = hi1+4, $fn = loc_res);
                translate([0, 0, -3])
                cylinder(d = diao-6, h = hi1+6, $fn = loc_res);
            }
        }
        for(j = [0:1:7])
        translate([0, 0, hi1+hi2/2])
        rotate([90, 0, j*45])
        cylinder(d = 2.5, h = diao/2+hi1, $fn = 32);
    }
    
    /*
    hole_dia = 6;
    space_rad = hole_dia+1;
    nb_edges = 6;
    for(m=[-6:1:6]) {
        for(n = [-6:1:6]) {
            translate([m*space_rad*cos(30), m*space_rad*sin(0+30)+n*space_rad, -1])
            cylinder(d = hole_dia, h = hi1+2, $fn = nb_edges);
        }
    }
    
    translate([0, 0, -1])
    cylinder(d = hole_dia, h = hi1+2, $fn = nb_edges);
    
    translate([7*cos(60*0+30), 7*sin(60*0+30), -1])
    cylinder(d = hole_dia, h = hi1+2, $fn = nb_edges);
    translate([2*7*cos(60*0+30), 2*7*sin(60*0+30), -1])
    cylinder(d = hole_dia, h = hi1+2, $fn = nb_edges);
    
    translate([7*cos(60*0+30), 7*sin(60*0+30)-7, -1])
    cylinder(d = hole_dia, h = hi1+2, $fn = nb_edges);
    */
    
}

module baloonholder1(diao = 24, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = diao, h = 20, $fn = loc_res);
            translate([0, 0, -4])
            cylinder(d = 20.8, h = 20, $fn = loc_res);
        }
        translate([0, 0, -10])
        cylinder(d = 8, h = 20, $fn = loc_res);
        translate([0, 0, 3])
        cylinder(d = diao-6, h = 20, $fn = loc_res);
    }
}
//baloondisk(loc_res=128);
baloondisk2(loc_res=128);
//baloonholder1(loc_res = 64);
