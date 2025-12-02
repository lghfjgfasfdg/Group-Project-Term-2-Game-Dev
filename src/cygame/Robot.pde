// charles k
class Robot {
  float x, y;
  float xVel, yVel;
  float gravity;
  float jumpStrength;
  float friction;
  float speed;
  int w, h;
  boolean isOnGround;
  color c1; 
  PImage tdavid;

  Robot(int x, int y, color c1) {
    this.x = x;
    this.y = y;
    this.c1 = c1;
    
    w = 50;
    h = 50;
    speed = 1;
    gravity = 0.8;
    jumpStrength = -20;
    friction = 0.9;
    
    yVel = 0;
    xVel = 0;
    isOnGround = false;
    
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

    // Simple ground collision
    float groundLevel = height - h/2;
    if (y > groundLevel) {
      y = groundLevel;
      yVel = 0;
      isOnGround = true;
    } else {
      isOnGround = false;
    }
  }

  void jump() {
    if (isOnGround) {
      yVel = jumpStrength;
      isOnGround = false;
    }
  }
}
