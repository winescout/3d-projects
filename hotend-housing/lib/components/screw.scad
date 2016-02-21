module screw(length, pad, recess){
  pad = pad ? pad : 0;
  recess = recess ? recess : 0;
  union(){
    cylinder(r=1.6, h=length + pad, center=true);
    translate([0,0,(length)/2 - 1.5]){
      cylinder(r=2.75, h=3,$fn=6, center=true);
    }
    translate([0,0,-(length)/2 + 1.5 - recess/2]){
      cylinder(r=2.75, h=3.2 + recess, center=true);
    }
  }
}


