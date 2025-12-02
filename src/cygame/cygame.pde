//Lucas/Charles | November 4 2025 |

PImage bg;
float x = 0;
char screen = 's';
Button btnStart, btnMenu;
Robot blub;
Enemy smasher;
ArrayList<Platform> platforms;
PImage sc;

final float BG_SCALE = 0.448;

void setup() {
  size(500, 500);
  bg = loadImage("Background.png");
  frameRate(60);

  int buttonWidth = 160;
  int buttonX = (width / 2) - (buttonWidth / 2);

  blub = new Robot(width/2, height - 25, color(0, 234, 124));
  sc = loadImage ("cystart.png");
  btnStart = new Button("PLAY", buttonX, 250, buttonWidth, 50);
  btnMenu  = new Button("MENU", buttonX, 320, buttonWidth, 50);
  smasher = new Enemy(250, 100, 40, color(255, 0, 0));

  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(200, 200, 100, 20, 2));
}

void draw() {
  background(135, 206, 255);

  image(bg, x, 0, bg.width * BG_SCALE, height);
  image(bg, x + bg.width * BG_SCALE, 0, bg.width * BG_SCALE, height);
  x -= 1;

  if (x < -bg.width * BG_SCALE) {
    x = 0;
  }

  switch (screen) {
  case 's':
    drawStartScreen();
    break;
  case 'p':
    drawPlayScreen();
    break;
  case 'g':
    drawGameOverScreen();
    break;
  }
}

void drawStartScreen() {

  image(sc, 0, 0, width, height);

  btnStart.display();
  btnMenu.display();
}

void drawPlayScreen() {

  background(135, 206, 255);
  image(bg, x, 0, bg.width * BG_SCALE, height);
  image(bg, x + bg.width * BG_SCALE, 0, bg.width * BG_SCALE, height);
  x -= 1;
  if (x < -bg.width * BG_SCALE) {
    x = 0;
  }


  blub.update();
  blub.display();
  for (Platform p : platforms) {
    p.update();
    p.display();
  }
  smasher.update();
  smasher.display();
  if (smasher.collidesWith(blub)) {
    gameOver();
  }
}


void drawGameOverScreen() {
  background(30);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("GAME OVER", width/2, height/2 - 20);
}

void keyPressed() {
  if (key == ' ') blub.jump();
  if (key == 'a') blub.move();
  if (key == 'd') blub.move();
}


void mousePressed() {

  if (screen == 's') {
    if (btnStart.clicked()) {
      screen = 'p';
    }
    if (btnMenu.clicked()) {
      println("Menu Button pressed");
    }
  } else if (screen == 'p') {

    blub.jump();
  }
}

void gameOver() {
  screen = 'g';
}

