$fn=100;

if($preview){
  translate([0,100,0])torii();
  translate([0,-100,0])street();
}else{
  // Put parts for 3D printing here and press F6
  $fn=300;
  cutter(1,140,-30);
}

// Assemblies
// Streetlamp style stand
module street(){
  color("Gainsboro")translate([0,0,200])rotate([-7,0,0])rolfstorp();
  for(i=[-1:2:1]){
    color("DarkOliveGreen")translate([140*i,0,0])street_stand();
  }
}

// Torii style stand
module torii(){
  color("Gainsboro")translate([0,0,120])rolfstorp();
  for(i=[-1:2:1]){
    color("MediumVioletRed")translate([140*i,0,0])torii_stand();
  }
}

// Helper
// 3D print splitter
module cutter(side=0,cuth=0,cuta=0){
  difference(){
  street_stand();
    union(){
      translate([0,0,cuth])rotate([cuta+180*side,0,0])translate([-500/2,-500/2,0])cube([500,500,500]);
    }
    translate([-12/2,40+5/2,cuth-30])rotate([cuta+180*side,0,0])translate([0,5,-5-9.5*side])cube([12,5,10]);
  }
  translate([-12/2,40+5/2,cuth-30])rotate([cuta+180*side,0,0])translate([0,-10,4.5-9.5*side])cube([12,5,10]);
}

// Parts
// Steetlamp style
module street_stand(){
  t=12;
  h=200;
  difference(){
    union(){
      // upper body
      hull(){
        translate([0,0,h+15/2])rotate([-7,0,0])translate([0,0,15])cube([t,40,15],center=true);
        translate([0,0,h+15/2])rotate([-7,0,0])translate([0,-20,7.5])cylinder(d=t,h=15);
        translate([0,0,h+15/2])rotate([-7,0,0])translate([0,40/2+15/2,15])rotate([-45,0,0])cube([t,15,15],center=true);
      }
      // neck
      hull(){
        translate([0,0,h+15/2])rotate([-7,0,0])translate([0,40/2+15/2,15])rotate([-45,0,0])cube([t,15,15],center=true);
        translate([0,60,10/2])cube([t,25,10],center=true);
      }
      hull(){
        translate([0,-5,0])cylinder(d=t,h=10);
        translate([0,80,0])cylinder(d=t,h=10);
      }
    }union(){
      // upper body cutout
      translate([0,0,h])rotate([-7,0,0])union(){
        translate([0,0,24/2])cube([t+2,28,24.1],center=true);
        translate([0,0,-2/2+24])cube([t+2,30.3,2.3],center=true);
      }
      for(i=[-1:2:1]){
        translate([0,i*177/2+10*i,14/2+h+15+5])rotate([i*-10,0,0])cube([t+2,20,32],center=true);
      }
    }
  }
}

// Torii style
module torii_stand(){
  t=25;
  h=120;
  difference(){
    union(){
      // upper body
      translate([0,0,8/2+h])cube([t,170,8],center=true);
      translate([0,0,14/2+h+15])cube([t,170,14],center=true);
      for(i=[-1:2:1]){
        translate([0,i*65/2+22*i,14/2+h+15+5])rotate([i*5,0,0])cube([t,90,10],center=true);
        translate([0,17*i,h+11.5])cube([t,6,9],center=true);
      }
      translate([0,0,14/2+h+15])cube([t,200,14],center=true);
      // stands
      for(i=[-1:2:1]){
        translate([0,55*i,(h+15)/2])cube([t,12,h+15],center=true);
        translate([0,55*i,8/2])cube([t,36,8],center=true);
      }
    }union(){
      // upper body cutout
      translate([0,0,24/2+h])cube([t+2,28,24.1],center=true);
      translate([0,0,-2/2+h+24])cube([t+2,30.1,2.1],center=true);
      for(i=[-1:2:1]){
        translate([0,i*177/2+10*i,14/2+h+15+5])rotate([i*-10,0,0])cube([t+2,20,32],center=true);
      }
    }
  }
}

// Lamp
module rolfstorp(){
  intersection(){
    union(){
      // body
      translate([0,0,24/2])cube([340,27.5,24],center=true);
      for(i=[-1:2:1]){
        translate([i*340/2,0,0])cylinder(d=27.5,h=24);
      }
      //rim
      translate([0,0,24-2/2])cube([340,30,2],center=true);
      for(i=[-1:2:1]){
        translate([i*340/2,0,24-2])cylinder(d=30,h=2);
      }
    }
    translate([8,0,24/2])cube([380,32,32],center=true);
    }
}
