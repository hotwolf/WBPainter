//###############################################################################
//# WBPainter - Gondola Pen Holder                                              #
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
//#   The pen clamp and cain mount                                              #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WBPConfig.scad>

use <./WBPBeadedChain.scad>

use <../printed/beadedChainMount.scad>

//Set view
//$vpt = [1,0,5];
//$vpr = [0,250,320];

//Beaded chain parts
//==================
//Left end bead
module WBPGondolaBearingLeftStartBead(offsX=gondolaX,
                                     offsY=gondolaY,
                                     offsA=90+stepperLeftA) {
  transrot([offsX,offsY,0],[0,0,offsA])
  bead(x=0,
       y=50-3*bcBeadS);                    
}
*WBPGondolaBearingLeftStartBead(0,0);

//Left end bead
module WBPGondolaBearingRightStartBead(offsX=gondolaX,
                                      offsY=gondolaY,
                                      offsA=-stepperRightA) {
  transrot([offsX,offsY,0],[0,0,offsA])
  bead(x=0,
       y=50-3*bcBeadS);                    
}
*WBPGondolaBearingRightStartBead(0,0);

//Pen clamp settings
penClampL1 = 10; //Depth of the clamp
penClampL2 =  0; //Depth of the pen holder extension
penClampA1 =  5; //Spring tension (spring offset angle)
penClampA2 = 60; //Hinge position at the handle

module trapezoidConnector(z=0,d=52,w=10,h=4) {
    
  translate([0,-d/2+h,z]) 
  linear_extrude(height=18,scale=[24/18,1])  
    polygon([[-3,-2],[3,-2],[1,1],[1,20],[-1,20],[-1,1]]);    
  *translate([-w/2,-22,z]) cube([w,20,18]);  
}
*trapezoidConnector();

//Pen clamp D18
module WBPGondolaPenClampD18Part1_stl() {
  stl("WBPGondolaPenClampD18Part1");
  color(pp2_colour)
  union() {
    penClamp1(d =18,
              l1=penClampL1,
              l2=penClampL2);
    
    //Stand  
    difference() {
      union() {
        translate([0,0,-9]) trapezoidConnector();      
        hull() {
          translate([-5,-22,-5]) cube([10,2,10]);
          translate([0,-0,-5]) cylinder(h=10,d=22);
        }
      }
      union() {
        hull() {
          translate([-3,-20,-6]) cube([6,2,12]);
          translate([0,-0,-6]) cylinder(h=12,d=18);
        }
        translate([-30,0,-6]) cube([60,60,12]);  
        translate([0,-0,-6]) cylinder(h=12,d=22);
        translate([-30,-30,-15]) cube([60,60,10]);  
        translate([-30,-30,+5])  cube([60,60,10]);
      }
    }
  }        
}
*WBPGondolaPenClampD18Part1_stl();

module WBPGondolaPenClampD18Part2_stl() {
  stl("WBPGondolaPenClampD18Part2");
  color(pp2_colour)
  penClamp2(d=18,
            l=penClampL1);
}

module WBPGondolaPenClampD18Part3_stl() {
  stl("WBPGondolaPenClampD18Part3");
  color(pp2_colour)
  penClamp3(d=18,
            l=penClampL1,
            a=penClampA2);
}

module WBPGondolaPenClampD18Part4_stl() {
  stl("WBPGondolaPenClampD18Part4");
  color(pp2_colour)
  penClamp4(d =18,
            l =penClampL1,
            a1=penClampA1, 
            a2=penClampA2);  
}

//Pen clamp D20
module WBPGondolaPenClampD20Part1_stl() {
  stl("WBPGondolaPenClampD20Part1");
  color(pp2_colour)
  union() {
    penClamp1(d =20,
              l1=penClampL1,
              l2=penClampL2);
    
    //Stand  
    difference() {
      union() {
        translate([0,0,-9]) trapezoidConnector();      
        hull() {
          translate([-5,-22,-5]) cube([10,2,10]);
          translate([0,-0,-5]) cylinder(h=10,d=24);
        }
      }
      union() {
        hull() {
          translate([-3,-20,-6]) cube([6,2,12]);
          translate([0,-0,-6]) cylinder(h=12,d=20);
        }
        translate([-30,0,-6]) cube([60,60,12]);  
        translate([0,-0,-6]) cylinder(h=12,d=24);
        translate([-30,-30,-15]) cube([60,60,10]);  
        translate([-30,-30,+5])  cube([60,60,10]);
      }
    }
  }        
}
*WBPGondolaPenClampD20Part1_stl();

module WBPGondolaPenClampD20Part2_stl() {
  stl("WBPGondolaPenClampD20Part2");
  color(pp2_colour)
  penClamp2(d=20,
            l=penClampL1);
}

module WBPGondolaPenClampD20Part3_stl() {
  stl("WBPGondolaPenClampD20Part3");
  color(pp2_colour)
  penClamp3(d=20,
            l=penClampL1,
            a=penClampA2);
}

module WBPGondolaPenClampD20Part4_stl() {
  stl("WBPGondolaPenClampD20Part4");
  color(pp2_colour)
  penClamp4(d =20,
            l =penClampL1,
            a1=penClampA1, 
            a2=penClampA2);  
}

//Pen clamp D30
module WBPGondolaPenClampD30Part1_stl() {
  stl("WBPGondolaPenClampD30Part1");
  color(pp2_colour)
  union() {
    penClamp1(d =30,
              l1=penClampL1,
              l2=penClampL2);

    //Stand  
    difference() {
      union() {
        translate([0,0,-9]) trapezoidConnector();      
        hull() {
          translate([-5,-22,-5]) cube([10,2,10]);
          translate([0,-0,-5]) cylinder(h=10,d=34);
        }
      }
      union() {
        hull() {
          translate([-3,-20,-6]) cube([6,2,12]);
          translate([0,-0,-6]) cylinder(h=12,d=30);
        }
        translate([-30,0,-6]) cube([60,60,12]);  
        translate([0,-0,-6]) cylinder(h=12,d=34);
        translate([-30,-30,-15]) cube([60,60,10]);  
        translate([-30,-30,+5])  cube([60,60,10]);  
      }
    }
  }    
}
*WBPGondolaPenClampD30Part1_stl();

module WBPGondolaPenClampD30Part2_stl() {
  stl("WBPGondolaPenClampD30Part2");
  color(pp2_colour)
  penClamp2(d=30,
            l=penClampL1);
}

module WBPGondolaPenClampD30Part3_stl() {
  stl("WBPGondolaPenClampD30Part3");
  color(pp2_colour)
  penClamp3(d=30,
            l=penClampL1,
            a=penClampA2);
}

module WBPGondolaPenClampD30Part4_stl() {
  stl("WBPGondolaPenClampD30Part4");
  color(pp2_colour)
  penClamp4(d =30,
            l =penClampL1,
            a1=penClampA1, 
            a2=penClampA2);
}

//! TBD
module WBPGondolaPenClampD18_assembly() {
  pose([1,0,5], [0,250,320])
  assembly("WBPGondolaPenClampD18") {

    explode([0,0,0]) WBPGondolaPenClampD18Part1_stl();
    explode([0,0,-5]) WBPGondolaPenClampD18Part2_stl();
    explode([0,0,-35]) WBPGondolaPenClampD18Part3_stl();
    explode([0,0,25]) WBPGondolaPenClampD18Part4_stl();
   
  }  
}

//! TBD
module WBPGondolaPenClampD20_assembly() {
  pose([1,0,5], [0,250,320])
  assembly("WBPGondolaPenClampD20") {

    explode([0,0,0]) WBPGondolaPenClampD20Part1_stl();
    explode([0,0,-5]) WBPGondolaPenClampD20Part2_stl();
    explode([0,0,-35]) WBPGondolaPenClampD20Part3_stl();
    explode([0,0,25]) WBPGondolaPenClampD20Part4_stl();
   
  }  
}

//! TBD
module WBPGondolaPenClampD30_assembly() {
  pose([1,0,5], [0,250,320])
  assembly("WBPGondolaPenClampD30") {

    explode([0,0,0]) WBPGondolaPenClampD30Part1_stl();
    explode([0,0,-5]) WBPGondolaPenClampD30Part2_stl();
    explode([0,0,-35]) WBPGondolaPenClampD30Part3_stl();
    explode([0,0,25]) WBPGondolaPenClampD30Part4_stl();
   
  }  
}

module cylinderBearingInnerConnector(a=0,l=20,w=10,h=4,d=52) {
  connectorA = (360*w)/((d-2*h)*PI);

  rotate([0,0,a]) {       
    linear_extrude(height=10,twist=-connectorA)
    difference() {
      circle(d=52);
      union() {
        rotate([0,0,270-0.5*connectorA]) translate([-30,0,0])   square([60,30]); 
        rotate([0,0,90-1.5*connectorA])  translate([-30,0,0])   square([60,30]); 
        rotate([0,0,-connectorA])        translate([-10,-d/2+h,0]) square([20,40]);
        *circle(d=36);          
      }
  }

    transrot([0,0,10],[0,0,0])
    linear_extrude(height=l)
    difference() {
      circle(d=52);
      union() {
        rotate([0,0,270+0.5*connectorA]) translate([-30,0,0])   square([60,30]); 
        rotate([0,0,90-0.5*connectorA])  translate([-30,0,0])   square([60,30]); 
        rotate([0,0,0])                  translate([-10,-d/2+h,0]) square([20,40]);
        *circle(d=36);          
      }
    }
  } 
}
*cylinderBearingInnerConnector();

module WBPGondolaBearing_stl(a=0) {
  stl("WBPGondolaBearing");
  color(pp2_colour)  
  translate([0,0,-5]) {
    
    //Chain mount
    rotate([0,0,a])
    difference() {
      union() {
        translate([0,50,0]) cylinder(h=5,d=bcBeadD+2);
        translate([0,50,5]) sphere(d=bcBeadD+2);
        translate([-(bcBeadD+2)/2,35,0])  cube([bcBeadD+2,15,5]);
        transrot([0,35,5],[270,0,0]) cylinder(h=15,d=bcBeadD+2);
     
      }
      union() {
        transrot([0,50,5],[0,0,90]) 
        bcCutoutLine(bcBeadD    = bcBeadD,   //Bead diameter (+tolerance)
                     bcBeadS    = bcBeadS,     //Bead spacing (distance between center of beads)
                     bcCordD    = bcCordD,     //Cord diameter
                     bcOpeningD = bcBeadD-0.4,   //Hole opening
                     bcOpeningH = 20,    //Hole height
                     bcC        = 4,     //Bead count
                     tiltFirst  = true); //Tilt first cutout          
        translate([0,0,4.8]) cylinder(h=10,r=36.2);   
        transrot([-bcBeadD,50-bcBeadS/2,6+bcBeadD/2],[0,90,0]) cylinder(h=2*bcBeadD,d=bcBeadD);
        translate([-bcBeadD,38-bcBeadS/2,6]) cube([2*bcBeadD,12,10]);
      }
    }
      
    //Bearing
    cylinderBearing(height                  = 4.8,  // Height of the bearing
                    spacer                  = 0.2,  // Width of a spacer at the inner ring
	                inner_radius            = 26.0, // Inner ring radius. Half of the diameter
	                outer_radius            = 36.0, // Outer ring radius. Half of the diameter
	                edge_radius             = 0.5,  // Radii of the inner and outer ring touching the housing and axis
                    ball_radius             = 3,    // Dimension of the rolling element
	                ball_edge_radius        = 0.3,  // Edge Radii of the rolling element
	                space_ball_rings        = 0.2,  // Space between the rolling element and each ring
	                min_space_between_balls = 0.25, // Minimum space between the rolling elements. Effects the number of rolling elements
	                ball_height_space       = 0.0,  // Clearance between height of the rings and the height rolling elements
	                guide_size_ratio        = 0.5,  // Ratio of height of the guidance elevation
	                ball_guide_height       = 0.8); // Elevation of the guidance element
    
    //Left screw mount
    difference() { 
      cylinderBearingInnerConnector(a=-60,l=8);
      rotate([0,0,30])  
      union() {
         transrot([-28,0,14],[0,90,0]) cylinder(h=10,r=screw_clearance_radius(M3_dome_screw));    
         transrot([-24,0,14],[90,0,90]) cylinder(h=10,r=nut_trap_radius(M3_nut,horizontal=true),$fn=6);    
      }
    }
    
    //Right screw mount
    difference() { 
      cylinderBearingInnerConnector(a=60,l=8);
      rotate([0,0,-30])  
      union() {
         transrot([28,0,14],[0,270,0]) cylinder(h=10,r=screw_clearance_radius(M3_dome_screw));    
         transrot([24,0,14],[270,0,90]) cylinder(h=10,r=nut_trap_radius(M3_nut,horizontal=true),$fn=6);    
      }
    }

    //Pen clamp mount
    difference() {
      cylinderBearingInnerConnector(a=0,l=16,w=10);
      trapezoidConnector(10);
    }
        
    //Support 
    cylinderBearingInnerConnector(a=135,l=0);
    cylinderBearingInnerConnector(a=225,l=0);
   
    
    
  }
}

//! TBD
module WBPGondolaBearings_assembly() {
  pose([1,0,5], [0,250,320])
  assembly("WBPGondolaPenBearings") {

    transrot([0,0,0],[0,0,0])   WBPGondolaBearing_stl(90+stepperLeftA);
    transrot([0,0,0],[0,180,0]) WBPGondolaBearing_stl(stepperRightA);

    transrot([0,0,12],[0,0,0])  WBPGondolaPenClampD18_assembly();
    transrot([0,0,-12],[0,180,0])  WBPGondolaPenClampD18_assembly();
  }  
}


if($preview) {
//   $explode = 1;
    
    WBPGondolaBearings_assembly();
    
      *translate([-winW/2,winH/2,-44]) windowFrame(glassHeight=winH,
                                                  glassWidth=winW); 
 
 }
