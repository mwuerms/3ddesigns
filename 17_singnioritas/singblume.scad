/**
 * Martin Egli
 * 2021-11-09
 */

// cutter outer part
module cutterOuterPart() {
    minkowski() {
        difference() {
            translate([0, 0, 0])
            linear_extrude(0.1)
            import("singblume6cm8.dxf");
            translate([0, 0, -0.05])
            linear_extrude(0.2)
            import("singblume6cm7.dxf");
        }
        cylinder(d1 = 2, d2 = 0.35, h = 10, $fn = 16);
    }
}

module cutterInnerPart() {
    minkowski() {
        difference() {
            translate([0, 0, 0])
            linear_extrude(0.1)
            import("singblume6cm5.dxf");
            translate([0, 0, -0.05])
            linear_extrude(0.2)
            import("singblume6cm4.dxf");
        }
        cylinder(d1 = 2, d2 = 0.35, h = 10, $fn = 16);
    }
}

module cutterHondingPart() {
    difference(){
        translate([0, 0, 0])
        linear_extrude(2)
        import("singblume6cm9.dxf");
        translate([0, 0, -0.5])
        linear_extrude(3)
        import("singblume6cm7.dxf");
    }
    import("singblume6cmCutter10mmOuter.stl");
    import("singblume6cmCutter10mmInner.stl");
    
    difference() {
        union() {
            translate([12, 38, 0])
            rotate([0, 0, 15])
            cube([55, 8, 2]);
            translate([40, 18, 0])
            rotate([0, 0, 8])
            cube([8, 65, 2]);
        }
        translate([0, 0, -1])
        linear_extrude(4)
        import("singblume6cm5.dxf");
    }
}
//cutterOuterPart();
//cutterInnerPart();
cutterHondingPart();