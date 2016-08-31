r = 0.55;
rframe = 0.6;
Rloop = 1.5;
a = [0,0,15];
b = [12,0,0];
c = [0,-5,0];
d = [0,-8,4];
e = [19,0,13.5];
fineness=20;

intersection() {
  fourarm();
  translate([-50,-50,-0.5]) cube([100,100,100]);
}

translate([0,0,16.5]) rotate(a=90, v=[1,0,0]) hookloop();

module fourarm() {
	biarm();
    scale([-1,1,1]) biarm();
}

module biarm() {
  arm();
  scale([1,-1,1]) arm();
}

module arm() {
  face(a,b,c);
  face(b,c,d);
  face(d,b,e);
}

module face(A,B,C) {
  hull(){
    translate(A) sphere(r,$fn=fineness);
    translate(B) sphere(r,$fn=fineness);
    translate(C) sphere(r,$fn=fineness);
  }
}

module hookloop() {
  rotate_extrude(convexity = 4,$fn=fineness)
    translate([Rloop, 0, 0])
    circle(r = rframe, $fn = fineness);
}
