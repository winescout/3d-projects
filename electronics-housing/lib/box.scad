xy = 113.6;
z = 51.2;
wall_width = 1.8;

//holes
hole_r = 5.9/2; 
hole_1 = [- 21.4, 0, -z /2];
hole_2 = [- 34.5, 0, -z /2];
hole_3 = [21.4, 0, -z /2];
hole_4 = [34.5, 0, -z /2];
hole_5 = [0, -21.4,-z /2];


//box();

module box(){
  scale_factor = (xy - wall_width * 2) / xy;

  echo(z/2 - wall_width);
  translate([0,0,z/2 - wall_width]){
    difference(){
      //shell
      cube([xy,xy,z], center=true);

      //negative space
      translate([0,0,wall_width]){
        difference(){
          scale([scale_factor, (xy - wall_width) / xy]){
            cube([xy,xy,z], center=true);
          }
          rotate([0,0,-27]){
            translate([-13,-38,-z/2 + wall_width]) cube([30,12,7], center=true);
          }
        }
      }

      //raised holes
      translate([-xy/2 + 19.5, -xy/2 + 32.68, -z/2 - wall_width]) cylinder(r=3.75/2, h=100);
      translate([-xy/2 + 35.2, -xy/2 + 25.3, -z/2 - wall_width]) cylinder(r=3.75/2, h=100);
      //screw holes
      translate(hole_1) cylinder(r=hole_r, wall_width);
      translate(hole_2) cylinder(r=hole_r, wall_width);
      translate(hole_3) cylinder(r=hole_r, wall_width);
      translate(hole_4) cylinder(r=hole_r, wall_width);
      translate(hole_5) cylinder(r=hole_r, wall_width);
    }
  }
}
