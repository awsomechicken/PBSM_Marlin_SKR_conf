// printrbot simple metal adapter to mount BTT SKR Mini controller

adapter();
//opz();
//keystone();

module adapter(){
  $fn=64;
  // printrboard mounting holes
  H = 4.5;
  bo=6; // board offset
  difference(){
    hull()for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([93*i,53.5*j,0])
      cylinder(d=8,h=H);
    hull()for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([93*i,53.5*j,-.5])
      cylinder(d=2,h=H+1);
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([93*i,53.5*j,-.5])
      cylinder(d=4.6,h=H+1);
    translate([0,bo,-.5]) skrmini_footprint(D=3,H=H+1);
  }
  difference(){
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([93*i,53.5*j,0])
      cylinder(d=8,h=H);
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([93*i,53.5*j,-.5])
      cylinder(d=4.6,h=H+1);
  }
  translate([0,bo]) difference(){
    intersection(){
      union(){
        dd = 8;
        skrmini_footprint(D=dd,H=H);
        hull(){
          translate([-50+1.5,34.75-2.54]) cylinder(d=dd,h=H);
          translate([-46.5,21.25]) cylinder(d=dd,h=H);
        }
      }
      translate([0,4.25-.5,0]) cube([110,80,H+10],center=true);
    }
    translate([0,0,-.5]) skrmini_footprint(D=3,H=H+1);
    translate([93*-.5,21.25-.5,-.5]) cylinder(d=4.6,h=H+1);
  }//*/
}

module skrmini_footprint(D=3,H=4){
  //%cube([100,70.25,1],center=true);
  translate([50-(20.40),-35.125+2.12]) cylinder(d=D,h=H); // between xm and ym
  translate([(17.45)-50,-35.125+2.12]) cylinder(d=D,h=H); // behind the sd slot
  translate([-50+1.5,34.75-2.54]) cylinder(d=D,h=H);
  //translate([-50+1.5,34.75-2.54]) cylinder(d=D,h=H);
  translate([50-2.54,34.75-32.05]) cylinder(d=D,h=H);
}

module opz(){
  $fn=64;
  for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([63*i,42*j,0]) difference(){
    cylinder(d=6,h=5.5,center=true);
    cylinder(d=3,h=6,center=true);
  }
  translate([0,0,-1.75]) difference(){
    cube([66,45,2],center=true);
    cube([61,40,4],center=true);
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([63*i,42*j,0]) cylinder(d=3,h=6,center=true);
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([52*i,31*j,.5]) cylinder(d=8,h=3.1,center=true);
  }
  translate([0,0,-1.75]) difference(){
    cube([50,32,2],center=true);
    cube([45,27,4],center=true);
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([63*i,42*j,0]) cylinder(d=3,h=6,center=true);
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([52*i,31*j,.5]) cylinder(d=8,h=3.1,center=true);
  }
  difference(){
    for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([52*i,31*j,-1.25])
      cylinder(d=14,h=3,center=true);
    #for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([63*i,42*j,-1.75])
      cylinder(d=3,h=6,center=true);
    #for(i=[-.5:1:.5],j=[-.5:1:.5]) translate([52*i,31*j,-1.25])
      cylinder(d=8,h=3.1,center=true);

  }

}

module keystone(){
  $fn=64;
  difference(){
    union(){
      hull() for(i=[-.5:1:.5],j=[-.5:1:.5])
        translate([36*i-19,20*j,-9.5]) cylinder(d=12,h=3);
      hull() for(j=[-.5:1:.5])
        translate([15-16,20*j,-9.5]) cylinder(d=12,h=19+3);
      translate([-39,0,-3.25-.5]) cube([8,12,9.5+2],center=true); // cable mount
    }
    translate([0,0,3]) union(){// keystone body
      cube([10+1,16+1,14.5+1],center=true); // keystone head
      translate([-10,1.5,0]) cube([20,19.75,13+1.5+1],center=true);
      translate([-1,2,0]) cube([4,23,13+1.5+1],center=true); // catch
      translate([-15-2,0,.25]) cube([20+4,22.5+1,19+.5],center=true); // cable termination block
    }
    for(i=[-.5:1:.5],j=[-.5:1:.5])
      translate([36*i-19,20*j,-9.5-.25]) cylinder(d=8,h=3.51);
    for(i=[-.5:1:.5],j=[-.5:1:.5])
      translate([36*i-19,20*j,-9.5+3.25]) cylinder(d1=8,d2=2,h=4,$fn=64);

    translate([-39,0,-5.5]) cube([3.5,20,2],center=true);
    translate([-39,0,3]) rotate([0,90,0]) cylinder(d=7,h=10,center=true);
  }
}
