int sum = 0;
int permaSum = 0;
void setup()
{
  size(500,550);
  noLoop();
  textAlign(CENTER,CENTER);
  stroke(255);
}
void draw()
{
  sum = 0;
  fill(127);
  quad(0,0,0,600,500,600,500,0);
  for(int y = 25; y < 500; y+=50) {
    for(int x = 25; x < 500; x+=50) {
       Die die = new Die(x,y);
       die.show();
       sum += die.value;
       permaSum += die.value;
    }
  }
  fill(0);
  textSize(30);
  text(sum,150,525);
  text(permaSum,350,525);
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  int myX, myY, value, type, yShift;
  
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    type = (int)(Math.random()*5);
    if (type == 0) value = (int)(Math.random()*6)+1;
    else if (type == 1) value = (int)(Math.random()*8)+1;
    else if (type == 2) value = (int)(Math.random()*4)+1;
    else if (type == 3) value = (int)(Math.random()*12)+1;
    else if (type == 4) value = (int)(Math.random()*20)+1;
    else value = 0;
  }
  void show()
  {
    roll();
    fill(0);
    if (type == 0){ //d6
      quad(myX-20,myY-20,myX-20,myY+20,myX+20,myY+20,myX+20,myY-20);
      textSize(1);
      fill(255);
      if (value % 2 == 1) ellipse(myX,myY,5,5);
      if (value > 1) {
       ellipse(myX-10,myY-10,5,5);
       ellipse(myX+10,myY+10,5,5);
      }
      if (value > 3) {
       ellipse(myX-10,myY+10,5,5);
       ellipse(myX+10,myY-10,5,5);
      }
      if (value == 6) {
       ellipse(myX-10,myY,5,5);
       ellipse(myX+10,myY,5,5);
      }
      yShift = 0;
    }
    else if (type == 1) { //d8
      triangle(myX-20,myY+15,myX+20,myY+15,myX,myY-25);
      triangle(myX-20,myY+15,myX+20,myY+15,myX,myY+22.5);
      triangle(myX-20,myY+15,myX,myY-25,myX-20,myY-7.5);
      triangle(myX+20,myY+15,myX,myY-25,myX+20,myY-7.5);
      textSize(26);
      yShift = 1;
    }
    else if (type == 2) { //d4 - NEEDS WORK
      /*triangle(myX-22,myY+18,myX+22,myY+18,myX,myY);
      triangle(myX+22,myY+18,myX,myY-23,myX,myY);
      triangle(myX-22,myY+18,myX,myY-23,myX,myY);*/
      
      beginShape();
      vertex(myX,myY-8);
      vertex(myX+7,myY+6);
      vertex(myX+14,myY+12);
      vertex(myX+16,myY+5);
      vertex(myX+5,myY-14);
      vertex(myX,myY-18);
      vertex(myX,myY-8);
      endShape();
      beginShape();
      vertex(myX,myY-8);
      vertex(myX-7,myY+6);
      vertex(myX-14,myY+12);
      vertex(myX-16,myY+5);
      vertex(myX-5,myY-14);
      vertex(myX,myY-18);
      vertex(myX,myY-8);
      endShape();
      beginShape();
      vertex(myX+7,myY+6);
      vertex(myX-7,myY+6);
      vertex(myX-14,myY+12);
      vertex(myX-10,myY+18);
      vertex(myX+10,myY+18);
      vertex(myX+14,myY+12);
      vertex(myX+7,myY+6);
      endShape();
      textSize(28);
      yShift = 3;
    }
    else if (type == 3) { //d12
      beginShape();
      vertex(myX-9,myY+14);
      vertex(myX+9,myY+14);
      vertex(myX+13,myY-5);
      vertex(myX,myY-12);
      vertex(myX-13,myY-5);
      endShape();
      beginShape();
      vertex(myX-9,myY+14);
      vertex(myX+9,myY+14);
      vertex(myX+12,myY+17);
      vertex(myX,myY+19);
      vertex(myX-12,myY+17);
      endShape();
      beginShape();
      vertex(myX+13,myY-5);
      vertex(myX+9,myY+14);
      vertex(myX+12,myY+17);
      vertex(myX+16,myY+5);
      vertex(myX+17,myY-6);
      endShape();
      beginShape();
      vertex(myX,myY-12);
      vertex(myX+13,myY-5);
      vertex(myX+17,myY-6);
      vertex(myX+10,myY-12);
      vertex(myX,myY-16);
      endShape();
      beginShape();
      vertex(myX-13,myY-5);
      vertex(myX-9,myY+14);
      vertex(myX-12,myY+17);
      vertex(myX-16,myY+5);
      vertex(myX-17,myY-6);
      endShape();
      beginShape();
      vertex(myX,myY-12);
      vertex(myX-13,myY-5);
      vertex(myX-17,myY-6);
      vertex(myX-10,myY-12);
      vertex(myX,myY-16);
      vertex(myX,myY-12);
      endShape();
      textSize(20);
      yShift = 2;
    }
    else if (type == 4) { //d20
      triangle(myX,myY-15,myX+12,myY+9,myX-12,myY+9);
      triangle(myX,myY+24,myX+12,myY+9,myX-12,myY+9);
      triangle(myX,myY-15,myX+12,myY+9,myX+21,myY-10.5);
      triangle(myX+12,myY+9,myX+21,myY-10.5,myX+21,myY+13.5);
      triangle(myX,myY-15,myX+21,myY-10.5,myX,myY-22.5);
      triangle(myX,myY+24,myX+12,myY+9,myX+21,myY+13.5);
      triangle(myX,myY-15,myX-12,myY+9,myX-21,myY-10.5);
      triangle(myX-12,myY+9,myX-21,myY-10.5,myX-21,myY+13.5);
      triangle(myX,myY-15,myX-21,myY-10.5,myX,myY-22.5);
      triangle(myX,myY+24,myX-12,myY+9,myX-21,myY+13.5);
      textSize(14);
      if (value < 10) yShift = 1;
      else yShift = 3;
    }
    else textSize(1);
    fill(255);
    text(value,myX,myY+yShift);
  }
  /***
  TYPES OF DICE TO IMPLEMENT:
    Normal d6
    Normal d4
    Normal d8
    Normal d12
    Normal d20
  Normal d10
  Normal "d100" (2d10)
  Rhombic d12
  d18
  Tetrakis d24
  Pentagonal d24
  d30
  d48
  Deltoidal d60
  Pentagonal d60
  d120
  skew d6
  ***/
}
