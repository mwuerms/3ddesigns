/**
 * Martin Egli
 * 2023-05-20
 * organize electronics project using A4 and A3 tablets
 * use 4 mm plywood
 */

module sheetA5(loc_red = 32) {
    cube([210, 297/2, 4]);
}

module sheetA4(loc_red = 32) {
    cube([210, 297, 4]);
}

module sheetA3(loc_red = 32) {
    cube([210*2, 297, 4]);
}

module logic8Old(loc_res = 32) {
    // 43 x 43 x 10 mm, micro USB
    color("DarkGray") 
    hull() {
        translate([8/2, 8/2, 0])
        cylinder(d = 8, h = 10, $fn = loc_res);
        translate([43-8/2, 8/2, 0])
        cylinder(d = 8, h = 10, $fn = loc_res);
        translate([8/2, 43-8/2, 0])
        cylinder(d = 8, h = 10, $fn = loc_res);
        translate([43-8/2, 43-8/2, 0])
        cylinder(d = 8, h = 10, $fn = loc_res);
    }
    color("white")
    translate([6, 15, 11])
    linear_extrude(1.1)
    text("logic");
}

module logic8(loc_res = 32) {
    // 53 x 53 x 12 mm, micro USB
    color("DarkGray") 
    hull() {
        translate([10/2, 10/2, 0])
        cylinder(d = 10, h = 12, $fn = loc_res);
        translate([53-10/2, 10/2, 0])
        cylinder(d = 10, h = 12, $fn = loc_res);
        translate([10/2, 53-10/2, 0])
        cylinder(d = 10, h = 12, $fn = loc_res);
        translate([53-10/2, 53-10/2, 0])
        cylinder(d = 10, h = 12, $fn = loc_res);
    }
    color("white")
    translate([6, 21, 11])
    linear_extrude(1.1)
    text("saleae");
}

module dscopeU3P100(loc_res = 32) {
    // 115 x 73 x 16 mm, micro USB
    di1 = 5;
    hi1 = 16;
    color("DarkGray") 
    hull() {
        translate([di1/2, di1/2, 0])
        cylinder(d = di1, h = hi1, $fn = loc_res);
        translate([73-di1/2, di1/2, 0])
        cylinder(d = di1, h = hi1, $fn = loc_res);
        translate([di1/2, 115-di1/2, 0])
        cylinder(d = di1, h = hi1, $fn = loc_res);
        translate([73-di1/2, 115-di1/2, 0])
        cylinder(d = di1, h = hi1, $fn = loc_res);
    }
    // BNC
    color("White") {
        translate([(73-34)/2, -11.5, hi1/2])
        rotate([-90, 0, 0])
        cylinder(d = 10, h = 12, $fn = loc_res);
        translate([(73-34)/2+11/2, -9, hi1/2])
        rotate([-90, 0, 90])
        cylinder(d = 2, h = 11, $fn = loc_res);
    }
    color("White") {
        translate([(73-34)/2+34, -11.5, hi1/2])
        rotate([-90, 0, 0])
        cylinder(d = 10, h = 12, $fn = loc_res);
        translate([(73-34)/2+34+11/2, -9, hi1/2])
        rotate([-90, 0, 90])
        cylinder(d = 2, h = 11, $fn = loc_res);
    }
}

// Renkforce 4 Port USB 2 Hub schaltbar
// digitec 13432837
module usb2HubRenkforceSwitch(loc_res = 32) {
    color("Red")
    text("no_picture :-(");
}
// SABRENT USB hub 
// USB3 https://www.amazon.de/Sabrent-USB-HUB-einzelnen-Schalter/dp/B00JX1ZS5O
// USB2 https://www.amazon.de/Sabrent-USB-HUB-einzelnen-Schalter/dp/B00BWF5U0M/
module usb2HubSabrentSwitch(loc_res = 32) {
    color("DarkGray")
    cube([80, 30, 16]);
}

module meastablet(loc_res = 32, show = 1) {
    if(show) {
        // same place for locig8 + locig8old
        translate([70, 5, 4])
        logic8();
        //translate([70, 5, 4])
        //logic8Old();
        translate([130, 5, 4])
        dscopeU3P100();
        translate([20, 80, 4])
        usb2HubSabrentSwitch();
        // USB PSU, LDOs with 3.3 V, 3.0 V, ...
        color("Red")
        translate([5, 5, 4])
        cube([50, 50, 2]);
        // FTDI cable
        translate([30, 50, 8])
        color("DarkGray") {
            hull() {
                translate([0, 0, 0])
                cube([16, 28, 9]);
                translate([2, -2, 0])
                cube([12, 30, 9]);
            }
            translate([2, -2-4, 0])
            cube([12, 30, 9]);
            
            translate([8, -100, 9/2])
            rotate([-90, 0, 0])
            cylinder(d = 5, h = 120, $fn = loc_res);
        }
        
    }
    
    sheetA5();
    
    
}

meastablet();