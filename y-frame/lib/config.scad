nema_z = 47 + 2;
nema_xy = 42 + 4;
nema_screw_xy_from_center = 15;
nema_shaft_r = 2.5;

rod_r = 9.2/2;
screw_r = 3.2/2;
tension_screw_r = 4;
tension_screw_bolt_r = 8;
tension_screw_bolt_h = 6;
tensioner_lip = 2;

thin_wall_width = 3;
rod_wall_width = rod_r * 2 + 8;

z_wall_xy = 14;

z_box_x = rod_wall_width + z_wall_xy + nema_xy +thin_wall_width;
z_box_y = rod_wall_width + nema_xy + rod_wall_width;
z_box_z = nema_z + thin_wall_width + 3;



rod_x_1_height = rod_r + z_box_z/6;
rod_x_2_height = rod_r + (z_box_z/6) *3;
rod_y_1_height = rod_r + (z_box_z/6) * 2;
rod_y_2_height = rod_r + (z_box_z/6) * 4;

z_drive_x = rod_wall_width + z_wall_xy +nema_xy/2;
z_drive_y = rod_wall_width + nema_xy/2;

