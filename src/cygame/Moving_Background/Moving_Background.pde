PImage bg;
float x =0;

void setup() {
  size(800, 600);
  bg = loadImage("Background.png");
}

void draw() {
  background(135, 206, 255);
  image(bg, x, 0);
  image(bg, x+bg.width, 0);
  x-=1;
  if (x<=-bg.width)x=0;
}
