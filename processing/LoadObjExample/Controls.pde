void keyPressed() {
  switch(key) {
    case('1'):
      gs = GameState.NATIVE;
      break;
    case('2'):
      gs = GameState.MESHOBJ;
      break;
    case('3'):
      gs = GameState.MESHOBJ_VOXEL;
      break;
  }
}
