using Toybox.System;
using Toybox.Timer;
using Toybox.WatchUi;
class BreathExerciseModel{
	var cycle_time = 5.2;
	var training_minutes = 7;
	var breath_in =  1;
	var hold_after_breath_in = 0;
	var breath_out =  2;
	var hold_after_breath_out = 3;
	var myTimer ;
	
	function start() {
       System.println("start breathing");
       myTimer = new Timer.Timer();
       myTimer.start(method(:count_down), 1000, true);
       return true;
    }
    
    function stop() {
       System.println("stop breathing");
       myTimer.stop();
       return true;
    }
    
    function count_down(){
    	System.println("counting breath");
    	WatchUi.requestUpdate();
    }
}