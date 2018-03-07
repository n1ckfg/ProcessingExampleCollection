"use strict";

class Room {

    constructor(_name) {
        this.name = _name;
        this.northWall = new Wall("./images/" + this.name + "/" + "north.png");
        this.southWall = new Wall("./images/" + this.name + "/" + "south.png");
        this.eastWall = new Wall("./images/" + this.name + "/" + "east.png");
        this.westWall = new Wall("./images/" + this.name + "/" + "west.png");    
        this.currentWall = this.northWall;        
    }
    
    run() {
        image(this.currentWall.img, 0, 0, width, height);
    }    
    
}


class Wall {
    
    constructor(_img) {
        this.img = loadImage(_img);
        this.nextRoom = "none";
    }

}
