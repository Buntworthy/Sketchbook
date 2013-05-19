float step = 8.0;
float r = 2.0;
float t = 0;

void setup(){
  size(400,400);
  background(255);
  stroke(0);
  smooth();
  //translate(width/2,0);
  //rotate(PI/4);
  strokeWeight(3);
}
void draw(){
  background(255);
    stroke(0,0,255);
    for (int j=0;j<101;j++){
    beginShape();
    curveVertex(step*j,0);
    curveVertex(step*j,0);
    for (int i=1;i<10;i++){
      float pos = step*float(j)+r*noise(0.1*i,0.1*j,t+200);
//float pos = 0.01*mouseX*step*j;
      curveVertex(pos,40*float(i));
      if(i==1 && j ==1) {println(pos);}
    }
    curveVertex(step*j,400);
    curveVertex(step*j,400);
    endShape();
  }
  
    stroke(0,255,0);
    for (int j=0;j<101;j++){
    beginShape();
    curveVertex(step*j,0);
    curveVertex(step*j,0);
    for (int i=1;i<10;i++){
      float pos = step*float(j)+r*noise(0.1*i,0.1*j,t+380);
//float pos = 0.01*mouseX*step*j;
      curveVertex(pos,40*float(i));
      if(i==1 && j ==1) {println(pos);}
    }
    curveVertex(step*j,400);
    curveVertex(step*j,400);
    endShape();
  }
  
  stroke(255,0,0);
    for (int j=0;j<101;j++){
    beginShape();
    curveVertex(step*j,0);
    curveVertex(step*j,0);
    for (int i=1;i<10;i++){
      float pos = step*float(j)+r*noise(0.1*i,0.1*j,t+100);
//float pos = 0.01*mouseX*step*j;
      curveVertex(pos,40*float(i));
      if(i==1 && j ==1) {println(pos);}
    }
    curveVertex(step*j,400);
    curveVertex(step*j,400);
    endShape();
  }
  
  stroke(0);
  for (int j=0;j<101;j++){
    beginShape();
    curveVertex(step*j,0);
    curveVertex(step*j,0);
    for (int i=1;i<10;i++){
      float pos = step*float(j)+r*noise(0.1*i,0.1*j,t);
//float pos = 0.01*mouseX*step*j;
      curveVertex(pos,40*float(i));
      if(i==1 && j ==1) {println(pos);}
    }
    curveVertex(step*j,400);
    curveVertex(step*j,400);
    endShape();
  }
  t+=0.001;
}
