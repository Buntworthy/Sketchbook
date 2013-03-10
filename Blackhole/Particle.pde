class Particle{
  PVector pos;
  PVector speed;
  PVector force;
  float mass;
  float drag;
  int age;
  int state;
  color myColor;
  
  Particle(PVector pos_, PVector speed_){
    pos = pos_;
    speed = speed_;
    force = new PVector(0,0);
    mass = 100;
    drag = 1;
    age = 0;

    state = 1;
    myColor = color(random(0,255),random(0,255),random(0,255));

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
      ellipse(pos.x,pos.y,3,3);
  }
  
  void applyForce(PVector force_){
    force.add(force_);
  }
}
