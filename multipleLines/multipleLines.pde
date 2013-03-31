//PImage img;
float time = 0;
PGraphics img;

void setup(){
  size(500,500);
img = createGraphics(500,500);
background(255);
smooth();
}

void draw(){
  background(255);
  img.beginDraw();
  img.background(255);
  for (int i=5; i<20; i++){
    for (int j=0; j<500; j++){
      img.point(10*i+2*sin(0.1*j+0.5*(time+i*time*0.1)),j);
    }
  }
  img.endDraw();
  time++;
  image(img,0,0);
}
