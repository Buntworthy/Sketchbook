class ParticleSystem{
  ArrayList particles;
  
  ParticleSystem(){
    particles = new ArrayList();
  }
  
  void addParticle(){
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
  
  void interact(){
    for(int i=particles.size()-1;i>=0;i--){
      Particle p = (Particle) particles.get(i);
      for(int j=particles.size()-1;j>=0;j--){
        Particle q = (Particle) particles.get(j);
        for(int k=p.interactions.size()-1;k>=0;k--){
        Interaction myInteraction = (Interaction) p.interactions.get(k);
        myInteraction.interact(p,q);
        //println(myInteraction.range_min);
        }
      }
    }
  }
  
  void edges(){
    for(int i=particles.size()-1;i>=0;i--){
      Particle p = (Particle) particles.get(i);
      if (p.pos.x >=width){
        p.pos.x = width-1;
        p.speed.x = -p.speed.x;
      } else if (p.pos.x <=0) {
        p.pos.x = 1;
        p.speed.x = -p.speed.x;
      }
      if (p.pos.y >=height){
        p.pos.y = height-1;
        p.speed.y = -p.speed.y;
      } else if (p.pos.y <=0) {
        p.pos.y = 1;
        p.speed.y = -p.speed.y;
      }
    }
  }
}
