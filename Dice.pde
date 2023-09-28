int sum = 0;
int permaSum = 0;
void setup()
{
  size(500,550);
  noLoop();
  textAlign(CENTER,CENTER);
  textSize(30);
  noStroke();
}
void draw()
{
  sum = 0;
  fill(255);
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
  text(sum,150,525);
  text(permaSum,350,525);
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  int myX, myY, value, type;
  
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    value = (int)(Math.random()*6)+1;
  }
  void show()
  {
    roll();
    fill(0);
    quad(myX-20,myY-20,myX-20,myY+20,myX+20,myY+20,myX+20,myY-20);
    fill(255);
    text(value,myX,myY);
  }
  /***
  TYPES OF DICE TO IMPLEMENT:
  Normal d6
  Mis-pipped d6 - 2s and 6s, all 5s
  Normal d4
  Normal d8
  Normal d12
  Normal d20
  Normal d10
  Normal "d100" (2d10)
  d24
  d48
  d60
  d120
  other weird numbers (catalans)
  barrel dice
  ***/
}
