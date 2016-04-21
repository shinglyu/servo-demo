#!/bin/bash

# TODO: depolyment script
echo 'Servo Demos'
echo '----------------------------'
echo '==WebRender=='
echo '  1) WebRender framerate on real website'
echo '  2) WebRender framerate on spheres'
echo '  3) WebRender on spheres v.s. Gecko'
echo '  4) WebRender on transparent rects v.s. Gecko'
echo ''
echo '==Parallel Painting=='
echo '  5) Parallel painting'
echo '  6) Single thread painting'
echo ''
echo '==Parallel Layout=='
echo '  7) Parallel layout'
echo '  8) Single thread layout'
echo ''
echo '==Browser.html=='
echo '  9) browser.html'
echo '----------------------------'
echo 'Please select (ENTER):'

SERVO_CMD="./servo/servo"
BASE_URL="http://localhost:8000"
DEMO_URL="$BASE_URL/index.html"
# DEMO_URL="https://en.wikipedia.org/wiki/Main_Page"

read OPT
case $OPT in
  1)
    $SERVO_CMD -w -Z wr-stats $DEMO_URL
    ;;
  2)
    $SERVO_CMD -w -Z wr-stats $BASE_URL/spheres.html
    ;;
  3)
    firefox $BASE_URL/spheres.html &
    $SERVO_CMD -w $BASE_URL/spheres.html
    ;;
  4)
    firefox $BASE_URL/transparent_rects.html &
    $SERVO_CMD -w $BASE_URL/transparent_rects.html 
    ;;
  5)
    $SERVO_CMD -Z show-parallel-paint $DEMO_URL
    ;;
  6)
    $SERVO_CMD -t 1 -Z show-parallel-paint $DEMO_URL
    ;;
  7)
    $SERVO_CMD -Z show-parallel-layout $DEMO_URL
    ;;
  8)
    $SERVO_CMD -y 1 -Z show-parallel-layout $DEMO_URL
    ;;
  9)
    print "cd to your servo repository, and run"
    print "./mach -r -b $DEMO_URL"
    ;;
  *)
    print "Not a valid option"
    ;;
esac

