/*
    KetaiSensorManagerExample1:  A simple example on using the android sensors through
 the KetaiSensorManager.
 */

import edu.uic.ketai.inputService.*; 
import android.content.pm.ActivityInfo; 
import java.text.NumberFormat; 
import java.text.DecimalFormat;

PFont font; 
KetaiSensorManager sensorManager; 
PVector orientation, magneticField, accelerometer;

void setup() {
  setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_PORTRAIT); 
  font = loadFont("font.vlw"); 
  sensorManager = new KetaiSensorManager(this); 
  textFont(font, 36);
  orientation = new PVector(); 
  accelerometer = new PVector(); 
  magneticField = new PVector();
  
  sensorManager.start();
}

void draw() {
  background(200); 
  text("Orientation data:\n" + nfp(orientation.x, 3, 2) + "\n" + nfp(orientation.y, 3, 2) + "\n" + nfp(orientation.z, 3, 2), 30, 50); 
  text("Accelerometer data:\n" + nfp(accelerometer.x, 2, 2) + "\n" + nfp(accelerometer.y, 2, 2) + "\n" + nfp(accelerometer.z, 2, 2), 30, 250); 
  text("MagneticField data:\n" + nfp(magneticField.x, 3, 2) + "\n" + nfp(magneticField.y, 3, 2) + "\n" + nfp(magneticField.z, 3, 2), 30, 450);
}

void onOrientationSensorEvent(long time, int accuracy, float x, float y, float z) {
  orientation.set(x,y,z);
}

void onAccelerometerSensorEvent(long time, int accuracy, float x, float y, float z) {
  accelerometer.set(x,y,z);
}

void onMagneticFieldSensorEvent(long time, int accuracy, float x, float y, float z) {
  magneticField.set(x,y,z);
}


public void mousePressed() { 
  if(sensorManager.isStarted())
    sensorManager.stop(); 
  else
    sensorManager.start(); 
  println("SensorManager isStarted: " + sensorManager.isStarted());
}
