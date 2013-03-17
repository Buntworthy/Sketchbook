ParticleSystem particles;

void setup(){
  size(800,400);
  background(255);
  fill(0);
  frameRate(60);
  particles = new ParticleSystem();
  for(int i=0;i<50;i++){
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


class Interaction{
  float range_min, range_max;
  int interaction_rule;
  float coeff;
  
  Interaction(float coeff_, float range_min_, float range_max_){
    coeff = coeff_;   
    range_min = range_min_;
    range_max = range_max_; 
  }
  
  void interact(Particle me, Particle them){
    PVector mePos = me.pos;
    PVector themPos = them.pos;
    PVector temp1 = PVector.sub(mePos,themPos); 
    float sqdist = temp1.mag();
    if ((sqdist < range_max) && (sqdist > range_min)){
      PVector temp = PVector.sub(themPos,mePos);
      PVector force = PVector.mult(temp,coeff/sqdist);
      me.applyForce(force);
      stroke(0,255,0);
      //line(me.pos.x,me.pos.y,them.pos.x,them.pos.y);
    }
  }
}
class Particle{
  ArrayList interactions;
  PVector pos;
  PVector speed;
  PVector force;
  float mass;
  float drag;
  int age;
  boolean drawme;
  int state;
  color myColor;
  
  Particle(PVector pos_, PVector speed_){
    pos = pos_;
    speed = speed_;
    force = new PVector(0,0);
    mass = 100;
    drag = 0.99;
    age = 0;
    drawme = true;
    state = 1;
    myColor = color(random(0,255),random(0,255),random(0,255));
    
    interactions = new ArrayList();
    Interaction myInteraction = new Interaction(-100,5,50);
    interactions.add(myInteraction);
    Interaction myInteraction2 = new Interaction(2,50,100);
    interactions.add(myInteraction2);

  }
  
  void update(){
    PVector accl = PVector.mult(force,(1/mass));
    speed.add(accl);
    force = new PVector(0,0);
    speed.mult(drag);
    pos.add(speed);
    //force.add(new PVector(0,1));
    age++;
  }
  
  void render(){
    noStroke();
    fill(myColor);
    //fill(color(255*noise(pos.x*0.01,pos.y*0.01+(0.001*age)),0,255*speed.heading()));
    //fill(color(255*noise(pos.x*0.01,pos.y*0.01+(0.001*age)),0,255*speed.mag()));
    if(drawme){
    ellipse(pos.x,pos.y,3,3);
    }
  }
  
  void applyForce(PVector force_){
    force.add(force_);
    
  }
  
}
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

