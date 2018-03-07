void moveLeft() {
  if (currentRoom.currentWall == currentRoom.northWall) {
    currentRoom.currentWall = currentRoom.westWall;
  } else if (currentRoom.currentWall == currentRoom.southWall) {
    currentRoom.currentWall = currentRoom.eastWall;
  } else if (currentRoom.currentWall == currentRoom.eastWall) {
    currentRoom.currentWall = currentRoom.northWall;
  } else if (currentRoom.currentWall == currentRoom.westWall) {
    currentRoom.currentWall = currentRoom.southWall;
  }
}

void moveForward() {
  if (!currentRoom.currentWall.nextRoom.equals("none")) {
    switchRoom();
  }
}

void moveRight() {
  if (currentRoom.currentWall == currentRoom.northWall) {
    currentRoom.currentWall = currentRoom.eastWall;
  } else if (currentRoom.currentWall == currentRoom.southWall) {
    currentRoom.currentWall = currentRoom.westWall;
  } else if (currentRoom.currentWall == currentRoom.eastWall) {
    currentRoom.currentWall = currentRoom.southWall;
  } else if (currentRoom.currentWall == currentRoom.westWall) {
    currentRoom.currentWall = currentRoom.northWall;
  }
}

void mousePressed() {
  goLeft.run();
  goForward.run();
  goRight.run();
  
  if (goLeft.clicked) {
    moveLeft();
  } else if (goForward.clicked) {
    moveForward();
  } else if (goRight.clicked) {
    moveRight();
  }
}