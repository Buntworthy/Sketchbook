/*
    KetaiSensorManagerExample0:  A simple example on using the android accelerometer through
                                  the KetaiSensorManager.
*/

import edu.uic.ketai.*; 
import edu.uic.ketai.inputService.*; 
import edu.uic.ketai.data.*; 
import edu.uic.ketai.analyzer.*; 
import android.content.pm.ActivityInfo; 


PFont font; 
KetaiSensorManager sensorManager; 
float accelerometerX, accelerometerY, accelerometerZ;

void setup() {
  //Lets lock the orientation so we do not restart on orientation changes
  setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_PORTRAIT); 
  font = loadFont("font.vlw"); 
  textFont(font, 48); 
  
  //create the SensorManager and start collecting dta.
  sensorManager = new KetaiSensorManager(this);
  sensorManager.start();
}

void draw() {
  background(200); 
  
  //Lets draw our data
  text("Accelerometer data:\n" + (nfp(accelerometerX, 2, 2)) + "\n" + nfp(accelerometerY, 2, 2) + "\n" + nfp(accelerometerZ, 2, 2), 30, 50);
}

//This is the callback method where are values are delivered by the sensorManager
void onAccelerometerSensorEvent(long time, int accuracy, float x, float y, float z) {
  accelerometerX = x; 
  accelerometerY = y; 
  accelerometerZ = z;
}

//Toggle the sensorManager by pressing on the screen
public void mousePressed() { 
  if(sensorManager.isStarted())
    sensorManager.stop(); 
  else
    sensorManager.start(); 
  println("SensorManager isStarted: " + sensorManager.isStarted());
}

