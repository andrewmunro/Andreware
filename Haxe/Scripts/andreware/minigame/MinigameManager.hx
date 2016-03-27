package andreware.minigame;

import unreal.*;
import andreware.minigame.games.*;

using andreware.utils.RandomHelper;
using andreware.utils.TimeHelper;

class MinigameManager
{
    public static inline var MINIGAME_LENGTH:Int = 30;

    var minigames:Array<IMinigame>;
    var currentMinigame:IMinigame;

    var gameTimer:FTimerHandle;
    var secondsLeft:Int;

    public function new()
    {
        minigames = [
            new ShootFiveTimesMinigame()
        ];

        startNextGame();
    }

    private function startNextGame()
    {
        currentMinigame = minigames.randomItem();
        currentMinigame.onStart();

        secondsLeft = MINIGAME_LENGTH;

        gameTimer = TimerHelper.createTimer(function():Void
        {
            secondsLeft -= 1;

            if(secondsLeft == 5)
            {
                currentMinigame.onFiveSecondsLeft();
            }

            if(secondsLeft <= 0)
            {
                currentMinigame.onEnd();
                TimerHelper.destroyTimer(gameTimer);
            }

            trace("Seconds left: " + secondsLeft);
        }, 1.0);

    }

    public function update(deltaTime:Float)
    {
        if(currentMinigame != null) currentMinigame.update(deltaTime);
    }
}
