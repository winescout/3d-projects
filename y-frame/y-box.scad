include <lib/config.scad>
include <lib/nema17_bolt_pattern.scad>

y_box();

module y_box(){
  y_tensioner_width = 20;
  y_box_x = thin_wall_width + nema_z + y_tensioner_width;


  difference(){
    union(){
      cube([y_box_x, z_box_y, z_box_z]);
      translate([y_box_x - y_tensioner_width / 2, 14, z_box_z])
        cylinder(r = tension_screw_bolt_r, h = tensioner_lip);
      translate([y_box_x - y_tensioner_width / 2, z_box_y - 14, z_box_z])
        cylinder(r = tension_screw_bolt_r, h = tensioner_lip);

    }
    translate([thin_wall_width, rod_wall_width, 0])
      cube([nema_xy, nema_xy, z_box_z - thin_wall_width]);

    translate([thin_wall_width + nema_xy/2,rod_wall_width + nema_xy/2, z_box_z]) nema17_holes();

    //tension_screws
    translate([y_box_x - y_tensioner_width / 2, 14, 0]){
      cylinder(r = tension_screw_r, h = z_box_z + tensioner_lip);
      cylinder(r = tension_screw_bolt_r, h = tension_screw_bolt_h, $fn=6);
    }

    translate([y_box_x - y_tensioner_width / 2, z_box_y - 14, 0]){
      cylinder(r = tension_screw_r, h = z_box_z + tensioner_lip);
      cylinder(r = tension_screw_bolt_r, h = tension_screw_bolt_h, $fn=6);
    }
  }
}
