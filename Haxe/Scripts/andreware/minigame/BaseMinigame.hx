package andreware.minigame;

class BaseMinigame implements IMinigame
{
    var hasWon(default, set):Bool = false;

    public function new()
    {

    }

    public function onStart():Void
    {
        trace("Debug", "Minigame", "Started");
    }

    public function onEnd():Void
    {
        trace("Debug", "Minigame", "Ended");
    }

    public function onFiveSecondsLeft():Void
    {
        trace("Debug", "Minigame", "Only 5 seconds left!");
    }

    public function update(deltaTime:Float):Void
    {

    }

    private function set_hasWon(value:Bool):Bool
    {
        trace("Winner!");
        return hasWon = value;
    }
}
