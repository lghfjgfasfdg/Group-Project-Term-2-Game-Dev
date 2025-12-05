//ck
class Robot {
  float x, y;
  float xVel, yVel;
  float gravity;
  float jumpStrength;
  float friction;
  float speed;
  
  int w, h, jumpCounter;
  boolean isOnGround;
  boolean canJump;
  color c1; 
  PImage tdavid;

  Robot(int x, int y, color c1) {
    this.x = x;
    this.y = y;
    this.c1 = c1;
    w = 50;
    h = 50;
    speed = 20;
    gravity = 0.8;
    jumpStrength = -10;
    friction = 0.9;
    jumpCounter = 0;
    yVel = 0;
    xVel = 0;
    isOnGround = false;
    canJump= true;
    
    tdavid = loadImage("tdavid.png");
  }

  void display() {
    imageMode(CENTER);
    image(tdavid, x, y, w, h);
  }

  void move() {
    if (keyPressed) {
      if (key == 'd' || keyCode == RIGHT) xVel += speed;
      if (key == 'a' || keyCode == LEFT) xVel -= speed;
    }
  }

  void update() {
    // Apply gravity
    yVel += gravity;
    y += yVel;
    x += xVel;

    // Apply friction
    xVel *= friction;

    //ground collision
    float groundLevel = height - h/2;
    if (y > groundLevel) {
      y = groundLevel;
      yVel = 0;
      jumpCounter = 0;
      isOnGround = true;
    } else {
      isOnGround = false;
      
    }
    if (isOnGround == true) {
    
    }
  }
// double jump func
  void jump() {
   if (jumpCounter < 2) {
    if (canJump == true ) {
      yVel = jumpStrength;
      isOnGround = false;
      jumpCounter = jumpCounter + 1;
      
        
      }
      
    }
  }
}
