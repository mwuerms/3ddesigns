/**
 * Martin Egli
 * 2022-01-24
 * helper for wood dowels (Holzdübel)
 */

module dowel_marker(dowel_dia = 5.5, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d1 = dowel_dia+2, d2 = dowel_dia, h = 0.6, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d = dowel_dia, h = 4, $fn = loc_res);
        }
        translate([0, 0, -1])
        cylinder(d = 0.8, h = 10, $fn = loc_res);
    }
}

module dowel_guide_28x9mm(dowel_dia = 6, loc_res = 32) {
    difference() {
        translate([-2, 0, -5])
        cube([9+4, 28, 15]);
        translate([0, 0, -6])
        cube([9, 28, 6]);
        
        translate([9/2, 1*28/4, -6])
        cylinder(d = dowel_dia, h = 20, $fn = loc_res);
        translate([9/2, 3*28/4, -6])
        cylinder(d = dowel_dia, h = 20, $fn = loc_res);
    
        translate([10.5, 4, 0])
        rotate([90, 0, 90])
        linear_extrude(1)
        scale([0.4, 0.4, 1])
        text("28x9mm");
    }
}

module dowel_guide_47x18mm(dowel_dia = 6, loc_res = 32) {
    difference() {
        translate([0, 0, 0])
        cube([18, 47, 10]);
        
        translate([1*18/3, 1*47/6, -6])
        cylinder(d = dowel_dia, h = 20, $fn = loc_res);
        translate([2*18/3, 3*47/6, -6])
        cylinder(d = dowel_dia, h = 20, $fn = loc_res);
        translate([1*18/3, 5*47/6, -6])
        cylinder(d = dowel_dia, h = 20, $fn = loc_res);
    
        translate([17.5, 10, 3])
        rotate([90, 0, 90])
        linear_extrude(1)
        scale([0.4, 0.4, 1])
        text("18x47mm");
    }
}

module drillguide_28x14mm(drill_dia = 2, loc_res = 32) {
    difference() {
        translate([0, 0, 0])
        cube([14, 28, 10]);
        
        translate([14/2, 1*28/5, -6])
        cylinder(d = drill_dia, h = 20, $fn = loc_res);
        translate([14/2, 2*28/5, -6])
        cylinder(d = drill_dia, h = 20, $fn = loc_res);
        translate([14/2, 3*28/5, -6])
        cylinder(d = drill_dia, h = 20, $fn = loc_res);
        translate([14/2, 4*28/5, -6])
        cylinder(d = drill_dia, h = 20, $fn = loc_res);
    
        /*translate([10.5, 10, 3])
        rotate([90, 0, 90])
        linear_extrude(10)
        scale([0.4, 0.4, 1])
        text("18x47mm");*/
    }
}

//dowel_marker(); // 8 x
//dowel_guide_28x9mm();   // 1 x
//dowel_guide_47x18mm(); // 1 x
drillguide_28x14mm();