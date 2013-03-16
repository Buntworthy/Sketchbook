void setup(){
  size(800,500);
  background(255);
  fill(100,10);
  translate(0,0);
}

void draw(){
  background(255);
  for (int j=0;j<100;j++){
    for (int i=0;i<100;i++){
      pushMatrix();
      translate(10*i,10*j);
      rotate(i*0.0005*mouseX);
      rect(-5,-5,10,10);
      popMatrix();
    }
  }
}
