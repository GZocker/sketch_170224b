import ketai.sensors.*;

KetaiSensor sensor;
float beschleunigungX=0;
float beschleunigungZ=0;
float beschleunigungY=0;

float orientationX=0;
float orientationZ=0;
float orientationY=0;

float zero = 0;

int x= width/2;
int y= width/2;
float a1 = 0;
float a2 = 0;
float a3 = 0;
/*
void settings(){
  fullScreen();
  smooth(16);
}
*/

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
  beschleunigungX = (-x + beschleunigungX) * 0.5; // -x
  beschleunigungY = (-y + beschleunigungX) * 0.5; // -y
  beschleunigungZ = (-z + beschleunigungX) * 0.5; // -z
}

void onOrientationEvent(float x, float y, float z)
{
  orientationX = -x;//(-x + orientationX) * 0.5;
  orientationY = -y;//(-y + orientationY) * 0.5;
  orientationZ = -z - zero;//(-z + orientationZ) * 0.5;
}

void mousePressed(){
  println("Pressed: " + mouseX + " " + mouseY);                                                                              //BUG
  if(mouseX < 150 && mouseY < 150){
    zero = orientationZ + zero;
  }
  
}

void draw()
{ 
  background(0,34,64);
  
  /*
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
  
  //ÄUßERE BÖGEN
  stroke(2, 137, 255);
  strokeWeight(5);
  noFill();
  
  a1 += constrain(map(beschleunigungX, -5, 5, -0.1, 0.1), -0.1, 0.1);
  a2 += constrain(map(beschleunigungX, -5, 5, -0.2, 0.2), -0.2, 0.2);
  a3 += constrain(map(beschleunigungX, -5, 5, -0.3, 0.3), -0.3, 0.3);
  
  arc(500, 500, 600, 600, HALF_PI + map(beschleunigungX, -5, 5, -0.5, 0.5) + a1, PI + map(beschleunigungX, -5, 5, -0.5, 0.5) + a1);
  arc(500, 500, 700, 700, PI + map(beschleunigungX, -5, 5, -1, 1) + a2, PI+QUARTER_PI + map(beschleunigungX, -5, 5, -1, 1) + a2);
  arc(500, 500, 800, 800, PI+QUARTER_PI + map(beschleunigungX, -5, 5, -1.5, 1.5) + a3, TWO_PI + map(beschleunigungX, -5, 5, -1.5, 1.5) + a3);
  */
  
  
  
  
  
  
  
                                                                                                                                                                                        //ZWEITER KREIS TEST
  
  
  noStroke();  
  fill(1,68,127);
  ellipse(75,75,75,75);
  strokeWeight(6);
  stroke(2,137,255);
  noFill();
  ellipse(75,75,50,50);
  
   
  
  //%-ARC
  noStroke();
  fill(2,137,255);
  if(orientationZ > 0){
    arc(1420, 500, 500, 500, 0, constrain(map(orientationZ, 0, 30, 0, TWO_PI), 0, TWO_PI));
  }else{
    arc(1420, 500, 500, 500, constrain(map(orientationZ, 0, 30, 0, TWO_PI), -TWO_PI, 0), 0);
  }  
  
  //KREIS IN DER MITTE  
  fill(1,68,127);
  //ellipse(500,500,(25 * abs(beschleunigungX)) + 200, (25 * abs(beschleunigungX)) + 200);
  ellipse(1420, 500, constrain(map(abs(orientationZ), 0, 30, 200, 350), 200, 350), constrain(map(abs(orientationZ), 0, 30, 200, 350), 200, 350));

  
  //%-ANZEIGE  
  fill(255,255,255);
  textSize(75);
  //text((int)(beschleunigungX * 10) + "%", 500, 500);
  text((int) constrain(map(orientationZ, 0, 30, 0, 100), -100, 100) + "%", 1420, 500);
  
  /*
  text(orientationX, 1000, 300);
  text(orientationY, 1000, 500);
  text(orientationZ, 1000, 700);

  text(beschleunigungX, 1400, 300);
  text(beschleunigungY, 1400, 500);
  text(beschleunigungZ, 1400, 700);
  */
  
  //ÄUßERE BÖGEN
  stroke(2, 137, 255);
  strokeWeight(5);
  noFill();
  
  a1 += constrain(map(orientationZ, -30, 30, -0.1, 0.1), -0.1, 0.1);
  a2 += constrain(map(orientationZ, -30, 30, -0.2, 0.2), -0.2, 0.2);
  a3 += constrain(map(orientationZ, -30, 30, -0.3, 0.3), -0.3, 0.3);
  
  arc(1420, 500, 600, 600, HALF_PI + map(orientationZ, -30, 30, -0.5, 0.5) + a1, PI + map(orientationZ, -30, 30, -0.5, 0.5) + a1);
  arc(1420, 500, 700, 700, PI + map(orientationZ, -30, 30, -1, 1) + a2, PI+QUARTER_PI + map(orientationZ, -30, 30, -1, 1) + a2);
  arc(1420, 500, 800, 800, PI+QUARTER_PI + map(orientationZ, -30, 30, -1.5, 1.5) + a3, TWO_PI + map(orientationZ, -30, 30, -1.5, 1.5) + a3);
  
  
  
  
  
  
  //debug
  println(frameRate);

  
  text(orientationY, 1000, 500);
  text(orientationZ, 1000, 700);

  
  
}