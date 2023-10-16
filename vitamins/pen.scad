//###############################################################################
//# WindowPainter - Pen                                                         #
//###############################################################################
//#    Copyright 2023 Dirk Heisswolf                                            #
//#    This file is part of the WindowPainter project.                          #
//#                                                                             #
//#    This project is free software: you can redistribute it and/or modify     #
//#    it under the terms of the GNU General Public License as published by     #
//#    the Free Software Foundation, either version 3 of the License, or        #
//#    (at your option) any later version.                                      #
//#                                                                             #
//#    This project is distributed in the hope that it will be useful,          #
//#    but WITHOUT ANY WARRANTY; without even the implied warranty of           #
//#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            #
//#    GNU General Public License for more details.                             #
//#                                                                             #
//#    You should have received a copy of the GNU General Public License        #
//#    along with this project.  If not, see <http://www.gnu.org/licenses/>.    #
//#                                                                             #
//#    This project makes use of the NopSCADlib library                         #
//#    (see https://github.com/nophead/NopSCADlib).                             #
//#                                                                             #
//###############################################################################
//# Description:                                                                #
//#   Model of a pen                                                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 25, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <NopSCADlib/lib.scad>

module pen(r=undef,d=12) {
  vitamin("pen(): Window pen");
  r = r==undef ? d/2 : r;
    
  //Tip
  color("SeaGreen") rotate_extrude()
  intersection() {
    square([1.5,4]);
    hull() {
      translate([0,0.5,0]) circle(d=1.5);
      translate([0,4,0])   circle(d=3);
    }
  }
  //Tip holder
  color("MediumSeaGreen") rotate_extrude()
  union() {
    translate([0,4,0]) square([2.5,6]);
    hull() {
      translate([0,10,0]) square([2.5,6]);
      translate([0,19,0]) square([r-2,9]);
    }
  }
  //Body
  color("WhiteSmoke") rotate_extrude()
  translate([0,28,0]) square([r,100]);
}

if ($preview) {
  pen();
}
