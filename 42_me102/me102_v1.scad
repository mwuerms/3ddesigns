/**
 * Martin Egli
 * 2021-03-16
 * ME102
 * Magnet holder
 */
res = 100;
project_text = "ME102,v1";

mag_dia = 16.5;
hold_dia = 12;
hold_indent = (mag_dia - hold_dia)/2;
hold_length = 25;
/**
 * calc external radius for a concave form
 * @param i_dep     inner depth
 * @param seg_len   segment length
 * @return  radius
 */
function calc_r_concave(i_dep, seg_len) = (pow(i_dep, 2) + pow((seg_len/2), 2))/(2 * i_dep);
concave_radius = calc_r_concave(hold_indent, hold_length);

difference() {
    rotate_extrude($fn = res) {
        rotate([0, 0, 90])
        translate([0, 0, 0])
        union() {
            difference() {
                translate([0, -mag_dia/2, 0])
                square([hold_length, mag_dia/2], center = false);
                translate([hold_length/2, -(concave_radius+hold_dia/2), 0])
                circle(r = concave_radius, $fn = 2*res);
            }
            /*translate([-5, -12, 0]) {
                square([5, 12]);
                translate([2.5, 0, 0])
                circle(d = 5, $fn = res);
            }*/
        }
    }
    translate([0, 0, -1])
    cylinder(d = 3.2, h = hold_length+2, $fn = res);
    translate([0, 0, hold_length-5-2.8]) {
        cylinder(d = 6.5, h = 2.8, $fn = 6);
        translate([-6.5/2, 0, 0])
        cube([6.5, 10, 2.8]);
    }
    translate([0, 0, 5]) {
        cylinder(d = 6.5, h = 2.8, $fn = 6);
        translate([-6.5/2, 0, 0])
        cube([6.5, 10, 2.8]);
    }

    // project text
    translate([-6, 3, hold_length-1])
    linear_extrude(2)
    text(project_text, 2, $fn = res);
    // cut to see inside cube(60);
}
