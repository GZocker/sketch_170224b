import ketai.sensors.*;

KetaiSensor sensor;
float beschleunigungX=0;
float beschleunigungZ=0;
float beschleunigungY=0;

float orientationX=0;
float orientationZ=0;
float orientationY=0;

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
  smooth(2);
}

void onAccelerometerEvent(float x, float y, float z)
{
  beschleunigungX = (-x + beschleunigungX) * 0.5; // -x
  beschleunigungY = (-y + beschleunigungX) * 0.5; // -y
  beschleunigungZ = (-z + beschleunigungX) * 0.5; // -z
}

void onOrientationEvent(float x, float y, float z)
{
  orientationX = x;
  orientationY = y;
  orientationZ = z;
}

void draw()
{
  text("B-Sensorwerte (m/s²):\n"+ "ax:" + orientationZ +"\n"+ "ay:" + orientationY +"\n"+"az:" + orientationZ, width/2,height/2);
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
  
  background(0,34,64);
  noStroke();  
  
  //%-ARC  
  fill(2,137,255);
  if(beschleunigungX > 0){
    arc(500, 500, 500, 500, 0, constrain(map(beschleunigungX, 0, 5, 0, TWO_PI), 0, TWO_PI));
  }else{
    arc(500, 500, 500, 500, constrain(map(beschleunigungX, 0, 5, 0, TWO_PI), -TWO_PI, 0), 0);
  }  
  
  //KREIS IN DER MITTE  
  fill(1,68,127);
  //ellipse(500,500,(25 * abs(beschleunigungX)) + 200, (25 * abs(beschleunigungX)) + 200);
  ellipse(500, 500, constrain(map(abs(beschleunigungX), 0, 5, 200, 350), 200, 350), constrain(map(abs(beschleunigungX), 0, 5, 200, 350), 200, 350));

  
  //%-ANZEIGE  
  fill(255,255,255);
  textSize(75);
  //text((int)(beschleunigungX * 10) + "%", 500, 500);
  text((int) constrain(map(beschleunigungX, 0, 5, 0, 100), -100, 100) + "%", 500, 500);
  
  /*
  text(orientationX, 1000, 300);
  text(orientationY, 1000, 500);
  text(orientationZ, 1000, 700);
*/
  text(beschleunigungX, 1400, 300);
  text(beschleunigungY, 1400, 500);
  text(beschleunigungZ, 1400, 700);
  
  
  //ÄUßERE BÖGEN
  stroke(2, 137, 255);
  strokeWeight(5);
  noFill();
  /*
  a1 += 0.01 * beschleunigungX;
  a2 += 0.02 * beschleunigungX;
  a3 += 0.03 * beschleunigungX;
  */
  
  a1 += constrain(map(beschleunigungX, -5, 5, -0.1, 0.1), -0.1, 0.1);
  a2 += constrain(map(beschleunigungX, -5, 5, -0.2, 0.2), -0.2, 0.2);
  a3 += constrain(map(beschleunigungX, -5, 5, -0.3, 0.3), -0.3, 0.3);
  
  arc(500, 500, 600, 600, HALF_PI + (beschleunigungX * 0.1) + a1, PI + (beschleunigungX * 0.1) + a1);
  arc(500, 500, 700, 700, PI + (beschleunigungX * 0.2 ) + a2, PI+QUARTER_PI + (beschleunigungX * 0.2) + a2);
  arc(500, 500, 800, 800, PI+QUARTER_PI + (beschleunigungX * 0.3 ) + a3, TWO_PI + (beschleunigungX * 0.3 ) + a3);
  println(frameRate);

  

  
  
}