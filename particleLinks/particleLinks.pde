import processing.opengl.*;
import toxi.geom.*; 
import toxi.geom.mesh2d.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.processing.*;

ParticleSystem particles;

void setup(){
  size(400,400,OPENGL);
  background(255);
  fill(0);
  particles = new ParticleSystem();
  for(int i=0;i<200;i++){
    particles.addParticle();
  }
}

void draw(){
  //background(255);
  //fill(255,10);
  //rect(0,0,width,height);
  particles.update();
  particles.render();
  particles.interact();
  //saveFrame();
}

void mouseDragged(){
  Particle p = new Particle(new Vec2D(mouseX,mouseY),new Vec2D(0,0));
  particles.addParticle(p);
}
