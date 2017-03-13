import ketai.sensors.*;

KetaiSensor sensor;
float beschleunigungX=0;
float beschleunigungZ=0;
float beschleunigungY=0;

int x= width/2;
int y= width/2;

void setup()
{
  frameRate(60);
  size(1920,1080);
  sensor=new KetaiSensor(this);
  sensor.start();
  orientation(LANDSCAPE);
  textAlign(CENTER,CENTER);
  textSize(36);
}

void onAccelerometerEvent(float x, float y, float z)
{
  beschleunigungX=-x;
  beschleunigungY=-y;
  beschleunigungZ=-z;
  
}

void draw()
{
  background(255,255,0);
  fill(0,0,0);
  text("B-Sensorwerte (m/s²):\n"+ "ax:" + nfp(beschleunigungX,2,3)+"\n"+ "ay:" + nfp(beschleunigungY,2,3)+"\n"+"az:" + nfp(beschleunigungZ,2,3), width/2,height/2);
  
  int kippWinkelX=(int) (atan(beschleunigungY/beschleunigungZ)*180/PI);
  int kippWinkelY=(int) (atan(beschleunigungX/beschleunigungZ)*180/PI);
  
  fill(255,0,0);
  ellipse(x,y,25,25);
  
  if(x < 1920){
    x += kippWinkelX; //youtube error 301 xD
  }
  
  if(y < 1080){
    y += kippWinkelY;
  }
  
  
  
  
  
  
  
  
  
}