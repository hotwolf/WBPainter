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


//hull() {
//translate([10,10,40]) linear_extrude(0.1) circle(20);
//translate([-10,-10,60]) linear_extrude(0.1) circle(20);
//}


module WBPStepperMount(inlay=true) {
  difference() {
    union() {
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
 
      hull() {
        hull() {  
          translate([ 8+NEMA_hole_pitch(stepperT)/2, 8+NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8);  
          translate([-8-NEMA_hole_pitch(stepperT)/2, 8+NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8);
          translate([   NEMA_hole_pitch(stepperT)/2,   NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8);  
          translate([  -NEMA_hole_pitch(stepperT)/2,   NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8);
        }  
         hull() {  
          translate([ NEMA_hole_pitch(stepperT)/2, NEMA_hole_pitch(stepperT)/2,-6.5]) cylinder(h=2,d=8);  
          translate([-NEMA_hole_pitch(stepperT)/2, NEMA_hole_pitch(stepperT)/2,-6.5]) cylinder(h=2,d=8);
         }  
      }
      hull() {
        hull() {  
          translate([-8-NEMA_hole_pitch(stepperT)/2,-8-NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8);  
          translate([-8-NEMA_hole_pitch(stepperT)/2, 8+NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8); 
          translate([  -NEMA_hole_pitch(stepperT)/2,  -NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8);  
          translate([  -NEMA_hole_pitch(stepperT)/2,   NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=2,d=8);
       }  
        hull() {  
          translate([-NEMA_hole_pitch(stepperT)/2,-NEMA_hole_pitch(stepperT)/2,-6.5]) cylinder(h=2,d=8);  
          translate([-NEMA_hole_pitch(stepperT)/2, NEMA_hole_pitch(stepperT)/2,-6.5]) cylinder(h=2,d=8);
        }  
      }
 
      translate([-9-NEMA_hole_pitch(stepperT)/2,-1-NEMA_hole_pitch(stepperT)/2,10]) cylinder(h=4,d1=3,d2=2); 
      translate([-9-NEMA_hole_pitch(stepperT)/2, 1+NEMA_hole_pitch(stepperT)/2,10]) cylinder(h=4,d1=3,d2=2); 
      translate([-1-NEMA_hole_pitch(stepperT)/2, 9+NEMA_hole_pitch(stepperT)/2,10]) cylinder(h=4,d1=3,d2=2); 
      translate([ 1+NEMA_hole_pitch(stepperT)/2, 9+NEMA_hole_pitch(stepperT)/2,10]) cylinder(h=4,d1=3,d2=2); 
     
      difference() {
        hull() { 
          translate([0,0,-10]) cylinder(h=2,d=40);
          translate([0,0,3]) cylinder(h=7,d=56);
        }
        union() {
          rotate([0,0,315]) translate([0,-40,-12]) cube([40,80,30]);
          translate([-20,-20,-12]) cube([40,40,10]);
        }
      }
    }
    union() {   
      NEMA_screw_positions(stepperT, n=3) {
        translate([0,0,-12]) cylinder(h=10,r=screw_clearance_radius(M3_pan_screw));
        translate([0,0,-8]) cylinder(h=60,d=washer_diameter(M3_washer)+0.1);
      }
      translate([0,0,-12]) cylinder(h=10,r=NEMA_boss_radius(stepperT));
      translate([0,0,-12]) cylinder(h=10,d=23);
      hull() {
        translate([0,0,-5]) cylinder(h=20,d=46);
        translate([0,0, 3]) cylinder(h=12,d=52);
      }

      //Nut traps with inlays
      if (inlay) {
        transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,-5],[0,0,0]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
        transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,8-nut_thickness(M3_nut)-0.2],[0,0,-15]) cylinder(r=nut_radius(M3_nut)+0.2,h=nut_thickness(M3_nut)+0.2,$fn=6);

        transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-5],[0,0,0]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
        transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,8-nut_thickness(M3_nut)-0.2],[0,0,-15]) cylinder(r=nut_radius(M3_nut)+0.2,h=nut_thickness(M3_nut)+0.2,$fn=6);

        transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-5],[0,0,0]) cylinder(r=screw_clearance_radius(M3_dome_screw),h=20);
        transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,8-nut_thickness(M3_nut)-0.2],[0,0,-15]) cylinder(r=nut_radius(M3_nut)+0.2,h=nut_thickness(M3_nut)+0.2,$fn=6);
      }
      //Nut traps without inlays
      else {
        transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,-2],[0,0,45]) nut_trap(M3_dome_screw, M3_nut,depth=10,h=40,$fn=32);  
        
          hull() {
          transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,-2],[0,0,-15]) nut_trap(M3_dome_screw, M3_nut,depth=10,h=10);   
          transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,-3],[0,0,135]) linear_extrude(10) polygon([[-2,0],[2,0],[0,5]]);
        }

        transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-2],[0,0,-15]) nut_trap(M3_dome_screw, M3_nut,depth=10,h=40);
        hull() {
          transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-2],[0,0,-15]) nut_trap(M3_dome_screw, M3_nut,depth=10,h=10);   
          transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-3],[0,0,45]) linear_extrude(10) polygon([[-2,0],[2,0],[0,5]]);
        }

        transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-2],[0,0,-15]) nut_trap(M3_dome_screw, M3_nut,depth=10,h=40);   
        hull() {
          transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-2],[0,0,-15]) nut_trap(M3_dome_screw, M3_nut,depth=10,h=10);   
          transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,-3],[0,0,-45]) linear_extrude(10) polygon([[-2,0],[2,0],[0,5]]);
        }
      }
    }
  }
  //Bridge to ease printing
  if (!inlay) {
    translate([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=0.15,d=8);
    translate([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=0.15,d=8);
    translate([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,8]) cylinder(h=0.15,d=8);
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
    
    //Nuts
    explode(10) transrot([-7-NEMA_hole_pitch(stepperT)/2,-7-NEMA_hole_pitch(stepperT)/2,7.9-nut_thickness(M3_nut)],[0,0,-15]) nut(M3_nut);
    explode(10) transrot([-7-NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,7.9-nut_thickness(M3_nut)],[0,0,-15]) nut(M3_nut);
    explode(10) transrot([ 7+NEMA_hole_pitch(stepperT)/2, 7+NEMA_hole_pitch(stepperT)/2,7.9-nut_thickness(M3_nut)],[0,0,-15]) nut(M3_nut);
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
    WBPStepperMountWithInlays_assembly();
    //WBPStepperMountWithoutInlays_assembly();

    //Stepper
    transrot([0,0,-8],[0,0,0])    NEMA_screws(stepperT, M3_pan_screw, n=3);   
    transrot([0,0,-10],[0,0,180]) NEMA(stepperT, 0, true);
  }
}

//! TBD
module WBPStepperMountRight_assembly() {
  pose([25,30,20], [80,0,180])
  assembly("WBPStepperMounRight") {

    //Stepper mount
    WBPStepperMountWithInlays_assembly();
    //WBPStepperMountWithoutInlays_assembly();

    //Stepper
    transrot([0,0,-8],[0,0,0])   NEMA_screws(stepperT, M3_pan_screw, n=3);   
    transrot([0,0,-10],[0,0,270]) NEMA(stepperT, 0, true);
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
   //WBPStepperMountLeft_assembly();
   WBPStepperMountRight_assembly();
}
