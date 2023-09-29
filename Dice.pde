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
    type = (int)(Math.random()*4);
    if (type == 0) value = (int)(Math.random()*6)+1;
    if (type == 1) value = (int)(Math.random()*8)+1;
    if (type == 2) value = (int)(Math.random()*4)+1;
  }
  void show()
  {
    roll();
    fill(0);
    if (type == 0){
      quad(myX-20,myY-20,myX-20,myY+20,myX+20,myY+20,myX+20,myY-20);
      textSize(30);
      yShift = 0;
    }
    else if (type == 1) {
      triangle(myX-20,myY+15,myX+20,myY+15,myX,myY-25);
      triangle(myX-20,myY+15,myX+20,myY+15,myX,myY+22.5);
      triangle(myX-20,myY+15,myX,myY-25,myX-20,myY-7.5);
      triangle(myX+20,myY+15,myX,myY-25,myX+20,myY-7.5);
      textSize(26);
      yShift = 1;
    }
    else if (type == 2) {
      triangle(myX-20,myY+18,myX+20,myY+18,myX,myY-23);
      textSize(28);
      yShift = 3;
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
