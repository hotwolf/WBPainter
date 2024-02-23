#!/bin/sh

#Set library path
export OPENSCADPATH=`pwd`/../lib:.:$OPENSCADPATH
#echo $OPENSCADPATH

#Run NopSCADlib scripts
cd $(dirname $0)/..
python3 ./lib/NopSCADlib/scripts/make_all.py
