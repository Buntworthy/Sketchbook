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
