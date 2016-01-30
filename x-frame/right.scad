//6mm plate
//9mm rod

$fn=32;

rod_radius = 9 / 2;
z_rod_radius = 4.1;
screw_radius = 2.1;
screw_head_radius= 3.5;
bracket_radius = 30 / 2;
bracket_z = 14;


bracket();

module bracket(){
  difference(){
    cylinder(r=bracket_radius, h=bracket_z, center=true);
    translate([0,-5,0])
      screw_hole();   
    translate([0,4,0])
      rotate([0,90,0]) rod();

    translate([12,4,0])
      cube([6,40,bracket_z], center=true);
    translate([-12,4,0])
      cube([6,40,bracket_z], center=true);

  }
}

module screw_hole(){
  translate([0,0,2+3])
    cylinder(r=screw_head_radius, h=4, center=true);
  translate([0,0,0])
    cylinder(r=screw_radius, h=6, center=true);
  translate([0,0,-5])
    cylinder(r=z_rod_radius, h=4, center=true);
}

module rod(){
  cylinder(r=rod_radius, h=30, center=true);
}
