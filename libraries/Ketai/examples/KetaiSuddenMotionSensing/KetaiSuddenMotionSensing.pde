import edu.uic.ketai.*;
import edu.uic.ketai.inputService.*;
import edu.uic.ketai.data.*;
import edu.uic.ketai.analyzer.*;
import android.content.pm.ActivityInfo;
PFont font;
KetaiSensorManager sensorManager;
PVector accelerometer = new PVector();
PVector pAccelerometer = new PVector();

void setup()
{
  setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
  font = loadFont("font.vlw");
  textFont(font, 36);
  sensorManager = new KetaiSensorManager(this);
  sensorManager.start();
  frameRate(10);
}

void draw()
{
  float delta = degrees(PVector.angleBetween(accelerometer, pAccelerometer));
  // Check degree of acceleration/orientation change, depends on sample and frame rate.
  if (delta > 5) {
    background(0,255,0);
  } 
  else {
    background(200);
  }
  // Raw accelerometer data
  text("Accelerometer data:\n" + (nfp(accelerometer.x, 2, 2)) + "\n" + nfp(accelerometer.y, 2, 2) + "\n" + nfp(accelerometer.z, 2, 2), 30, 50);
  text("Change (degrees):\n"+delta, 30, 300);
  pAccelerometer.set(accelerometer.x, accelerometer.y, accelerometer.z);
}

void onAccelerometerSensorEvent(long time, int accuracy, float x, float y, float z)
{
  // Set PVector for raw accelerometer data
  accelerometer.set(x,y,z);
}

