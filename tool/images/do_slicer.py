#!/usr/bin/env python3

# - assume python3 installed 
# - (one time) python3 -m venv isplit
# - source ipslit/bin/activate

# BACKGROUND
# have 
# ...assets/images/dashtar/ ls
#   /(blue | green | yellow)/
#     1.png 
#     ...
#     15.png 
#   /gallery/
#     (blue | green | yellow).png 
#   /gallery/
#     (blue | green | yellow).png 


# from image_slicer import slice
# slice('blue.png', 4)

# produces:
# blue_01_01.png
# blue_01_02.png
# blue_02_01.png
# blue_02_02.png

# THIS SCRIPT
# from imp import source_from_cache
# from xml.etree.ElementPath import get_parent_map


# - copy script to diretory (like ...assets/images/dashtar/gallery)
# - using gallery images since dont have source 
# - split blue|green|yellow for 3x3 (ie. ./do_slicer.py blue.png 9)
# - create directory ...assets/images/dashtar/blue3
# - mv sliced files to that directory (mv blue_*0.png ../blue3)
# - repeat for yellow and green 
# - repeat for blue5, green5, and yellow5 


import sys
from image_slicer import slice

def usage():
    print("python3 do_slicer.py <file name> <number slices>")
    print("   ex. python3 do_slicer.py green.png 4")

if len(sys.argv) < 3:
    usage()
    exit(1)

name = sys.argv[1]
count = int(sys.argv[2])

print(name)
print(count)

input("continue (crtl-c to exit)...")

slice(name, count)

# TODO 
# - script 
# - input 
# - directory structure 
# - add to app.dart 
