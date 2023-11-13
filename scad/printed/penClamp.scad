//###############################################################################
//# WindowPainter - Pen Clamp                                                   #
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
//#   Printed parts for the pen clamp                                           #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 24, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <../lib/NopSCADlib/lib.scad>


module hingeMale(l=22,a=0) {

  rotate([0,0,a])
  difference() {
    union() {
      translate([0,0,-l/2])  cylinder(h=l/2-0.1,d=6);
      translate([0,0,-1])    cylinder(h=l/2+2.5,d=3.8);  
      translate([0,0,l/2+0.75]) rotate_extrude() translate([1.9,0,0]) circle(d=1.5);
    }
    union() {
      translate([-3,0,0.75]) rotate([0,90,0]) cylinder(h=6, d=1.5);
      translate([-3,-0.75,0.75])              cube([6,1.5,l/2+3]);
      translate([1.9,-3,l/2-1])               cube([2,6,3]);
      translate([-3.9,-3,l/2-1])              cube([2,6,3]);  
    }
  }
}
*hingeMale(32);

module hingeFemale(l=22) {
  difference() {  
    translate([0,0,0.1]) cylinder(h=l/2-0.1,d=6);
    translate([0,0,-1])   cylinder(h=l/2+3,d=4.2);
  }   
}
*hingeFemale(32);

module hingeFemaleCutout(l=22) {
    translate([0,0,-0.1]) cylinder(h=l/2+2,d=6.2);
}
*hingeFemaleCutout(32);

module hingeMaleCutout(l=22) {
  translate([0,0,-l/2-2]) cylinder(h=l/2+2.1,d=6.2);
  translate([0,0,-1])    cylinder(h=l/2+4,d=4.2);
}
*hingeMaleCutout(32);

module penClamp1(r=undef,d=20,l1=22,l2=0) {
  r = r==undef ? d/2  : r;

  //Ring
  difference() {
    union() {  
      rotate([0,0,180]) rotate_extrude(angle=180) translate([d/2,-l1/2,0]) square([2,l1+l2]);
    }
    union() {
      translate([-d/2-3,0,0]) hingeFemaleCutout(l=l1);
      translate([d/2+3,0,0])  hingeFemaleCutout(l=l1);
   
      translate([-d/2-3,-3,l1/2+2]) cube([d+6,4,l2]);
      translate([-d/2-3,-1,l1/2+2]) rotate([0,90,0]) cylinder(h=d+6,r=2);
        translate([d/2+3,-r-2,max(l1/2,l2+l1/2-r+1)]) rotate([0,270,0]) difference() {    
        cube([r-1,r-1,d+6]);
        cylinder(h=d+6,r=r-1);
      }    
    }
  }      
  //Hinges
  translate([-d/2-3,0,0]) hingeMale(l=l1,a=90);
  translate([d/2+3,0,0])  hingeMale(l=l1,a=90);  
}
*penClamp1(l1=32,l2=10);

module penClamp2(r=undef,d=20,l=22) {
  r = r==undef ? d/2 : r;
 
   //Ring
  difference() {
    rotate([0,0,0]) rotate_extrude(angle=90) translate([d/2,-l/2,0]) square([2,l]); 
    union() {
      translate([0,d/2+3,0]) hingeMaleCutout(l=l);
      translate([d/2+3,0,0]) hingeMaleCutout(l=l);     
     }
  }      
  //Hinges
  translate([0,d/2+3,0]) hingeFemale(l=l);
  translate([d/2+3,0,0]) hingeFemale(l=l);  
}
*penClamp2(l=32);
   
module penClamp3(r=undef,d=20,l=22,a=45) {
  r = r==undef ? d/2 : r;
  
  //Ring
  difference() {
    rotate([0,0,90-a]) rotate_extrude(angle=a) translate([d/2+2,-l/2,0]) square([2,l]); 
    union() {
      translate([0,d/2+3,0])                    hingeFemaleCutout(l=l);
      rotate([0,0,-a]) translate([0,d/2+5,0]) hingeFemaleCutout(l=l);
    }
  }      
  //Hinges
  translate([0,d/2+3,0])                   hingeMale(l=l,a=0);
  rotate([0,0,-a]) translate([0,d/2+5,0]) hingeMale(l=l,a=0);
}
*penClamp3(l=32,a=60);

module penClamp4(r=undef,d=20,l=22,a1=10,a2=45,stretch=$preview) {
  r  = r==undef ? d/2 : r;
  a1 = stretch ? 0 : a1;
  aStart = 19+a1;
  aStep = (52-a1)/4;  
    
  difference() {
    union() {  
      radSpringSeg(-aStart-0*aStep);
      radSpringSeg(-aStart-1*aStep);
      radSpringSeg(-aStart-2*aStep);
      radSpringSeg(-aStart-3*aStep);
      radSpringSeg(-aStart-4*aStep);
    
      inTanSpringSeg(-a1            ,-aStart-0*aStep);
      inTanSpringSeg(-aStart-1*aStep,-aStart-2*aStep);
      inTanSpringSeg(-aStart-3*aStep,-aStart-4*aStep);
   
      outTanSpringSeg(-aStart-0*aStep,-aStart-1*aStep);
      outTanSpringSeg(-aStart-2*aStep,-aStart-3*aStep);
    
      outTanSpringSeg(-aStart-4*aStep,-90-a2);
      hull() {  
       rotate([0,0,75-a2]) translate([d/2+7,0,-l/2]) cylinder(h=l,d=1);
       rotate([0,0,90-a2]) translate([d/2+6,0,-l/2]) cylinder(h=l,d=4);
      }

      difference() {  
        translate([0,d/2+3,-l/2]) cylinder(h=l,d=10);
        translate([0,0,-l/2-1]) cylinder(h=l+2,d=d+8);
      }
    }
    union() {
      rotate([0,0,-a1]) translate([-d/2-3,0,0]) hingeMaleCutout(l=l);  
      rotate([0,0,-a2]) translate([0,d/2+5,0])  hingeMaleCutout(l=l); 
      translate([0,d/2+3,0]) hingeMaleCutout(l=l);
      translate([0,d/2+3,0]) hingeFemaleCutout(l=l);
  
    }
  }

  //Hinges
  rotate([0,0,-a1]) translate([-d/2-3,0,0]) hingeFemale(l=l);  
  rotate([0,0,-a2]) translate([0,d/2+5,0])  hingeFemale(l=l);
   
  //Radial spring elements 
  module radSpringSeg(a=0) {
    hull() {
       rotate([0,0,a]) translate([-d/2-1,0,-l/2]) cylinder(h=l,d=2);
       rotate([0,0,a]) translate([-d/2-5,0,-l/2]) cylinder(h=l,d=2);
    }
  }  

  //Inner tangential spring elements 
  module inTanSpringSeg(a1=0,a2=10) {
     rotate([0,0,180+a1]) rotate_extrude(angle=a2-a1) translate([d/2,-l/2,0]) square([2,l]); 
  }
   
  //Outer tangential spring elements 
  module outTanSpringSeg(a1=0,a2=10) {
     rotate([0,0,180+a1]) rotate_extrude(angle=a2-a1) translate([d/2+4,-l/2,0]) square([2,l]); 
  }
}
*penClamp4(l=32,a1=5,a2=55,stretch=false);

if($preview) {
 penClamp1(l1=32,l2=20);
 penClamp2(l=32);
 penClamp3(l=32,a=60);
 penClamp4(l=32,a1=5,a2=60);  
}
