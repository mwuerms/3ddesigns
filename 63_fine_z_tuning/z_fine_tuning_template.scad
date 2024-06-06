/**
 * Martin Egli
 * 2024-06-06
 * template for z axis fine tuning
 */

module ztuningtemplate_part(xsize = 10, ysize = 2, zsize = 0.2) {
    linear_extrude(zsize)
    polygon([[0, 0], [xsize-1.5*ysize, 0], [xsize, ysize], [0, ysize]]);
}
    
module ztuningtemplate(thickness = 0.2) {
    for(n = [0:1:6]) {
        translate([0, n*2, 0])
        ztuningtemplate_part(10, 2, thickness);
    }
}

//projection()
ztuningtemplate();