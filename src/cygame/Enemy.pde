//charles k
class Enemy {
  float x, y;
  float diameter;
  float rdiameter;
  float vx, vy;     // velocity
  color c;

  Enemy(float x_, float y_, float d_, color c_) {
    x = x_;
    y = y_;
    diameter = d_;
    c = c_;
    vx = random(-2, 2);
    vy = random(-2, 2);
  }

  void update() {
    x += vx;
    y += vy;

    // Bounce on walls
    if (x < diameter/2 || x > width - diameter/2) {
      vx *= -1;
    }
    if (y < diameter/2 || y > height - diameter/2) {
      vy *= -1;
    }
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }

 boolean collidesWith(Robot r) {
  float enemyRadius = diameter / 2;
  float robotRadius = 20; // adjust to your robot drawing
  float d = dist(x, y, r.x, r.y);

  return d < enemyRadius + robotRadius;
}
}
}

