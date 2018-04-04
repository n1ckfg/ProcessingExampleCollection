import peasy.PeasyCam;

PeasyCam cam;

PShape pod;
MeshObj podObj;

GameState gs;

void setup() {
  size(640, 480, P3D);
  gs = GameState.NATIVE;
  
  cam = new PeasyCam(this, 400);
  pod = loadShape("battle_pod_tri.obj");
  podObj = new MeshObj(pod);
}

void draw() {
  background(0);
  lights();
  
  pushMatrix();
  translate(width/2, height/2, -500);
  scale(1000, 1000, 1000);
  rotateX(radians(180));
  rotateY(radians(90));
  
  switch(gs) {
    case NATIVE:
      shape(pod, 0, 0);
      break;
    case MESHOBJ:
      podObj.draw();
      break;
    case MESHOBJ_VOXEL:
      podObj.drawVoxel();
      break;
    }
  
  popMatrix();
  
  surface.setTitle(""+frameRate);
}
