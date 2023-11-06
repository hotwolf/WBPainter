//###############################################################################
//# WBPainter - Beaded Chain Pulley                                             #
//###############################################################################
//#    Copyright 2023 Dirk Heisswolf                                            #
//#    This file is part of the WBPainter project.                              #
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
//#   Fixture to align the beaded chain to the center of the stepper shaft      #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <WBPConfig.scad>

use <../printed/beadedChainPulley.scad>

//Set view
$vpt = [8,10,20];
$vpr = [72,0,75];

//Pulley for beaded chain
module WBPPulley_stl() {
  stl("WBPPulley");

  color(pp2_colour)
  difference() {
    union() {
      beadedChainPulley(bcBeadD = bcBeadD, //Bead diameter (+tolerance)
                        bcBeadS = bcBeadS, //Bead spacing (distance between center of beads)
                        bcCordD = bcCordD, //Cord diameter
                        boreD   = 2,       //Bore diameter
                        guideN  = 32,      //Number of beads on the chain guide
                        outerD  = 45,      //Outter diameter
                        guideW  = 6,       //Width of the chain guide 
                        outerW  = 8);      //Outer width

      translate([0,0,4]) cylinder(h=6,d=16);
    }
    union() {
      transrot([0,0,7],[90,0,0]) cylinder(h=10,r=screw_clearance_radius(M3_pan_screw));
      transrot([-0.1-nut_square_width(M3nS_thin_nut)/2,-4.1-nut_square_thickness(M3nS_thin_nut),6.9-nut_square_width(M3nS_thin_nut)/2],[0,0,0]) 
        cube([nut_square_width(M3nS_thin_nut)+0.2,nut_square_thickness(M3nS_thin_nut)+0.2,10]);
      difference() {
        translate([0,0,3]) cylinder(d=5,h=20,center=true);
        translate([0,-3,3]) cube([8,2,20],center=true);
      }
    }
  } 
}

//! TBD
module WBPPulley_assembly() {
  pose([8, 10, 20], [72,0,75])
  assembly("WBPPulley") {

    WBPPulley_stl();
    transrot([0,-4,7],[90,0,0])  explode([0,15,0]) nut_square(M3nS_thin_nut);
    transrot([0,-10,7],[90,0,0]) explode([0,0,15])screw(M3_pan_screw,8);
    
  }
}

if($preview) {   
   $explode = 1;
   WBPPulley_assembly();
}
