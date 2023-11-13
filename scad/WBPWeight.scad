//###############################################################################
//# WBPainter - Counter Weight                                                  #
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
//#   Counter weight for the beaded chain                                       #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WBPConfig.scad>

//Set view
//$vpt = [-10,-60,15];
//$vpr = [330,-30,0];

//Beaded chain parts
//==================
//Left start bead
module WBPWeightLeftStartBead(offsY=weightLeftY) {
  bead(x=-weightOffsX,
       y=offsY-16.5,
       z=bcZ-20);                    
}
*WBPWeightLeftStartBead();

//Left end bead
module WBPWeightLeftEndBead(offsY=weightLeftY) {
  bead(x=-weightOffsX,
       y=offsY-16.5,
       z=bcZ);                    
}
*WBPWeightLeftEndBead();

//Left chain segment
module WBPWeightLeftChain(offsY=weightLeftY) {
  beadArc(x =-weightOffsX,
          y =offsY-16.5,
          z =bcZ-10,
          ry=90,                    
          d =20,
          a1=90,
          a2=270);
}
*WBPWeightLeftChain();

//Right start bead
module WBPWeightRightStartBead(offsY=weightRightY) {
  bead(x=canvasW+weightOffsX,
       y=offsY-16.5,
       z=bcZ-20);                    
}
*WBPWeightRightStartBead();

//Left end bead
module WBPWeightRightEndBead(offsY=weightRightY) {
  bead(x=canvasW+weightOffsX,
       y=offsY-16.5,
       z=bcZ);                    
}
*WBPWeightRightEndBead(0,0);

//Left chain segment
module WBPWeightRightChain(offsY=weightRightY) {

  beadArc(x =canvasW+weightOffsX,
          y =offsY-16.5,
          z =bcZ-10,
          ry=90,                    
          d =20,
          a1=90,
          a2=270);
}
*WBPWeightRightChain();

//Thread profile
threadPitch   = 4;
threadProfile = thread_profile(threadPitch / 2.2, threadPitch * 0.25, 60);

//Idler for beaded chain
module WBPWeightIdler_stl() {
  stl("WBPWeightIdler");
   
  color(pp2_colour)  
  translate([0,0,-4])  
  cylinderBearing(height                  = 8.0,  // Height of the bearing
	              inner_radius            = screw_clearance_radius(M3_dome_screw),// Inner ring radius.
	              outer_radius            = 8.0,  // Outer ring radius. Half of the diameter
	              edge_radius             = 0.5,  // Radii of the inner and outer ring touching the housing and axis
	              ball_radius             = 2.0,  // Dimension of the rolling element
	              ball_edge_radius        = 0.3,  // Edge Radii of the rolling element
	              space_ball_rings        = 0.2,  // Space between the rolling element and each ring
	              min_space_between_balls = 0.25, // Minimum space between the rolling elements. Effects the number of rolling elements
	              ball_height_space       = 0.0,  // Clearance between height of the rings and the height rolling elements
	              guide_size_ratio        = 0.5,  // Ratio of height of the guidance elevation
	              ball_guide_height       = 0.8); // Elevation of the guidance element

  color(pp2_colour)
  beadedChainIdler(bcBeadD = bcBeadD, //Bead diameter (+tolerance)
                   bcBeadS = bcBeadS, //Bead spacing (distance between center of beads)
                   bcCordD = bcCordD, //Cord diameter
                   boreD   = 15,      //Bore diameter
                   guideD  = 20,      //Chain guide diameter
                   outerD  = 24,      //Outter diameter
                   guideW  = 6,       //Width of the chain guide 
                   outerW  = 8);      //Outer width
}
*WBPWeightIdler_stl();

//Chain hole shape
module bcHoleShape() {
  difference() {    
    translate([0,0,0]) square([5,6]);
    translate([5.5,3,0]) circle(r=2.5);
  }
}
*bcHoleShape();

//Chain hole
module bcHole() {
  union() {
    transrot([-5,0,0],[0,90,0])  rotate_extrude()   bcHoleShape();
    transrot([1,0,0],[0,0,90])   linear_extrude(20) bcHoleShape();
    transrot([-5,0,0],[0,0,270]) linear_extrude(20) bcHoleShape();
  }
}   
*bcHole();

module WBPWeightTop_stl() {
  stl("WBPWeightTop");

  color(pp2_colour) {

    //Top plate
    difference() {
      union() {
        rotate([90,0,0]) rotate_extrude() union() {
          translate([0,1,0])  square([12,3]);
          translate([0,0,0])  square([11,4]);
          translate([11,1,0]) circle(r=1);
        }
      }
      union() {
        transrot([0,0,10],[0,0,90]) bcHole();  
        transrot([0,0,-10],[180,0,90]) bcHole();  
      }
    } 
  
    //Idler enclosure  
    difference() {
      union() {  
        transrot([0,-4,0],[90,0,0]) cylinder(h=30,d=24);
      }
      union() {
        translate([-4.5,-29,-15]) cube([9,26,30]);
        translate([0,-29,-15]) cylinder(h=30,d=9);
        transrot([-15,-16.5,0],[0,90,0]) cylinder(h=30,r=screw_clearance_radius(M3_dome_screw));
        transrot([-16,-16.5,0],[0,90,0]) cylinder(h=8,d=screw_boss_diameter(M3_dome_screw));
        transrot([8,-16.5,0],[0,90,0]) cylinder(h=8,r=screw_nut_radius(M3_dome_screw)+0.2,$fn=6);
      }
    }
    
    //Male thread
    difference() {
      union() {
        transrot([0,-49,0],[90,0,180])  
        thread(dia     = 17, 
               pitch   = threadPitch, 
               length  = 15, 
               profile = threadProfile,
               center  = false, 
               top     = 0, 
               bot     = -1, 
               starts  = 1, 
               solid   = true, 
               female  = false);
      }
      union() {
        transrot([0,-51.5,0],[90,0,180]) cylinder(h=17,d=15);
      }
    }
  }
}

module WBPWeightBottom_stl() {
  stl("WBPWeightBottom");
  
  color(pp2_colour) {  
    //Female thread  
        transrot([0,-49,0],[90,0,180])  
        thread(dia     = 22, 
               pitch   = threadPitch, 
               length  = 15, 
               profile = threadProfile,
               center  = false, 
               top     = 0, 
               bot     = 0, 
               starts  = 1, 
               solid   = true, 
               female  = true);

    //Weight container
    difference() {
      union() {
        transrot([0,-34,0],[90,0,0]) cylinder(h=60,d=24);
        translate([0,-94,0])         sphere(d=24); 
      }   
      union() {
        transrot([0,-30,0],[90,0,0]) cylinder(h=64,d=22);
        translate([0,-94,0])         sphere(d=22); 
      }
    }   
  }
}

//! TBD
module WBPWeight_assembly() {
  pose([-10,-60,15], [330,-30,0])
  assembly("WBPWeight") {
  
    rotate([0,90,0]) { 
      difference() { 
        WBPWeightTop_stl();
        *box(-100,100,0,100,-100,100);
      }
      transrot([0,-16.5,0],[0,90,0])   explode([-30,0,0]) WBPWeightIdler_stl();
      transrot([8,-16.5,0],[0,90,0])   explode(10) nut(M3_nut);  
      transrot([-8,-16.5,0],[0,270,0]) screw_and_washer(M3_dome_screw,20);  
      explode([0,-20,0]) difference() { 
        WBPWeightBottom_stl();
        *rotate([0,0,0]) box(-100,100,0,100,-100,100);
      }  
    }
  }  
}

if($preview) {
   $explode = 0;

   transrot([0,weightLeftY,bcZ-10],[0,90,0])  
     WBPWeight_assembly();

   transrot([canvasW,weightRightY,bcZ-10],[0,90,0])  
     WBPWeight_assembly();

   *whiteboard(canvasHeight=canvasH,
              canvasWidth=canvasW,
              drawingXF=drawingXF,
              drawingYF=drawingYF);   
 }
