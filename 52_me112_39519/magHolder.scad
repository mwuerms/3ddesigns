/**
 * Martin Egli
 * 2023-01-06
 * using https://www.thingiverse.com/thing:39519
 * changing to my desires
 */

//import("40-25-10_pcb_holder.STL");
//import("flipper.stl"); // leave at it is

module pcb_holder_me_filled(loc_res = 32) {
    import("pcb_holder.stl");
    // fill hole for magnet
    translate([5, 18, 0.1])
    cube([29, 15, 8]);
}

module pcb_holder_me_N5x5x5(loc_res = 32) {
    // orogin on fill translate([5, 18, 0.1])
    difference() {
        pcb_holder_me_filled();
        translate([22, 20, 0])
        cube([11, 21, 5.1]); // 2 x 4 x N5x5x5 Magnets
        // temper
        #translate([22, 20, 0])
        hull() {
            translate([-1, -1, -1])
            cube([11+2, 21+2, 0.1]);
            translate([0, 0, 0])
            cube([11, 21, 1.1]);
        }
    }
}

mirror([1, 0, 0])
pcb_holder_me_N5x5x5();
