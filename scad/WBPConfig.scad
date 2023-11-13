//###############################################################################
//# WBPainter - Configuration                                                   #
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
//#   Global configurations for the WindowPainter.                              #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   October 16, 2023                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

//include <../lib/NopSCADlib/global_defs.scad>
include <../lib/NopSCADlib/lib.scad>
//include <NopSCADlib/core.scad>
include <../lib/NopSCADlib/vitamins/screws.scad>
include <../lib/NopSCADlib/vitamins/nuts.scad>
include <../lib/NopSCADlib/vitamins/stepper_motors.scad>
include <../lib/NopSCADlib/vitamins/microswitches.scad>
include <../lib/NopSCADlib/utils/thread.scad>

use <./vitamins/sg90.scad>
use <./vitamins/pen.scad>
use <./vitamins/magnet.scad>

use <./printed/cylinderBearing.scad>
use <./printed/beadedChainIdler.scad>
use <./printed/beadedChainPulley.scad>
use <./printed/beadedChainMount.scad>
use <./printed/penClamp.scad>
use <./printed/sg90Spline.scad>

use <./models/whiteboard.scad>

use <./WBPPulley.scad>
use <./WBPAligner.scad>
use <./WBPStepper.scad>
use <./WBPStepperMount.scad>
use <./WBPGondola.scad>
use <./WBPGondolaBearings.scad>
use <./WBPGondolaLifter.scad>
use <./WBPWeight.scad>
use <./WBPController.scad>
use <./WBPBeadedChain.scad>



//Global variables
//================

//Canvas size
canvasW  = 1000; //Window width
canvasH  =  800; //Window height
//canvasZ  =  -12; //Y offset of the canvas

//Drawing
drawingXF = function (t)  canvasW/2+0.4*canvasW*cos(360*t);
drawingYF = function (t) -canvasH/2-0.4*canvasW*cos(360*t)*sin(360*t);

//Gondola position (origin is the upper left window corner)
gondolaX = drawingXF($t); //X coordiate of the gondola
gondolaY = drawingYF($t); //Y coordinate of the gondola
//gondolaX =  0*canvasW; //X coordiate of the gondola
//gondolaY = -canvasH; //Y coordinate of the gondola
//gondolaX =  0.7*canvasW; //X coordiate of the gondola
//gondolaY = -0.7*canvasH; //Y coordinate of the gondola

//Steppers
stepperT      = NEMA17_40; //type of stepper motor
stepperOffsZ  = 1;         //Y offset between stepper and whiteboard 
stepperLeftA  = atan(gondolaY/gondolaX);
stepperRightA = 90+atan(gondolaY/(canvasW-gondolaX));
//echo("stepperLeftA  = ", stepperLeftA); 
//echo("stepperRightA = ", stepperRightA); 
pulleyLeftA  = sqrt(pow(gondolaX,2)+pow(gondolaY,2))*360/(64*4);
pulleyRightA = sqrt(pow(canvasW-gondolaX,2)+pow(gondolaY,2))*360/(64*4);
idlerLeftA  = sqrt(pow(gondolaX,2)+pow(gondolaY,2))*180/(20*PI);
idlerRightA = sqrt(pow(canvasW-gondolaX,2)+pow(gondolaY,2))*180/(20*PI);

//Beaded chain
bcBeadD = 3.2;     //Bead diameter (+tolerance)
bcBeadS = 4;       //Bead spacing (distance between center of beads)
bcCordD = 1;       //Cord diameter
bcBeadC = "Gray";  //Bead color
bcZ     = stepperOffsZ+NEMA_length(stepperT)+NEMA_boss_height(stepperT)+8;

//Weights
weightOffsX    = 64/PI;
weightOffsY    = -canvasH; //Endstop Y offset (relative to the window corner)
weightMaxLiftS = sqrt(pow(canvasW,2)+pow(canvasH,2));
weightRightY   = weightOffsY+(weightMaxLiftS-sqrt(pow(gondolaX,2)+pow(gondolaY,2)))/2;
weightLeftY    = weightOffsY+(weightMaxLiftS-sqrt(pow(canvasW-gondolaX,2)+pow(gondolaY,2)))/2;
//echo("weightLeftY  = ", weightLeftY); 
//echo("weightRightY = ", weightRightY); 

//Pen
penD = 20; //Pen diameter

//Color scheme
//============
pp1_colour = "Orange"; //for static parts
pp2_colour = "Coral";  //for moving parts

//Common operations
//=================

//Combined translate and rotate
module transrot(trans=[0,0,0],rot=[0,0,0]) {
    translate(trans) rotate(rot) children();
}
