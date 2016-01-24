include <lib/components/screw.scad>

$fn=32;

//39.5 x 16.3
//16.8 and 3.2
bed_x = 39.5 + 5;
bed_y = 3;
bed_z = 16.3;

bracket_z = 13.3;

rod_center = [-12,-3,0];


difference(){
  union(){
    bracket();
    translate([-10 - 12, -8, 0]) clip();
  }
  translate(rod_center){
    rod();
  }


  //bracket holders
  translate([0,0, bracket_z/2]){
    translate([-19,-2,0]){
      rotate([270,0,0]){
        screw(13);
      }
    }
    translate([-6,-2,0]){
      rotate([270,0,0]){
        screw(13);
      }
    }

  }

  //endstop holders
  translate([0,0, bed_z - 3.2]){
    translate([16.8,0,0]){
      rotate([270,0,0]){
        screw(13);
      }
    }
    translate([bed_x - 3.2,0,0]){
      rotate([270,0,0]){
        screw(13);
      }
    }
  }

}



module clip(){
  cube([19,5,bracket_z]);
}

module bracket(){
  union(){
    linear_extrude(height=bracket_z){
      hull(){
        square([1, bed_y]);
        translate([-8,-2]){
          square(5);
        }
      }
    } 
    translate([-10 - 12,-2,0]){
      cube([14,5, bracket_z ]);
    }

    minkowski(){
      cube([bed_x, bed_y, bed_z]);
      translate([0,0,bed_z]){
        rotate([90,0,0]) cylinder(r=2);
      }
    }
  }
}

module rod(){
  cylinder(r=4, h=bed_z);
}
