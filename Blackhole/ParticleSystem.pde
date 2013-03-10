class ParticleSystem{
  ArrayList particles;
  
  ParticleSystem(){
    particles = new ArrayList();
  }
  
  void addParticle(){
    PVector stPos = new PVector();
    Particle p = new Particle(new PVector(random(0,800),random(0,400)),new PVector(random(-1,1),random(-1,1)));
    particles.add(p);
  }
  
  void addParticle(Particle p_){
    particles.add(p_);
  }
  
  void removeParticle(){
  }  
  
  void update(){
    for(int i=particles.size()-1;i>=0;i--){
      Particle p = (Particle) particles.get(i);
      p.update();
    }
  }
  
  void render(){
    for(int i=particles.size()-1;i>=0;i--){
      Particle p = (Particle) particles.get(i);
      p.render();
    }
  }
  
  void blackhole(){
    for(int i=particles.size()-1;i>=0;i--){
      Particle p = (Particle) particles.get(i);
      PVector f = new PVector(width/2,height/2);
      f.sub(p.pos);
      f.mult(0.01);
      p.applyForce(f);
    }
  }
}
