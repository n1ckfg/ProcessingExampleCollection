"use strict";

function moveLeft() {
    if (currentRoom.currentWall === currentRoom.northWall) {
        currentRoom.currentWall = currentRoom.westWall;
    } else if (currentRoom.currentWall === currentRoom.southWall) {
        currentRoom.currentWall = currentRoom.eastWall;
    } else if (currentRoom.currentWall === currentRoom.eastWall) {
        currentRoom.currentWall = currentRoom.northWall;
    } else if (currentRoom.currentWall === currentRoom.westWall) {
        currentRoom.currentWall = currentRoom.southWall;
    }
}

function moveForward() {
    if (currentRoom.currentWall.nextRoom !== "none") {
        switchRoom();
    }
}

function moveRight() {
    if (currentRoom.currentWall === currentRoom.northWall) {
        currentRoom.currentWall = currentRoom.eastWall;
    } else if (currentRoom.currentWall === currentRoom.southWall) {
        currentRoom.currentWall = currentRoom.westWall;
    } else if (currentRoom.currentWall === currentRoom.eastWall) {
        currentRoom.currentWall = currentRoom.southWall;
    } else if (currentRoom.currentWall === currentRoom.westWall) {
        currentRoom.currentWall = currentRoom.northWall;
    }
}

function mousePressed() {
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