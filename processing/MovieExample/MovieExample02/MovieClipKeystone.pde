class MovieClipKeystone extends MovieClip {

  CornerPinSurface surface;
  PGraphics offscreen;
  boolean firstRun = true;
  
  MovieClipKeystone(PApplet sketch, String fileName) {
    super(sketch, fileName);
  }

  void draw() {
    if (movie.available()) {
      movie.read();
      if (firstRun) {
        surface = ks.createCornerPinSurface(movie.width, movie.height, 20);
        offscreen = createGraphics(movie.width, movie.height, P3D);
        firstRun = false;
      }
    }
    
    offscreen.beginDraw();  
    offscreen.imageMode(CENTER);
    offscreen.tint(255, alpha);
    offscreen.image(movie, offscreen.width/2, offscreen.height/2);
    offscreen.noTint();
    offscreen.endDraw();
    
    surface.render(offscreen);
  }

}