"use strict";

var keyW = false;
var keyA = false;
var keyS = false;
var keyD = false;

function keyPressed() {
  checkKeyChar(key, true);
  
  if (key == ' ') gm.reset();
}

function keyReleased() {
  checkKeyChar(key, false);
}

function mousePressed() {
  player.setTarget(mouseX, mouseY);
}

function checkKeyChar(k, b) {
  switch (k.toLowerCase()) {
    case 'w':
      return keyW = b;
    case 'a':
      return keyA = b;
    case 's':
      return keyS = b;      
    case 'd':
      return keyD = b;
    default:
      return b;
  }
}

function updateControls() {
  if (keyW) player.move(0, -player.speed);
  if (keyS) player.move(0, player.speed);
  if (keyA) player.move(-player.speed, 0);
  if (keyD) player.move(player.speed, 0);
}

function keysOff() {
  keyW = false;
  keyA = false;
  keyS = false;
  keyD = false;
}