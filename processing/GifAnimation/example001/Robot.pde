class Robot {

  Gif gif;
  float x;
  float y;
  
  Robot(float _x, float _y, Gif _gif) {
    x = _x;
    y = _y;
    gif = _gif;
  }
  
  void run() {
    imageMode(CENTER);
    image(gif, x, y);
  }
  
}