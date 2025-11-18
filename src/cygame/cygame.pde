   // Lucas/Charles | November 4 2025 |

char screen = 's';  // 's' = start, 'p' = play
Button btnStart, btnMenu;
Robot blub;
ArrayList<Platform> platforms;

void setup() {
  size(500, 500);     
  frameRate(60);

  blub = new Robot(width/2, height - 25, color(0, 234, 124));

  btnStart = new Button("PLAY", 170, 250, 160, 50);
  btnMenu  = new Button("MENU", 170, 320, 160, 50);

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
  }
}


  // START SCREEN

void drawStartScreen() {
  background(0);

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
