"use strict";

class Button {
  
  constructor(px, py, sx, sy) {
	  this.p = createVector(px, py);;
	  this.s = createVector(sx, sy);;
	  
	  this.clicked = false;
	  this.hovered = false;
	  
	  this.offColor = color(0);
	  this.hoveredColor = color(127);
	  this.clickedColor = color(255);
	  this.currentColor = this.offColor;
  }
  
  update() {
    this.clicked = this.hovered && mouseIsPressed;
    
    if (this.hovered && !this.clicked) {
      this.currentColor = this.hoveredColor;
    } else if (this.hovered && this.clicked) {
      this.currentColor = this.clickedColor;
    } else {
      this.currentColor = this.offColor;
    }
  }
  
  draw() {
    //
  }
  
  run() {
    this.update();
    this.draw();
  }
  
}


class CircleButton extends Button {

  constructor(x, y, s) {
    super(x, y, s, s);
  }
  
  update() {
    this.hovered = this.hitDetectCircle(mouseX, mouseY, 1, this.p.x, this.p.y, this.s.x);
    super.update();
  }
  
  draw() {
    fill(this.currentColor);
    ellipseMode(CENTER);
    ellipse(this.p.x, this.p.y, this.s.x, this.s.y);
  }

  // 2D CIRCLE hit detect: xy, diameter of object 1; xy, diameter of object 2; assumes center.
  hitDetectCircle(x1, y1, d1, x2, y2, d2) {
    d1 /= 2;
    d2 /= 2;
    if (dist(x1, y1, x2, y2) < d1 + d2) {
      return true;
    } else {
      return false;
    }
  }

}


class SquareButton extends Button{

  constructor(x, y, s) {
    super(x, y, s, s);
  }
  
  update() {
    this.hovered = this.hitDetectRect(mouseX, mouseY, 1, 1, this.p.x, this.p.y, this.s.x, this.s.y);
    super.update();
  }
  
  draw() {
    fill(this.currentColor);
    rectMode(CENTER);
    rect(this.p.x, this.p.y, this.s.x, this.s.y);
  }

  // 2D RECTANGLE hit detect: xy, wh of object 1; xy, wh of object 2; assumes center.
  hitDetectRect(x1, y1, w1, h1, x2, y2, w2, h2) {
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


class ImageButton extends Button {

  constructor(x, y, _img) {
    super(x, y, _img.width, _img.height);
    this.img = _img;
    this.img.loadPixels();
  }
  
  update() {
    this.hovered = this.hitDetectImage(mouseX, mouseY, this.p.x, this.p.y, this.img);
    super.update();
  }
  
  draw() {
    tint(this.currentColor);
    imageMode(CENTER);
    image(this.img, this.p.x, this.p.y);
  }

  // 2D IMAGE hit detect: xy of object 1; xy, wh of object 2; assumes center.
  hitDetectImage(x1, y1, x2, y2, img) {
    if (this.hitDetectRect(x1, y1, 1, 1, x2, y2, img.width, img.height)) {
      var xLoc = constrain((x1 - x2) + (img.width/2), 0, img.width-1);
      var yLoc = constrain((y1 - y2) + (img.height/2), 0, img.height-1);
      //var loc = xLoc + (yLoc * img.width);
      //var c = img.pixels[loc];
      var c = img.get(xLoc, yLoc);
      if (alpha(c) > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }  
  }

  // 2D RECTANGLE hit detect: xy, wh of object 1; xy, wh of object 2; assumes center.
  hitDetectRect(x1, y1, w1, h1, x2, y2, w2, h2) {
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
