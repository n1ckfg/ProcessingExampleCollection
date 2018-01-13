PWindow win;

void settings() {
  //size(320, 240, P2D);
  fullScreen(P2D, 1); // use first monitor
}

void setup() { 
  win = new PWindow();
}

void draw() {
  background(255, 0, 0);
  fill(255);
  rect(10, 10, frameCount, 10);
}

void mousePressed() {
  println("mousePressed in primary window");
}  