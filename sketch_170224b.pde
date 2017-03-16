import ketai.sensors.*;

KetaiSensor sensor;
float beschleunigungX=0;
float beschleunigungZ=0;
float beschleunigungY=0;

int x= width/2;
int y= width/2;
float a1 = 0;
float a2 = 0;
float a3 = 0;
void setup()
{
  frameRate(60);
  size(1920,1080);
  sensor=new KetaiSensor(this);
  sensor.start();
  orientation(LANDSCAPE);
  textAlign(CENTER,CENTER);
  textSize(36);
  smooth(4);
  frameRate(60);
}

void onAccelerometerEvent(float x, float y, float z)
{
  beschleunigungX = -x;
  beschleunigungY = -y;
  beschleunigungZ = -z;
  
}

void draw()
{
  background(0,34,64);
  fill(0,0,0);
  /*
  //text("B-Sensorwerte (m/s²):\n"+ "ax:" + nfp(beschleunigungX,2,3)+"\n"+ "ay:" + nfp(beschleunigungY,2,3)+"\n"+"az:" + nfp(beschleunigungZ,2,3), width/2,height/2);
  
  int kippWinkelX=(int) (atan(beschleunigungY/beschleunigungZ)*180/PI);
  int kippWinkelY=(int) (atan(beschleunigungX/beschleunigungZ)*180/PI);
  
  fill(255,0,0);
  ellipse(x,y,25,25);
  
  x += kippWinkelX; //youtube error 301 xD
  y += kippWinkelY;
  
  if(x > 1920){
    x = width;
  }
  if(x < 0){
    x = 0;
  }
  if(y > 1080){
    y = height;
  }
  if(y < 0){
    y = 0;
  }  
  */
  
  
  noStroke();
  fill(2,137,255);
  if(beschleunigungX > 0){
    arc(500, 500, 500, 500, 0, beschleunigungX);
  }else{
    arc(500, 500, 500, 500, beschleunigungX, 0);
  }
  
  fill(1,68,127);
  if(beschleunigungX > 0){
    ellipse(500,500,(25 * beschleunigungX) + 200, (25 * beschleunigungX) + 200);
  }else{
    ellipse(500,500,(25 * -beschleunigungX) + 200, (25 * -beschleunigungX) + 200);
  }
  //delay(100);
  stroke(2, 137, 255);
  strokeWeight(5);
  noFill();
  
  arc(500, 500, 600, 600, HALF_PI + (beschleunigungX * 0.1) + a1, PI + (beschleunigungX * 0.1) + a1);
  arc(500, 500, 700, 700, PI + (beschleunigungX * 0.2 ) + a2, PI+QUARTER_PI + (beschleunigungX * 0.2) + a2);
  arc(500, 500, 800, 800, PI+QUARTER_PI + (beschleunigungX * 0.3 ) + a3, TWO_PI + (beschleunigungX * 0.3 ) + a3);
  
  fill(255,255,255);
  textSize(75);
  text((int)(beschleunigungX * 10) + "%", 500, 500);
  
  a1 += 0.01 * beschleunigungX;
  a2 += 0.02 * beschleunigungX;
  a3 += 0.03 * beschleunigungX;
  
  
}