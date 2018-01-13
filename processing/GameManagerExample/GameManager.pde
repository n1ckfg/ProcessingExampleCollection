// https://forum.processing.org/two/discussion/9877/how-to-use-enums

class GameManager {

  GameState gameState;
  color backupColor;
  
  GameManager() {
    gameState = GameState.PLAY;
    backupColor = color(buttons[0].clickedColor);
  }
  
  void run() {
     switch (gameState) {
       case PLAY:
         boolean gotoEnd = true;
         for (int i=0; i<buttons.length; i++) {
           if (!buttons[i].clicked) gotoEnd = false;
         }
         if (gotoEnd) gameState = GameState.END;
         break;
         
       case END:
         for (int i=0; i<buttons.length; i++) {
           buttons[i].clickedColor = color(255, 127, 0);
         }
         break;
     }
  }
  
  void reset() {
    gameState = GameState.PLAY;
    for (int i=0; i<buttons.length; i++) {
      buttons[i].clickedColor = backupColor;
      buttons[i].clicked = false;
      buttons[i].hovered = false;
    }
    player.reset();
  }

}