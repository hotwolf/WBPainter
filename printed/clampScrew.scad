//###############################################################################
//# WindowPainter - Clamp Screw Parts                                           #
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
//#   Printed parts for the clamp screws                                        #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 24, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <NopSCADlib/lib.scad>

module screwClampGrip(type=M5_hex_screw) {
    
  difference() {  
    union() { 
      for(a=[10:10:360]) {
        rotate([0,0,a]) {
            translate([0,7,0.5]) cylinder(h=screw_head_height(type),d=1,$fn=16);
            translate([0,7,0.5]) sphere(d=1);
            translate([0,7,0.5+screw_head_height(type)]) sphere(d=1);
        }
      }
      cylinder(h=1+screw_head_height(type),r=7);       
    }
    translate([0,0,-1]) cylinder(h=1+screw_head_height(type),r=screw_head_radius(type),$fn=6);
  }
}

module screwClampShoe(type=M5_hex_screw,length=20) {

  difference() {  
    rotate_extrude() hull() {
      translate([1+screw_radius(type),4-length,0]) circle(d=2);
      translate([6.5,-length,0]) circle(d=2);
      translate([0,-length-2,0]) square([7.5,2]);
      translate([0,-length-2,0]) square([2,7]);
    }
    translate([0,0,-length]) cylinder(h=length,r=screw_radius(type));
  } 
}

if ($preview) {
  %screw(M5_hex_screw, 20);
  screwClampGrip(type=M5_hex_screw); 
  screwClampShoe(type=M5_hex_screw,length=20);
}