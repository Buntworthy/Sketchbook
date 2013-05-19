class Car{
  float pos, speed, speedTarget;
  float distance = 1;
  float rndm = 0.02;
  color c;
  
  Car(float pos_, float speed_){
    pos = pos_;
    speed = speed_;
    speedTarget = speed_;
    c = color(100,pos%300,200);
  }
  
  void update(){
    pos += speed;
    if (pos>width){
      pos -= width;
    }
    speedTarget += random(-rndm,rndm);
  }
  
  void interact(Car c){
    if (abs(c.pos - this.pos) < distance){
      speed = 0.8*speed;
    } else {
      speed = speedTarget;
    }
  }
  
  void render(){
//    fill(10,230,150,50);
    fill(c);
    ellipse(pos,time,2,2);
//    fill(10,230,150,50);
//    ellipse(pos,time,4,4);
//    fill(10,230,150,10);
//    ellipse(pos,time,10,10);
  }
}
