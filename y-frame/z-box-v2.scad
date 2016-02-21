include <lib/config.scad>
include <lib/nema17_bolt_pattern.scad>

box();
mirror([0,1,0]) box();

module box(){
  difference(){
    union(){
      difference(){
        cube([z_box_x, z_box_y, z_box_z]);

        translate([rod_wall_width,0,0]){
          cube([z_box_x - rod_wall_width, z_box_y - rod_wall_width - z_wall_width, z_box_z - thin_wall_width]);
        }
      }

      translate([z_box_x,rod_wall_width/2,z_box_z - rod_x_2_height ]){
        rotate([0,270,0]) bar_dongle();
      }
    }

    //x bar holes
    union(){
      //front
      translate([0, rod_wall_width/2, 0]){
        translate([0,0,rod_x_1_height])
          rotate([0,90,0]) rod(z_box_x + 5);

        translate([0,0,rod_x_2_height])
          rotate([0,90,0]) rod(z_box_x + 5);
      }

      //back
      translate([0, z_box_y - rod_wall_width/2, 0]){
        translate([0,0,rod_x_1_height])
          rotate([0,90,0]) rod(z_box_x + 5);

        translate([0,0,rod_x_2_height])
          rotate([0,90,0]) rod(z_box_x + 5);
      }

    }

    //y bar holes
    translate([rod_wall_width/2,z_box_y,rod_y_1_height])
      rotate([90,0,0]) rod(z_box_y + 5);



    translate([nema_center_x,nema_center_y,0]) nema17_holes(z_box_z);


    translate([0, z_rod_center_y,0]){
      //z-frame
      translate([rod_wall_width + frame_bolt_width + 10,0,0]){
        rod(z_box_z);
        cylinder(r=7.5, h=8.5,center=true, $fn=6);
      }

      //lm88
      translate([z_rod_center_x, 0, 0]){
        translate([0,0,7.5]) cylinder(r=4, h=z_box_z - 7.5);
        translate([0,0,4.5]) cylinder(r=2.1, h=z_box_z - 3.5);
        cylinder(r=3.5, h=4.5);
      }

    }


  }
}

module rod(height){
  cylinder(r=rod_r, h=height);
}

module bar_dongle(){
    union(){
      cylinder(r=rod_wall_width/2, h=4);
      translate([0,-rod_wall_width/2,0]) cube([rod_x_2_height,rod_wall_width,4]);
    }
}


