/**
 * Martin Egli
 * 2021-11-03
 * M5 screw cut outs
 */

module m5ScrewCut(len = 10, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = 5.1, h = len, $fn = loc_res);
}
/*
module m5SinkHeadCut(len = 4, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d1 = 3.2, d2 = 6.6, h = 2, $fn = loc_res);
    translate([0, 0, 2])
    cylinder(d = 6.6, h = len, $fn = loc_res);
}*/
module m5CylinderHeadCut(len = 4, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = 9.7, h = len, $fn = loc_res);
}

module m5WasherCut(washer_dia = 12.2, len = 4, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = washer_dia, h = len, $fn = loc_res);
}

module m5NutCut() {
    translate([0, 0, 0])
    cylinder(d = 9, h = 4+4, $fn = 6);
}
/*
module m5SinkHeadScewNutCut(len = 10, loc_res = 32) {
    translate([0, 0, len])
    m3SinkHeadCut(4, loc_res);
    m3ScrewCut(len+1, loc_res);
    m3NutCut();
}
*/
module m5CylinderHeadScewNutCut(len = 10, loc_res = 32) {
    translate([0, 0, len])
    m5CylinderHeadCut(6, loc_res);
    m5ScrewCut(len+1, loc_res);
    m5NutCut();
}

module m5CylinderHeadWasherScewNutCut(len = 10, washer_dia = 12.2, loc_res = 32) {
    translate([0, 0, len])
    m5WasherCut(washer_dia, 30, loc_res);
    m5ScrewCut(len+1, loc_res);
    m5NutCut();
}

module m5TestingCylinderScrew(col = "Red", len = 20, loc_res = 32) {
    color(col) {
        translate([0, 0, 0])
        cylinder(d = 5-1, h = len, $fn = loc_res);
        translate([0, 0, 0])
        cylinder(d = 9-1, h = 4, $fn = 6);
        translate([0, 0, len])
        cylinder(d = 9.5-1, h = 4, $fn = loc_res);
    }
}

//m5SinkHeadScewNutCut(20);
//m5CylinderHeadScewNutCut(15);
//m5CylinderHeadWasherScewNutCut(20);
m5TestingCylinderScrew();