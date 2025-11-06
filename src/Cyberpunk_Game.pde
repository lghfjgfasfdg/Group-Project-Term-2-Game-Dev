// Lucas/Charles|November 4 2025|
// Global Variables
int x, y, startScreen, play;
float scale;
PImage Start;
PImage GameOver;

void setup() {
  x=0;
  y=0;

  size(1024, 1024);
  background(220);
  frameRate(60);
  Start = loadImage("Start.jpg");
  GameOver = loadImage("GameOver.jpg");
  play = startScreen;
  scale = 1;
}

void draw() {
  if (mousePressed) {
    startScreen();
  } else {
  }
}




void startScreen() {
  image(Start, x, y);
  if (mousePressed);
  {
      loadImage("Start.jpg");

  }
}
