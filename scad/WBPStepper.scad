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
//#   Stepper motor clamp assembly of the WindoWBPainter.                       #
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

//Beaded chain parts
//==================
//Left start bead
module WBPStepperLeftStartBead() {
  bead(x=-64/PI,
       y=0,
       z=bcZ);                    
}
*WBPStepperLeftStartBead();

//Left end bead
module WBPStepperLeftEndBead(offsA=stepperLeftA) { 
  transrot([0,0,0],[0,0,offsA-270])
  bead(x=0,
       y=-37,
       z=bcZ);                    
}
*WBPStepperLeftEndBead();

//Left chain segment
module WBPStepperLeftChain(offsA=stepperLeftA) {
  //Geometry
  r1 = 64/PI; //~20.73
  r2 = 10;
  d  = 37;                                 
  t  = sqrt((d^2+r2^2)-((r1+r2)^2));
  a  = acos(t/d);

  color(bcBeadC)
  transrot([0,0,bcZ],[0,0,offsA]) {
    beadArc(r=r1,a1=90-offsA,a2=-90+a);
    beadArc(x=37,y=10,r=r2,a1=90+a,a2=180);
    hull() {
      transrot([37,10,0],[0,0,90+a]) bead(y=10);
      transrot([0,0,0],[0,0,-90+a])  bead(y=r1);
    }
  }
}
*WBPStepperLeftChain();

//Right start bead
module WBPStepperRightStartBead() {
  bead(x=canvasW+64/PI,
       y=0,
       z=bcZ);                    
}
*WBPStepperRightStartBead();

//Right end bead
module WBPStepperRightEndBead(offsA=stepperRightA) {
  transrot([canvasW,0,0],[0,0,-offsA])
  bead(x=0,
       y=-37,
       z=bcZ);                    
}
*WBPStepperRightEndBead();

//Right chain segment
module WBPStepperRightChain(offsA=stepperRightA) {
  //Geometry
  r1 = 64/PI; //~20.73
  r2 = 10;
  d  = 37;                                 
  t  = sqrt((d^2+r2^2)-((r1+r2)^2));
  a  = acos(t/d);

  color(bcBeadC)
  transrot([canvasW,0,bcZ],[0,0,-offsA]) {
    beadArc(r=r1,a1=-90+offsA,a2=180-a);
    beadArc(x=-10,y=-37,r=r2,a1=-a,a2=-90);
    hull() {
      transrot([-10,-37,0],[0,0,-a]) bead(y=10);
      transrot([0,0,0],[0,0,180-a])  bead(y=r1);
    }
  }
}
*WBPStepperRightChain();

//! TBD
module WBPStepperRight_assembly() {
  pose([25,30,20], [80,0,240])
  assembly("WBPStepperClampRight") {
  
    //Stepper + mount
    WBPStepperMountRight_assembly();
        
    //Aligner
    transrot([0,0,bcZ],[0,0,270-stepperRightA])          
      WBPAlignerRight_assembly(); 
   
    //Pulley
    transrot([0,0,bcZ],[0,0,pulleyRightA])
      WBPPulley_assembly();
      
      
//      explode([0,0,20]) 
//      transrot([0,0,0],[180,0,270]) WBPStepperShaftRight_assembly();
//      transrot([0,0,0],[180,0,180]) WBPStepperMountScrews();
//     
//      //EndStop  
//      translate([0,0,0]) WBPStepperEndstopRight_assembly();
//      translate([0,0,0]) WBPStepperEndstopScrewsRight();
      
  }
}

//! TBD
module WBPStepperLeft_assembly() {
  pose([25,30,20], [80,0,180])
  assembly("WBPStepperClampLeft") {
      
    //Stepper + mount
    WBPStepperMountLeft_assembly();

    //Aligner
    transrot([0,0,bcZ],[0,0,0+stepperLeftA])
      WBPAlignerLeft_assembly();
      
    //Pulley
    transrot([0,0,bcZ],[0,0,pulleyLeftA])
      WBPPulley_assembly();


//      explode([0,0,20]) 
//      transrot([0,0,0],[180,0,270]) WBPStepperShaftLeft_assembly();
//      transrot([0,0,0],[180,0,270]) WBPStepperMountScrews();
//      
//      //EndStop  
//      translate([0,0,0]) WBPStepperEndstopLeft_assembly();
//      translate([0,0,0]) WBPStepperEndstopScrewsLeft();
    
  }
}

if($preview) {
   $explode = 0;
   translate([canvasW,0,0]) 
     WBPStepperRight_assembly();
   WBPStepperLeft_assembly();
   
   *whiteboard(canvasHeight=canvasH,
              canvasWidth=canvasW,
              drawingXF=drawingXF,
              drawingYF=drawingYF); 
 
}
