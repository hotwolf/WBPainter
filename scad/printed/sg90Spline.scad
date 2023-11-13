//###############################################################################
//# WindowPainter - SG90 Spline                                                 #
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
//#   Spline of the SG90 servo motor                                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 26, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <../lib/NopSCADlib/lib.scad>

//Cut out shape
module sg90SplineCutout() {
  
  cylinder(h=10,d=2.4);
  translate([0,0,4])cylinder(h=6,d=5);
    
  translate([0,0,-2]) linear_extrude(5) 
  difference() {  
    circle(d=6);
    union() {
      for(a=[360/21:360/21:360]) {
        rotate([0,0,a]) translate([0,4.76/2,0]) polygon([[2,2],[0,0],[-2,2]]);
      }
    }
  }
}

//Spline connector
module sg90SplineConnector() {
  
  difference() {  
    cylinder(h=4,d=6);
    sg90SplineCutout();
  }
}
  
if ($preview) {
  *sg90SplineCutout();
  sg90SplineConnector();
}
