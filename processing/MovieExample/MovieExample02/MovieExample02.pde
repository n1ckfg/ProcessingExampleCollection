import deadpixel.keystone.*;

Keystone ks;

MovieClipKeystone clip1, clip2;
boolean firstRun = true;

void setup() {
  size(800, 600, P3D);

  ks = new Keystone(this);   
  clip1 = new MovieClipKeystone(this, "cat.mp4");
  clip2 = new MovieClipKeystone(this, "peach.mp4");  
}

void draw() { 
  if (firstRun) {
    try {
      ks.load();
      firstRun = false;
    } catch (Exception e) { }
  }
  background(0);
  clip1.run();
  clip2.run();
}

void keyPressed() {
  switch(key) {
    case 'c':
      // toggle calibration mode, where surfaces can be warped and moved
      ks.toggleCalibration();
      break;
    case 'l':
      // loads the saved layout
      ks.load();
      break;
    case 's':
      // saves the layout
      ks.save();
      break;
  }
}