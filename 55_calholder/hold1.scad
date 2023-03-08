/** 
 * Martin Egli
 * 2023-03-08
 */

module hold1(h1 = 20, loc_res = 32) {
    hull() {
        translate([-1/2, -10.5/2, 0])
        cube([1, 10.5, h1]);
        translate([-1.8/2, -9.5/2, 0])
        cube([1.8, 9.5, h1]);
    }
    translate([-1.8/2, -6.5/2, 0])
    cube([1.8+2, 6.5, h1]);
    hull() {
        translate([-1.8/2, -6.5/2, 0])
        cube([40, 3, h1]);
        translate([-1.8/2, -6.5/2+0.5, 0])
        cube([41, 2, h1]);
    }
}
hold1();