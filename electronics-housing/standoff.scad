include <lib/box.scad>

// Arduino Mega mounting holes are at [0,0],[81.5,0],[1,48],[75,48]
bl = [0,0,0]; //bottomleft
br = [81.5,0,0]; //bottomright
tl = [1,48,0]; //topleft
tr = [75,48,0]; //topright

standoff_height = 5;

//box();

//translate([-xy/2 + 10.5, -8,0]) frame();
frame();

module frame(){
  w = 3;
  arduino_points = [
    [bl[0],bl[1]], //0
    [br[0],br[1]], //1
    [tr[0],tr[1]], //2
    [tl[0],tl[1]], //3
    [bl[0]+w,bl[1]+w], //4
    [br[0]-w,br[1]+w], //5
    [tr[0]-w,tr[1]-w], //6
    [tl[0]+w,tl[1]-w]  //7
  ];

  anchor_points = [
    [0,-6],
    [0,-22],
    [35,-33],
    [35,-18],
    [20,-13],
    [20,-6]
  ];

  union(){
    translate(bl) standoff();
    translate(br) standoff();
    translate(tl) standoff();
    translate(tr) standoff();

    linear_extrude(height=2){
      polygon(arduino_points, paths=[[0,1,2,3], [4,5,6,7]], convexity=10);
    }

    translate([0,-6,0]) cube([20,6,3]);
    translate([0,-6,0]) cube([20,2,9]);

    translate([0,0,7]){
      linear_extrude(height=2){
        polygon(anchor_points, paths=[[0,1,2,3,4,5]]);
      }
    }
  }
}


module standoff(coordiantes){
  difference(){
    cylinder(r=3, h=standoff_height);
    cylinder(r=1.5,h=standoff_height);
  }
}

