// Generated by Haxe
using haxe.root;

#pragma warning disable 109, 114, 219, 429, 168, 162
public class HaxeExternalModule : global::BaseModuleRules {
	
	public HaxeExternalModule(global::UnrealBuildTool.TargetInfo target) : base(target) {
	}
	
	
	public override void run(global::UnrealBuildTool.TargetInfo target, bool firstRun) {
		this.Type = global::UnrealBuildTool.ModuleRules.ModuleType.External;
		this.PublicAdditionalLibraries.Add(((string) (global::HaxeModuleRules.getLibLocation(target)) ));
	}
	
	
}


