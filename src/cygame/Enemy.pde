  class Enemy {
      //  Variables
      float x;
      float y;
      float diameter;
      color c;

      // Constructor
      Enemy(float tempX, float tempY, float tempD, color tempC) {
        x = tempX;
        y = tempY;
        diameter = tempD;
        c = tempC;
      }

      // Methods
      void display() {
        fill(c);
        ellipse(x, y, diameter, diameter);
      }

      void move() {
        x += random(-1, 1); // Simple movement example
        y += random(-1, 1);
      }
    }
