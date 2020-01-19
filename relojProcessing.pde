/**
  *clock
 */

import java.lang.Math;
int angulo = 45;

void setup() {
  size(500, 500);
  drawClock();
} 
void drawClock(){
    //contorno de reloj
  background(255);
  fill(204, 102, 0);
  ellipse(250, 250, 450, 450);
  
  //punto medio  
  fill(0);
  ellipse(250, 250, 10, 10);
  
  //llena las horas
  for(int i = 10; i < 22; i++){
    int x = (int) (Math.cos(Math.toRadians(30*i)) * 200);
    int y = (int) (Math.sin(Math.toRadians(30*i)) * 200);
    text((i-9)+"", 250+x, 250+y);
    println(x+" , "+y);
  }
}

void draw() {
  delay(1000);
  drawClock();
  
  int x = (int) (Math.cos(Math.toRadians(6*angulo)) * 190);
  int y = (int) (Math.sin(Math.toRadians(6*angulo)) * 190);
  
  line(250, 250, 250+x, 250+y);
  
  angulo ++;
  
}
