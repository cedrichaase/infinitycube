# Infinitycube

Models and documentation for creating DIY infinitycubes.

Inspired by some people at a Chaos Communication Congress booth who built an impressively overengineered version of this (formerly found at infinitycubez.de).

![infinitycube](infinitycube.png "Infinitycube example build")

## Part list

This might not be comprehensive; if anything is missing, feel free to drop me a line!

- Acrylic plates (3mm thickness)
- Semi-transparent adhesive mirror foil
- 1kg or so of your favourite PETG 3D printer filament :)
- Adressable RGB LED strips with black PCB, 144 LEDs per meter (WS2812B or similar)
- Controller for the RGB LED strips (sometimes the LED strips ship with one, but feel free to make your own using an ESP 32 or something similar)
- Black heatshrink tubing
- Some wire
- Some solder

## Required tools

- A 3D printer
- A soldering iron
- A lighter, heat gun or something else to apply the heatshrink tubing
- A jigsaw or something else that cuts acrylic plates to size
- A spray bottle with some soapy water
- A credit card or something similar for squeegeeing purposes


## Assembly

### Frame assembly

The frame assembly for the infinitycube consists of frame pieces and corners.
Print 30 edge pieces and 20 corners for the vertices for a dodecahedron infinitycube.

Feel free to print the frame pieces in any length to scale the dodecahedron as desired.
Connect the frame pieces via the corner pieces by sliding them in; no glue or screws are necessary.

Cut acrylic plates to size to make up the faces of the dodecahedron.
I found it helpful to first make a template for cutting the acrylic plates.
You can either 3D print this or make one out of thin wood (or acrylic even).
I then used a jigsaw to cut out the faces.
You have quite some tolerance to work with here, as a couple of millimeters of the face edges
will sit inside the frame pieces anyway.

Stick adhesive, semi-transparent mirror foil to the faces.
Use a spray bottle to cover the faces as well as the sticky side of the foil in soapy water.
You can then position it and squeegee out the water from between the foil and the acrylic plate.
Cut off any excess foil; make sure to leave a little border of the acrylic plates uncovered by foil, up to the depth they will sit inside the frame pieces.
If you don't, the foil might peel off when you push the acrylic plates into the frame pieces. 

Now, the prerequisites for the case are complete.
You can push the acrylic plates into the frame pieces and the corners on the frame pieces.
The faces should also fit tightly enough inside the frame pieces to not require any screws or glue to be held in place.


### Electronics

Cut LED strips to the length of one of the frame pieces.
Make sure you leave enough of the solder pads intact or soldering will become a bit of a nightmare :)

You won't be able to cover all edges with an LED strip.
My dodecahedron infinitycube has 20 edges covered with LED strips.
Maybe there is an elaborate way to cover more edges, but I really couldn't be bothered :D
Feel free to experiment with this.

Next, bridge the gap between the LED strip pieces with wire.
Apply black heatshrink tubing to the wires. This keeps them nice and tidy and also makes them less visible later.

One end should be soldered to a cable plug that can be routed outside of the case via a corner.
For this purpose, drill a small hole into one of the corner pieces.
Route the wires through the hole, slide over heatshrink tubing,
solder them to the end of the LED strip chain and then fixate the heatshrink.

Next, glue the LED strips to the frame pieces.
A two-component epoxy glue that cures in around 15 minutes works well here.
These usually stick very well and give you the time to shift around the LED strips until they're aligned properly.
Also, the curing process can be sped up using a heat gun (or a hairdryer) if you're impatient :)

Now, assemble everything and you're done!

