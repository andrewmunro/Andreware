package andreware.minigame;

interface IMinigame
{
    public function onStart():Void;
    public function onFiveSecondsLeft():Void;
    public function update(deltaTime:Float):Void;
    public function onEnd():Void;
}
