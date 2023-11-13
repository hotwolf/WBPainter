//###############################################################################
//# WBPainter - Gondola Assembly                                                #
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
//#   The pen clamp                                                             #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WBPConfig.scad>

//Set view
//$vpt = [1,0,5];
//$vpr = [0,250,320];

//! TBD
module WBPGondola_assembly() {
  pose([1,0,5], [0,250,320])
  assembly("WBPGondola") {


   translate([0,0,0])  WBPGondolaBearings_assembly();

   translate([0,-42,0]) WBPGondolaLifter_assembly();
      
   translate([0,0,-bcZ]) pen(r=undef,d=18);

       
  }  
}


if($preview) {
//   $explode = 1;
    
  WBPGondola_assembly();
    
//  translate([-canvasW/2,canvasH/2,-44]) windowFrame(glassHeight=canvasH,
//                                              glassWidth=canvasW); 
 }
