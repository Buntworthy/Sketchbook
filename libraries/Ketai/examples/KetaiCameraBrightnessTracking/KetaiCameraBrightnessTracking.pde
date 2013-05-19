/**
 * Brightness Tracking on Android using KetaiCamera
 * by Golan Levin. 
 * 
 * Tracks the brightest pixel in a live video signal. 
 */
import edu.uic.ketai.inputService.*;

KetaiCamera video; 
int numPixels; 
int[] previousFrame;

void setup() { 
  // Prevent Orientation Reset, keep landscape orientation 
  setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE); 
  
  //Create our camera object, this is probably the best parameters
  video = new KetaiCamera(this, 320, 240, 24); 
  numPixels = video.width * video.height; // Create an array to store the previously captured frame 
  previousFrame = new int[numPixels]; 
  video.start();
}

//If we go into the background let's release the camera
void pause()
{
  if(video.isStarted())
    video.stop();
}

void draw() { 
  // Nothing needed...
}

void onCameraPreviewEvent() {
  video.read(); 
  image(video, 0, 0); // Draw the webcam video onto the screen 
  int brightestX = 0; // X-coordinate of the brightest video pixel 
  int brightestY = 0; // Y-coordinate of the brightest video pixel 
  float brightestValue = 0; // Brightness of the brightest video pixel 

  // Search for the brightest pixel: For each row of pixels in the video image and 
  // for each pixel in the yth row, compute each pixel's index in the video 
  video.loadPixels(); 
  int index = 0; 
  for (int y = 0; y < video.height; y++) {
    for (int x = 0; x < video.width; x++) { // Get the color stored in the pixel 
      int pixelValue = video.pixels[index]; // Determine the brightness of the pixel 
      float pixelBrightness = brightness(pixelValue); 
      // If that value is brighter than any previous, then store the 
      // brightness of that pixel, as well as its (x,y) location
      if (pixelBrightness > brightestValue) { 
        brightestValue = pixelBrightness; 
        brightestY = y; 
        brightestX = x;
      } 
      index++;
    }
  }

  // Draw a yellow circle at the brightest pixel 
  fill(255, 204, 0, 128); 
  ellipse(brightestX, brightestY, 30, 30);
}
