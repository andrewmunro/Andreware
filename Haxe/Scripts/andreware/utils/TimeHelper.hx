package andreware.utils;

import unreal.*;
import unreal.FTimerManager;

class TimerHelper
{
    public static function createTimer(callback:Void->Void, delay:Float32, loop:Bool = true, startDelay:Float32 = -1.0):FTimerHandle
    {
        var timer:FTimerHandle = FTimerHandle.create();
        var timerDelegate = FTimerDelegate.create();
        timerDelegate.BindLambda(callback);

        var timerManager = getTimerManager();
        if(timerManager == null)
        {
            trace("Error", "TimeHelper: Timer Manager was NULL!");
            return null;
        }

        getTimerManager().SetTimer(timer, timerDelegate, delay, loop, startDelay);
        return timer;

    }

    public static function destroyTimer(timerHandle):Void
    {
        getTimerManager().ClearTimer(timerHandle);
    }

    public static function getTimerManager():FTimerManager
    {
        return AAndrewareGamemode.world != null ? AAndrewareGamemode.world.GetTimerManager() : null;
    }
}
