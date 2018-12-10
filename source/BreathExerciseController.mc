using Toybox.Timer;
using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;


class BreathExerciseController{
	var mTimer;
    var mModel;
    var mRunning;
    
    // Initialize the controller
    function initialize() {

        // Allocate a timer
        mTimer = null;
        // Get the model from the application
        mModel = Application.getApp().model;
        // We are not running (yet)
        mRunning = false; 
    }
     // Start the recording process
    function start() {
        // Start the model's processing
        System.println("controller start timer");
        if(mRunning){
        	mModel.pause();
        	mRunning = false;
        }else{
        	mModel.start();
        	mRunning = true;
        } 
        
        // Flag that we are running
        
    }

    // Stop the recording process
    function stop() {
        // Stop the model's processing
        System.println("controller stop timer");
        mModel.stop();
        // Flag that we are not running
        mRunning = false;
    }
    // Are we running currently?
    function isRunning() {
        return mRunning;
    }
    
    function getTimeLeft() {
        return mModel.getTrainingLeftInSeconds();
    }
	
}