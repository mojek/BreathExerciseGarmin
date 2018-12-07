using Toybox.System;
using Toybox.Timer;
using Toybox.WatchUi;
using Toybox.Math;
using Toybox.Lang;
class BreathExerciseModel{
	var cycle_time = 5.2;
	var training_minutes = 7.0;
	var breath_states = ["inhale" , "hold on", "exhale" , "hold on"];
	var breath_states_ratio = [1, 0, 2, 3];
	
	var myTimer ;
	var loop_size_in_mili = 100;
	var current_breath_state;
	function start() {
       System.println("start breathing");
       myTimer = new Timer.Timer();
       myTimer.start(method(:count_down), loop_size_in_mili, true);
       return true;
    }
    
    function stop() {
       System.println("stop breathing");
       myTimer.stop();
       return true;
    }
    
     function pause() {
       System.println("stop breathing");
       myTimer.stop();
       return true;
    }
    
    function count_down(){
    	calulate_time_left();
    	System.println("time left: "+print_time_left()+ "");
    	WatchUi.requestUpdate();
    }
    function change_breath_state(){
    
    }
    function calulate_time_left(){
    	var training_minutes_in_seconds = training_minutes * 60;
    	//System.println("training_minutes_in_seconds: "+ training_minutes_in_seconds);
    	var training_minutes_in_miliseconds = training_minutes * 60000;
    	//System.println("training_minutes_in_miliseconds: "+ training_minutes_in_miliseconds);
    	var dif = training_minutes_in_miliseconds - loop_size_in_mili;
    	//System.println("training_minutes_in_miliseconds - loop_size_in_mili: " + dif/60000);
    	training_minutes = dif/60000;
    } 
    
    
    function to_milisenods(seconds){
    	return seconds*1000;
    }
    
    function to_seconds(milisenudns){
    	return milisenudns/1000;
    }
    
    function print_time_left() {
    	var full_minute = Math.floor(training_minutes);
    	var seconds_with_tens = (training_minutes - full_minute)*60;
    	var tens = (seconds_with_tens - seconds_with_tens.toNumber())*10;
    	var number_minute =  full_minute.toNumber();
    	var number_seconds = seconds_with_tens.toNumber();
    	return lead_zero(number_minute)+":"+lead_zero(number_seconds)+"."+tens.toNumber();
    }
    function lead_zero(number){
	    if(number < 10){
	    	return "0"+number;
	    }else{
	    	return number;
	   } 	
    }
    
    
}