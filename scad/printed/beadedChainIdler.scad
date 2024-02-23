//###############################################################################
//# WindowPainter - Beaded Chain Idler                                          #
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
//#   Configurable beaded chain idler                                           #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 22, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <../lib/NopSCADlib/lib.scad>

module beadedChainIdler(bcBeadD = 3.2, //Bead diameter (+tolerance)
                        bcBeadS = 4,   //Bead spacing (distance between center of beads)
                        bcCordD = 1,   //Cord diameter
                        boreD   = 14,  //Bore diameter
                        guideD  = 20,  //Chain guide diameter
                        outerD  = 24,  //Outter diameter
                        guideW  = 6,   //Width of the chain guide 
                        outerW  = 8)   //Outer width
{			 
  //Calculated Variables]
  outerD = outerD < guideD ? guideD : outerD;                   //Adjust outer diameter if it is too small
  guideW = guideW < bcBeadD ? bcBeadD : guideW;                 //Adjust guide width if it is too small
  guideD = guideD < boreD+bcBeadD/2 ? boreD+bcBeadD/2 : guideD; //Adjust guide diameter if it is too small
  rimW   = (outerW-guideW)/4;                                   //Width of the rim

  rotate_extrude($fn = 64)
  union() {
    difference() {
      translate([boreD/2,-outerW/2,0]) square([(guideD-boreD)/2,outerW]);
      translate([guideD/2,0,0]) circle(d=bcBeadD);
    }  
    hull() {
      translate([(outerD-rimW)/2,(outerW-rimW)/2,0]) circle(d=rimW);
      translate([boreD/2,bcBeadD/2,0]) square([(guideD-boreD)/2,(outerW-bcBeadD)/2]);
    }    
    hull() {
      translate([(outerD-rimW)/2,-(outerW-rimW)/2,0]) circle(d=rimW);
      translate([boreD/2,-(bcBeadD+outerW-bcBeadD)/2,0]) square([(guideD-boreD)/2,(outerW-bcBeadD)/2]);
    }
  }
 
}

if ($preview) {
  beadedChainIdler();
}