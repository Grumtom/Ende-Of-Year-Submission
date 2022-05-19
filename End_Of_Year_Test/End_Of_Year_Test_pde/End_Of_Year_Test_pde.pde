float tSize = 75;
int tLength = 0;
int genderNum = 0;
char[] gender = {'m', 'f', 'h', 'n'};
char bigGender;
int eyes = 0;
float colour = 0;
String[] name = {"invoke","justice","the","big","lemon","divine","ancient","calamity","free","invisible","telemarketer","speed","whfuh","bell","Leg","mepo","Serj","iceFrog"};
String bigName;
int nameNum = 0;
float totalLength = 0;
float eyeAngle = 0;


void setup()
{
  fullScreen(P3D);
  colorMode(3);
  randomize(); // randomize
}


void draw()
{
  background(0);

  noFill();
  strokeWeight(5);
  stroke(colour, 255, 255); // decides the colour and stroke of the tadpole

  textAlign(CENTER);
  textSize(50);
  fill(colour, 255, 255);
  text(bigName, width/2, 100); // name text at the top
  noFill();

  for (int I=0; I < tLength + 1; I++)
  {
    pushMatrix();
    translate(width/2, height/5 + I*tSize);
    
    if (I == 0) {
      drawHead(); // draws the head at the start of the worm
    }
    if (I == tLength) {
      drawTail(); // draws the tail at the end
    }
    
    drawBody(I); // draws the body segments at each interval (does not draw arms at the start and end)
    popMatrix();
  }




  if (keyPressed) {
    if (key == ' ') {
      randomize(); // randomizes the tadpole on spacebar
    }
  }
} // --------------------------------------------------------------------------------------








void randomize()
{
  // background(0);
  tLength = int(random(0, 11));
  colour = random(0, 255);
  eyes = int(random(0, 10));
  nameNum = int(random(1, 6));
  genderNum = int(random(0, 4));
  bigGender = gender[genderNum]; // randomizes all of the variables
  eyeAngle = PI/eyes;


  for (int I=0; I<nameNum; I++) {
    if (I==0) {
      bigName = " ";
    }
    int O = int(random(0, name.length));
    bigName += name[O];
    bigName += " ";
  }
}

void drawHead()
{
  pushMatrix();
  rotate(-PI/2 - eyeAngle/2);
  for (int I = 0; I < eyes; I++) {
    rotate(eyeAngle);
    line(0, -tSize/2, 0, -tSize); // draws the head and eyes
    circle(0, -tSize-10, 20);
  }
  popMatrix();
}

void drawBody(int I) {


  circle(0, 0, tSize);
  if (I != 0) {
    line(-tSize/2, 0, -tSize, 0); // draws the body and limbs
    line(tSize/2, 0, tSize, 0);
  }
}


void drawTail() {
  if (bigGender == 'm' || bigGender == 'h') { // draws the gendered bits
    line(0, tSize/2, 0, tSize);
    circle(0, tSize+10, 20);
  }
  if (bigGender == 'f' || bigGender == 'h') {
    circle(0, 0, tSize/2);
  }
}
