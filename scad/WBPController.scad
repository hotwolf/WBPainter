//###############################################################################
//# WBPainter - Controller Mount Assembly                                       #
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
//#   Stepper motor clamp assembly of the WBPainter.                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WBPConfig.scad>

//Set view
//$vpt = [25,30,20];
//$vpr = [80,0,340];

//Arduino MEGA 2560 * RAMPS 1.4
MEGA2560 = ["MEGA2560", "Arduino MEGA 2560 + RAMPS 1.4", 
            inch(4.0),        //Length
            inch(2.1),        //Width
            1.6,              //PCB thickness
            0,                //Corner radius
            3.3,              //Mounting hole diameter
            0,                //Pad araound mounting holes
            "Gray",           //PCB color
            false,            //Component BOM
            inch([            //Mounting holes 
             [0.55,0.10], 
             [0.60,2.00],
             [2.60,0.30],
             [2.60,1.40],
             [3.50,2.00],
             [3.80,0.10]
            ]),
            [[inch(2.0), inch(1.55), 0, "text", 90, 12, "Arduno MEGA 2560", "Liberation Mono:style=Bold"],
             [inch(2.0), inch(1.05), 0, "text",  8,  8, "+", "Liberation Mono:style=Bold"],
             [inch(2.0), inch(0.55), 0, "text", 50, 12, "RAMPS 1.4", "Liberation Mono:style=Bold"]],
            [],[],
            inch([
             [-2.00, -1.05],
             [-2.00,  1.05],
             [ 1.80,  1.05],
             [ 1.90,  0.95],
             [ 1.90,  0.54],
             [ 2.00,  0.44],
             [ 2.00, -0.85],
             [ 1.90, -0.95],
             [ 1.90, -1.05]
            ]),
            M2p5_pan_screw
           ];

//Geeetech GT2560
GT2560   = ["GT2560", "Geeetech GT2560", 
            109,              //Length
            78,               //Width
            1.6,              //PCB thickness
            0,                //Corner radius
            4,                //Mounting hole diameter
            0,                //Pad araound mounting holes
            "Gray",           //PCB color
            false,            //Component BOM
            [                 //Mounting holes 
             [3.5,3], 
             [3.5,75],
             [95.5,3],
             [95.5,75]
            ],
            [[54.5, 39, 0, "text", 50, 12, "GT2560", "Liberation Mono:style=Bold"]],
            [],[],[],
            M2p5_pan_screw
           ];

//RapRapDiscount Smart Controller
RRDSC    = ["RRDSC", "RapRapDiscount Smart Controller", 
            150,              //Length
            55,               //Width
            1.6,              //PCB thickness
            0,                //Corner radius
            3,                //Mounting hole diameter
            0,                //Pad araound mounting holes
            "Gray",           //PCB color
            false,            //Component BOM
            [                 //Mounting holes 
             [2.62,2.62], 
             [2.62,52.38],
             [147.38,2.62],
             [147.38,52.38]
            ],
            [[75, 27.5, 0, "text", 140, 18, "RapRapDiscount Smart Controller", "Liberation Mono:style=Bold"]],
            [],[],[],
            M2p5_pan_screw
           ];

//Magnet positions
module WBPController_magnetPositions_GT2560(z=0) {
  for(i = [[-58, 69-45, z],
           [ 58, 69-45, z],
           [-60,-46, z],
           [ 60,-46, z]])
    translate(i) children();
}

module WBPController_magnetPositions_MEGA2560(z=0) {
  for(i = [[-52, 69-45, z],
           [ 52, 69-45, z],
           [-60,-46, z],
           [ 60,-46, z]])
    translate(i) children();
}

//Controller mount
module WBPControllerMount_GT2560_stl() {

   difference() {
      union() {         
         translate([0, 40,0]) pcb_screw_positions(GT2560)   cylinder(h=10, d=7);
         translate([0,-28,0]) pcb_screw_positions(RRDSC)    cylinder(h=10, d=7);
         hull() { 
            translate([-52, 76,0]) cylinder(h=6, d=10);
            translate([ 52, 76,0]) cylinder(h=6, d=10);
            WBPController_magnetPositions_GT2560(0) cylinder(h=6, d=24);
            translate([0, 40,0]) pcb_screw_positions(GT2560)   cylinder(h=6, d=10);
            translate([0,-28,0]) pcb_screw_positions(RRDSC)    cylinder(h=6, d=10);
         }
      }
      union() {
         WBPController_magnetPositions_GT2560(0+0.2) magnetCavity();
         translate([0, 40,-12]) pcb_screw_positions(GT2560)   nut_trap(M3_dome_screw, M3_nut, 5);
         translate([0,-28,-12]) pcb_screw_positions(RRDSC)    nut_trap(M3_dome_screw, M3_nut, 5);
      }
  }  
}

module WBPControllerMount_MEGA2560_stl() {

   difference() {
      union() {         
         translate([0, 28,0]) pcb_screw_positions(MEGA2560) cylinder(h=10, d=7);
         translate([0,-28,0]) pcb_screw_positions(RRDSC)    cylinder(h=10, d=7);
         hull() { 
            translate([-48, 52,0]) cylinder(h=6, d=10);
            translate([ 48, 52,0]) cylinder(h=6, d=10);
            WBPController_magnetPositions_MEGA2560(0) cylinder(h=6, d=24);
            translate([0, 28,0]) pcb_screw_positions(MEGA2560) cylinder(h=6, d=10);
            translate([0,-28,0]) pcb_screw_positions(RRDSC)    cylinder(h=6, d=10);
         }
      }
      union() {
         WBPController_magnetPositions_MEGA2560(0+0.2) magnetCavity();
         translate([0, 28,-12]) pcb_screw_positions(MEGA2560) nut_trap(M3_dome_screw, M3_nut, 5);
         translate([0,-28,-12]) pcb_screw_positions(RRDSC)    nut_trap(M3_dome_screw, M3_nut, 5);
      }
  }  
}


//! Insert magnets during print
module WBPControllerMount_GT2560_assembly() {

   //Controller mount
   WBPControllerMount_GT2560_stl();

   //Magnets 
   WBPController_magnetPositions_GT2560(0+0.2){magnet();};
}

module WBPControllerMount_MEGA2560_assembly() {

   //Controller mount
   WBPControllerMount_MEGA2560_stl();

   //Magnets 
   WBPController_magnetPositions_MEGA2560(0+0.2){magnet();};
}

//! TBD
module WBPController_GT2560_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WBPController") {

   //Controller mount
   WBPControllerMount_GT2560_assembly();

   //Geeetech GT2560
   transrot([0,40,-2],[0,0,0]) {
      explode(3) translate([0,0,12]) pcb(GT2560);
      pcb_screw_positions(GT2560)         
        translate([0,0,pcb_thickness(GT2560)+12]) screw_and_washer(M3_dome_screw,10);
      explode(-10) translate([0,0,4]) nut(M3_nut);         
       
    }
 
    //RapRapDiscount Smart Controller
    translate([0,-28,-2]) {
      explode(3) translate([0,0,12]) pcb(RRDSC);
      pcb_screw_positions(RRDSC) {      
        translate([0,0,pcb_thickness(RRDSC)+12]) screw_and_washer(M3_dome_screw,10);
        explode(-10) translate([0,0,4]) nut(M3_nut);
      }   
    }
  }
}
 
//! TBD
module WBPController_MEGA2560_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WBPController") {

   //Controller mount
   WBPControllerMount_MEGA2560_assembly();

    //Arduino MEGA 2560 * RAMPS 1.4
    transrot([0,28,-2],[0,0,0]) {
      explode(3) translate([0,0,12]) pcb(MEGA2560);
        pcb_screw_positions(MEGA2560) {        
      translate([0,0,pcb_thickness(MEGA2560)+12]) screw_and_washer(M3_dome_screw,10);
      explode(-10) translate([0,0,4]) nut(M3_nut);  
      } 
    }
 
    //RapRapDiscount Smart Controller
    translate([0,-28,-2]) {
      explode(3) translate([0,0,12]) pcb(RRDSC);
      pcb_screw_positions(RRDSC) {        
        translate([0,0,pcb_thickness(RRDSC)+12]) screw_and_washer(M3_dome_screw,10);
        explode(-10) translate([0,0,4]) nut(M3_nut);         
      } 
    }       
  }
}
  
if($preview) {
//  $explode = 1;
    translate([(canvasW/2)-100,0,0])
      WBPController_GT2560_assembly();
    translate([(canvasW/2)+100,0,0])
      WBPController_MEGA2560_assembly();
    
    whiteboard(canvasHeight=canvasH,
              canvasWidth=canvasW,
              drawingXF=drawingXF,
              drawingYF=drawingYF); 
       
}
