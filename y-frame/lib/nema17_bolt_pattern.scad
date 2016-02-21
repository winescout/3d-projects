//hole_z = 4;
//nema17_holes(hole_z);

module nema17_holes(hole_z){
  mounting_xy = 15.5;

  translate([0,0,hole_z/2]){
    cylinder(r=11.1, h=hole_z, center=true, $fn=32);
    translate([mounting_xy, 0,0]){
      translate([0,-mounting_xy,0]) cylinder(r=1.6,h=hole_z,center=true, $fn=24);
      translate([0,mounting_xy,0]) cylinder(r=1.6,h=hole_z,center=true, $fn=24);
    }
    translate([-mounting_xy,0,0]){
      translate([0,-mounting_xy,0]) cylinder(r=1.6,h=hole_z,center=true, $fn=24);
      translate([0, mounting_xy,0]) cylinder(r=1.6,h=hole_z,center=true, $fn=24);
    }
  }
}
