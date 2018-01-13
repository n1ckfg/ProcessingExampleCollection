"use strict";

var gm;
var player;
var buttons = [];

function setup() {
	createCanvas(640, 480);

	buttons.push(new CircleButton((width/2) - 200, height/2, 50));
  	buttons.push(new CircleButton((width/2) + 200, height/2, 50));
  	buttons.push(new CircleButton(width/2, (height/2) - 200, 50));
  	buttons.push(new CircleButton(width/2, (height/2) + 200, 50)); 
	for (var i=0; i<buttons.length; i++) {
		buttons[i].offColor = color(0, 0, 127);
		buttons[i].hoveredColor = color(0, 127, 255);
		buttons[i].clickedColor = color(0, 200, 255);  
	}

	gm = new GameManager();
	player = new Player();
}

function draw() {
  gm.run();
  updateControls();
  background(0);
  for (var i=0; i<buttons.length; i++) {
    buttons[i].run();
  }
  player.run();
}

