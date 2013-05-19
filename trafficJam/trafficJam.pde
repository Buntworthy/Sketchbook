ArrayList cars;
float time = 0;

void setup(){
  size(1000,1000);
  background(0);
  fill(10,230,150);
  noStroke();
  cars = new ArrayList();
  for(int i=0;i<200;i++){
    Car c = new Car(100+4*i,1);
    cars.add(c);
  }
}

void draw(){
  time++;
  //background(255);
  for(int i=0;i<cars.size()-1;i++){
      Car p = (Car) cars.get(i);
      Car p2 = (Car) cars.get(i+1);
      p.interact(p2);
      p.update();
      p.render();
  }
}

void keyPressed(){
  saveFrame();
}
