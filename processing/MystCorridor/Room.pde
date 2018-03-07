class Room {

  String name;
  Wall northWall, southWall, eastWall, westWall;
  Wall currentWall;
  
  Room(String _name) {
    init(_name);
    currentWall = northWall;    
  }
  
  void init(String _name) {
    name = _name;
    northWall = new Wall(_name + "/" + "north.png");
    southWall = new Wall(_name + "/" + "south.png");
    eastWall = new Wall(_name + "/" + "east.png");
    westWall = new Wall(_name + "/" + "west.png");  
  }
 
  void run() {
    image(currentWall.img, 0, 0, width, height);
  }  
  
}

class Wall {
  
  PImage img;
  String nextRoom = "none";
  
  Wall(String _img) {
    img = loadImage(_img);
  }

}