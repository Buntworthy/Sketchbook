float r = 100;
int num = 36;

void setup(){
  size(500,500);
  background(255);
  //blendMode(ADD);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  
  translate(width/2,height/2);
  for (int i=0;i<num;i++){
    rotate(2*PI/num);
    //translate(-0.05*i,0);
    fill(i*20%360,50,random(100,255),20);
    ellipse(0,r/2,r,r);
  }
//  
//  for (int i=0;i<50;i++){
//    rotate(PI/25);
//    fill(10,100,random(0,255),10);
//    ellipse(0,200,100,100);
//  }
}
