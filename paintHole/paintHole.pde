ParticleSystem particles;

void setup(){
  size(800,800);
  background(255);
  fill(0);
  frameRate(60);
  float rad = 100.0;
  particles = new ParticleSystem();
  for(int i=0;i<1000;i++){
    particles.addParticle(new PVector(width/2+rad*cos(i),height/2+rad*sin(i)), new PVector(0,0));
  }
}

void draw(){
  //background(255);
  //fill(255,255,255,1);
  //rect(0,0,width,height);
  particles.update();
  particles.render();
  particles.interact();
  particles.edges();
}


