package andreware;

import unreal.*;

import andreware.minigame.MinigameManager;

using andreware.utils.FindHelper;

@:uclass
class AAndrewareGamemode extends AGameMode
{
    var mesh:UStaticMeshComponent;

    var minigameManager:MinigameManager;

    public static var world:UWorld;

    public function new(wrapped)
    {
        super(wrapped);

        DefaultPawnClass = FindHelper.FindClass("/Game/FirstPersonCPP/Blueprints/FirstPersonCharacter");
        AAndrewareGamemode.world = GetWorld();

        //TODO Port the HUDClass
        //HUDClass = AAndrewareHUD::StaticClass();
    }

    public override function BeginPlay():Void
    {
        super.BeginPlay();
        minigameManager = new MinigameManager();
    }

    override function Tick(deltaTime:Float32) : Void
    {
        super.Tick(deltaTime);

        if(minigameManager != null) minigameManager.update(deltaTime);
    }
}
