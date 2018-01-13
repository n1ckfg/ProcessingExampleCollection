GameManager gm;
Player player;
CircleButton[] buttons = new CircleButton[4];

void setup() {
  size(640, 480, P2D);
  bloomSetup();
  buttons[0] = new CircleButton((width/2) - 200, height/2, 50);
  buttons[1] = new CircleButton((width/2) + 200, height/2, 50);
  buttons[2] = new CircleButton(width/2, (height/2) - 200, 50);
  buttons[3] = new CircleButton(width/2, (height/2) + 200, 50); 
  for (int i=0; i<buttons.length; i++) {
    buttons[i].offColor = color(0, 0, 127);
    buttons[i].hoveredColor = color(0, 127, 255);
    buttons[i].clickedColor = color(0, 200, 255);  
  }
  gm = new GameManager();
  player = new Player();
}

void draw() {
  gm.run();
  updateControls();
  tex.beginDraw();
  tex.background(0);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].run();
  }
  tex.endDraw();
  bloomDraw();
  player.run();
}