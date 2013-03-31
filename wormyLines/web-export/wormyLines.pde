float r = 4;
float s = 10.0;
float t = 0;
PVector[] pos = new PVector[1000];

void setup(){
  size(500,500);
  background(100,125,220);
  noStroke();
  for (int j=0;j<10;j++){
    float posx = random(0,width);
    float posy = random(0,height);
    for (int i=0;i<1000;i++){
      fill(0,10);
      pos[i] = new PVector();
      posx += r*(noise(0.1*(-i+100*j))-0.5);
      posy += r*(noise(j,0.1*i)-0.5);
      pos[i].set(posx,posy,0);
      
      ellipse(pos[i].x,pos[i].y,1.5*s,1.5*s);
      fill(100,50,251);
      ellipse(pos[i].x,pos[i].y,s,s);
    }
  }
}

void draw(){
}

void mousePressed(){
  setup();
}

