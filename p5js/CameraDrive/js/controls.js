"use strict";

var deltaOrig = 10;
//var deltaFast = 10;
var delta = deltaOrig;

var keyW = false;
var keyA = false;
var keyS = false;
var keyD = false;
var keyQ = false;
var keyE = false;
var keySpace = false;

function keyPressed() {
  checkKeyChar(key, true);
}

function keyReleased() {
  checkKeyChar(key, false);
}

function checkKeyChar(k, b) {
  switch (k) {
    case 'w':
      return keyW = b;
    case 'a':
      return keyA = b;
    case 's':
      return keyS = b;      
    case 'd':
      return keyD = b;
    case 'q':
      return keyQ = b;
    case 'e':
      return keyE = b;
    case ' ':
      return keySpace = b;
    default:
      return b;
  }
}

/*
function checkKeyCode(int k, var b) {
  switch (k) {
    case SHIFT:
      return keyShift = b;
    default:
      return b;
  }
}
*/

function updateControls() {
  if (keyW) cam.move(0,0,-delta);
  if (keyS) cam.move(0,0,delta);
  if (keyA) cam.move(-delta,0,0);
  if (keyD) cam.move(delta,0,0);
  if (keyQ) cam.move(0,delta,0);
  if (keyE) cam.move(0,-delta,0);
  
  if (keySpace) {
    cam.reset();
    //keysOff();  
  }
}

function keysOff() {
  keyW = false;
  keyA = false;
  keyS = false;
  keyD = false;
  keyQ = false;
  keyE = false;
  keySpace = false;
}