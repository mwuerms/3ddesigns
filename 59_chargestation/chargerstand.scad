/**
 * Martin Egli
 * 2023-10-22
 */

module phonedummy(lenx = 160, leny = 80, lenz = 12, col = "LightGreen", loc_res = 32) {
    rad1 = 10;
    color(col) {
        hull() {
            translate([rad1, rad1, 0])
            cylinder(r = rad1, h = lenz, $fn = loc_res);
            translate([lenx - rad1, rad1, 0])
            cylinder(r = rad1, h = lenz, $fn = loc_res);
            translate([lenx - rad1, leny - rad1, 0])
            cylinder(r = rad1, h = lenz, $fn = loc_res);
            translate([rad1, leny - rad1, 0])
            cylinder(r = rad1, h = lenz, $fn = loc_res);
        }

        // usb c
        translate([lenx+2, leny/2, lenz/2])
        rotate([0, -90, 0])
        hull() {
            translate([0, -5, 0])
            cylinder(r = 4, h = 4, $fn = loc_res);
            translate([0, +5, 0])
            cylinder(r = 4, h = 4, $fn = loc_res);
        }
    }
}

module chargerstand(show_phones = 1, loc_res = 32) {
    if(show_phones) {
        translate([4, 0, 4]) {
        
            translate([0, 10+0*30, 0])
            rotate([90, 0, 0])
            phonedummy(160, 80, 15, "SteelBlue");

            translate([0, 10+1*30, 0])
            rotate([90, 0, 0])
            phonedummy(160, 80, 15, "LightBlue");

            translate([0, 10+2*30, 0])
            rotate([90, 0, 0])
            phonedummy(145, 74, 15, "LightGray");

            translate([0, 10+3*30, 0])
            rotate([90, 0, 0])
            phonedummy(145, 74, 15, "DarkGray");

            translate([6, 10+4*30, 0])
            rotate([90, -7, 0])
            phonedummy(200, 140, 10, "LightGreen");
        }
    }
    
    // front
    color("LightCyan")
    translate([-4, -10, -20])
    cube([4, 150, 80]);
    
    // bottom
    color("CadetBlue")
    translate([0, -10, 0])
    cube([180, 150, 4]);
    
    // back
    color("LightCoral")
    translate([180, -10, -20])
    cube([4, 150, 40]);
    
    // shaft for cables
    color("LightSalmon")
    translate([180+20, -10, -20])
    cube([4, 150, 40]);
    
    // rigth side
    color("LightGreen")
    translate([-4, -10-4, 0])
    cube([208, 4, 60]);
    
    // separators from right
    color("MediumSeaGreen")
    translate([0, -10+1*30-2, 4])
    cube([180, 4, 60-4]);
    // separator
    color("SeaGreen")
    translate([0, -10+2*30-2, 4])
    cube([180, 4, 60-4]);
    // separator
    color("ForestGreen")
    translate([0, -10+3*30-2, 4])
    cube([180, 4, 60-4]);
    // separator
    color("Green")
    translate([0, -10+4*30-2, 4])
    cube([180, 4, 60-4]);
    
    // left side
    color("LightGreen")
    translate([-4, 20+4*30, 0])
    cube([208, 4, 60]);
}

chargerstand();
