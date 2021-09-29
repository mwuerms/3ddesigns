/**
 * Martin Egli
 * 2021-09-19
 * Käthi & Evan
 */
res = 20;

module embossed_text() {
    minkowski()
    {
        linear_extrude(0.01)
        text("Käthi & Evan", size = 12, $fn = res);
        //text("2021", size = 12, $fn = res);
        cylinder(r1 = 1, r2 = 0, h = 1, $fn = res);
    }
}

module ring1() {
    res1 = 40;
    minkowski() 
    {
        difference()
        {
            translate([0, 0, 0])
            cylinder(d = 12, h = 0.01, $fn = res1);
            translate([0, 0, -0.1])
            cylinder(d = 10, h = 0.2, $fn = res1);
            
            translate([0, 0, -0.1])
            linear_extrude(0.2)
            polygon([[0, 0], [6.5*cos(-80), 6.5*sin(-80)], [6.5*cos(-40), 6.5*sin(-40)]]);
        }
        cylinder(r1 = 1, r2 = 0, h = 1, $fn = res1);
    }
}

module rings() {
    ring1();
    translate([6, 0, 0])
    rotate([0, 0, -180])
    ring1();
}

//rings();
//embossed_text();

module bottomPlate() {
    translate([97.5, 4, 0])
    rotate([0, 180, 0])
    mirror([0, 0, 1]) 
    {
    translate([0, 32, 0])
    import("SchriftKE12x1.stl");
    translate([45, 21, 0])
    import("SchriftKERings2.stl");
    translate([30, 0, 0])
    import("SchriftKE202112x1.stl");
    }

    difference() {
        minkowski() {
            translate([3, 3, -1])
            cube([94, 46, 1]);
            cylinder(d1 = 4, d2 = 4, h = 1, $fn = res);
        }
        minkowski() {
            translate([3, 3, 0])
            cube([94, 46, 1]);
            cylinder(d1 = 1, d2 = 4, h = 1, $fn = res);
        }
    }
}

module case() {
    difference() {
        minkowski() {
            translate([3, 3, -1])
            cube([94, 46, 8-1]);
            cylinder(d = 6, h = 1, $fn = res);
        }
        minkowski() {
            translate([3, 3, -1])
            cube([94, 46, 8]);
            cylinder(d1 = 4, d2 = 4, h = 1, $fn = res);
        }
    }
}

module bottomPlateV2(ratio = 0.5) {
    scale([ratio, ratio, 1])
    bottomPlate();
}

module caseV2(ratio = 0.5) {
    difference() {
        minkowski() {
            translate([3*ratio , 3*ratio, -1])
            cube([94*ratio, 46*ratio, 5-1]);
            cylinder(d = 8, h = 1, $fn = res);
        }
        minkowski() {
            translate([3*ratio, 3*ratio, -1])
            cube([94*ratio, 46*ratio, 8]);
            cylinder(d1 = 4*ratio, d2 = 4*ratio, h = 1, $fn = res);
        }
    }
}
bottomPlateV2(0.7);
//caseV2(0.7);
