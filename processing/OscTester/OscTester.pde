PVector lastPos;
int clicked = 0;
float destWidth = 1280;
float destHeight = 720;

void setup() {
  size(640, 360, P2D);
  lastPos = new PVector(0,0);
  oscSetup();
}


void draw() {
  background(0);
  noStroke();
  fill(127);
  ellipse(lastPos.x, lastPos.y, 10, 10);
  fill(255);
  ellipse(mouseX, mouseY, 10, 10);
  sendOsc();
}

void mousePressed() {
  lastPos = new PVector(mouseX, mouseY);
  clicked = 1;
}

void mouseReleased() {
  clicked = 0;
}