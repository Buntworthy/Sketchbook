float time = 0.0;
float size = 10;

void setup() {
  size(800, 500);
  rectMode(CENTER);
  background(255);
  fill(100, 200, 120, 20);
  translate(0, 0);
  stroke(80,25,50,40);
  background(255);
  for (int j=0;j<100;j++) {
    fill(100, 200*random(0,1), 120, 10);
    pushMatrix();
    translate(0,50*j);
    for (int i=0;i<250;i++) {
      size = random(10,50);
      translate(random(1,10),0);
      pushMatrix();
      rotate(time);
      rect(-10, -10, size, size);
      popMatrix();
      time += random(-0.1,0.1);
    }
    popMatrix();
    time = 0;
  }
  

}

void draw(){
}

void keyPressed() {
  if (key == 's') {
    save("screen.tif");
  }
}



