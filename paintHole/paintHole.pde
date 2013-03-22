ParticleSystem particles;

void setup(){
  size(800,800);
  background(0);
  fill(0);
  frameRate(60);
  float rad = 200.0;
  particles = new ParticleSystem();
  for(int i=0;i<100;i++){
    particles.addParticle(new PVector(width/2+rad*cos(i),height/2+rad*sin(i)), new PVector(0,0));
  }
}

void draw(){
  //background(255);
  fill(0,0,0,1);
  rect(0,0,width,height);
  particles.update();
  particles.render();
  particles.interact();
  particles.edges();
}


