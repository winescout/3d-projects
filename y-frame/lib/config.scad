rod_r = 9.2/2;
screw_r = 3.2/2;

bearing_outer_r = 11;
bearing_inner_r = 4;
bearing_h = 7;


thin_wall_width = 3;
rod_wall_width = rod_r * 2 + 8;
frame_bolt_width = 15;

z_wall_width = 14;

nema_z = 47 + 2;
nema_xy = 42 + 4;
nema_center_x = rod_wall_width + frame_bolt_width + nema_xy/2;
nema_center_y = rod_wall_width + nema_xy/2;

z_rod_center_x = nema_center_x + 10;
z_rod_center_y = nema_center_y + 15.5 + 16;

nema_screw_xy_from_center = 15;
nema_shaft_r = 2.5;

frame_bolt_width = 15;

//ybox
tension_screw_r = 4;
tension_screw_bolt_r = 5;
tension_screw_bolt_h = 6;
tensioner_lip = 2;

z_box_x = rod_wall_width + frame_bolt_width + nema_xy;
z_box_y = rod_wall_width + nema_xy + z_wall_width + rod_wall_width;
z_box_z = nema_z + thin_wall_width;



rod_x_1_height = rod_r + z_box_z/5;
rod_x_2_height = rod_r + (z_box_z/5) *3;
rod_y_1_height = rod_r + (z_box_z/5) * 2;


