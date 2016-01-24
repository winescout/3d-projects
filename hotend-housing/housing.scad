include <e3d_v6_all_metall_hotend.scad>
include <fan_duct_v2.scad>
//include <arm1.scad>

shell_x = 30;
shell_y = 40;
shell_height = 45;
fin_radius=12.15;

fan_size = 40;

shell();
rotate([0,180,90]) e3d(fin_radius);
//fan_hinge();

module shell(){
  difference(){
    translate([-shell_x/2,-shell_y/2,-shell_height-.1]){
      left_shell();
      right_shell();
     }

    rotate([0,180,90]) e3d(fin_radius);
  }

}

module left_shell(){
  difference(){
    cube([shell_x/2,shell_y,shell_height]);
    fin_box();
  }
}

module right_shell(){
  /*difference(){*/
    /*translate([shell_x/2,0,0]) */
      /*cube([shell_x /2,shell_y,shell_height]);*/

    /*fin_box();*/
  /*}*/
  translate([shell_x + fan_size/2 + 10,0,shell_height-19])
    rotate([205,0,90])
      duct(fan_size);

}

module fan_hinge(){
  difference() {
    // arm
    union() {
      //arm
      cube([10,7,3], center=true);
      //hole
      translate([0,0,arm_th/2]) cylinder(r=arm_wi/2, h=arm_th, center=true);
    }
  }
}

module fin_box(){
  translate([shell_x/2,15,shell_height/2 - 19])
    cube([fin_radius *2 - 3, shell_y + 2, shell_height - 4], center=true);
}
