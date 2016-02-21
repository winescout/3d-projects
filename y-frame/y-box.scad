include <lib/config.scad>
include <lib/nema17_bolt_pattern.scad>

full_render = true;

y_box();

module y_box(){
  y_tensioner_width = 20;
  y_box_x = thin_wall_width + nema_z + y_tensioner_width;

  tension_1_screw_center = [y_box_x - y_tensioner_width / 2, rod_wall_width + nema_xy/2 + bearing_outer_r + 5, z_box_z];
  tension_2_screw_center = [y_box_x - y_tensioner_width / 2,rod_wall_width + nema_xy/2 - bearing_outer_r - 5, z_box_z];

  difference(){
    union(){
      cube([y_box_x, z_box_y, z_box_z]);
      translate(tension_1_screw_center){
        cylinder(r = tension_screw_bolt_r, h = tensioner_lip);

        if(full_render){
          translate([0,0,tensioner_lip]) bearing();
        }
      }

      translate(tension_2_screw_center);
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

module bearing(){
  color("blue"){
    difference(){
      cylinder(r = bearing_outer_r, h=bearing_h);
      cylinder(r = bearing_inner_r, h=bearing_h);
    }  
  }
}

