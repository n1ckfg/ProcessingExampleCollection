class Cube {
  
  PVector pos;
  PVector rot;
  
  Cube() {
    pos = cam.mouse;
    rot = new PVector(-PI/random(3,6), PI/random(3,6), 0);
  }
  
  void update() {
  }
  
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateXYZ(rot.x, rot.y, rot.z);
    box(10);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }
  
  void rotateXYZ(float x, float y, float z){
    rotateX(x);
    rotateY(y);
    rotateZ(z);
  }
  
}