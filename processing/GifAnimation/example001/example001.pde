import gifAnimation.*;

Gif origGif;
ArrayList<Robot> robots;

public void setup() {
  size(960, 540);
  
  origGif = new Gif(this, "robot.gif");
  origGif.loop(); //.ignoreRepeat();
  origGif.play();
  robots = new ArrayList<Robot>();
}

void draw() {
  background(127);
  
  if (mousePressed) {
    robots.add(new Robot(mouseX, mouseY, origGif));
  }
  
  for (int i=0; i<robots.size(); i++) {
    robots.get(i).run();
  }
}

void keyPressed() {
  robots = new ArrayList<Robot>();
}