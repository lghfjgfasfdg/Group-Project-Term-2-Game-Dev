// Lucas/Charles|November 4 2025|
// Global Variables
int x, y, speed, startScreen, play ;
float scale;
//PImage Start;
//PImage GameOver;
Robot blub;
boolean up, down, left, right;

void setup() {
  x=0;
  y=0;
  blub = new Robot(width/2, height - 25, color(0, 234, 124));
  size(500, 500);
  background(220);
  frameRate(60);
  //Start = loadImage("Start.jpg");
  //GameOver = loadImage("GameOver.jpg");
  play = startScreen;
  scale = 1;
  speed = 3;
}



void draw() {

  background(171);
  blub.update();
  blub.display();
}


void keyPressed() {
  if (key == ' ') {
    blub.jump();
  }
  if (key == 'a') {
    blub.move();
  }
   if (key == 'd'){
     blub.move(); } 






void mousePressed() {
  blub.jump();
}

//void startScreen() {
//image(Start, x, y);
// if (mousePressed);
//{
// loadImage("Start.jpg");

// }
//}
