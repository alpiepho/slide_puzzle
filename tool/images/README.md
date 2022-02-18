#!/usr/bin/env python3

This is a tool and process to create new images for the different puzzle sizes.  These
will all need to be added to assets and loaded at start time.  

I looked into using Flutter/Dart to split an image at run-time, but this seems to be a 
really big problem in Flutter/Dart.  There are lots of ideas, particularly using a package
incoviently named "image".  Unfortunately, I could not find a way to convert the widget 
"Image" (ie. ui.Image) to the library "Image" (ie imglib.Image).

Instead, we will follow the pattern of adding a series of smaller images for each tile.

One unfortunate thing is that the best image for splitting is the smaller gallery images
with rounded corners.

Another thing missing is changing the success images to reflect the puzzle size.

# BACKGROUND
<pre>
have 
...assets/images/dashatar/ ls
  /(blue | green | yellow)/
    1.png 
    ...
    15.png 
  /gallery/
    (blue | green | yellow).png 
  /gallery/
    (blue | green | yellow).png 
</pre>

For example:
<pre>
from image_slicer import slice
slice('blue.png', 4)

produces:
blue_01_01.png
blue_01_02.png
blue_02_01.png
blue_02_02.png
</pre>


# PROCESS
- assume python3 installed 
- cd ...tool/images
- (one time) python3 -m venv isplit
- source isplit/bin/activate
- (one time) python3 -m pip install image_slicer
- cp -r ../../assets/images/dashatar .
- WARNING: need to use gallery image since don't have original

- cp dashatar/gallery/blue.png .
- mkdir blue33
- ./do_slicer.py blue.png 9
- move *_*.png blue33
- ls
- mkdir blue44
- ./do_slicer.py blue.png 16
- move *_*.png blue44
- ls
- mkdir blue55
- ./do_slicer.py blue.png 25
- move *_*.png blue55
- ls
- rm blue.png

- same process for green.png and yellow.png

- mv *33 ../../assets/images/dashatar
- mv *44 ../../assets/images/dashatar
- mv *55 ../../assets/images/dashatar

- rm -rf dashatar


# TODO 
- [x] create images 
- [x] add to app.dart 
- [ ] update dashatar_puzzle_tile.dart
- [ ] round corners
- [ ] new images for success
- [ ] use puzzleSize
- [ ] overlay numbers in tile code?


