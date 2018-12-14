using Toybox.WatchUi;

class BreathExerciseView extends WatchUi.View {
	hidden var mModel;
    hidden var mController;
    hidden var mLabel;
    hidden var mLabelCurrentTime;
    hidden var mLabelCurrentState;
    hidden var mPrompt;
    hidden var mTimer;

    function initialize() {
    	View.initialize();
        // Get the model and controller from the Application
        mModel = Application.getApp().model;
        mController = Application.getApp().controller;
        // Initialize the label
        mLabel = null;
        mLabelCurrentTime = null;
        mLabelCurrentState = null;
        mPrompt = WatchUi.loadResource(Rez.Strings.prompt);
        
    
    }

    // Load your resources here
    function onLayout(dc) {
    	setLayout(Rez.Layouts.MainLayout(dc));
    	mLabel = View.findDrawableById("MainLabel");
    	mLabelCurrentTime = View.findDrawableById("mLabelCurrentTime");
    	mLabelCurrentState = View.findDrawableById("mLabelCurrentState");
       
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
		
	}

    // Update the view
   function onUpdate(dc) {
        // If we are running, show a running clock
      	var timeString = printTimeLeft();
        mLabel.setText(timeString);
        
        //mLabelCurrentTime.setText(timeString);
        //mLabelCurrentState.setText(timeString);
        
        if(mController.isRunning() ) {
            mLabelCurrentTime.setText(printTimeLeftBreathState());
        	mLabelCurrentState.setText(mModel.current_breath_state_label());
        }else{
        	//mLabel.setText(mPrompt);
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    function printTimeLeft(){
    	var time = mController.getTimeLeft(); 
    	var minutes = Math.floor(time/60);
        var seconds =  Math.floor((time/60 - minutes)*60).toNumber();
        var tenth = (((time/60 - minutes)*60 - seconds)*10).toNumber();
        var timeString = Lang.format("$1$:$2$:$3$", [minutes.format("%02d"),seconds.format("%02d"),tenth]);
        return timeString;
    }
    function printTimeLeftBreathState(){
    	var time_left_breath_state =  mModel.time_left_breath_state();
    	return  Lang.format("$1$", [time_left_breath_state.format("%.1f")]);
    }
    
   
}
