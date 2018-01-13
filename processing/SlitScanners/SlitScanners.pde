Scanner scanner;
PGraphics buffer;
ArrayList<Dot> dots;
int numDots = 150;
boolean showScan = true;

void setup() {
  size(960, 540, P2D);
  buffer = createGraphics(width, height, P2D);
  scanner = new Scanner(-1);
  dots = new ArrayList<Dot>();
  for (int i=0; i<numDots; i++) {
    dots.add(new Dot(random(width), random(height)));
  }
  bloomSetup();
}

void draw() {
  buffer.beginDraw();
  buffer.background(0);
  for (int i=0; i<dots.size(); i++) {
    dots.get(i).run();
  }
  buffer.endDraw();
  buffer.loadPixels();
  
  if (showScan) {
    scanner.run();
  } else {
    tex.beginDraw();
    tex.image(buffer, 0, 0, width, height);
    tex.endDraw();
  }
  
  bloomDraw();
  
  surface.setTitle(""+frameRate);
}

void mousePressed() {
  dots.add(new Dot(mouseX, mouseY));
}