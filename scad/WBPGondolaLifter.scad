//###############################################################################
//# WBPainter - Gondola Lifter                                                  #
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
//#   Gondola lifter                                                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   November 6, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <./WBPConfig.scad>

use <../scad/WBPWeight.scad>

//Set view
//$vpt = [-10,-60,15];
//$vpr = [330,-30,0];

//servo gear
module WBPServoGear_stl() {  
  stl("WBPServoGear");
  color(pp2_colour) {
    transrot([5.5,0,0],[270,1,0]) 
    difference() {  
      linear_extrude(4) involute_gear_profile(.5,16);    
      sg90SplineCutout();
    }
  }
}  

//Weight
module WBPServoWeight_stl() {
  //Thread profile
  threadPitch   = 4;
  threadProfile = thread_profile(threadPitch / 2.2, threadPitch * 0.25, 60);
 
  color(pp2_colour) {
  
    //Servo mount
    difference() {
      union() {
        transrot([0,-12.75,0],[270,0,0]) 
          linear_extrude(4)
          hull() {
              translate([12.1,6.1,0])   circle(d=8);
              translate([12.1,-6.1,0])  circle(d=8);
              translate([-12.1,6.1,0])  circle(d=8);
              translate([-12.1,-6.1,0]) circle(d=8);
          }       
        transrot([0,-27.6,0],[270,0,0]) cylinder(h=1,d=21);         
        for (a=[0,180]) {
          rotate([0,a,0]) {          
            hull() { 
              difference () {
                transrot([0,-12.75,0],[270,0,0]) 
                linear_extrude(1)
                hull() {
                  translate([12.1,6.1,0])   circle(d=8);
                  translate([12.1,-6.1,0])  circle(d=8);
                  translate([-12.1,6.1,0])  circle(d=8);
                  translate([-12.1,-6.1,0]) circle(d=8);
                }
                translate([-20,-26.6,0]) cube([40,22.6,20]);
              }
              difference () {
                transrot([0,-18.75,0],[270,0,0]) 
                linear_extrude(1)
                hull() {
                  translate([10.1,6.1,0])   circle(d=8);
                  translate([-10.1,6.1,0])  circle(d=8);
                }
                translate([-20,-26.6,-6.2]) cube([40,22.6,20]);
              }
            }       
            hull() {
              difference () {   
                transrot([0,-26.6,0],[270,0,0]) cylinder(h=1,d=21); 
                translate([-20,-26.6,-6.2]) cube([40,22.6,20]);
              }      
              difference () {
                transrot([0,-18.75,0],[270,0,0]) 
                linear_extrude(1)
                hull() {
                  translate([10.1,6.1,0])   circle(d=8);
                  translate([-10.1,6.1,0])  circle(d=8);
                }
                translate([-20,-26.6,-6.2]) cube([40,22.6,20]);
              }
            }
            // Lifter guide    
            difference() { 
              hull() {
                translate([-10,-8.75,-10.1]) cube([20,0.1,6]);
                transrot([5.5-centre_distance(0.5,16,16)/2,4,-12],[0,0,0])
                linear_extrude(8)          
                offset(delta=1)
                projection(cut = false)
                transrot([0,0,-2],[0,90,270])
                linear_extrude(4) involute_rack_profile(0.5, 4, 4);
              }   
              transrot([5.5-centre_distance(0.5,16,16)/2,4,-16],[0,0,0])
              linear_extrude(16)
              offset(delta=0.2)
              projection(cut = false)
              transrot([0,0,-2],[0,90,270])
              linear_extrude(4) involute_rack_profile(0.5, 4, 4);
            }   
          }
        }
      }
      union() {
        //Stepper cut out  
        translate([-11.35,-26.6,-6.2]) cube([22.7,22.6,12.4]);
        translate([-20,-10.85,-6.2])   cube([40,40,12.4]);
        //Screw holes
        hull() {
         transrot([32.5/2-2,-5,0],[90,0,0])    cylinder(h=15,r=screw_clearance_radius(M2_dome_screw));
         transrot([32.5/2-4,-5,0],[90,0,0])    cylinder(h=15,r=screw_clearance_radius(M2_dome_screw));
        }
        transrot([32.5/2-2,-12,0],[90,30,0])  cylinder(h=5,r=nut_radius(M2_nut),$fn=6);
        transrot([-32.5/2+2,-5,0],[90,0,0])   cylinder(h=15,r=screw_clearance_radius(M2_dome_screw)); 
        transrot([-32.5/2+2,-12,0],[90,30,0]) cylinder(h=5,r=nut_radius(M2_nut),$fn=6);
        //Cable slot
        hull() {          
          transrot([12.25,-5,-0.5],[90,0,0])    cylinder(h=15,r=1);
          transrot([12.25,-5, 0.5],[90,0,0])    cylinder(h=15,r=1);
          transrot([11.25,-5,-1.5],[0,0,180])   cube([2,15,3]);
        }
      }    
    }  
    //Helper bridge  
    translate([12.35,-12,-3]) cube([3.5,0.15,6]);
    translate([-15.75,-12,-1.5]) cube([3,0.15,3]);
       
    //Weightadapter
    transrot([0,-28.6,0],[90,0,0])
    difference() {
      union() {
        hull() {
          transrot([0,0,-1],[180,0,0]) cylinder(h=1,d=21);        
          difference() {    
            rotate([180,0,0])
            thread(dia     = 17, 
                   pitch   = threadPitch, 
                   length  = 4, 
                   profile = threadProfile,
                   center  = false, 
                   top     = 1, 
                   bot     = 1, 
                   starts  = 1, 
                   solid   = true, 
                   female  = false);
            translate([-20,-20,-40.1]) cube([40,40,40]);     
          }
        }
        thread(dia     = 17, 
               pitch   = threadPitch, 
               length  = 15, 
               profile = threadProfile,
               center  = false, 
               top     = -1, 
               bot     = 1, 
               starts  = 1, 
               solid   = true, 
               female  = false);
      }
      union() {
        translate([0,0,6.5]) sphere(d=15);
        translate([0,0,6.5]) cylinder(h=12,d=15);
      }
    }
  }
}
*WBPServoWeight_stl();

//Lifter
module WBPServoLifter_stl() {  
  stl("WBPServoLifter");
  color(pp2_colour) {
    transrot([5.5-centre_distance(0.5,16,16)/2,0,-12.5],[270,270,0])
    linear_extrude(4) involute_rack_profile(0.5, 15, 4);
  }
}

//! TBD
module WBPGondolaLifter_assembly() {
  pose([-10,-60,15], [330,-30,0])
  assembly("WBPGondolaLifter") {



    WBPServoGear_stl();
    
    WBPServoLifter_stl();
      
    WBPServoWeight_stl();
    
     transrot([0,6.5,0],[0,0,0]) WBPWeightBottom_stl();
    
    
      
    transrot([0,-8.75,0],[270,0,0]) sg90();

  
  }  
}

if($preview) {
   $explode = 1;
   WBPGondolaLifter_assembly();
 }
