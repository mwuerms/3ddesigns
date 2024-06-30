/**
 * Martin Egli
 * 2024-06-27
 * add a shed to the outside scene
 * this is the actual brain works (aka thinking and creating)
 */

use <outside_scene.scad>
scene();

left_angle = 45; // in ° (degrees)
right_angle = 45; // in °
board_length = 2000; // in mm
bottom_space = 80; // in mm, space at the bottom

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
// 52 x 38 x 25 cm
module toolbox1(col = "SeaGreen", loc_res = 32) {
    rad1 = 50;
    color(col) {
        hull() {
            translate([0, 0, 0]) {
                translate([rad1, rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([380-rad1, rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([rad1, 420-rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([380-rad1, 420-rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
            }
            translate([0, 0, 160]) {
                translate([rad1, rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([380-rad1, rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([rad1, 520-rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([380-rad1, 520-rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
            }
            translate([0, 0, 250]) {
                translate([rad1, rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([380-rad1, rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([rad1, 420-rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
                translate([380-rad1, 420-rad1, 0])
                cylinder(r = rad1, h = 1, $fn = loc_res);
            }
        }
    }
}

translate([200, 200, 0])
rotate([0, 0, 90])
rotate([85, 0, 0])
festbank();

translate([2, 1050, 0])
#firewood();
translate([200, 1550, 0])
#stickcollection();

// add shelf here (where firewood + stick collection were lying)
module shelf1(col = "Cyan") {
    color(col) {
        translate([10, 1040, 180])
        cube([480, 20, 60]);
        translate([10, 1040, 1800])
        cube([480, 20, 60]);
        translate([40, 1020, 0])
        cube([60, 20, 2000]);
        translate([480, 1020, 0])
        cube([60, 20, 2000]);
        translate([10, 1680, 180])
        cube([480, 20, 60]);
        translate([10, 1680, 1800])
        cube([480, 20, 60]);
        
        translate([10, 1040, 400])
        cube([480, 660, 20]);
        translate([10, 1040, 800])
        cube([480, 660, 20]);
        translate([10, 1040, 1200])
        cube([480, 660, 20]);
        translate([10, 1040, 1600])
        cube([480, 660, 20]);
    }
    /*
    translate([240, 200, 1000])
    toolbox1();
    translate([240, 200, 1300])
    toolbox1();*/
    translate([10, 1450, 1230])
    rotate([0, 0, 270])
    toolbox1();
    translate([10, 1450, 1630])
    rotate([0, 0, 270])
    toolbox1();

}
shelf1();

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
color("Red")//"Plum")
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
    translate([n*85+140, 1800-80, bottom_space])
    cube([60, 20, board_length]);
}
// right side door
color("BlueViolet")
translate([610+10, 1800-80-60, bottom_space])
cube([20, 60, board_length]);
// mounted to right door
module right_door(angle = 0, col = "DarkSalmon") {
    // hinge
    translate([0, 0, 1780]) 
    color("Silver") {
        translate([0, 0, 0])
        cylinder(d = 10, h = 30);
        translate([-5, 1, -30]) 
        cube([5, 39, 80]);
    }
    translate([0, 0, 80]) 
    color("Silver") {
        translate([0, 0, 0])
        cylinder(d = 10, h = 30);
        translate([-5, 1, -30]) 
        cube([5, 39, 80]);
    }
    // door
    rotate([0, 0, angle])
    translate([-25, 0, 0]) {
        color(col) {
            translate([-20, -(750+30), 60])
            cube([20, 750, 60]);
            translate([-20, -(750+30), 1760])
            cube([20, 750, 60]);
            
            for(n = [0:1:9]) {
                translate([0, n*85-(740+85), 0])
                cube([20, 60, board_length]);
            }
        }
        // hinge
        color("Silver") {
            translate([-5+25, -405, 80]) 
            cube([5, 400, 30]);
            translate([-5+25, -405, 1780]) 
            cube([5, 400, 30]);
        }
    }
}
translate([610+10+25, 1800-80-60, bottom_space])
right_door(right_angle);

// left side door
color("BlueViolet")
translate([610+10, 20, bottom_space])
cube([20, 60, board_length]);
// mounted to left door
module left_door(angle = 0, col = "IndianRed") {
    // hinge
    translate([0, 0, 1780]) 
    color("Silver") {
        translate([0, 0, 0])
        cylinder(d = 10, h = 30);
        translate([-5, -40, -30]) 
        cube([5, 39, 80]);
    }
    translate([0, 0, 80]) 
    color("Silver") {
        translate([0, 0, 0])
        cylinder(d = 10, h = 30);
        translate([-5, -40, -30]) 
        cube([5, 39, 80]);
    }
    // door
    rotate([0, 0, -angle])
    translate([-25, 0, 0]) {
        color(col) {
            translate([-20, 30, 60])
            cube([20, 750, 60]);
            translate([-20, 30, 1760])
            cube([20, 750, 60]);
            
            for(n = [0:1:8]) {
                translate([0, n*85, 0])
                cube([20, 60, board_length]);
            }
        }
        // hinge
        color("Silver") {
            translate([-5+25, 5, 80]) 
            cube([5, 400, 30]);
            translate([-5+25, 5, 1780]) 
            cube([5, 400, 30]);
        }
    }
}
translate([610+10+25, 80, bottom_space])
left_door(left_angle);

// mark half way of the doors
*translate([580, 20, board_length])
cube([20, 1700/2, 60]);
*translate([580, 1700/2+20, board_length+60])
cube([20, 1700/2, 60]);
*translate([580, 20, board_length+120])
cube([20, 1700, 60]);