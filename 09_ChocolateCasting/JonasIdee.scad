/**
 * Martin Egli
 * 2021-09-15
 * chocolate casting form
 */

res = 20;

module embossed_text(str, str_h = 2, str_size = 12, str_fn = 20, rim_wid = 2, str_font = "Arial:style=Bold") {
    minkowski() 
    {
        translate([0, 0, 0])
        linear_extrude(0.1)
        text(str, font = str_font, size = str_size, $fn = str_fn);
        
        cylinder(d1 = rim_wid, d2 = rim_wid-2, h = str_h, $fn = str_fn);
    }
}

module embossed_test_text(str, str_h = 2, str_size = 12, str_fn = 20, str_font = "Arial:style=Bold") {
    //minkowski() 
    {
        translate([0, 0, 0])
        linear_extrude(str_h+0.1)
        text(str, font = str_font, size = str_size, $fn = str_fn);
        
        cylinder(d1 = 2, d2 = 0, h = str_h, $fn = str_fn);
    }
}

/*
difference() {
    // casting mold
    hull() {
        dista = 2;
        heighta = 8;
        translate([0-dista, 0-dista, 0])
        cylinder(d = 2*dista, h = heighta, $fn = res);
        translate([0-dista, 12+dista, 0])
        cylinder(d = 2*dista, h = heighta, $fn = res);
        translate([88+dista, 12+dista, 0])
        cylinder(d = 2*dista, h = heighta, $fn = res);
        translate([88+dista, 0-dista, 0])
        cylinder(d = 2*dista, h = heighta, $fn = res);
    }

    // text to cut out
    union() {
        translate([0, 0, 2])
        //embossed_text("Jonas' Idee", str_h = 5, str_fn = res);
        //embossed_test_text("Jonas' Idee", str_h = 5, str_fn = res);
        
        hull() {
            dista = 1;
            translate([0-dista, 0-dista, -1])
            cylinder(d = 2*dista, h = 3, $fn = res);
            translate([0-dista, 12+dista, -1])
            cylinder(d = 2*dista, h = 3, $fn = res);
            translate([88+dista, 12+dista, -1])
            cylinder(d = 2*dista, h = 3, $fn = res);
            translate([88+dista, 0-dista, -1])
            cylinder(d = 2*dista, h = 3, $fn = res);
        }
    }
    
    // to see inside
    //cube(20);
}*/

//attention will compile for 15 min! embossed_text("Jonas' Idee", str_size = 30, str_h = 3, str_fn = res);
//embossed_text("Jonas' Idee", str_size = 24, str_h = 3, rim_wid = 2, str_fn = res);
//embossed_text("Jonas' Idee", str_size = 24, str_h = 3, rim_wid = 4, str_fn = res);
//embossed_text("Robert", str_size = 24, str_h = 3, str_fn = res);
//embossed_test_text("Robert", str_size = 24, str_h = 3, str_fn = res);


