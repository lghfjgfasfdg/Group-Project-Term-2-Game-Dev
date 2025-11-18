   // Lucas/Charles | November 4 2025 |

char screen = 's';  // 's' = start, 'p' = play
Button btnStart, btnMenu;
Robot blub;
Enemy smasher;
ArrayList<Platform> platforms;
PImage sc;
void setup() {
  size(500, 500);     
  frameRate(60);
  //  PImage("bacground.png");
  blub = new Robot(width/2, height - 25, color(0, 234, 124));
 sc = loadImage ("cystart.png");
  btnStart = new Button("PLAY", 170, 250, 160, 50);
  btnMenu  = new Button("MENU", 170, 320, 160, 50);
smasher = new Enemy(250, 100, 40, color(255, 0, 0));

  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(200, 200, 100, 20, 2));
}

void draw() {
  background(171);

  switch (screen) {
  case 's':
    drawStartScreen();
    break;

  case 'p':
    drawPlayScreen();
    break;
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
}


  // START SCREEN

void drawStartScreen() {
  background(0);
 image(sc,0,0,500,500);
  btnStart.display();
  btnMenu.display();

  if (btnStart.clicked()) screen = 'p';
  if (btnMenu.clicked()) println("Menu Button pressed");
}


  // PLAY SCREEN

void drawPlayScreen() {
  background(171);

  blub.update();
  blub.display();

  for (Platform p : platforms) {
    p.update();
    p.display();
    
    
 }
 smasher.update();
  smasher.display();
}

void drawGameOverScreen() {
  background(30);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("GAME OVER", width/2, height/2 - 20);

  
  
}



  // INPUT

void keyPressed() {
  if (key == ' ') blub.jump();
  if (key == 'a') blub.move();
  if (key == 'd') blub.move();
}

void mousePressed() {
  blub.jump();
}
void gameOver() {
  screen = 'g'; // game over screen
}
