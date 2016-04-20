#!/bin/bash

# TODO: depolyment script
echo 'Servo Demos'
echo '----------------------------'
echo '1) WebRender framerate on real website'
echo '2) WebRender framerate on spheres'
echo '3) WebRender on spheres v.s. Gecko'
echo '4) WebRender on transparent rects v.s. Gecko'
echo '5) Parallel painting'
echo '6) Single thread painting'
echo '7) Parallel layout'
echo '8) Single thread layout'
echo '9) browser.html'
echo '----------------------------'
echo 'Please select (ENTER):'

# DEMO_URL="https://en.wikipedia.org/wiki/Main_Page"
BASE_URL="http://localhost:8000"
DEMO_URL="$BASE_URL/index.html"

read OPT
case $OPT in
  1)
    ./mach run -w -r -Z wr-stats $DEMO_URL
    ;;
  2)
    ./mach run -w -r -Z wr-stats $BASE_URL/spheres.html
    ;;
  3)
    firefox $BASE_URL/spheres.html&
    ./mach run -w -r $BASE_URL/spheres.html
    ;;
  4)
    firefox $BASE_URL/transparent_rects.html &
    ./mach run -w -r $BASE_URL/transparent_rects.html 
    ;;
  5)
    ./mach run -r -Z show-parallel-paint $DEMO_URL
    ;;
  6)
    ./mach run -r -t 1 -Z show-parallel-paint $DEMO_URL
    ;;
  7)
    ./mach run -r -Z show-parallel-layout $DEMO_URL
    ;;
  8)
    ./mach run -r -y 1 -Z show-parallel-layout $DEMO_URL
    ;;
  9)
    ./mach run -r -b $DEMO_URL
    ;;
  *)
    print "Not a valid option"
    ;;
esac

