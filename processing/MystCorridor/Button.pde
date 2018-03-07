class Button {
  
  PVector p;
  PVector s;
  
  boolean clicked = false;
  boolean hovered = false;
  
  color offColor = color(0);
  color hoveredColor = color(127);
  color clickedColor = color(255);
  color currentColor = offColor;
  
  Button(float px, float py, float sx, float sy) {
    p = new PVector(px, py);
    s = new PVector(sx, sy);
  }
  
  void update() {
    clicked = hovered && mousePressed;
    
    if (hovered && !clicked) {
      currentColor = hoveredColor;
    } else if (hovered && clicked) {
      currentColor = clickedColor;
    } else {
      currentColor = offColor;
    }
  }
  
  void draw() {
    //
  }
  
  void run() {
    update();
    draw();
  }
  
}

class RectButton extends Button {
  
  boolean visible = true;
  
  RectButton(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
  
  void update() {
    hovered = hitDetectRect(mouseX, mouseY, 1, 1, p.x, p.y, s.x, s.y);
    super.update();
  }
  
  void draw() {
    if (visible) {
      fill(currentColor);
      rectMode(CENTER);
      rect(p.x, p.y, s.x, s.y);
    }
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