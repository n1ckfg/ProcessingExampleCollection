class Player {
  
  constructor() {
    this.p;
    this.t;
    this.speed = 4;
    this.init();
  }
  
  init() {
    this.p = createVector(width/2, height/2);    
    this.t = createVector(width/2, height/2);
  }
  
  update() {
    this.p.x = lerp(this.p.x, this.t.x, 0.1);
    this.p.y = lerp(this.p.y, this.t.y, 0.1);    
  }

  draw() {
    ellipseMode(CENTER);
    fill(255);
    ellipse(this.p.x, this.p.y, 30, 30);
  }

  run() {
    this.update();
    this.draw();
  }
  
  move(x, y) {
    this.t.add(createVector(x, y));
  }
  
  setTarget(x, y) {
    this.t = createVector(x, y);
  }

  reset() {
    this.init();
  }
  
  
}