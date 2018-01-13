class Robot {
  
  Gif robot, banana, current;
  
  Robot(PApplet sketch) {
    
    robot = new Gif(sketch, "robot.gif");
    robot.loop();
    robot.play();
    
    banana = new Gif(sketch, "banana.gif");
    banana.loop();
    banana.play();
    
    current = robot;
  }
  
  void update() {
    if (mousePressed) {
      current = banana;
    } else {
      current = robot;
    }
  }
  
  void draw() {
    imageMode(CENTER);
    image(current, mouseX, mouseY);
  }
  
  void run() {
    update();
    draw();
  }
    
}