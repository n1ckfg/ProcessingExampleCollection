ArrayList<Room> rooms;
Room currentRoom;
PFont font;
int fontSize = 20;

RectButton goLeft,goForward, goRight;

void setup() {
  size(960, 540, P2D);
  font = loadFont("Arial120.vlw");
  textFont(font, fontSize);
    
  rooms = new ArrayList<Room>();
  
  Room room1 = new Room("room1");
  room1.northWall.nextRoom = "room2";
  rooms.add(room1);
    
  Room room2 = new Room("room2");
  room2.southWall.nextRoom = "room1";
  rooms.add(room2);
  
  currentRoom = getRoom("room1");

  goLeft = new RectButton(width/6, height/2, (int(width/3))-2, height);
  goForward = new RectButton(width/2, height/2, (int(width/3)), height);
  goRight = new RectButton((width/6)*5, height/2, (int(width/3))-2, height);
  goLeft.visible = goForward.visible = goRight.visible = false;
}

void draw() {
  currentRoom.run();
  
  fill(0);
  text(currentRoom.name, fontSize + 2, (fontSize * 1.5) + 2);
  fill(255, 255, 0);
  text(currentRoom.name, fontSize, fontSize * 1.5);
}

Room getRoom(String _name) {
  for (int i=0; i<rooms.size(); i++) {
    Room room = rooms.get(i);
    if (room.name == _name) return room;
  }
  return null;
}

void switchRoom() {
  Room nextRoom = getRoom(currentRoom.currentWall.nextRoom);
  if (currentRoom.currentWall == currentRoom.northWall) {
    nextRoom.currentWall = nextRoom.northWall;
  } else if (currentRoom.currentWall == currentRoom.southWall) {
    nextRoom.currentWall = nextRoom.southWall;
  } else if (currentRoom.currentWall == currentRoom.eastWall) {
    nextRoom.currentWall = nextRoom.eastWall;
  } else if (currentRoom.currentWall == currentRoom.westWall) {
    nextRoom.currentWall = nextRoom.westWall;
  }
  currentRoom = nextRoom;
}