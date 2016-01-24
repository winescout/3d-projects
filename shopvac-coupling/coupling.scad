//hose: 47 z, 52.5 diameter
//attachments: 44 z, 44.5 diameter
$fn=64;

hose_z = 27;
hose_radius = 53.2/2;

lip_z = 2;
lip_radius = hose_radius + 2;

attachment_z = 36;
attachment_radius = 45.5/2;

wall_thickness = 2.5;

translate([0,0,hose_z/2 + lip_z/2]) lip();
translate([0,0,hose_z/2 + attachment_z/2 + lip_z/2]) attachment();
hose();

module attachment(){
  difference(){
    cylinder(r=attachment_radius, h=attachment_z, center=true);
    cylinder(r=attachment_radius - wall_thickness/2, h=attachment_z, center=true);
  }
}

module hose(){
  difference(){
    cylinder(r=hose_radius, h=hose_z, center=true);
    cylinder(r=attachment_radius - wall_thickness/2, h=hose_z, center=true);
  }
}

module lip(){
  difference(){
    cylinder(r=lip_radius, h=lip_z, center=true);
    cylinder(r=attachment_radius - wall_thickness/2, h=hose_z, center=true);
  }
}
