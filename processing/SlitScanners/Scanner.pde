class Scanner {
  
  PImage img;  
  int getSliceX, setSliceX;
  int sliceDelta = -1;

  Scanner() {
    img = createImage(width, height, RGB);
    init(buffer.width / 2, img.width - 1);
  }
  
  Scanner(int _sliceDelta) {
    img = createImage(width, height, RGB);
    init(buffer.width / 2, img.width - 1);
    sliceDelta = _sliceDelta;
  }
  
  Scanner(int _sliceDelta, int _getSliceX, int _setSliceX) {
    img = createImage(width, height, RGB);
    init(_getSliceX, _setSliceX);
    sliceDelta = _sliceDelta;
  }
  
  void init(int _getSliceX, int _setSliceX) {
    getSliceX = _getSliceX;
    setSliceX = _setSliceX;
  }
  
  void update() {
    img.loadPixels();
    
    for (int y = 0; y < buffer.height; y++) {
      int setPixelIndex = y * img.width + setSliceX;
      int getPixelIndex = y * buffer.width + getSliceX;
      if (setPixelIndex > 0 && setPixelIndex < img.pixels.length && getPixelIndex > 0 && getPixelIndex < buffer.pixels.length) {
        img.pixels[setPixelIndex] = buffer.pixels[getPixelIndex];
      }
    }

    img.updatePixels();

    setSliceX += sliceDelta;
    if (setSliceX < 0 || setSliceX > img.width-1) sliceDelta *= -1;
  }
  


  
  void draw() {
    tex.beginDraw();
    tex.background(0);
    tex.image(img, 0, 0);
    tex.endDraw();
  }
  
  void run() {
    update();
    draw();
  }

}