"use strict";

var gif;
var robots = [];

function setup() {
  createCanvas(960, 540);
  gif = loadGif("./images/robot.gif");
}

function draw() {
  background(127);

  if (mouseIsPressed) {
  	robots.push(new Robot(mouseX, mouseY, gif));
  }

  for (var i=0; i<robots.length; i++) {
  	robots[i].run();
  }
}

function keyPressed() {
	robots = [];
}

class Robot {

	constructor(_x, _y, _gif) {
		this.x = _x;
		this.y = _y;
		this.gif = _gif;
	}

	run() {
		imageMode(CENTER);
		image(this.gif, this.x, this.y);
	}

}

