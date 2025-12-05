// Lucas/Charles | November 4 2025 |

char screen = 's';  // 's' = start, 'p' = play
Button btnStart, btnMenu;
Robot blub;
Enemy smasher;
ArrayList<Platform> platforms;
ArrayList<Projectile> projectiles;
PImage sc;
PImage bg;
PImage go;
float x =0;
void setup() {
  size(500, 500);
  frameRate(60);
  //PImage("bacground.png");
  blub = new Robot(width/2, height - 25, color(0, 234, 124));
  sc = loadImage ("cystart.png");
  btnStart = new Button("PLAY", 170, 250, 160, 50);
  btnMenu  = new Button("MENU", 170, 320, 160, 50);
  smasher = new Enemy(250, 100, 40, color(255, 0, 0));
  bg = loadImage("Background.png");
  go = loadImage("endblub.png");
  projectiles = new ArrayList<Projectile>();
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
  

  case 'g':
    drawGameOverScreen();
    break;
    
   
    
   




  }
}


// START SCREEN
//ck
void drawStartScreen() {
  background(0);
  image(sc, 0, 0, 500, 500);
  btnStart.display();
  btnMenu.display();

  if (btnStart.clicked()) screen = 'p';
  if (btnMenu.clicked()) println("Menu Button pressed");
}


// PLAY SCREEN
//ck
void drawPlayScreen() {
  background(171);
  image(bg, x, 0);
  image(bg, x+bg.width, 0);
  bg.resize(11600,1000);
  x-=1;
  if (x<=-bg.width)x=0;
  
  for (int i = projectiles.size()-1; i >= 0; i--) {
  Projectile p =projectiles .get(i);
  p.update();
  p.display();


  


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
  //for (Enemy e : enemies) {
 // e.update();
 // e.display();

 // PAUSE |  this part is really jank and doesnt work this was just hopes and dreams trying to get this to work 
  //if (e.Cooldown == 0) {
   // float angle = atan2(blub.y - e.y, blub.x - e.x);
    //float speed = 4;

  //  projectiles.add(new Projectile(
   //   e.x,
   //   e.y,
    //  cos(angle)*speed,
     // sin(angle)*speed
 //   ));

   // e.Cooldown = 60;
  //}
  //weird jank stuff that doesnt work ends here | CONT 
  }
  }


void drawGameOverScreen() {
 //ck
  image(go,width/2, height/2);
  imageMode(CENTER);
  go.resize(500,500);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  //text("GAME OVER", width/2, height/2 - 20);
}



// INPUT - ck

void keyPressed() {

  if (key == ' ') blub.jump();
  //these kinda function like dashes but he moves like a water skeeter 
  if (key == 'a') blub.move();
  if (key == 'd') blub.move();
}

void mousePressed() {
  blub.jump();
}
void gameOver() {
  screen = 'g'; // sends to game over screen | NOT ACTUAL SCREEN
}
