import processing.pdf.*;

float r = 20;
int num = 500;



void setup(){
  size(1920,1080);
  background(255);
  //blendMode(ADD);
  noStroke();
  
  translate(-100,-100);
  for (int k=0;k<22;k++){
    translate(100,0);
    pushMatrix();
    for (int j=0;j<12;j++){
      translate(0,100);
      for (int i=0;i<5;i++){
        //rotate(2*PI/100);
        pushMatrix();
        translate(random(-7,7),random(-7,7));
        fill(100,10,random(0,255),50);
        ellipse(0,0,0.9*i*r,0.9*i*r);
        popMatrix();
      }
      
    }
    popMatrix();
  }
  saveFrame();
//  
//  for (int i=0;i<50;i++){
//    rotate(PI/25);
//    fill(10,100,random(0,255),10);
//    ellipse(0,200,100,100);
//  }
}
