// https://forum.processing.org/one/topic/pgraphics-in-3d-pgraphics-and-peasycam.html

import peasy.*;

PeasyCam cam;

void setup() {
  size(1280, 720, P3D);
  bloomSetup();
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw() {
  background(0);
  
  bloomMatrixStart();
  
  tex.beginDraw();
  tex.setMatrix(getMatrix());
  tex.rotateX(-.5);
  tex.rotateY(-.5);
  tex.background(0);
  tex.fill(255,0,0);
  tex.box(30);
  tex.pushMatrix();
  tex.translate(0,0,20);
  tex.fill(0,0,255);
  tex.box(5);
  tex.popMatrix();
  tex.endDraw();
  
  bloomMatrixEnd();
  
  surface.setTitle(""+frameRate);
}