class Player {
  
  PVector p;
  PVector t;
  float speed = 4;
  
  Player() {
    init();
  }
  
  void init() {
    p = new PVector(width/2, height/2);
    t = new PVector(width/2, height/2);
  }
  
  void update() {
    p.x = lerp(p.x, t.x, 0.1);
    p.y = lerp(p.y, t.y, 0.1);
  }
  
  void draw() {
    ellipseMode(CENTER);
    fill(255);
    ellipse(p.x, p.y, 30, 30);
  }
  
  void run() {
    update();
    draw();
  }
  
  void move(float x, float y) {
    t.add(new PVector(x,y));
  }
  
  void setTarget(float x, float y) {
    t = new PVector(x, y);
  }
  
  void reset() {
    init();
  }
  
  
}