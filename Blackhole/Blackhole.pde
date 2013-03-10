ParticleSystem particles;

void setup(){
  size(500,500);
  background(255);
  particles = new ParticleSystem();
  for(int i=0;i<200;i++){
    particles.addParticle();
  }
}

void draw(){
  particles.update();
  particles.render();
  particles.blackhole();
}
