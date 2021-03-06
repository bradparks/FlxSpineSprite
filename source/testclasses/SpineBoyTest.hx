package  testclasses;
import flixel.FlxG;
import spinehx.SkeletonData;

/**
 * ...
 * @author Kris
 */
class SpineBoyTest extends FlxSpineSprite
{

	public function new( skeletonData:SkeletonData,  X:Float = 0, Y:Float = 0, Width:Int = 0, Height:Int = 0 ) 
	{
		super( skeletonData, X, Y, Width, Height );
		
		skeleton.setX(150);
        skeleton.setY(360); 
		
		stateData.setMixByName("walk", "jump", 0.2);
        stateData.setMixByName("jump", "walk", 0.4);
        stateData.setMixByName("jump", "jump", 0.2);
		
        state.setAnimationByName("walk", true);
		
		timeScale = 0.333;
		
	}
	
	override private function handleAnimations():Void
	{
		if (state.getAnimation().getName() == "walk") {
            // After one second, change the current animation. Mixing is done by AnimationState for you.
            if (state.getTime() > 2) state.setAnimationByName("jump", false);
        } else {
            if (state.getTime() > 1) state.setAnimationByName("walk", true);
        }
		
		if ( FlxG.mouse.justPressed() )
		{
			state.setAnimationByName("jump", false);
			state.addAnimationByNameSimple("walk", true);
		}
	}
	
}