/**
 * Martin Egli
 * 2024-06-27
 * add a shed to the outside scene
 * this is the actual brain works (aka thinking and creating)
 */

use <outside_scene.scad>

*scene();

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



// now add the shed
// lower left corner
color("Thistle")
translate([10, 20, 180])
cube([610, 20, 60]);
color("Plum")
translate([10, 120, 180])
cube([160, 20, 60]);
// upper left corner
color("Thistle")
translate([10, 20, 2000-60])
cube([610, 20, 60]);
color("Plum")
translate([10, 120, 2000-60])
cube([160, 20, 60]);
// left stiffener
color("Violet")
hull() {
    translate([10, 20, 180+60])
    cube([60, 20, 10]);
    translate([610-60+10, 20, 2000-60-10])
    cube([60, 20, 10]);
}
// left pilar
color("Orchid")
translate([610-60+10, 40, 0])
cube([60, 60, 2000]);

// lower right corner
color("Thistle")
translate([10, 1800-80-20, 180])
cube([610, 20, 60]);
color("Plum")
translate([10, 1800, 180])
cube([160, 20, 60]);
// upper rightcorner
color("Thistle")
translate([10, 1800-80-20, 2000-60])
cube([610, 20, 60]);
color("Plum")
translate([10, 1800, 2000-60])
cube([160, 20, 60]);
// right stiffener
color("Violet")
hull() {
    translate([10, 1800-80-20, 180+60])
    cube([60, 20, 10]);
    translate([610-60+10, 1800-80-20, 2000-60-10])
    cube([60, 20, 10]);
}
// right pilar
color("Orchid")
translate([610-60+10, 1800-80-60-20, 0])
cube([60, 60, 2000]);

// right side wooden wall
color("BlueViolet")
for(n = [0:1:5]) {
    translate([n*85+140, 1800-80, 180])
    cube([60, 20, 2000]);
}
// right side door
color("BlueViolet")
translate([610+10, 1800-80-60, 180])
cube([20, 60, 2000]);

// left side door
color("BlueViolet")
translate([610+10, 20, 180])
cube([20, 60, 2000]);