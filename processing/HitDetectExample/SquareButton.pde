class SquareButton extends Button {
  
  SquareButton(float x, float y, float s) {
    super(x, y, s, s);
  }
  
  void update() {
    hovered = hitDetectRect(mouseX, mouseY, 1, 1, p.x, p.y, s.x, s.y);
    super.update();
  }
  
  void draw() {
    fill(currentColor);
    rectMode(CENTER);
    rect(p.x, p.y, s.x, s.y);
  }
  
  // 2D RECTANGLE hit detect: xy, wh of object 1; xy, wh of object 2; assumes center.
  boolean hitDetectRect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
    w1 /= 2;
    h1 /= 2;
    w2 /= 2;
    h2 /= 2; 
    if ( x1 + w1 >= x2 - w2 && 
         x1 - w1 <= x2 + w2 && 
         y1 + h1 >= y2 - h2 && 
         y1 - h1 <= y2 + h2 ) 
    {
      return true;
    } else {
      return false;
    }
  }

}