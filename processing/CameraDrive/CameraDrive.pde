Cam cam;

ArrayList<Cube> cubes;

void setup() {
  size(1280, 720, P3D);
  cam = new Cam();
  cubes = new ArrayList<Cube>();
  noStroke();
}

void draw() {
  lights();
  background(0);

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3);
  box(100);
  popMatrix();
  
  updateControls();
  cam.run();
  
  for (int i=0; i<cubes.size(); i++) {
    cubes.get(i).run();
  }

  surface.setTitle(""+frameRate);
}

void mousePressed() {
  cubes.add(new Cube());
}