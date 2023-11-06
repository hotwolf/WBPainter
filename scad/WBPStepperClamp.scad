//###############################################################################
//# WindowPainter - Stepper Motor Clamp Assembly                                #
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
//#   Stepper motor clamp assembly of the WindowPainter.                        #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 25, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WPConfig.scad>

use <./WPClampScrew.scad>
//use <./WPStepperShaft.scad>

//Set view
//$vpt = [25,30,20];
//$vpr = [80,0,340];

module WPStepperClamp () {

  //Inside
  difference() {
    union() {
      translate([14,-61,-34]) cube([8,47,20]);
      for(y=[-22,-37,-61]) {
        hull() {  
          translate([7,y,-14]) cube([15,8,4]);
          translate([14,y,-34]) cube([8,8,20]);
        }    
      }
      translate([14,-22,-34]) cube([47,8,20]);
      for(x=[14,29,53]) {
        hull() {  
          translate([x,-22,-14]) cube([8,15,4]);
          translate([x,-22,-34]) cube([8,8,20]);
        }    
      }    
    }  
    union() {
      transrot([45,-30,-24],[90,0,0]) hull()
        screwClampShoe(type=M5_hex_screw,length=20);
      transrot([45,-10,-24],[90,0,0]) cylinder(h=20,r=screw_clearance_radius(M5_hex_screw)); 
      hull() {
        for (z=[-24,-44]) {
          transrot([45,-15.9,z],[90,30,0]) 
            cylinder(h=nut_trap_depth(M5_nut)+0.2,r=nut_radius(M5_nut)+0.2,$fn=6);
        }
      }
      transrot([30,-45,-24],[0,90,0]) hull()
        screwClampShoe(type=M5_hex_screw,length=20); 
      transrot([10,-45,-24],[0,90,0]) cylinder(h=20,r=screw_clearance_radius(M5_hex_screw)); 
      hull() {
        for (z=[-24,-44]) {
          transrot([15.9,-45,z],[0,90,0]) 
            cylinder(h=nut_trap_depth(M5_nut)+0.2,r=nut_radius(M5_nut)+0.2,$fn=6);
        }
      }
    }
  }
  //Front
  difference() {
    union() {
      translate([-90,-61,-14]) cube([112,60,4]);
      translate([-79,-22,-14]) cube([140,112,4]);
    }
    union() {
       //Stepper mount screw holes
       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY-7-NEMA_hole_pitch(stepperT)/2,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY-7-NEMA_hole_pitch(stepperT)/2,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);

       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
       translate([-stepperOffsX-7-NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);

       translate([-stepperOffsX+7+NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
       translate([-stepperOffsX+7+NEMA_hole_pitch(stepperT)/2,stepperOffsY+7+NEMA_hole_pitch(stepperT)/2,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);
 
       //Stepper mount shaft hole 
       translate([-stepperOffsX,stepperOffsY,-16]) cylinder(h=10,d=48);

       //Stepper mount fittings
       translate([-stepperOffsX-9-NEMA_hole_pitch(stepperT)/2,stepperOffsY-1-NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 
       translate([-stepperOffsX-9-NEMA_hole_pitch(stepperT)/2,stepperOffsY+1+NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 
       translate([-stepperOffsX-1-NEMA_hole_pitch(stepperT)/2,stepperOffsY+9+NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 
       translate([-stepperOffsX+1+NEMA_hole_pitch(stepperT)/2,stepperOffsY+9+NEMA_hole_pitch(stepperT)/2,-16]) cylinder(h=8,d1=1.7,d2=3.7); 

       //End stop mount screw holes
       translate([-weightOffsX+0.1,-weightOffsY+15,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
       translate([-weightOffsX+0.1,-weightOffsY+15,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);

       translate([-weightOffsX+6.4,-weightOffsY+8,-20]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
       translate([-weightOffsX+6.4,-weightOffsY+8,-21]) cylinder(d=screw_boss_diameter(M3_dome_screw),h=10);

//      transrot([-4.7,15,-16],[0,0,0]) 
//     cylinder(h=12,r=screw_clearance_radius(M3_dome_screw)); 
// 
//     transrot([6.4,8,-9],[0,0,0]) 
//     cylinder(h=3,r=nut_trap_radius(M3_nut,horizontal=true)+0.2,$fn=6); 
       
        
    }
  }
        
  //Outside
  translate([-87,-61,-24]) cube([2,60,10]);
  for (y=[-5:-8:-64]) { 
    hull() {
      translate([-90,y,-14]) cube([5,4,4]);
      translate([-87,y,-24]) cube([2,4,10]);
    }
  }
  translate([-79,85,-24]) cube([140,2,10]);
  for (x=[-79:8:58]) { 
    hull() {
      translate([x,85,-14]) cube([4,5,4]);
      translate([x,85,-24]) cube([4,2,10]);
    }
  }     
}

module WPStepperClampLeft_stl() {
  stl("WPStepperClampLeft");
  color(pp1_colour)
  WPStepperClamp();
}

module WPStepperClampRight_stl() {
  stl("WPStepperClampRight");
  color(pp1_colour)
  mirror([1,0,0]) WPStepperClamp();
}

//! TBD
module WPStepperClampRight_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WPStepperClampRight") {
    //Printed part
    transrot([0,0,0],[0,0,0]) WPStepperClampRight_stl();
      
    //Clamp screws
    explode([0,0,-20]) transrot([-45,-16,-24],[90,30,0]) nut(M5_nut);  
    transrot([-45,-22-8,-24],[90,0,0]) {
      explode(45)  screw(M5_hex_screw, 20);
      explode(55)  WPClampScrewGrip_stl(); 
      explode(-10) WPClampScrewShoe_stl();
    }       
    transrot([-20,-45,-24],[0,90,0]) explode([20,0,0]) nut(M5_nut);  
    transrot([-22-8,-45,-24],[0,270,0]) {
      explode(20)   screw(M5_hex_screw, 20);
      explode(30)   WPClampScrewGrip_stl(); 
      explode(-10)  WPClampScrewShoe_stl();
    }
  }
}

//! TBD
module WPStepperClampLeft_assembly() {
  pose([25,30,20], [80,0,180])
  assembly("WPStepperClampLeft") {
    //Printed part
    transrot([0,0,0],[0,0,0])   WPStepperClampLeft_stl();
    
    //Clamp screws
    explode([0,0,-20]) transrot([45,-16,-24],[90,30,0]) nut(M5_nut);  
    transrot([45,-22-8,-24],[90,0,0]) {
      explode(45)  screw(M5_hex_screw, 20);
      explode(55)  WPClampScrewGrip_stl(); 
      explode(-10) WPClampScrewShoe_stl();
    }       
    transrot([16,-45,-24],[0,90,0]) explode([20,0,0]) nut(M5_nut);  
    transrot([22+8,-45,-24],[0,90,0]) {
      explode(20)  screw(M5_hex_screw, 20);
      explode(30)  WPClampScrewGrip_stl(); 
      explode(-10) WPClampScrewShoe_stl();
    }
  }
}

if($preview) {
//   $explode = 1;
   WPStepperClampRight_assembly();
   *WPStepperClampLeft_assembly();
}
