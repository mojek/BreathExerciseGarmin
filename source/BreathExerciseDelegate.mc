using Toybox.WatchUi;
using Toybox.Application;

class BreathExerciseDelegate extends WatchUi.BehaviorDelegate {
	var mController;
    function initialize() {
        BehaviorDelegate.initialize();
        mController = Application.getApp().controller;
    }

    function onSelect() {
        System.println("start timer");
        mController.start();
        return true;
    }
    
    function onBack() {
    	if(mController.isRunning()){
        	System.println("stop timer");
        	mController.stop();
        }else{
        	 System.exit();
        	
        }
        return true;
        
    }
     function onMenu() {  	
        WatchUi.pushView(new Rez.Menus.MainMenu(), new BreathExerciseMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}