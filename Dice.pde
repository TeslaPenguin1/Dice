int sum = 0;
int permaSum = 0;
int trial = 0;
void setup()
{
  size(500,550);
  background(0);
  noLoop();
  textAlign(CENTER,CENTER);
  stroke(255);
}
void draw()
{
  sum = 0;
  fill(0);
  trial++;
  noStroke();
  quad(0,0,0,600,500,600,500,0);
  for(int y = 25; y < 500; y+=50) {
    for(int x = 25; x < 500; x+=50) {
       Die die = new Die(x,y);
       die.show();
       sum += die.value;
       permaSum += die.value;
    }
  }
  fill(200);
  textSize(25);
  text("Value: "+str(sum),115,510);
  text("Average: "+str(permaSum/trial),250,530);
  text("Total: "+str(permaSum),385,510);
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
    type = (int)(Math.random()*9);
    if (type == 0) value = (int)(Math.random()*6)+1;                    //d6 1-6
    else if (type == 1) value = (int)(Math.random()*8)+1;               //d8 1-8
    else if (type == 2) value = (int)(Math.random()*4)+1;               //d4 1-4
    else if (type == 3 || type == 7) value = (int)(Math.random()*12)+1; //d12 1-12
    else if (type == 4) value = (int)(Math.random()*20)+1;              //d20 1-20
    else if (type == 5) value = (int)(Math.random()*10);                //d10 0-9
    else if (type == 6) value = (int)(Math.random()*10)*10;             //d00 00-90
    //       type == 7 is included in another line
    else if (type == 8) value = (int)(Math.random()*24)+1;              //d24 1-24
    else value = 0;
  }
  void show()
  {
    roll();
    fill(0);
    stroke(255);
    color textColor = #FFFFFF;
    boolean funkyd00 = false;
    if (type == 0){ //d6
      fill(255);
      quad(myX-20,myY-20,myX-20,myY+20,myX+20,myY+20,myX+20,myY-20);
      stroke(0);
      fill(0);
      quad(myX+21,myY+21,myX+15,myY+21,myX+15,myY+15,myX+21,myY+15);
      quad(myX-21,myY+21,myX-15,myY+21,myX-15,myY+15,myX-21,myY+15);
      quad(myX+21,myY-21,myX+15,myY-21,myX+15,myY-15,myX+21,myY-15);
      quad(myX-21,myY-21,myX-15,myY-21,myX-15,myY-15,myX-21,myY-15);
      fill(255);
      stroke(255);
      ellipse(myX+15,myY+15,10,10);
      ellipse(myX-15,myY+15,10,10);
      ellipse(myX+15,myY-15,10,10);
      ellipse(myX-15,myY-15,10,10);
      textSize(1);
      fill(0);
      if (value % 2 == 1) ellipse(myX,myY,7,7);
      if (value > 1) {
       ellipse(myX-10,myY-10,7,7);
       ellipse(myX+10,myY+10,7,7);
      }
      if (value > 3) {
       ellipse(myX-10,myY+10,7,7);
       ellipse(myX+10,myY-10,7,7);
      }
      if (value > 5) {
       ellipse(myX-10,myY,7,7);
       ellipse(myX+10,myY,7,7);
      }
      yShift = 0;
    }
    else if (type == 1) { //d8
      fill(#480583);
      stroke(#A0F8FF);
      textColor = #C0F6FA;
      triangle(myX-20,myY+15,myX+20,myY+15,myX,myY-25);
      triangle(myX-20,myY+15,myX+20,myY+15,myX,myY+22.5);
      triangle(myX-20,myY+15,myX,myY-25,myX-20,myY-7.5);
      triangle(myX+20,myY+15,myX,myY-25,myX+20,myY-7.5);
      textSize(26);
      yShift = 1;
    }
    else if (type == 2) { //d4
      fill(0);
      stroke(200);
      textColor = #FFFFFF;
      triangle(myX-22,myY+18,myX+22,myY+18,myX,myY);
      triangle(myX+22,myY+18,myX,myY-23,myX,myY);
      triangle(myX-22,myY+18,myX,myY-23,myX,myY);
      textSize(28);
      yShift = 2;
    }
    else if (type == 3) { //d12
      fill(#07645D);
      stroke(#0EE3D3);
      textColor = #0EE3D3;
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
      fill(0);
      stroke(#FF0000);
      textColor = #FA2D3B;
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
    else if (type == 5) { //d10
      fill(#1DED59);
      stroke(#1BAA45);
      textColor = #5F5D32;
      quad(myX,myY-20,myX+12,myY+3,myX,myY+7,myX-12,myY+3);
      quad(myX,myY+7,myX+12,myY+3,myX+17,myY+5,myX,myY+20);
      quad(myX,myY-20,myX+12,myY+3,myX+17,myY+5,myX+18,myY+2);
      quad(myX,myY+7,myX-12,myY+3,myX-17,myY+5,myX,myY+20);
      quad(myX,myY-20,myX-12,myY+3,myX-17,myY+5,myX-18,myY+2);
      textSize(18);
      yShift = -3;
    }
    else if (type == 6) { //d00
      fill(#7563EA);
      stroke(#1D183E);
      textColor = #FFFFFF;
      quad(myX,myY-20,myX+12,myY+3,myX,myY+7,myX-12,myY+3);
      quad(myX,myY+7,myX+12,myY+3,myX+17,myY+5,myX,myY+20);
      quad(myX,myY-20,myX+12,myY+3,myX+17,myY+5,myX+18,myY+2);
      quad(myX,myY+7,myX-12,myY+3,myX-17,myY+5,myX,myY+20);
      quad(myX,myY-20,myX-12,myY+3,myX-17,myY+5,myX-18,myY+2);
      textSize(13);
      yShift = -2;
      if (value == 0) funkyd00 = true;
    }
    /***
    Thus ends the "normal" dnd dice.... now onwards to weirder things!!!
    ***/
    else if (type == 7) { //rhombic d12
      stroke(#EFFA58);
      textColor = #F1F5BC;
      fill(#747244);
      quad(myX,myY-11,myX+17,myY,myX,myY+15,myX-17,myY);
      fill(#62613C);
      quad(myX,myY-11,myX+17,myY,myX+17,myY-10,myX,myY-21);
      quad(myX,myY+11,myX+17,myY,myX+17,myY+10,myX,myY+21);
      quad(myX,myY-11,myX-17,myY,myX-17,myY-10,myX,myY-21);
      quad(myX,myY+11,myX-17,myY,myX-17,myY+10,myX,myY+21);
      yShift = 0;
      if (value < 10) textSize(16);
      else textSize(14);
    }
    else if (type == 8) { //tetrakis d24
      fill(#FFB640);
      stroke(#E08B02);
      textColor = #714701;
      triangle(myX,myY-3,myX+17,myY+17,myX-17,myY+17);
      fill(#FFB339);
      triangle(myX,myY-3,myX+17,myY+17,myX+17,myY-17);
      triangle(myX,myY-3,myX-17,myY+17,myX-17,myY-17);
      triangle(myX,myY-3,myX+17,myY-17,myX-17,myY-17);
      fill(#FFB236);
      triangle(myX+17,myY+17,myX-17,myY+17,myX,myY+23);
      triangle(myX+17,myY-17,myX-17,myY-17,myX,myY-20);
      triangle(myX+17,myY-17,myX+17,myY+17,myX+21,myY-3);
      triangle(myX-17,myY-17,myX-17,myY+17,myX-21,myY-3);
      triangle(myX+17,myY+17,myX,myY+23,myX+18,myY+19);
      triangle(myX-17,myY+17,myX,myY+23,myX-18,myY+19);
      triangle(myX+17,myY+17,myX+18,myY+19,myX+21,myY-3);
      triangle(myX-17,myY+17,myX-18,myY+19,myX-21,myY-3);
      if (value < 10) yShift = 9;
      else yShift = 10;
      textSize(15);
    }
    else textSize(1);
    fill(textColor);
    if (funkyd00) text("00",myX,myY+yShift);
    else text(value,myX,myY+yShift);
  }
}
