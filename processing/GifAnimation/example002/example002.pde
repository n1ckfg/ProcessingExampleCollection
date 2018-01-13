import gifAnimation.*;

Robot robot;

void setup() {
  size(960, 540, P2D);
  robot = new Robot(this);
}

void draw() {
  background(127);
  robot.run();
}