class ParticleSystem{
  ArrayList particles;
  float radius = 10000;
  
  ParticleSystem(){
    particles = new ArrayList();
  }
  
  void addParticle(PVector pos, PVector speed){
    Particle p = new Particle(pos, speed);
    particles.add(p);
  }
  
//  void addParticle(){
//    Particle p = new Particle(new PVector(random(0,800),random(0,400)),new PVector(random(-1,1),random(-1,1)));
//    particles.add(p);
//  }
  
//  void addParticle(Particle p_){
//    particles.add(p_);
//  }
  
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
      PVector cent = new PVector(width/2,height/2);
      cent.sub(p.pos);
      //PVector temp2 = PVector.mult(temp,0.1);
      float dist = cent.magSq();
      if (dist < radius) {
        PVector rectify = cent;
        rectify.mult(-0.05);
        p.pos.add(rectify);
        cent.rotate(PI/2);
        cent.div(0.01*cent.magSq());
        cent.mult(mouseX);
        p.applyForce(cent);
        //line(width/2,height/2,p.pos.x,p.pos.y);
      } else if (dist < radius + 50000) {
        PVector f = PVector.mult(cent,0.01);
        p.applyForce(f);
        cent.rotate(PI/2);
        cent.div(0.01*cent.magSq());
        cent.mult(1*mouseX);
        p.applyForce(cent);
         
      }

      
//      if (p.pos.x >=width){
//        p.pos.x = width-1;
//        p.speed.x = -p.speed.x;
//      } else if (p.pos.x <=0) {
//        p.pos.x = 1;
//        p.speed.x = -p.speed.x;
//      }
//      if (p.pos.y >=height){
//        p.pos.y = height-1;
//        p.speed.y = -p.speed.y;
//      } else if (p.pos.y <=0) {
//        p.pos.y = 1;
//        p.speed.y = -p.speed.y;
//      }
    }
  }
}
