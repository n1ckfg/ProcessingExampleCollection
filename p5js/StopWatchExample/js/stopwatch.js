"use strict";

// https://forum.processing.org/one/topic/timer-in-processing.html

class StopWatch {
    
    // If you create the class with a countdown argument other than zero, it counts down.
    constructor(_countdownMin) {
        this.init();
        this.countdownMin = _countdownMin;
    }
    
    init() {
        this.startTime = 0;
        this.stopTime = 0;
        this.running = false;    
    }
    
    start() {
        this.startTime = millis();
        this.running = true;
    }
    
    stop() {
        this.stopTime = millis();
        this.running = false;
    }
    
    getElapsedTime() {
        var elapsed;
        if (this.running) {
             elapsed = (millis() - this.startTime);
        } else {
            elapsed = (this.stopTime - this.startTime);
        }
        return elapsed;
    }
    
    second() {
        if (this.running) {
            var sec = (this.getElapsedTime() / 1000) % 60;
            if (this.countdownMin == 0) {
                return parseInt(sec);
            } else {
                var secDown = constrain(59 - sec, 0, 59);
                if (this.running && secDown == 0 && minute() == 0) this.init();
                return parseInt(secDown);
            }
        } else {
            return parseInt(0);
        }
    }
    
    minute() {
        if (this.running) {
            var min = (this.getElapsedTime() / (1000*60)) % 60;
            if (this.countdownMin == 0) {
                return parseInt(min);
            } else {
                var minDown = constrain(this.countdownMin - min, 0, this.countdownMin);
                return parseInt(minDown);
            }
        } else {
            return parseInt(0);
        }
    }
    
    hour() {
        if (this.running) {
            var hr = (this.getElapsedTime() / (1000*60*60)) % 24;
            return parseInt(hr);
        } else {
            return parseInt(0);
        }
    }
    
    countdownFinished() {
        var returns = this.countdownMin != 0 && this.minute() <= 0 && this.second() <= 0;
        if (returns) this.init();
        return returns;
    }
    
}