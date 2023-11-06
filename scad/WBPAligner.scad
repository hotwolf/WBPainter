//###############################################################################
//# WBPainter - Beaded Chain Aligner                                            #
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
//#   Fixture to align the beaded chain to the center of the stepper shaft      #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WBPConfig.scad>

use <../printed/cylinderBearing.scad>
use <../printed/beadedChainIdler.scad>

//Set view
$vpt = [42,8,11];
$vpr = [60,0,340];

//Idler for beaded chain
module WBPAlignerIdler_stl() {
  stl("WBPAlignerIdler");

  color(pp2_colour) 
  translate([0,0,-4])  
  cylinderBearing(height                  = 8.0,  // Height of the bearing
	              inner_radius            = 2.6,  // Inner ring radius. Half of the diameter
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
*WBPAlignerIdler_stl();

//Aligner for beaded chain
module WBPAligner() {
    
  translate([0,0,-8])  
  cylinderBearing(height                  = 4.0,  // Height of the bearing
	              inner_radius            = 2.6,  // Inner ring radius. Half of the diameter
	              outer_radius            = 11.0, // Outer ring radius. Half of the diameter
	              edge_radius             = 0.5,  // Radii of the inner and outer ring touching the housing and axis
	              ball_radius             = 2.0,  // Dimension of the rolling element
	              ball_edge_radius        = 0.3,  // Edge Radii of the rolling element
	              space_ball_rings        = 0.2,  // Space between the rolling element and each ring
	              min_space_between_balls = 0.25, // Minimum space between the rolling elements. Effects the number of rolling elements
	              ball_height_space       = 0.0,  // Clearance between height of the rings and the height rolling elements
	              guide_size_ratio        = 0.5,  // Ratio of height of the guidance elevation
	              ball_guide_height       = 0.8); // Elevation of the guidance element

  difference () {
    union() {  
      hull() {
        translate([37,10,-8])  cylinder(h=3.5,d=24);
        translate([57,-10,-8]) cylinder(h=3.5,d=24);
        translate([18,-11,-8])  cube([10,22,3.5]);
     }
      translate([0,-11,-8])    cube([50,22,3.5]);
      translate([37,10,-8])  cylinder(h=4,d=24);
      translate([57,-10,-8]) cylinder(h=4,d=24);
    }      
    union() {
      translate([0,0,-14])  cylinder(h=12,d=19);
      *translate([15.5,15.5,-14])  cylinder(h=12,d=7);
      *translate([15.5,-15.5,-14]) cylinder(h=12,d=7);        
      translate([40,0,-8]) cube([40,0.4,0.8],center=true);
      translate([40,0,-8]) cube([0.4,20,0.8],center=true);
    }
  }
       
   transrot([37,10,-4],[0,0,90-15.4123]) {
    difference() {
      union() {
        cylinder(h=8.1,d=5);
        hull() rotate_extrude() translate([2.75,8.6,0]) circle(0.5);
      }
      union() {
        transrot([0,0,2],[90,0,0]) cylinder(h=10,d=2,center=true);
        translate([-1,-5,2])   cube([2,10,12]);  
        translate([-5,2.5,0])  cube([10,2,12]);  
        translate([-5,-4.5,0]) cube([10,2,12]);  
          
      }
    }
  }
 
  transrot([57,-10,-4],[0,0,90]) {
    difference() {
      union() {
        cylinder(h=8.1,d=5);
        hull() rotate_extrude() translate([2.75,8.6,0]) circle(0.5);
      }
      union() {
        transrot([0,0,2],[90,0,0]) cylinder(h=10,d=2,center=true);
        translate([-1,-5,2])   cube([2,10,12]);  
        translate([-5,2.5,0])  cube([10,2,12]);  
        translate([-5,-4.5,0]) cube([10,2,12]);  
          
      }
    }
  }
}
*WBPAligner();

module WBPAlignerRight_stl() {
  stl("WBPAlignerRight");
  color(pp2_colour)
  difference() { 
    %WBPAligner();
    union() {
      transrot([39,1,-7.8],[180,0,270])  linear_extrude(0.8)text("+4cm",size=6,halign="right",valign="bottom");
      transrot([52,-4,-7.8],[180,0,270]) linear_extrude(0.8)text("R",size=12,halign="left",valign="top");
    }   
  }
}

module WBPAlignerLeft_stl() {
  stl("WBPAlignerLeft");
  color(pp2_colour)
  difference() {
    %mirror([0,1,0]) WBPAligner();
    union() {
      transrot([39,-1,-7.8],[180,0,270]) linear_extrude(0.8)text("+4cm",size=6,halign="left",valign="bottom");
      transrot([52,4,-7.8],[180,0,270])  linear_extrude(0.8)text("L",size=12,halign="right",valign="top");
    }
  }
}

//! TBD
module WBPAlignerRight_assembly() {
    pose([42,8,11], [60,0,340])
    assembly("WBPAlignerRight") {

      WBPAlignerRight_stl();
      translate([37,10,0])  explode([0,0,20]) WBPAlignerIdler_stl();
      translate([57,-10,0]) explode([0,0,20]) WBPAlignerIdler_stl();
    }
}

//! TBD
module WBPAlignerLeft_assembly() {
    pose([42, 8, 11], [70,0,218])
    assembly("WBPAlignerLeft") {

      WBPAlignerLeft_stl();
      translate([37,-10,0]) explode([0,0,20]) WBPAlignerIdler_stl();
      translate([57,10,0])  explode([0,0,20]) WBPAlignerIdler_stl();
    }
}

if($preview) {
   $explode = 0;
   *WBPPulley_assembly();   
   *WBPAlignerRight_assembly();
   WBPAlignerLeft_assembly();
}
