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


class RectButton extends Button{

    constructor(x, y, s) {
        super(x, y, s, s);
        this.visible = true;
    }
    
    update() {
        this.hovered = this.hitDetectRect(mouseX, mouseY, 1, 1, this.p.x, this.p.y, this.s.x, this.s.y);
        super.update();
    }
    
    draw() {
        if (this.visible) {
            fill(this.currentColor);
            rectMode(CENTER);
            rect(this.p.x, this.p.y, this.s.x, this.s.y);
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

