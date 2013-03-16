ParticleSystem particles;

void setup(){
  size(800,800);
  background(255);
  fill(0);
  frameRate(60);
  particles = new ParticleSystem();
  for(int i=0;i<100;i++){
    particles.addParticle();
  }
}

void draw(){
  //background(255);
  fill(255,255,255,1);
  rect(0,0,width,height);
  particles.update();
  particles.render();
  particles.interact();
  particles.edges();
}


