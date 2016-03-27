package andreware.minigame.games;

class ShootFiveTimesMinigame extends BaseMinigame
{
    public override function onStart():Void
    {
        trace("Debug", "Minigame", "Shoot 5 times to win!");
        super.onStart();
    }

    public override function update(deltaTime:Float)
    {
        super.update(deltaTime);
    }
}
