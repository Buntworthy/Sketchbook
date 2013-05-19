import edu.uic.ketai.*;
import edu.uic.ketai.inputService.KetaiCamera;

Ketai ketai;
PFont font;
long dataCount;

void setup()
{
  //Create Ketai object
  ketai = new Ketai(this);
  ketai.setCameraParameters(320, 240, 10);

  ketai.enableCamera();
  ketai.enableFaceAnalyzer();
  
  //Get the current data count
  dataCount = ketai.getDataCount();
  
  //Let's lock the orientation so we dont restart on orientation changes
  setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);

  font = loadFont("font.vlw");
  textFont(font, 22);
  frameRate(10);
  background(0);
}

void draw() {

  //We will simply display the ketai status and data count
  if(ketai.isCollectingData())
    text("Collecting Data...", 20,20);
  else
    text("Not Collecting Data...", 20,20);

  text("Current Data count: " + dataCount, 20, 60);
}


//  We will toggle collection by touching the screen
void mousePressed()
{
  if(ketai.isCollectingData())
  {
    ketai.stopCollectingData();
    dataCount = ketai.getDataCount();
  }
  else
    ketai.startCollectingData();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == MENU) {
        println("Exporting data...");
        
        //Export all data (this will delete all data in DB)
        ketai.exportData("test");
        
        //update the data count
        dataCount = ketai.getDataCount();
        background(0);
    }
  }
}

 void onCameraPreviewEvent(KetaiCamera video)
{
  video.read();
  
  //We can stretch the camera preview to fill the screen
  imageMode(CENTER);
  image(video, screenWidth/2,screenHeight/2);
}  



