using Toybox.Application;
using Toybox.WatchUi;

class BreathExerciseApp extends Application.AppBase {
	var model;
    var controller;

    function initialize() {
        System.println("init  breathing");
        AppBase.initialize();
        model = new $.BreathExerciseModel();
        controller = new $.BreathExerciseController();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	System.println("onStart init");
    	
    }
 

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new BreathExerciseView(), new BreathExerciseDelegate() ];
    }

}
