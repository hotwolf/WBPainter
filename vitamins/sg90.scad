//###############################################################################
//# SG90 Servo Motor                                                            #
//###############################################################################
//#   SG90 servo model by ledalert                                              #
//#     => https://github.com/ledalert/cadmodel-sg90                            #
//#                                                                             #
//###############################################################################
//# Description:                                                                #
//#   Model of a SG90 servo motor                                               #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 26, 2023                                                          #
//#      - Adapted for NopSCADlib                                               #
//#                                                                             #
//###############################################################################

include <NopSCADlib/lib.scad>

module sg90() {
  vitamin("sg90(): SG90 servo motor");
  translate([0,0,-17.75]) {
      
	color("blue") difference() {
		union() {
			translate([0,0,22.5/2]) cube([22.5,12.2,22.5], center=true);
			translate([0,0,16.75]) cube([32.2,12.2,2], center=true);

			translate([0,0,22.5-1]) {
				hull() {
					translate([-1,0,0]) cylinder(d=5.5, h=4+1);
					translate([1,0,0]) cylinder(d=5.5, h=4+1);
				}

				translate([5.5,0,0]) cylinder(d=11.6, h=4+1);
			}

		}	

		translate([-32.5/2+2,0,16.75-2]) {
			cylinder(d=2, h=2+2);
			translate([-2,0,2]) cube([4,1,2+2], center=true);
		}
		translate([32.5/2-2,0,16.75-2]) {
			cylinder(d=2, h=2+2);
			translate([2,0,2]) cube([4,1,2+2], center=true);
		}
	}
	color("white") translate([5.5,0,22.5-1+4]) {
		difference() {
			cylinder(d=4.8, h=3+1);
			translate([0,0,1]) cylinder(d=2, h=4);
		}
	}
  }
}

if ($preview) {
  sg90();
}