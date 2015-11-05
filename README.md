# gimp-workprep

A Script-Fu (possibly later evolving into a full plugin to do this in batch) to save time on workflow on a file in GIMP. Specifically, when I plan to start by roughly tracing over an image for reference.

It's main aim is to change the layer name of the initial active layer to 'Reference' (requires an open existing image in mode RGBA), ratchet down the opacity to 30%, and insert two canvas sized layers: one transparent at the top and one filled with white underneath the starting layer.

The transparent layer I use for Lines, while the White is simply there so that the default gray checkerboard pattern does not distract.
