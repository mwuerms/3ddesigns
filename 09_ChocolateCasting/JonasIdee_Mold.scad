/**
 * Martin Egli
 * 2021-09-15
 * chocolate casting form
 */

res = 20;

module chocolatePositive() {
    translate([220+5, 1.5+5, 3])
    rotate([0, 180, 0])
    import(file = "JonasIdeeString.stl");
    
    translate([0, 0, 2])
    hull() {
        dist1 = 1;
        translate([0+5-dist1, 0+5-dist1, 0])
        cylinder(d = 2*dist1, h = 5, $fn = res);
        translate([0+5-dist1, 32.5+5+dist1, 0])
        cylinder(d = 2*dist1, h = 5, $fn = res);
        translate([220+5+dist1, 32.5+5+dist1, 0])
        cylinder(d = 2*dist1, h = 5, $fn = res);
        translate([220+5+dist1, 0+5-dist1, 0])
        cylinder(d = 2*dist1, h = 5, $fn = res);
    }
}

module bottomNegative() {
    difference() 
    {
        union() {
            // bottom plate
            translate([0, 0, -3.1])
            hull() {
                dist1 = 1+2;
                height1 = 3;
                translate([0+5-dist1, 0+5-dist1, 0])
                cylinder(d = 2*dist1, h = height1, $fn = res);
                translate([0+5-dist1, 32.5+5+dist1, 0])
                cylinder(d = 2*dist1, h = height1, $fn = res);
                translate([220+5+dist1, 32.5+5+dist1, 0])
                cylinder(d = 2*dist1, h = height1, $fn = res);
                translate([220+5+dist1, 0+5-dist1, 0])
                cylinder(d = 2*dist1, h = height1, $fn = res);
            }
            
            // fill holes in
            // "o"
            translate([190, 17, -1])
            cylinder(d = 15, h = 4, $fn = res);
            // "a"
            translate([142, 13, -1])
            cylinder(d = 12, h = 4, $fn = res);
            // "d"
            translate([63, 17, -1])
            cylinder(d = 15, h = 4, $fn = res);
            // "e"
            translate([34, 17, -1])
            cube([10, 10, 4]);
            // "e"
            translate([11.5, 17, -1])
            cube([10, 10, 4]);
        }
        chocolatePositive();
    }
}

module topNegative() {
    difference() 
    {
        // top plate
        translate([0, 0, 0])
        hull() {
            dist1 = 1+2;
            height1 = 5;
            translate([0+5-dist1, 0+5-dist1, 0])
            cylinder(d = 2*dist1, h = height1, $fn = res);
            translate([0+5-dist1, 32.5+5+dist1, 0])
            cylinder(d = 2*dist1, h = height1, $fn = res);
            translate([220+5+dist1, 32.5+5+dist1, 0])
            cylinder(d = 2*dist1, h = height1, $fn = res);
            translate([220+5+dist1, 0+5-dist1, 0])
            cylinder(d = 2*dist1, h = height1, $fn = res);
        }
        
        union() {
            
            // fill holes in 
            // "o"
            translate([190, 17, -0.1])
            cylinder(d = 15, h = 4, $fn = res);
            // "a"
            translate([142, 13, -0.1])
            cylinder(d = 12, h = 4, $fn = res);
            // "d"
            translate([63, 17, -0.1])
            cylinder(d = 15, h = 4, $fn = res);
            // "e"
            translate([34, 17, -0.1])
            cube([10, 10, 4]);
            // "e"
            translate([11.5, 17, -0.1])
            cube([10, 10, 4]);
            
            chocolatePositive();
        }
    }
}

/*difference() {

    translate([0, 0, -2])
    cube([220, 32.5, 5]);
    
    

}*/

//chocolatePositive();
//bottomNegative();
topNegative();