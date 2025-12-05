// NOTE|This class is kind of justy testing the waters in its currennt state 

class Projectile {
  float x, y;
  float vx, vy;
  float size = 8;
  boolean live = true;

  Projectile(float x_, float y_, float vx_, float vy_) {
    x = x_;
    y = y_;
    vx = vx_;
    vy = vy_;
  }

  void update() {
    x += vx;
    y += vy;
    if (x < 0 || x > width || y < 0 || y > height) live = false;
  }

  void display() {
    fill(255, 50, 50); 
    ellipse(x, y, size, size);
  }
}
