class Particle{
  Vec2D pos;
  Vec2D speed;
  Vec2D force;
  float mass = 0.1;
  float drag = 0.99;
  
  Particle(Vec2D pos_, Vec2D speed_){
    pos = pos_;
    speed = speed_;
    force = new Vec2D(0,0);
  }
  
  void update(){
    Vec2D accl = force.scale(mass);
    speed = speed.add(accl);
    force = new Vec2D(0,0);
    speed = speed.scale(drag);
    pos = pos.add(speed);
  }
  
  void render(){
    stroke(0,0,0);
    fill(0,0,0);
    //ellipse(pos.x,pos.y,2,2);
  }
  
  void applyForce(Vec2D force_){
    force = force.add(force_);
  }
}
