//###############################################################################
//# WindowPainter - Beaded Chain Mount                                          #
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
//#   Configurable beaded chain mount                                           #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   February 3, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <../lib/NopSCADlib/lib.scad>

//Bead cut out
module bcCutout(bcBeadD    = 3.2,   //Bead diameter (+tolerance)
                bcOpeningD = 2.6,   //Hole opening
                bcOpeningH = 20)    //Hole height
{
  bcOpeningD  = min(bcBeadD, bcOpeningD);
  openingOffs = sqrt(bcBeadD^2 - bcOpeningD^2);  
    
  union() {  
    translate([0,0,0])             sphere(d=bcBeadD);
    translate([0,0,openingOffs])   sphere(d=bcBeadD);
    translate([0,0,0])             cylinder(h=bcBeadD/2,d=bcOpeningD);
    translate([0,0,openingOffs])   cylinder(h=max(bcBeadD/2,bcOpeningH-openingOffs),d=bcBeadD);
  }
}
*bcCutout();

module bcCutoutLine(bcBeadD    = 3.2,   //Bead diameter (+tolerance)
                    bcBeadS    = 4,     //Bead spacing (distance between center of beads)
                    bcCordD    = 1,     //Cord diameter
                    bcOpeningD = 2.8,   //Hole opening
                    bcOpeningH = 20,    //Hole height
                    bcC        = 4,     //Bead count
                    tiltFirst  = false) //Tilt first cutout
{
  union() {  
    for (i=[0:bcBeadS:(bcC-1)*bcBeadS]) {
      //Beads
      translate([-i,0,0]) rotate([0,(i==0)&&tiltFirst?-45:0,0]) 
      bcCutout(bcBeadD    = bcBeadD,      //Bead diameter (+tolerance)
               bcOpeningD = bcOpeningD,   //Hole opening
               bcOpeningH = bcOpeningH);  //Hole height
    }
    //Chain
    translate([bcBeadS,0,0]) rotate([0,270,0]) cylinder(h=(bcC+0.5)*bcBeadS,d=bcCordD);    
    translate([-(bcC-0.5)*bcBeadS,-bcCordD/2,0]) cube([(bcC+0.5)*bcBeadS,bcCordD,bcOpeningH]);    
  }
}
*bcCutoutLine();

module bcCutoutEscape(bcBeadD    = 3.2,  //Bead diameter (+tolerance)
                      bcOpeningH = 20,   //Hole height
                      bcEscapeR  = 5,    //Escape radius
                      bcLeft     = true) //Escape to the left
{
  translate([0,bcLeft?-bcEscapeR:bcEscapeR,0])
  rotate([0,0,bcLeft?90:180])
  rotate_extrude(angle=90) {
    union() {
      translate([bcEscapeR,,00]) circle(d=bcBeadD);
      translate([bcEscapeR-bcBeadD/2,0,0]) square([bcBeadD,bcOpeningH]);
    }
  }
}
*bcCutoutEscape();

if ($preview) {

 bcCutoutLine();
    
}