//-- arm1.scad by AndrewBCN - November 2014
//-- remix of thing #154834
//-- replaces Brazo.stl with slightly stronger part
//-- and with source file.
//-- GPL V3


arm_th=3;
arm_len=20;
arm_wi=7;
arm_gap=3;
$fn=32;


hole_height = arm_wi + 3;
bracket_length = hole_height + 2.5;
bracket_width = 5;


module arm(){
  difference() {
    // arm
    union() {
      //arm
      translate([arm_len/2,0,arm_th/2]) cube([arm_len,arm_wi,arm_th], center=true);
      //hole
      translate([0,0,arm_th/2]) cylinder(r=arm_wi/2, h=arm_th, center=true);
    }
    // holes
    cylinder(r=3.4/2, h=3*arm_th, center=true);
    //translate([arm_len,0,0]) cylinder(r=3.4/2, h=3*arm_th, center=true);
  }
}

module bracket(){
  difference(){
    cube([bracket_length,10,3]);
    translate([hole_height,5,0]) cylinder(r=3.4/2, h=3*arm_th, center=true);
  }
}

union(){
  translate([0,-2,0]){
    rotate([90,0,0]) arm();
  }

  translate([0,2,0]){
    rotate([270,0,0]) arm();
  }

  translate([arm_len,bracket_width * -1,arm_wi / -2]) {
    rotate([0,270,0]){
      bracket();
    }
  }
}

//bracket();
