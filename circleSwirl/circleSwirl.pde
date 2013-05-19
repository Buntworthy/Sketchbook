float time = 0.0;

void setup(){
  size(500,500);
  background(255);
  //smooth();
  strokeWeight(2);
  noFill();
  stroke(100,200,10);

}

void draw(){
  translate(width/2,height/2);
  rotate(time);
  translate(-width/2,-height/2);
  background(255);
    for (int i=0;i<100;i++){
    pushMatrix();
    translate(10*sin(0.3*i),10*cos(0.3*i));
    ellipse(width/2,height/2,9*i,9*i);
    popMatrix();
  }
  time+=0.1;
}
void keyPressed() {
  if (key == 's') {
    save("screen.tif");
  }

  if (key == 'r') {
    setup();
  }
}
