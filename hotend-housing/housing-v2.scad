include <lib/e3d_v6_all_metall_hotend.scad>
include <lib/fan_duct_v1_2.scad>
include <lib/components/screw.scad>

$fn=32;

shell_x = 30;
shell_y = 40;
shell_z = 46;
fin_top_z = 16;
fin_z = 26;
fin_xy = 22.3;

fan_screw_width=24.1;
fan_screw_top_z = 19;
fan_screw_bottom_z = fan_screw_top_z + fan_screw_width;
fan_screw_depth=10;
fan_screw_radius=1.2;

fin_box_x = 4;

fin_radius=11.15;

hotend_screw_radius = 1.6;
cheek_x = 9;
cheek_y = 40;
cheek_z = 15;

bracket_x= 48;
bracket_y= 13;
bracket_z = 60;

bracket_screw_width=31;

//Uncomment to preview E3D in mount
//rotate([0,180,0]) e3d(fin_radius, 1);

difference(){
  union(){
    //shell();
    //ducts();
    translate([0,shell_y/2 + bracket_y/2,-cheek_z + bracket_z/2]){
      bracket();
    }

    //hotend_clamp();
  }

  hotend_screws();
  bracket_screws();
}



module ducts(){
  translate([-40,0,-14]){
    rotate([38,180,90]) duct_v1();
  }

  translate([40,0,-14]){
    rotate([38,180,270]) duct_v1();
  }
}


module bracket_screws(){
  length = cheek_y + bracket_y;
  translate([0,shell_y / 2 - cheek_y + length/2,0]){
    translate([0,0,-4]){
      rotate([270,0,0]){
        translate([-shell_x/2 - fin_box_x,0,0]){
          screw(length);
        }
      }

      rotate([270,0,0]){
        translate([shell_x/2 + fin_box_x,0,0]){
          screw(length);
        }
      }
    }

    translate([0,0,-11]){
      rotate([270,0,0]){
        translate([-shell_x/2 - fin_box_x,0,0]){
          screw(length);
        }
      }

      rotate([270,0,0]){
        translate([shell_x/2 + fin_box_x,0,0]){
          screw(length);
        }
      }
    }

  }



  translate([0,shell_y/2 + 20 - bracket_y/2 +3,0]){
    translate([bracket_screw_width/2, 0,0]){
      translate([0,0,5])
        rotate([270,0,0])
          screw(bracket_y + 20);
      translate([0,0,36])
        rotate([270,0,0])
          screw(bracket_y + 20);
    }

    translate([-bracket_screw_width/2,0,0]){
      translate([0,0,5])
        rotate([270,0,0])
          screw(bracket_y + 20);
      translate([0,0,36])
        rotate([270,0,0])
          screw(bracket_y + 20);
    }
  }
}

module hotend_screws(){
  translate([0,0,-fin_top_z/2 - 2]){
    rotate([270,0,0]){
      translate([-shell_x/2 + fin_box_x + 2.2 ,0,0]){
        screw(shell_y, 10);
      }
    }

    rotate([270,0,0]){
      translate([shell_x/2 - fin_box_x - 2.2,0,0]){
        screw(shell_y, 10);
      }
    }
  }
}

module bracket(){
  cube([bracket_x,bracket_y, bracket_z], center=true);
}

module hotend_clamp(){
  difference(){
     translate([-shell_x/2 + fin_box_x,-shell_y/2,-fin_top_z - .1]){
      cube([shell_x - fin_box_x *2,shell_y /2 - .5,fin_top_z]);
      
    }
    rotate([0,180,90]) e3d(fin_radius, 0);
  }
}

module shell(){
  difference(){
    union(){
      //top block
      translate([-shell_x/2 + fin_box_x,0,-fin_top_z - .1]){
        cube([shell_x - fin_box_x *2,shell_y/2,fin_top_z]);
        
      }

      //back wall
      translate([0,shell_y/4, -shell_z + (shell_z - fin_top_z)/2]){
        difference(){
          cube([shell_x - fin_box_x *2,shell_y /2,shell_z - fin_top_z], center=true);
          rotate([90,0,0])
            cylinder(h=shell_y/2, r1=15, r2=15, center = true);
          
        }
      }

      //walls
      translate([-shell_x/2 + fin_box_x/2,0,-shell_z/2]){
        cube([fin_box_x, shell_y, shell_z], center=true);
      }
      translate([shell_x/2 - fin_box_x/2,0,-shell_z/2]){
        cube([fin_box_x, shell_y, shell_z], center=true);
      }

      //cheeks
      union(){
        translate([-shell_x/2 - 4.5,shell_y /2 - cheek_y/2,-cheek_z/2]){
          cube([cheek_x, cheek_y, cheek_z], center=true);
        }

      }
      translate([shell_x/2 + 4.5,shell_y /2 -cheek_y/2,-cheek_z/2]){
        cube([cheek_x, cheek_y, cheek_z], center=true);
      }



    }

    //fan screws
    translate([-fan_screw_width / 2 , shell_y/2,0]){
      translate([0,0,-fan_screw_top_z])
        rotate([90,0,0]) cylinder(r=fan_screw_radius, h=fan_screw_depth, center=true);
      translate([0,0,-fan_screw_bottom_z])
        rotate([90,0,0]) cylinder(r=fan_screw_radius, h=fan_screw_depth, center=true);
    }
    translate([fan_screw_width / 2 , shell_y/2,0]){
      translate([0,0,-fan_screw_top_z])
        rotate([90,0,0]) cylinder(r=fan_screw_radius, h=fan_screw_depth, center=true);
      translate([0,0,-fan_screw_bottom_z])
        rotate([90,0,0]) cylinder(r=fan_screw_radius, h=fan_screw_depth, center=true);
    }


    rotate([0,180,90]) e3d(fin_radius);
  }

}

module fin_box(){
  translate([0,0,-19])
    cube([fin_radius *2 - 3, shell_y + 2, shell_height - 4], center=true);
}
