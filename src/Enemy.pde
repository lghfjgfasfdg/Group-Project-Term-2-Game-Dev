class Enemy {
  float x, y;
  float diameter;
  float rdiameter;
  float vx, vy;     // velocity
  color c;
  boolean flipped = false;
PImage drone;
  Enemy(float x_, float y_, float d_, color c_) {
    x = x_;
    y = y_;
    diameter = d_;
    c = c_;
    vx = random(-2, 2);
    vy = random(-2, 2);
    drone = loadImage("drone.png") ;
  }

  void update() {
    x += vx;
    y += vy;
if (x < r || x > width - r) {
  vx *= -1;
  flipped = !flipped;
    // Bounce on walls
    if (x < diameter/2 || x > width - diameter/2) {
      vx *= -1;
       
    }
  
    
  }
  }

  void display() {
   // fill(c);
   // noStroke();
    //image(drone, x, y);
    //imageMode (CENTER);
  
  pushMatrix();               
  translate(x, y);            
  
  if (flipped) {
    scale(-1, 1);             
  }
  
  imageMode(CENTER);
  image(drone, 0, 0, diameter, diameter);

  popMatrix();                // restore
}
  }
    
  

 boolean collidesWith(Robot r) {
  float enemyRadius = diameter / 2;
  float robotRadius = 20; 
  float d = dist(x, y, r.x, r.y);

  return d < enemyRadius + robotRadius;
}
}
