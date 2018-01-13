PFont font;
int fontSize = 28;

StopWatch sw = new StopWatch(3); 

void setup() {
  size(320, 240, P2D);
  smooth(4);
  font = loadFont("Arial120.vlw");
  textFont(font, fontSize);
  ellipseMode(CENTER);
  textAlign(CENTER);
  strokeWeight(2);
  sw.start();
}

void draw() {
  background(0);
  String s = "";
  if (sw.countdownFinished()) {
    stroke(0, 127, 200);
    s = "FINISHED.";
  } else {
    stroke(255);
    s = sw.minute() + " : " + sw.second();  
  }
  noFill();
  ellipse(width/2, height/2, 120, 80);
  fill(255);
  text(s, width/2, (height/2) + (fontSize/3));
}