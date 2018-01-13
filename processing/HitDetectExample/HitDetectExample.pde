CircleButton circleButton;
SquareButton squareButton;
PImage img;
ImageButton imageButton;

void setup() {
  size(600,300,P2D);
  
  circleButton = new CircleButton(100, height/2, 100);
  squareButton = new SquareButton(300, height/2, 100);
  img = loadImage("potter.png");
  imageButton = new ImageButton(500, height/2, img);
}

void draw() {
  background(0, 100, 200);
  circleButton.run();
  squareButton.run();
  imageButton.run();
  
  surface.setTitle(""+frameRate);
}