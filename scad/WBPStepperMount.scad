//###############################################################################
//# WBPainter - Stepper Motor Mount Assembly                                    #
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
//#   Stepper motor mount assembly of the WBPainter.                            #
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
//Left end bead
module WBPStepperMountLeftEndBead() {
  bead(x=-weightOffsX,
       y=-60,
       z=bcZ-20);                    
}
*WBPStepperMountLeftEndBead();

//Left end bead
module WBPStepperMountRightEndBead() {
  bead(x=canvasW+weightOffsX,
       y=-60,
       z=bcZ-20);                    
}
*WBPStepperMountRightEndBead();

//hull() {
//translate([10,10,40]) linear_extrude(0.1) circle(20);
//translate([-10,-10,60]) linear_extrude(0.1) circle(20);
//}


//SS-GL5 end switch with lever
module ss_gl5() {
    
  translate([4.8-14.5,-5.1-1.5,0]) {
    microswitch(medium_microswitch); 
    microswitch_hole_positions(medium_microswitch) {
      transrot([0,0,-3.2],[0,180,0]) screw_and_washer(M3_dome_screw, 12); 
      transrot([0,0, 5],[0,0,30]) nut(M3_nut);
    }
  }   
  color("silver") {
    transrot([-17,-1.5,-1.8],[0,0,18]) cube([17,0.5,3.6]);
    translate([-17,-3,-1.8]) cube([0.5,1.8,3.6]);
  }   
}
*ss_gl5();

module WBPStepperMount(inlay=true) {

  //Stepper mount
  difference() {
    union() {
      //Stepper mount  
      hull() {  
        translate([ NEMA_hole_pitch(stepperT)/2, NEMA_hole_pitch(stepperT)/2,-10]) cylinder(h=5.5,d=8);  
        translate([-NEMA_hole_pitch(stepperT)/2, NEMA_hole_pitch(stepperT)/2,-10]) cylinder(h=5.5,d=8);
      }  
      hull() {  
        translate([-NEMA_hole_pitch(stepperT)/2,-NEMA_hole_pitch(stepperT)/2,-10]) cylinder(h=5.5,d=8);  
        translate([-NEMA_hole_pitch(stepperT)/2, NEMA_hole_pitch(stepperT)/2,-10]) cylinder(h=5.5,d=8);
      }  
      translate([-NEMA_hole_pitch(stepperT)/2,0,-10]) 
        cube([NEMA_hole_pitch(stepperT)/2,NEMA_hole_pitch(stepperT)/2,5.5]);
      translate([0,0,-10]) cylinder(h=1.5,d=39);
      translate([0,0,-10]) cube([4+NEMA_hole_pitch(stepperT)/2,NEMA_hole_pitch(stepperT)/2,1.5]);
      translate([-NEMA_hole_pitch(stepperT)/2,-4-NEMA_hole_pitch(stepperT)/2,-10])
        cube([NEMA_hole_pitch(stepperT)/2,4+NEMA_hole_pitch(stepperT)/2,1.5]);
 
      //Bumper plate
      hull() {
        for(x=[-5,5]) {
          transrot([x-10-64/PI,-30,0],[0,0,180]) {
            rotate([90,0,0]) rotate_extrude() union() {
              translate([0,1,0])  square([12,3]);
              translate([0,0,0])  square([11,4]);
              translate([11,1,0]) circle(r=1);
            }
          }
        }  
      }
     //Bead holder
     #hull() {
       translate([-10,bcBeadS*3,0]) sphere(d=bcBeadD*2);
       transrot([-10,bcBeadS*3,0],[90,0,0]) cylinder(h=bcBeadS*3,d=bcBeadD*2);
       transrot([-7.4,9.1,-7],[0,0,90]) rotate_extrude(angle=90) square([2.3,2]);
       transrot([-9.7,4,-7],[0,0,0]) cube([2.3,5.1,2]);
     }
     *translate([-12,4,-10]) cube([4,15,12]);

      
      
      
      
      
    }
    union() {
      //Stepper mount   
      NEMA_screw_positions(stepperT, n=3) {
        translate([0,0,-12]) cylinder(h=10,r=screw_clearance_radius(M3_pan_screw));
        translate([0,0,-8]) cylinder(h=60,d=washer_diameter(M3_washer)+0.1);
      }
      translate([0,0,-12]) cylinder(h=10,r=NEMA_boss_radius(stepperT));
      translate([0,0,-12]) cylinder(h=10,d=23);
      hull() {
        translate([0,0,-4.5]) cylinder(h=20,d=46);
        translate([0,0, 3]) cylinder(h=12,d=52);
      }
      
      //Guide hole  
      transrot([-64/PI,-30.5,0],[270,0,0]) rotate_extrude() {
        difference() {
          width=6;    
          translate([0,0,0])   square([width/2+2.5,6]);
          translate([2.5+width/2,2.5,0]) circle(r=2.5);
        }
      }
      transrot([-64/PI,bcBeadS-30,0],[180,0,90])
        bcCutoutLine(bcBeadD     = bcBeadD,     //Bead diameter (+tolerance)
                      bcBeadS    = bcBeadS,     //Bead spacing (distance between center of beads)
                      bcCordD    = bcCordD,     //Cord diameter
                      bcOpeningD = bcBeadD,     //Hole opening
                      bcOpeningH = 20,          //Hole height
                      bcC        = 2);          //Bead count

      //Switch slot   
      transrot([-13.35-64/PI,-40,-19.7],[0,0,0]) cube([6.7,20,20]);

      //Chain mount slot
      #transrot([-40.35,-14,0],[0,180,270])
      bcCutoutLine(bcBeadD     = bcBeadD,      //Bead diameter (+tolerance)
                   bcBeadS    = bcBeadS,     //Bead spacing (distance between center of beads)
                   bcCordD    = bcCordD,     //Cord diameter
                   bcOpeningD = bcBeadD-0.4, //Hole opening
                   bcOpeningH = 20,          //Hole height
                   bcC        = 5);          //Bead count    
      #transrot([64/PI,bcBeadS-30,0],[0,0,0]) cube([7,20,10]);
      #transrot([-14.4,11.4,1.6],[0,0,0]) cube([10,6,10]);
     
    }
  }

  //Endstop
  mirror([0,0,1]) 
  translate([-10-64/PI,-30,0])
  difference() {
    union() {  
      //Bumper plate
      *hull() {
        for(x=[-5,5]) {
          transrot([x,0,0],[0,0,180])
          union() {
            rotate([90,0,0]) rotate_extrude() union() {
            translate([0,1,0])  square([12,3]);
            translate([0,0,0])  square([11,4]);
            translate([11,1,0]) circle(r=1);
          }
        }
       }
     }
     //Bead holder
     hull() {
       translate([-10,bcBeadS*3,0]) sphere(d=bcBeadD*2);
       transrot([-10,bcBeadS*3,0],[90,0,0]) cylinder(h=bcBeadS*3,d=bcBeadD*2);
       transrot([-7.4,9.1,-7],[0,0,90]) rotate_extrude(angle=90) square([2.3,2]);
       transrot([-9.7,4,-7],[0,0,0]) cube([2.3,5.1,2]);
     }
     *translate([-12,4,-10]) cube([4,15,12]);
     
     //Switch 
     transrot([0,-1.5,0],[0,90,180])
     translate([4.8-14.5,-5.1-1.5,0])
     hull() {
       microswitch_hole_positions(medium_microswitch) {
         transrot([0,0,3.4],[0,0,30])  cylinder(h=4,d=7.4);    
         transrot([16,0,3.4],[0,0,30]) cylinder(h=4,d=7.4);   
       }
     }

     //Stand
     *hull() {         
       transrot([-7.4,9.1,-10],[0,0,90]) rotate_extrude(angle=90) square([2.3,3]);
       *transrot([-9.7,4,-10],[0,0,0]) cube([2.3,5.1,3]);         
       translate([-9.7,4,-10])  cube([21.3,1,3]);
       translate([0.1,14,-10]) cylinder(h=3,d=10);
       translate([6.6,7,-10])   cylinder(h=3,d=10);
     }



   }
   union() {
        
    //Chain mount slot
    *transrot([-10,0,0],[0,0,270])
    bcCutoutLine(bcBeadD     = bcBeadD,      //Bead diameter (+tolerance)
                  bcBeadS    = bcBeadS,     //Bead spacing (distance between center of beads)
                  bcCordD    = bcCordD,     //Cord diameter
                  bcOpeningD = bcBeadD-0.4, //Hole opening
                  bcOpeningH = 20,          //Hole height
                  bcC        = 5);          //Bead count    
    transrot([-14.4,4,1.6],[0,0,0]) cube([7,20,10]);
    transrot([-14.4,11.4,1.6],[0,0,0]) cube([10,6,10]);

     //Nut traps (switch)
     transrot([0,-1.5,0],[0,90,180])
     translate([4.8-14.5,-5.1-1.5,0]) 
     microswitch_hole_positions(medium_microswitch) {
       transrot([0,0,5],[0,0,30]) 
       cylinder(h=4,r=nut_trap_radius(M3_nut,horizontal=true)+0.2,$fn=6); 
       transrot([0,0,-6],[0,0,30]) 
       cylinder(h=12,r=screw_clearance_radius(M3_dome_screw)); 
     }
     
     //Bottom
    transrot([-20,-3,-20],[0,0,0]) cube([40,30,10]);      
   }
 }









}
*WBPStepperMount();

module WBPStepperMountWithInlays_stl() {
  stl("WBPStepperMountWithInlays");
  color(pp1_colour)
  WBPStepperMount(inlay=true);
}

module WBPStepperMountWithoutInlays_stl() {
  stl("WBPStepperMountWithoutInlays");
  color(pp1_colour)
  WBPStepperMount(inlay=false);
}

//$vpt = [-10,0,-5];
//$vpr = [60,0,160];
//! TBD
module WBPStepperMountWithInlays_assembly() {
  pose([-10,0,-5], [60,0,160])
  assembly("WBPStepperMountWithInlays", ngb = true) {
   
    //Stepper mount
    difference() {        
      WBPStepperMountWithInlays_stl();
      if (is_undef($explode) ? 0 : $explode) {
        translate([-50,-50,7.99]) cube([100,100,100]);
        //translate([-50,22,4.99]) cube([100,100,100]);
      }  
    }
  } 
}

//! TBD
module WBPStepperMountWithoutInlays_assembly() {

  //Stepper mount
  WBPStepperMountWithoutInlays_stl();

  //Nuts
  explode(-10) transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,7.9-nut_thickness(M3_nut)],[0,0,-15]) nut(M3_nut);
  explode(-10) transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,7.9-nut_thickness(M3_nut)],[0,0,-15]) nut(M3_nut);
  explode(-10) transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,7.9-nut_thickness(M3_nut)],[0,0,-15]) nut(M3_nut);
}


//! TBD
module WBPStepperMountLeft_assembly() {
  pose([25,30,20], [80,0,180])
  assembly("WBPStepperMountLeft") {

    //Stepper mount
    //WBPStepperMountWithInlays_assembly();
    //WBPStepperMountWithoutInlays_assembly();

    //Stepper
    transrot([0,0,NEMA_length(stepperT)+stepperOffsZ],[0,0,270]) NEMA_screws(stepperT, M3_pan_screw, n=3);   
    transrot([0,0,NEMA_length(stepperT)+stepperOffsZ],[0,0,270])  NEMA(stepperT, 0, true);
  }
}

//! TBD
module WBPStepperMountRight_assembly() {
  pose([25,30,20], [80,0,180])
  assembly("WBPStepperMounRight") {

    //Stepper mount
    //WBPStepperMountWithInlays_assembly();
    //WBPStepperMountWithoutInlays_assembly();

    //Stepper
    transrot([0,0,NEMA_length(stepperT)+stepperOffsZ],[0,0,0])   NEMA_screws(stepperT, M3_pan_screw, n=3);   
    transrot([0,0,NEMA_length(stepperT)+stepperOffsZ],[0,0,90]) NEMA(stepperT, 0, true);
  }
}

//Screws
module WBPStepperMountScrews() {

  //Mount screws
  transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,11],[0,0,0]) screw_and_washer(M3_dome_screw,10);
  transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,11],[0,0,0]) screw_and_washer(M3_dome_screw,10);
  transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,11],[0,0,0]) screw_and_washer(M3_dome_screw,10);
}

if($preview||true) {
   $explode = 0;
   WBPStepperMountLeft_assembly();
   translate([canvasW,0,0]) 
      WBPStepperMountRight_assembly();
    
   *whiteboard(canvasHeight=canvasH,
              canvasWidth=canvasW,
              drawingXF=drawingXF,
              drawingYF=drawingYF); 
    
    
    
   
}
