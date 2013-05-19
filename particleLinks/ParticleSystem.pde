class ParticleSystem{
  ArrayList particles;
  float attraction = 0.5;
  float repulsion = -10;
  float attraction_range = 100;
  float repulsion_range = 20;
  
  ParticleSystem(){
    particles = new ArrayList();
  }
  
  void addParticle(){
    Particle p = new Particle(new Vec2D(random(100,300),random(100,300)),new Vec2D(random(-0.1,0.1),random(-0.1,0.1)));
    particles.add(p);
  }
  
  void addParticle(Particle p_){
    
    particles.add(p_);
  }
  
  
  void update(){
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
      Particle q1 = (Particle) particles.get(i);
      for(int j=particles.size()-1;j>=0;j--){
          Particle q2 = (Particle) particles.get(j);
          float sqdist = q2.pos.distanceToSquared(q1.pos);
          if ((sqdist < repulsion_range) && (sqdist > 1)){
            q1.applyForce(q2.pos.sub(q1.pos).scale(repulsion/sqdist));
            q2.applyForce(q1.pos.sub(q2.pos).scale(repulsion/sqdist));
            //stroke(255,0,0);
            //line(q1.pos.x,q1.pos.y,q2.pos.x,q2.pos.y);
          } if ((sqdist>repulsion_range) && (sqdist<repulsion_range+10)){
            q1.applyForce(q2.speed.normalize().scale(1));
          } if ((sqdist>repulsion_range) && (sqdist<attraction_range)){
            q1.applyForce(q2.pos.sub(q1.pos).scale(attraction/sqdist));
            q2.applyForce(q1.pos.sub(q2.pos).scale(attraction/sqdist));
            stroke(0,0,255,10);
            line(q1.pos.x,q1.pos.y,q2.pos.x,q2.pos.y);
          }
        }
        if (q1.pos.distanceToSquared(new Vec2D(mouseX,mouseY)) < 1000){
          q1.applyForce(q1.pos.sub(new Vec2D(mouseX,mouseY)).scale(-0.2));
        }
    }
  }
  
  
}
