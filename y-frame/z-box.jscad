function main(){
  var rounded_cube = CSG.roundedCube({ radius: 10, roundradius: 2, resolution: 16 });
  var cube = CSG.cube({radius: [10,10,5]}).translate([0,0,-5]);
  var rounded_top = rounded_cube.subtract(cube);


  return rounded_top;
}
