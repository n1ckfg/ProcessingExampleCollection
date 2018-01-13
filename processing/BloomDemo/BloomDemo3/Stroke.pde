class Stroke {

  ArrayList<PVector> points;
  float deltaDiv = 2;
  float deltaMin = 1;
  float deltaReset = 2 * deltaMin;
  float spreadOrig = 10;
  float spread = spreadOrig;
  float friction = 0.98;
  
  Stroke() {
    points = new ArrayList<PVector>();
  }

  void update() {
    //
  }

  void draw() {
    tex.noFill();
    tex.beginShape();
    for (int i=0; i<points.size(); i++) {
      PVector p = points.get(i);
      float delta = dist(mouseX,mouseY,pmouseX,pmouseY)/deltaDiv;
      if (delta < deltaMin) delta = deltaMin;
      if (delta > deltaReset) spread = spreadOrig;
      tex.strokeWeight(delta);
      tex.stroke(255, 127, 0, 127);
      float deltaFinal = delta * (spread/spreadOrig);
      tex.vertex(p.x, p.y, p.z + random(-deltaFinal, deltaFinal));
    }
    tex.endShape();
    tex.beginShape();
    for (int i=0; i<points.size(); i++) {
      PVector p = points.get(i);
      tex.strokeWeight(10);
      tex.stroke(255, 0, 255, 200);
      tex.vertex(p.x, p.y, p.z + random(-spread, spread));
    }
    tex.endShape();
    spread *= friction;
  }

  void run() {
    update();
    draw();
  }
}