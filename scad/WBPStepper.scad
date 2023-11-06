//###############################################################################
//# WBPainter - Stepper Motor Assembly                                          #
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
//#   Stepper motor clamp assembly of the WindoWBPainter.                        #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WBPConfig.scad>

use <./WBPStepperMount.scad>
use <./WBPStepperShaft.scad>
use <./WBPStepperEndstop.scad>

//Set view
//$vpt = [25,30,20];
//$vpr = [80,0,340];


//! TBD
module WBPStepperRight_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WBPStepperClampRight") {
    translate([canvasW,0,0]) {
   
      //Stepper
      explode([0,0,20]) transrot([stepperOffsX,stepperOffsY,0],[180,0,270]) WBPStepperShaftRight_assembly();
      transrot([stepperOffsX,stepperOffsY,0],[180,0,180]) WBPStepperMountScrews();
     
      //EndStop  
      translate([weightOffsX,-weightOffsY,0]) WBPStepperEndstopRight_assembly();
      translate([weightOffsX,-weightOffsY,0]) WBPStepperEndstopScrewsRight();
    }   
  }
}

//! TBD
module WBPStepperLeft_assembly() {
  pose([25,30,20], [80,0,180])
  assembly("WBPStepperClampLeft") {
    translate([0,0,0]) {
      
      //Stepper
      explode([0,0,20]) transrot([-stepperOffsX,stepperOffsY,0],[180,0,270]) WBPStepperShaftLeft_assembly();
      transrot([-stepperOffsX,stepperOffsY,0],[180,0,270]) WBPStepperMountScrews();
      
      //EndStop  
      translate([-weightOffsX,-weightOffsY,0]) WBPStepperEndstopLeft_assembly();
      translate([-weightOffsX,-weightOffsY,0]) WBPStepperEndstopScrewsLeft();
   }   
  }
}

if($preview) {
   $explode = 0;
   WBPStepperRight_assembly();
   *WBPStepperLeft_assembly();
   
   *translate([0,0,-44]) windowFrame(glassHeight=canvasH,
                                    glassWidth=canvasW); 
}
