include <lib/config.scad>
include <lib/nema17_bolt_pattern.scad>

//for printing
z_box();
//mirror([1,0,0]) z_box();

module z_box(){
  difference(){
    box();
    //x bar holes
    //front
    translate([-z_box_x, rod_wall_width/2, 0]){
      translate([0,0,rod_x_1_height])
        rotate([0,90,0]) rod(z_box_x + 5);

      translate([0,0,rod_x_2_height])
        rotate([0,90,0]) rod(z_box_x + 5);
    }

    //back
    translate([-z_box_x, z_box_y - rod_wall_width/2, 0]){
      translate([0,0,rod_x_1_height])
        rotate([0,90,0]) rod(z_box_x + 5);

      translate([0,0,rod_x_2_height])
        rotate([0,90,0]) rod(z_box_x + 5);


    }

    //y bar holes
    translate([-rod_wall_width/2,z_box_y,rod_y_1_height])
      rotate([90,0,0]) rod(z_box_y + 5);

    translate([-rod_wall_width/2,z_box_y,rod_y_2_height])
      rotate([90,0,0]) rod(z_box_y + 5);

    //z holes
    translate([-rod_wall_width - z_wall_xy/2 + 2, 0,0]){
      //rod
      translate([0,z_box_y - rod_wall_width - rod_r, 0]){
        rod(z_box_z);
        cylinder(r=7.5, h=8.5,center=true, $fn=6);
      }

     //lm8uu
      translate([0,z_drive_y - 10, 0]){
        translate([0,0,7.5]) cylinder(r=4, h=z_box_z - 7.5);
        translate([0,0,4.5]) cylinder(r=2.1, h=z_box_z - 3.5);
        cylinder(r=3.5, h=4.5);
      }
    }

    translate([-z_drive_x, z_drive_y, z_box_z]) nema17_holes(thin_wall_width + 10);
    //wire hole
    translate([-z_box_x, z_box_y/2 - 5,0]) cube([thin_wall_width, 10,10]);
  }

  module rod(height){
    cylinder(r=rod_r, h=height);
  }
  module box(){
    difference(){
      translate([-z_box_x,0,0]) cube([z_box_x, z_box_y, z_box_z]);
      
      translate([-z_box_x + thin_wall_width, rod_wall_width,0]){
        cube([nema_xy, nema_xy, nema_z]);
      }
    }
  }
}
