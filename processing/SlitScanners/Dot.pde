class Dot {
  
  PVector p;
  float s = 50;
  PVector speed;
  
  Dot(float x, float y) {
    p = new PVector(x, y);
    float speedVal = random(-5, 5);
    speed = new PVector(speedVal, -speedVal);
  }
  
  void update() {
    p.add(speed);
    if (p.x < 0 || p.x > width) speed.x *= -1;
    if (p.y < 0 || p.y > height) speed.y *= -1;
  }
  
  void draw() {
    buffer.noStroke();
    buffer.fill(127, 127, 255, random(20, 80));
    buffer.ellipseMode(CENTER);
    buffer.ellipse(p.x, p.y, s, s);
    buffer.fill(0);
    buffer.ellipse(p.x, p.y, s/2, s/2);
  }
  
  void run() {
    update();
    draw();
  }
  
}