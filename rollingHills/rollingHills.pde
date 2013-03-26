float time = 0.0;
float size = 10;

void setup() {
  size(800, 500);
  rectMode(CENTER);
  background(255);
  fill(255);
  translate(0, 0);
  stroke(80,25,50,40);
  background(255);
  for (int j=0;j<100;j++) {
    //fill(100, 200*random(0,1), 120, 10);
    pushMatrix();
    translate(0,50*j);
    for (int i=0;i<1000;i++) {
      size = 30+200*noise(20+time,0.2*j);
      pushMatrix();
      translate(i,200*(noise(time,0.2*j)-0.5));
      
      //rotate(time);
      ellipse(-10, -10, size, size);
      popMatrix();
      time += 0.002;
    }
    popMatrix();
    time = 0;
  }
  

}



