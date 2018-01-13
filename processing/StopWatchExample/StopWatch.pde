// https://forum.processing.org/one/topic/timer-in-processing.html

class StopWatch {
  
  int startTime = 0;
  int stopTime = 0;
  boolean running = false;  
  int countdownMin = 0;
  
  // If you create the class with a countdown argument other than zero, it counts down.
  StopWatch(int _countdownMin) {
    init();
    countdownMin = _countdownMin;
  }
  
  void init() {
    startTime = 0;
    stopTime = 0;
    running = false;  
  }
  
  void start() {
    startTime = millis();
    running = true;
  }
  
  void stop() {
    stopTime = millis();
    running = false;
  }
  
  int getElapsedTime() {
    int elapsed;
    if (running) {
       elapsed = (millis() - startTime);
    } else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  
  int second() {
    if (running) {
      int sec = (getElapsedTime() / 1000) % 60;
      if (countdownMin == 0) {
        return sec;
      } else {
        int secDown = constrain(59 - sec, 0, 59);
        if (running && secDown == 0 && minute() == 0) init();
        return secDown;
      }
    } else {
      return 0;
    }
  }
  
  int minute() {
    if (running) {
      int min = (getElapsedTime() / (1000*60)) % 60;
      if (countdownMin == 0) {
        return min;
      } else {
        int minDown = constrain((countdownMin - 1) - min, 0, countdownMin);
        return minDown;
      }
    } else {
      return 0;
    }
  }
  
  int hour() {
    if (running) {
      return (getElapsedTime() / (1000*60*60)) % 24;
    } else {
      return (0);
    }
  }
  
  boolean countdownFinished() {
    boolean returns = countdownMin != 0 && minute() <= 0 && second() <= 0;
    if (returns) init();
    return returns;
  }
  
}