int w = 10;
int num = 100;
boolean done = true;
float time = 0.0;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  fill(255);
//  for (int k=0;k<width;k++) {
//    for (int j=0;j<height;j++) {
//      color c = color(50*(noise(0.01*j, 0.01*k)+0.5), 10, 50*(noise(0.01*j, 0.01*k)+0.5));
//      set(k, j, c);
//    }
//  }
  noStroke();
}

void draw() {
  background(0);
  translate(0, -height);

  for (int k=0;k<num;k++) {
    translate(-1.3*w, 2.3*w);
    rotate(0.008*1.5*cos(time*0.99));
    pushMatrix();
    for (int j=0;j<num;j++) {
      //rotate(0.02);
      pushMatrix();
      translate(2.3*w*j, 1.3*w*j);
      rotate(0.1*j*6*sin(time));
      rect(0, w, 3*w, w);
      rect(w, 0, w, 3*w);
      popMatrix();
    }
    popMatrix();
  }
  time +=0.002;
}

void keyPressed() {
  if (key == 's') {
    save("screen.tif");
  }

  if (key == 'r') {
    setup();
  }
}


