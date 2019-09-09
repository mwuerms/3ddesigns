/**
 * Martin Egli
 * 2019-09-02
 *
 * Free Piston Stirling Engine
 */

res_final = 100;
res_draw = 40;
//res = res_final;
res = res_draw;

/* - vitamins --------------------------------------------------------------- */
module outerPiston() {
    color("Silver") {
        difference() {
            translate([0,0,0])
            cylinder(r=19.3/2, h = 30, $fn=res);
            translate([0,0,-1])
            cylinder(r=16.2/2, h = 30+2, $fn=res);
        }
    }
}

module magR190906N() {
    color("Silver") {
        difference() {
            translate([0,0,0])
            cylinder(r=19.0/2, h = 6, $fn=res);
            translate([0,0,-1])
            cylinder(r=9.5/2, h = 6+2, $fn=res);
        }
    }
}

module magR190906Spacer() {
    color("White") {
        difference() {
            translate([0,0,0])
            cylinder(r=19.0/2, h = 2.5, $fn=res);
            translate([0,0,-1])
            cylinder(r=10.0/2, h = 2.5+2, $fn=res);
        }
    }
}

module pistonShaft(hps = (30+15+38+20)) {
    color("Gold") {
        difference() {
            translate([0,0,0])
            cylinder(r=4.0/2, h = hps, $fn=res);
            translate([0,0,-1])
            cylinder(r=3.0/2, h = hps+2, $fn=res);
        }
    }
}

module displacerShaft(hds = (160)) {
//    color("Gold") {
    color("Red") {
        difference() {
            translate([0,0,0])
            cylinder(r=3.0/2, h = hds, $fn=res);
        }
    }
}

module displacerDisc(hdd=10) {
    ddisk = 100-1;
    color("Gray") {
        difference() {
            translate([0,0,0])
            cylinder(r=ddisk/2, h = hdd, $fn=res);
        }
    }
}

module displacerMetal(hmet = 1) {
    din = 100.0;
    dout = din+20;
    dout2 = dout+10;
    hdout2 = 4;
    doph = 40;
    color("Silver") {
        difference() {
            union() {
                translate([0,0,0])
                cylinder(r=dout2/2,h=hmet,$fn=8);
            }
            // center hole
            translate([0,0,-1])
            cylinder(r=15/2,h=hmet+2,$fn=res);
            // outer M3 holes
            rm3= (dout2-6)/2;
            for(n=[0:7]) {
                translate([rm3*cos(45*n),rm3*sin(45*n),-1])
                cylinder(r=2.5/2,h=hmet+2,$fn=res);
            }
            // inner M3 holes
            for(n=[0:3]) {
                translate([((doph+20)/2)/2*cos(90*n+45), ((doph+20)/2)/2*sin(90*n+45),-1])
                cylinder(r=2.5/2,h=10,$fn=res);
            }
        }
    }
}

/* - 3d printed parts ------------------------------------------------------- */

module springHolder(rsh=3, lsh=5) {
    translate([-lsh/2,0,0])
    rotate([0,90,0])
    hull() {
        translate([0, rsh/2,0])
        cylinder(r=rsh, h = lsh, $fn = res);
        translate([0,-rsh/2,0])
        cylinder(r=rsh, h = lsh, $fn = res);
    }
}


module pistonSpring(th=1.0, slength = 120) {
    hsprh = 2.7;
    color("Green") {
        difference() {
            union() {
                translate([0,0,0])
                cylinder(r=8/2,h=5,$fn=res);
                // arms with holder
                translate([-slength,0,0]) {
                    translate([0,-1.5,0])
                    cube([2*slength,3,th]);
                    translate([3.5,-1.5,0])
                    difference() {
                        translate([0,0,0])
                        cube([hsprh*2,3,hsprh*2]);
                        rotate([90,0,0])
                        translate([hsprh*2,hsprh*2+th,-hsprh*1.5])
                        cylinder(r = hsprh*2, h = hsprh*2, $fn = res);
                    }                    
                    translate([0,0,hsprh])
                    springHolder(rsh = hsprh, lsh = 7);

                    translate([2*slength-6.2,-1.5,0])
                    difference() {
                        translate([-hsprh,0,0])
                        cube([hsprh*2,3,hsprh*2]);
                        rotate([90,0,0])
                        translate([-hsprh,hsprh*2+th,-hsprh*1.5])
                        cylinder(r = hsprh*2, h = hsprh*2, $fn = res);
                    }
                    translate([2*slength,0,hsprh])
                    springHolder(rsh = hsprh, lsh=7);
                }
            }
            translate([0,0,-1])
            cylinder(r=1/2,h=5+2,$fn=res);
        }
    }
}


module innerPiston() {
    color("Green") {
        difference() {
            union() {
                translate([0,0,0])
                cylinder(r=16.7/2, h = 30, $fn=res);
                translate([0,0,30])
                cylinder(r=9.4/2, h = 38, $fn=res);
            }
            translate([0,0,-1])
            cylinder(r=4.1/2, h = 30+38+2, $fn=res);
        }
    }
}

module outerPistonHolder(doph = 40) {
    color("Green") {
        difference() {
            union() {
                translate([0,0,0])
                cylinder(r=doph/2, h = 30, $fn=res);
            }
            // inner bore
            translate([0,0,-1])
            cylinder(r=19.5/2, h = 30+2, $fn=res);
            // mounting holes, M3
            for(n=[0:3]) {
                translate([((doph+20)/2)/2*cos(90*n+45), ((doph+20)/2)/2*sin(90*n+45),-1])
                cylinder(r=2.5/2,h=10,$fn=res);
            }
            // mounting holes springs
            translate([((doph+20)/2)/2*cos(0), ((doph+20)/2)/2*sin(0),6])
            rotate([0,0,0])
            translate([-15,0,0])
            springHolder(lsh=50);

            translate([((doph+20)/2)/2*cos(90), ((doph+20)/2)/2*sin(90),6])
            rotate([0,0,90])
            translate([-15,0,0])
            springHolder(lsh=50);
        }
    }
}

module donut(ddia=2.0, dia=10) {
    rotate_extrude(convexity = 10, $fn = res)
    translate([dia/2, 0, 0])
    circle(r = ddia/2, $fn = res);
}

module regeneratorCutout(dreg, dreghole, part_circle, hcut) {
    ang = 360/part_circle;
    translate([0,0,-1]) {
        rotate([0,0,-ang/2]) {
            rotate_extrude(angle=ang, convexity = 10, $fn = res)
            translate([dreg/2, 0, 0])
            square([dreghole, hcut+2], $fn = res);
translate([(dreg+dreghole)/2*cos(0),(dreg+dreghole)/2*sin(0), 0])
            cylinder(r=dreghole/2, h=hcut+2,$fn=res);
translate([(dreg+dreghole)/2*cos(ang),(dreg+dreghole)/2*sin(ang), 0])
            cylinder(r=dreghole/2, h=hcut+2,$fn=res);
        }
    }
}

module displacerCaseMount(hdcm=4) {
    din = 100.0;
    dout = din+20;
    dout2 = dout+8;
    color("Green") {
        difference() {
            union() {
                translate([0,0,0])
                cylinder(r=dout2/2,h=hdcm,$fn=8);

            }
            // displacer hole
            translate([0,0,-1])
            cylinder(r=din/2,h=hdcm+2,$fn=res);

            // seal ring
            translate([0,0,hdcm])
            donut(2.5, din+13);

            // M3 holes
            rm3= (dout2-6)/2;
            for(n=[0:7]) {
                translate([rm3*cos(45*n),rm3*sin(45*n),-1])
                cylinder(r=2.5/2,h=hdcm+2,$fn=res);
            }
            // regenerator holes
            for(n=[0:3]) {
                rotate([0,0,90*n])
                regeneratorCutout(din+2, 3, 9.5, hdcm);
            }
            // connection bolts (M3) for glueing
            for(n=[0:3]) {
                translate([(din+2+3)/2*cos(90*n+45),(din+2+3)/2*sin(90*n+45),-1])
                cylinder(r=2.5/2,h=hdcm+2,$fn=res);
            }
        }
    }
}

module displacerCase(hdc=2) {
    din = 100.0;
    dout = din+13;
    color("Green") {
        difference() {
            union() {
                translate([0,0,0])
                cylinder(r=dout/2,h=hdc,$fn=res);
            }
            // displacer hole
            translate([0,0,-1])
            cylinder(r=din/2,h=hdc+2,$fn=res);

            // regenerator holes
            for(n=[0:3]) {
                rotate([0,0,90*n])
                regeneratorCutout(din+2, 3, 9.5, hdc);
            }
            // connection bolts (M3) for glueing
            for(n=[0:3]) {
                translate([(din+2+3)/2*cos(90*n+45),(din+2+3)/2*sin(90*n+45),-1])
                cylinder(r=2.5/2,h=hdc+2,$fn=res);
            }
        }
    }
}

/* - put together------------------------------------------------------------ */
module putTogether(cut=1) {
    difference () {
        union() {
            // powerpiston
            outerPiston();
            outerPistonHolder();

            translate([0,0,0]) {
                innerPiston();
                pistonShaft();
                // magnets as weight and magnets
                translate([0,0,30+1]) {
                    translate([0,0,0])
                    magR190906N();
                    translate([0,0,6])
                    magR190906Spacer();
                     translate([0,0,6+2.5])
                    magR190906N();
                    translate([0,0,6+2.5+6])
                    magR190906Spacer();
                    translate([0,0,6+2.5+6+2.5])
                    magR190906N();
                    translate([0,0,6+2.5+6+2.5+6])
                    magR190906Spacer();
                    translate([0,0,6+2.5+6+2.5+6+2.5])
                    magR190906N();
                }
            }

            // displacer
            translate([0,0,-20]) {
                translate([0,0,-1])
                displacerShaft();
                translate([0,0,-1])
                displacerDisc();
            }

            // displacer case
            translate([0,0,-11])
            displacerCase();
            translate([0,0,-11])
            rotate([180,0,0])
            displacerCase();

            translate([0,0,-1])
            displacerMetal();
            translate([0,0,-22])
            displacerMetal();
        }
        // cut
        if(cut == 1) {
            translate([0,-50,-50])
            cube([100,100,300]);
        }
    }
}

//putTogether(1);

// single 3d printed parts

/* outerPistonHolder: 
 *  OK, super dimensions
 *  no need to reprint */
//outerPistonHolder();    // 1 x

/* innerPiston: 
 *  Adjustments, 
 *  inner diameter 0.1 mm too small, 
 *  outer diameter for magnets: 0.5 mm to large
 *  outer diameter for Piston: 0.2 mm to small, make 0.4 mm larger and schleif down
 *  reprint */
//innerPiston();  // 1 x
/* pistonSpring
 *  Adjustments: sprintHolder too small, 0.5 mm to small, make 0.4 mm larger
 *  reprint */
pistonSpring(); // 2 x

//translate([0,0,14])
//displacerCaseMount(4);  // 2 x
//displacerCase(20-8);  // 1 x

// cut out from metal sheet
//projection()
//displacerMetal();


