using Toybox.System;
using Toybox.Timer;
using Toybox.WatchUi;
using Toybox.Math;
using Toybox.Lang;
class BreathExerciseModel{
	var cycle_time = 5; //seconds
	var starter_minutes	= 7.0; //minutes
	var training_minutes_left = starter_minutes;
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
       System.println("pouse breathing");
       myTimer.stop();
       return true;
    }
    
    function count_down(){
    	calulate_time_left();
    	System.println("time left: "+print_time_left()+ "");
    	System.println("time passed: "+time_passed()+ "");
    	System.println("time full_cycle_time: "+ full_cycle_time()+ "");
    	System.println("current cycle: "+ current_cycle()+ "");
    	System.println("all_cycle_count: "+ all_cycles_count()+ "");
    	WatchUi.requestUpdate();
    }
    function change_breath_state(){
    
    }
    function calulate_time_left(){
    	var training_minutes_in_seconds = training_minutes_left * 60;
    	//System.println("training_minutes_in_seconds: "+ training_minutes_in_seconds);
    	var training_minutes_in_miliseconds = training_minutes_left * 60000;
    	//System.println("training_minutes_in_miliseconds: "+ training_minutes_in_miliseconds);
    	var dif = training_minutes_in_miliseconds - loop_size_in_mili;
    	//System.println("training_minutes_in_miliseconds - loop_size_in_mili: " + dif/60000);
    	training_minutes_left = dif/60000;
    } 
    function current_cycle(){
    	return  Math.ceil(time_passed()/full_cycle_time()).toNumber();
    }
    
    function all_cycles_count(){
		return  Math.ceil(starter_minutes/full_cycle_time());
    }
    
    function time_passed(){
    	// return in minutes
    	return starter_minutes - training_minutes_left;  
    }
    
    function full_cycle_time(){
    	// return in minutes
    	var seconds = 0;
    	for( var i = 0; i < breath_states_ratio.size(); i++ ) {
    		seconds = seconds +  breath_states_ratio[i] * cycle_time;
		}
		return seconds.toFloat()/60; 
    }
    
    function current_state(){
    
    }
    function getTrainingLeftInSeconds(){
    	//return in seconds
    	return training_minutes_left* 60;
    }
    
    
    function to_milisenods(seconds){
    	return seconds*1000;
    }
    
    function to_seconds(milisenudns){
    	return milisenudns/1000;
    }
    
    function print_time_left() {
    	var full_minute = Math.floor(training_minutes_left);
    	var seconds_with_tens = (training_minutes_left - full_minute)*60;
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