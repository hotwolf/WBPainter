//###############################################################################
//# WBPainter - Main Assembly                                                   #
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
//#   Main assembly of the WBPainter.                                           #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
//! ![WBPainter](img/wbp.gif?raw=true)
//! 
//! WindoWBPainter is a project to recycle old 3D printers.
//! It's a vertical plotter, to be mounted on a whiteboard.
//! 
//! This project is still work in progress. Here is my todo list:
//! 
//! | Status | Task  |
//! |:---|:---|
//! | &#9989; | Setup the project |
//! | &#9989; | Start the design |
//! | &#9989; | Run the NopSCADlib flow |
//! | &#10060; | Complete an initial version of the design |
//! | &#10060; | Add assembly descriptions |
//! | &#10060; | Simplify the BOM |
//! | &#10060; | Finalize the build instructions |
//! | &#10060; | Build a prototype |
//! | &#10060; | Refine the design |
//! | &#10060; | Setup a project web site |
//! | &#9989; | Render an animated title picture |
//! | &#10060; | Configure/customize the Marlin firmware |
//! | &#10060; | Plot the first image |

include <./WBPConfig.scad>

//Set view
//$vpt = [500,-400,-1.5];
//$vpr = [10,30,0];
//$vpd = 3500;

//! A vertical plotter  . 
// ![inside](doc/DIYLB.gif?raw=true)

//! Finished!
module main_assembly() {
  //pose([30, 0, 0], [150,150,0])
    assembly("main") {

      //Left stepper
      WBPStepperLeft_assembly();

      //Right stepper
      translate([canvasW,0,0])
        WBPStepperRight_assembly();

      //Gondola
      translate([gondolaX,gondolaY,bcZ]) WBPGondola_assembly();

      //Left weight
      transrot([-weightOffsX,weightLeftY,bcZ-10],[0,90,0])
        WBPWeight_assembly();
        
      //Right weight
      transrot([canvasW+weightOffsX,weightRightY,bcZ-10],[0,90,0]) 
        WBPWeight_assembly();

      //Controller
      translate([(canvasW/2)-100,0,0])
        WBPController_GT2560_assembly();
      translate([(canvasW/2)+100,0,0])
        WBPController_MEGA2560_assembly();

      //Beaded chains
      WBPBeadedChainLeft();
      WBPBeadedChainRight();

      //Whiteboard
      whiteboard(xOffset=0,
                 yOffset=0,
                 zOffset=0,
                 canvasHeight=canvasH,
                 canvasWidth=canvasW,
                 drawingXF=drawingXF,
                 drawingYF=drawingYF);

    }
}

if($preview) {
    
  main_assembly();
}
