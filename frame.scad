// angle between planes in given polyhedron (dihedral angle)
// d = 70.52877936550931; // tetrahedron (D4)
// d = 90; // cube / hexahedron (D6)
// d = 109.47122063449069; // octahedron (D8)
d = 116.56505117736714; // dodecahedron (D12)
// d = 138.18968510422138; // icosahedron (D20)

d2 = d/2;

// acrylic plate thickness in mm
a = 3;
//a=6.1;

// acrylic plate depth in frame [mm]
ad = 6;
//ad = 8;

// structure thickness in mm
t = 1.5;

// extrusion length (polyhedron edge length) in mm
l = 146;

// LED strip width in mm
w_led = 12;

module rotate_about_pt(z, y, pt) {
    translate(pt) rotate([0, y, z]) translate(-pt) children();
}

module BracePerimeter(hasCutouts=false) {
    //
    // D1: small triangle
    //

    // cathete touching angle d2 (inner edge)
    h1 = ad + t/2;

    // other cathete
    b1 = h1 * tan(d2);

    // hypothenuse
    c1 = h1 / cos(d2);


    //
    // D2: big triangle
    //

    // cathete not touching angle d2
    b2 = 2*t + a + b1;

    // cathete touching angle d2 (outer edge)
    h2 = b2 * (1 / tan(d2));

    // hypothenuse
    c2 = h2 / cos(d2);

    // 
    // C: cutout for acrylic plate
    //

    // distance from origin in x-direction
    cx = b1 + t;

    // normal of the plane along which to mirror
    n = cross([0, 0, 1],  [b2, h2, 0]);


    // crazy computations for cutout that allows for smooth led strip fit
    hc1 = b1 * cos(d2);
    hc0 = hc1 * sin(d2);
    q0 = hc0 * (1 / tan(d2));

    // assert((hc1 * 2) > w_led, "Not enough space for LED strip.");

    rotate(d/2, [0, 0, 1]) translate([0, c2, 0]) rotate(d2 + 180) union () {
        difference() {
            polygon([[0, 0], [b2, 0], [b2, h2]]); // D2
            polygon([[0, 0], [b1, 0], [b1 - q0, hc0]]); // D1
            if (hasCutouts) polygon([[cx, 0], [cx, ad], [cx + a, ad], [cx + a, 0]]); // cutout for acrylic plate
        }

        mirror(n) {
            difference() {
                polygon([[0, 0], [b2, 0], [b2, h2]]); // D2
                polygon([[0, 0], [b1, 0], [b1 -q0, hc0]]); // D1
                if (hasCutouts) polygon([[cx, 0], [cx, ad], [cx + a, ad], [cx + a, 0]]); // cutout for acrylic plate
            }
        }
    }
}

module Brace(length) {
    linear_extrude(length) BracePerimeter(true);
}

module BraceFitting(length) {
    rotate(-120, [1, 0, 0]) translate([0, -10, 0])  linear_extrude(length) BracePerimeter(true);
}

module TBrace(length) {
    x = (2*t+a) / 2; // translate amount to make cutouts overlap
    translate([x, 0, 0]) linear_extrude(length) BracePerimeter(true);
    translate([-x, 0, 0]) mirror([1, 0, 0]) linear_extrude(length) BracePerimeter(true);
}

module _EdgeBrace(x, y, length) {
    difference() {
        cube([x, y, length]);
        translate([t*2, 0, 0]) cube([a, ad, length]);
        
    }
}

module EdgeBrace(length) {
    x_out = a + t*4;
    y_out = ad + t*2;
    
    _EdgeBrace(x_out, y_out, length);
}

module ScrewCutout() {
    translate([2.5, 0, 0]) rotate([90, 0, 90]) cylinder(h=5, d=2, center=true);
}

// orientation = 0: magnets on the back
// orientation = 1: magnets on the side
module EdgeBraceWithMagnets(length, orientation = 0, hinges = 0, magnets = 0) {
    //
    // D1: small triangle
    //

    // cathete touching angle d2 (inner edge)
    h1 = ad + t/2;

    // other cathete
    b1 = h1 * tan(d2);

    // hypothenuse
    c1 = h1 / cos(d2);


    //
    // D2: big triangle
    //

    // cathete not touching angle d2
    b2 = 2*t + a + b1;

    x_out = a + t*4;
    y_out = b2;

    difference() {
        offs = orientation == 0 ? y_out - x_out / 2 : x_out / 2;

        if (orientation == 0) {
            _EdgeBrace(x_out, y_out, length);
        } else {
            translate([y_out, 0, 0]) rotate([0, 0, 90]) _EdgeBrace(x_out, y_out, length);
        }
    
        // magnet cutouts
        magnet_distance_from_edge = length / 4;
        
        if (magnets == 1) {
            translate([0, offs, magnet_distance_from_edge]) rotate([0, 90, 0]) cylinder(h=2, d=6.2);
            translate([0, offs, length - magnet_distance_from_edge]) rotate([0, 90, 0]) cylinder(h=2, d=6.2);
        }

        // hinge cutouts
        w_hinge = 7.3;
        l_hinge = 17.3;
        d_hinge = 1;
        
        if (hinges == 1) {
            translate([0, offs - 2.5, magnet_distance_from_edge / 4])
                cube([d_hinge, w_hinge, l_hinge]);
            translate([0, offs - 2.5, length - (magnet_distance_from_edge / 2) - w_hinge])
                cube([d_hinge, w_hinge, l_hinge]);
            translate([0, offs - 2.5, length / 2 - l_hinge / 2])
                cube([d_hinge, w_hinge, l_hinge]);
        }
    }
}

$fn=100;
// EdgeBraceWithMagnets((300-12) / 2, orientation=1, hinges=0, magnets=1);
Brace(200);



