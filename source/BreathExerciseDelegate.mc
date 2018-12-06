using Toybox.WatchUi;

class BreathExerciseDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new BreathExerciseMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}