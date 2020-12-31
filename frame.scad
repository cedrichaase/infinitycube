// angle between planes in given polyhedron (dihedral angle)
// d = 70.52877936550931; // tetrahedron (D4)
// d = 90; // cube / hexahedron (D6)
// d = 109.47122063449069; // octahedron (D8)
d = 116.56505117736714; // dodecahedron (D12)
// d = 138.18968510422138; // icosahedron (D20)
d2 = d/2;

// internal angle of each face polygon
aint = 108;

// acrylic plate thickness in mm
a = 5;

// acrylic plate depth in frame [mm]
ad = 8;

// structure thickness in mm
t = 2;

// extrusion length (polyhedron edge length) in mm
l = 200;

// LED strip width
w_led = 12;

module BracePerimeter(hasCutouts=false) {
    //
    // D1: small triangle
    //

    // cathete touching angle d2 (inner edge)
    h1 = ad + t/2;

    // other cathete
    b1 = h1 * tan(d2);


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

    assert((hc1 * 2) > w_led, "Not enough space for LED strip.");

    translate([0, c2, 0]) rotate(d2 + 180) union () {
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
    linear_extrude(length) BracePerimeter(false);
}
