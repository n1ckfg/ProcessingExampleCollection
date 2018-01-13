"use strict";

class GameManager {

  constructor() {
  	this.GameState = { PLAY: 1, END: 2 };
  	Object.freeze(this.GameState);
    this.gameState = this.GameState.PLAY;
    this.backupColor = color(buttons[0].clickedColor);
  }
  
  run() {
     switch (this.gameState) {
       case this.GameState.PLAY:
         var gotoEnd = true;
         for (var i=0; i<buttons.length; i++) {
           if (!buttons[i].clicked) gotoEnd = false;
         }
         if (gotoEnd) this.gameState = this.GameState.END;
         break;
         
       case this.GameState.END:
         for (var i=0; i<buttons.length; i++) {
           buttons[i].clickedColor = color(255, 127, 0);
         }
         break;
     }
  }
  
  reset() {
    this.gameState = this.GameState.PLAY;
    for (var i=0; i<buttons.length; i++) {
      buttons[i].clickedColor = this.backupColor;
      buttons[i].clicked = false;
      buttons[i].hovered = false;
    }
    player.reset();
  }

}

