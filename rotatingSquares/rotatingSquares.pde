float time = 0.0;
float size = 15;
float[][] d = new float[100][100];
boolean toFile = true;
boolean noSkip = true;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  background(255);
  fill(255);
  //translate(0, 0);
  strokeWeight(2);
  stroke(0);
  smooth();
  for (int j=0;j<100;j++) {
    for (int i=0;i<100;i++) {
      d[j][i] = 0.0;
    }
  }
}
void draw() {
  background(255);
  for (int j=0;j<100;j++) {
    pushMatrix();
    translate(0, 20*j);
    for (int i=0;i<100;i++) {
      pushMatrix();
      //rotate(time+0.1*i+0.1*j+noise(0.1*i,10+0.1*j,time));
      d[j][i] += 0.1*sin(i+0.5*time);
      d[j][i] += 0.1*sin(j+0.5*time);
      rotate(time+0.1*d[j][i]);
      rect(0, 0, size, size);
      popMatrix();
      translate(20, 0);
    }
    popMatrix();
  }
  time+=0.1;
  if (toFile && noSkip) {saveFrame();}
  noSkip = !noSkip;
  if (time == 7){
    toFile = false;
  }
}

