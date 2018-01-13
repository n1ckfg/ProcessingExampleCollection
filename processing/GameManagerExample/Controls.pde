boolean keyW = false;
boolean keyA = false;
boolean keyS = false;
boolean keyD = false;

void keyPressed() {
  checkKeyChar(key, true);
  
  if (key == ' ') gm.reset();
}

void keyReleased() {
  checkKeyChar(key, false);
}

void mousePressed() {
  player.setTarget(mouseX, mouseY);
}

boolean checkKeyChar(char k, boolean b) {
  switch (k) {
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

void updateControls() {
  if (keyW) player.move(0, -player.speed);
  if (keyS) player.move(0, player.speed);
  if (keyA) player.move(-player.speed, 0);
  if (keyD) player.move(player.speed, 0);
}

void keysOff() {
  keyW = false;
  keyA = false;
  keyS = false;
  keyD = false;
}