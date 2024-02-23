//###############################################################################
//# Cylinder Bearing                                                            #
//###############################################################################
//#   Printable bearing design by axels9                                        #
//#     => https://www.thingiverse.com/thing:4776109                            #
//#                                                                             #
//#   Licensed under the Creative Commons - Attribution license                 #
//#                                                                             #
//###############################################################################
//# Description:                                                                #
//#   Printable bearing.                                                        #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 20, 2023                                                          #
//#      - Adapted for the WindowPainter project.                               #
//#                                                                             #
//###############################################################################

module cylinderBearing(height                  = 7.0,  // Height of the bearing
                       spacer                  = 0,    // Width of a spacer at the inner ring
	                   inner_radius            = 4.0,  // Inner ring radius. Half of the diameter
	                   outer_radius            = 11.0, // Outer ring radius. Half of the diameter
	                   edge_radius             = 0.5,  // Radii of the inner and outer ring touching the housing and axis
	                   ball_radius             = 2,    // Dimension of the rolling element
	                   ball_edge_radius        = 0.3,  // Edge Radii of the rolling element
	                   space_ball_rings        = 0.2,  // Space between the rolling element and each ring
	                   min_space_between_balls = 0.25, // Minimum space between the rolling elements. Effects the number of rolling elements
	                   ball_height_space       = 0.0,  // Clearance between height of the rings and the height rolling elements
	                   guide_size_ratio        = 0.5,  // Ratio of height of the guidance elevation
	                   ball_guide_height       = 0.8)  // Elevation of the guidance element
{

  //Calculated Variables]
  radi_diff = outer_radius - inner_radius;
  ball_pos_radius = radi_diff/2 + inner_radius;
  length_ball_pos_line = 2 * PI * ball_pos_radius;
  num_balls = floor(length_ball_pos_line/(ball_radius*2+min_space_between_balls));
  ball_angle_step = 360/num_balls;
  guide_height = height * guide_size_ratio/2;

  translate([0,0,height/2])
    union() {
        rotate_extrude($fn = 64) {
            translate([ball_pos_radius,0,0])
            union() {
                difference(){     
//                    minkowski(){
//                        square([radi_diff-2*edge_radius,height-2*edge_radius], center=true);
//                        circle(r = edge_radius, $fn=16);
//                   }
                    union() {
                      square([radi_diff,height], center=true);
                      translate([-radi_diff/2,0,0]) square([radi_diff/2,height/2+spacer]);
                    }
                    square([(ball_radius+space_ball_rings)*2, 2*(height+spacer)], center=true);
                }
                difference() {
                    for (angle = [0:180:180]) {
                        rotate([0,0,angle])    
                        translate([(ball_radius+space_ball_rings),0,0]) 
                        difference() {
                            rotate([0,0,45]) 
                            square(guide_height*sqrt(2), center=true);
                            translate([guide_height,0,0])
                            square(guide_height*2,center=true);
                        }
                    } 
                    square([(ball_radius+space_ball_rings-ball_guide_height)*2, height + 1], center=true);
                }
            }
        }
        
        for (angle_ball = [0 : ball_angle_step : 360]) {
            rotate([0,0,angle_ball])
            translate([ball_pos_radius,0,0])
            rotate_extrude($fn = 32) {
                union() {
                    translate([(ball_radius/2),0,0])
                    difference() {    
                        minkowski(){
                            square([(ball_radius-2*ball_edge_radius), height-2*ball_height_space-2*ball_edge_radius], center=true);
                            circle(r = ball_edge_radius, $fn=4);
                        }
                        translate([(ball_radius/2),0,0])
                        rotate([0,0,45])
                        square(guide_height*sqrt(2), center=true);
                    }
                    translate([((ball_radius-ball_guide_height)/2),0,0])
                    square([(ball_radius-ball_guide_height), height-ball_height_space*2], center=true);
                }
            }
        }
    }
}


if ($preview) {
    
  cylinderBearing();
  
    
}