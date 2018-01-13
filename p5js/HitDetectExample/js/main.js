"use strict";

var circleButton;
var squareButton;
var img;
var imageButton;

function preload() {
	img = loadImage("./images/potter.png");
}

function setup() {
  createCanvas(600,300);
  
  circleButton = new CircleButton(100, height/2, 100);
  squareButton = new SquareButton(300, height/2, 100);
  imageButton = new ImageButton(500, height/2, img);
}

function draw() {
  background(0, 100, 200);
  circleButton.run();
  squareButton.run();
  imageButton.run();
}
	
