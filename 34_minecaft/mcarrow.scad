/**
 * Martin + Linus Egli
 * 2023-05-05
 */

module mcblock(xsize = 1.6, ysize = 1.6, zsize = 1.6) {
    translate([-xsize/2, -ysize/2, 0])
    cube([xsize, ysize, zsize]);
}

module mcarrow(xsize = 1.6, ysize = 1.6, zsize = 1.6) {
    // origin: tip of arrow
    for(m = [0:1:2]) {
        translate([m*xsize, m*ysize, 0*zsize])
        for(n = [0:1:3]) {
            translate([n*xsize, 0*ysize, 0*zsize])
            mcblock();
        }
        translate([m*xsize, m*ysize, 0*zsize])
        for(n = [0:1:3]) {
            translate([0*xsize, n*ysize, 0*zsize])
            mcblock();
        }
    }
    for(m = [3:1:8]) {
        translate([m*xsize, m*ysize, 0*zsize])
        for(n = [0:1:1]) {
            translate([n*xsize, 0*ysize, 0*zsize])
            mcblock();
        }
        translate([m*xsize, m*ysize, 0*zsize])
        for(n = [0:1:1]) {
            translate([0*xsize, n*ysize, 0*zsize])
            mcblock();
        }
    }
    for(m = [9:1:11]) {
        translate([m*xsize, m*ysize, 0*zsize])
        for(n = [0:1:2]) {
            translate([n*xsize, 0*ysize, 0*zsize])
            mcblock();
        }
        translate([m*xsize, m*ysize, 0*zsize])
        for(n = [0:1:2]) {
            translate([0*xsize, n*ysize, 0*zsize])
            mcblock();
        }
    }
}

mcarrow();