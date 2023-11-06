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

module WBPControllerClamp () {

  //Inside
  difference() {
    union() {

      for(x=[-75,39]) {
        translate([x,-22,-34]) cube([36,8,20]);
     }
      for(x=[-75,-47,39,67]) {
        hull() {  
          translate([x,-22,-14]) cube([8,15,4]);
          translate([x,-22,-34]) cube([8,8,20]);
        }    
      }    
    }  
    union() {
      for (x=[57,-57]) {
//        transrot([x,-30,-24],[90,0,0]) hull()
//          screwClampShoe(type=M5_hex_screw,length=20);
        transrot([x,-10,-24],[90,0,0]) cylinder(h=20,r=screw_clearance_radius(M5_hex_screw)); 
        hull() {
          for (z=[-24,-44]) {
            transrot([x,-15.9,z],[90,30,0]) 
            cylinder(h=nut_trap_depth(M5_nut)+0.2,r=nut_radius(M5_nut)+0.2,$fn=6);
          }
        }
      }
    }
  }
  //Front
  difference() {
    union() {
      translate([-75,-22,-14]) cube([150,112,4]);
    }
    union() {
//       //Screw holes
//       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY-7-NEMA_hole_pitch(stepperT)/2,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
//       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY-7-NEMA_hole_pitch(stepperT)/2,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);
//
//       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
//       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);
//
//       translate([-stepperOffsX+7+NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
//       translate([-stepperOffsX+7+NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);
// 
//       //Fittings
//       translate([-stepperOffsX-9-NEMA_hole_pitch(stepperT)/2,stepperOffsY-1-NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 
//       translate([-stepperOffsX-9-NEMA_hole_pitch(stepperT)/2,stepperOffsY+1+NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 
//       translate([-stepperOffsX-1-NEMA_hole_pitch(stepperT)/2,stepperOffsY+9+NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 
//       translate([-stepperOffsX+1+NEMA_hole_pitch(stepperT)/2,stepperOffsY+9+NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 

        
    }
  }
        
  //Outside
  translate([-75,85,-24]) cube([150,2,10]);
  for (x=[-75:9.125:75]) { 
    hull() {
      translate([x,85,-14]) cube([4,5,4]);
      translate([x,85,-24]) cube([4,2,10]);
    }
  }     
}

module WBPControllerClamp_stl() {
  stl("WBPControllerClamp");
  color(pp1_colour)
  WBPControllerClamp();
}

//! TBD
module WBPControllerClamp_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WBPControllerClamp") {
    //Printed part
    transrot([0,0,0],[0,0,0]) WBPControllerClamp_stl();
      
    //Clamp screws
    for (x=[57,-57]) {
      transrot([x,-22,-24],[90,0,0])WBPClampScrew_assembly();
      #explode([0,0,-20]) transrot([x,-16,-24],[90,30,0]) nut(M5_nut);  
    }
  }
}


module WBPControllerDisplayMount_stl() {
  stl("WBPControllerDisplayMount")

//  translate([2.62-150/2,-55/2,0]) 
  difference() {    
    union() {
      
    }  
    union() { 
      for (y=[2.62,52.38]) {
        #transrot([0,y,-2],[180,0,30]) cylinder(h=20,r=nut_radius(M3_nut),$fn=6);   
        #transrot([0,y,10],[180,0,0]) cylinder(h=20,r=screw_radius(M3_dome_screw));   
      }
      #transrot([0,0,0],[0,0,0]) cube([10,10,10]);   
  }
      



 
      
      
//            150,              //Length
//            55,               //Width
//        
//             [2.62,2.62], 
//             [2.62,52.38],
//             [147.38,2.62],
//             [147.38,52.38]


}
 
}
WBPControllerDisplayMount_stl();

module WBPControllerDisplay_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WBPController") {

      pcb(RRDSC);



  }
  } 


//! TBD
module WBPController_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WBPController") {
    //Clamp
//    WBPControllerClamp_assembly();
  
    //RapRapDiscount Smart Controller
    translate([0,-26,-14])
    rotate([45,0,0]) 
    translate([0,27.5,0]) {
      pcb(RRDSC);
      pcb_screw_positions(RRDSC) {
         
         translate([0,0,pcb_thickness(RRDSC)]) screw_and_washer(M3_dome_screw,20);
          
      } 
    }
        
  }
}
  
if($preview) {
//   $explode = 1;
   *WBPController_assembly();
    WBPControllerDisplay_assembly();
    
   *transrot([0,0,0],[0,0,0]) pcb(MEGA2560); 
     *transrot([0,60,0],[0,0,0]) pcb(GT2560);
     *transrot([0,-10,10],[45,0,0]) pcb(RRDSC);
}
