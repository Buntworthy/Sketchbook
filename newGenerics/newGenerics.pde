//import processing.opengl.*;
//import toxi.geom.*; 
//import toxi.geom.mesh2d.*;
//import toxi.util.*;
//import toxi.util.datatypes.*;
//import toxi.processing.*;

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


