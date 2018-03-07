void keyPressed() {
  if (keyCode == BACKSPACE && message.length() > 0) {
    message = message.substring(0, message.length()-1);
  } else if (keyCode == DELETE) {
    message = "";
  } else if (keyCode == ENTER || keyCode == RETURN) {
    result = getRhyme(message);
    message = "";
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    if (key != '\'' && key != '\"' && key !=',' && key != '.' && key != '?' && key != '!') {
      message = message + key;
    }
  }
}