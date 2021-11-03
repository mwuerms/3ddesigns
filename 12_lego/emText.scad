/**
 * Martin Egli
 * 2021-10-30
 * Gute Besserung Robert
 */
module embossed_text(loc_res = 16) {
    minkowski()
    {
        //translate([20, 30, 0])
        linear_extrude(0.01)
        text("Gute", size = 12, $fn = loc_res);
        //text("Besserung", size = 12, $fn = loc_res);
        //text("Robert", size = 12, $fn = loc_res);
        cylinder(r1 = 1, r2 = 0, h = 1, $fn = loc_res);
    }
}
embossed_text();
