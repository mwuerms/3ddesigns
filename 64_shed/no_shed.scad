/**
 * Martin Egli
 * 2024-06-27
 * add a shed to the outside scene
 * this is the actual brain works (aka thinking and creating)
 */

use <outside_scene.scad>

scene();

module festbank(col = "DarkGoldenrod", loc_res = 32) {
    edge_rad = 50;
    color(col) {
        hull() {
            translate([edge_rad, edge_rad, 0])
            cylinder(r = edge_rad, h = 30, $fn = loc_res);
            translate([800-edge_rad, edge_rad, 0])
            cylinder(r = edge_rad, h = 30, $fn = loc_res);
            translate([edge_rad, 2200-edge_rad, 0])
            cylinder(r = edge_rad, h = 30, $fn = loc_res);
            translate([800-edge_rad, 2200-edge_rad, 0])
            cylinder(r = edge_rad, h = 30, $fn = loc_res);
        }
        translate([100, 200, 0])
        cube([600, 30, 80]);
        translate([100, 2000-30, 0])
        cube([600, 30, 80]);
    }
}
module firewood(col = "SandyBrown") {
    color(col)
    cube([400, 400, 800]);
}
module stickcollection(col = "DarkOliveGreen", loc_res = 32) {
    color(col)
    cylinder(r = 100, h = 1000, $fn = loc_res);
}

translate([200, 200, 0])
rotate([0, 0, 90])
rotate([85, 0, 0])
festbank();

translate([2, 1050, 0])
firewood();
translate([200, 1550, 0])
stickcollection();