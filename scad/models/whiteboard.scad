//###############################################################################
//# WBPainter - Whiteboard                                                      #
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
//#   Model of a whiteboard                                                     #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   October 16, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

//include <../lib/NopSCADlib/lib.scad>

module whiteboard(xOffset=0,
                  yOffset=0,
                  zOffset=0,
                  canvasHeight=800,
                  canvasWidth=1000,
                  drawingXF=undef,
                  drawingYF=undef) {

  //Constants
  depth=10;
  margin=120; 
                       
  translate([xOffset,yOffset,zOffset]) {

    //Whiteboard
    color("WhiteSmoke")
    translate([-margin,-canvasHeight-margin,-depth]) 
    cube([canvasWidth+2*margin,
          canvasHeight+2*margin,
          depth]);
      
    
    //Drawing
    if (!is_undef(drawingXF) && !is_undef(drawingYF)) {
      color("Green")
      linear_extrude(0.1)
      union() {
        step=0.01;
        for (i=[step:step:1]) {
          hull() {
            translate([drawingXF(i),drawingYF(i),0]) circle(1);
            translate([drawingXF(i-step),drawingYF(i-step),0]) circle(1);
          }
        }
      }   
    }       
  }
}

if ($preview) {
   canvasHeight=800;
   canvasWidth=1000;
   drawingXF=function (t)  canvasWidth/2+0.4*canvasWidth*cos(360*t);
   drawingYF=function (t) -canvasHeight/2-0.4*canvasWidth*cos(360*t)*sin(360*t);
     
   whiteboard(canvasHeight=canvasHeight,
              canvasWidth=canvasWidth,
              drawingXF=drawingXF,
              drawingYF=drawingYF);
}