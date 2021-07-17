/**
 * Martin Egli
 * 2021-06-23
 * a relife strip for corona masks
 */

res = 50;

module heicho(th = 3) {
    difference() {
        translate([0, 0, 0])
        linear_extrude(th)
        import("dino_case_out.dxf");
        
        translate([0, 0, th-1])
        linear_extrude(1.5)
        import("dino_1heicho_case_in.dxf");
        
        translate([0, 0, -0.5])
        linear_extrude(th+1)
        import("dino_1heicho_cut.dxf");            
    }
    translate([0, 0, th-1])
    linear_extrude(1)
    import("dino_1heicho_top.dxf");
}

module dino(th = 2) {
    color("Orange") {
    difference() {
        translate([0, 0, 0])
        linear_extrude(th)
        import("dino_case_out.dxf");
        
        translate([0, 0, -0.5])
        linear_extrude(th+1)
        import("dino_2dino_cut.dxf");            
    }
    difference() {
        translate([0, 0, 0])
        linear_extrude(th+2)
        import("dino_2dino_top.dxf");

        translate([0, 0, th+1])
        linear_extrude(1.5)
        import("dino_2dino_top_cut.dxf");
    }
    translate([0, 0, 0])
    linear_extrude(th+1)
    import("dino_2dino_middle.dxf");
}
}

translate([0, 30, 0])
heicho(2);


dino(2);