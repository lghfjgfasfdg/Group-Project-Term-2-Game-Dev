class Projectile {
  float x, y;
  float vx, vy;
  float size = 8;
  boolean alive = true;

  Projectile(float x_, float y_, float vx_, float vy_) {
    x = x_;
    y = y_;
    vx = vx_;
    vy = vy_;
  }

  void update() {
    x += vx;
    y += vy;

    // Remove bullet if off-screen
    if (x < 0 || x > width || y < 0 || y > height) {
      alive = false;
    }
  }

  void display() {
    fill(255, 200, 50);
    noStroke();
    ellipse(x, y, size, size);
  }

  boolean hits(Robot e) {
     float robotRadius = 20; 
     float projectileRadius = 3;
    float d = dist(x, y, e.x, e.y);
  
    return d < projectileRadius + robotRadius ;
  }
}
