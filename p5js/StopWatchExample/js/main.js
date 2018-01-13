"use strict";

var font = "Arial";
var fontSize = 28;

// Using a countdown argument (in minutes) means it counts down instead of up.
var sw = new StopWatch(3); 

function setup() {
    createCanvas(320, 240);
    smooth(4);
    textFont(font, fontSize);
    ellipseMode(CENTER);
    textAlign(CENTER);
    strokeWeight(2);
    sw.start();
}

function draw() {
    background(0);
    var s = "";
    if (sw.countdownFinished()) {
        stroke(0, 127, 200);
        s = "FINISHED.";
    } else {
        stroke(255);
        s = sw.minute() + " : " + sw.second();    
    }
    noFill();
    ellipse(width/2, height/2, 120, 80);
    fill(255);
    text(s, width/2, (height/2) + (fontSize/3));
}