// Lucas/Charles|November 4 2025|
// Global Variables
int x, y, speed, startScreen, play ;
float scale;
//PImage Start;
//PImage GameOver;
Robot blub;
Enemy smasher;
boolean up, down, left, right;
ArrayList<Platform> platforms;
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
  //smasher = new Enemy();

 platforms = new ArrayList<Platform>();
  // Add platforms (x, y, width, height, xVel)
  platforms.add(new Platform(200, 200, 100, 20, 2)) ;

}



void draw() {

  for (Platform p : platforms) {
    p.update();
  }
  
  background(171);
  blub.update();
  blub.display();
  
   for (Platform p : platforms) {
    p.display();
   }
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


}



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
