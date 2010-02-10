package
{
	import flash.geom.Point;
	import org.flixel.*;

	
	
	public class BaseState extends FlxState
	{
		[Embed(source = "Assets/Cursor.png")] private var CursorImg:Class;
		[Embed(source = "Assets/Guy.png")] private var GuyImg:Class;
		
		
		public var TitleDisplay:FlxText;
		public var TitleShadow:FlxText;
		
		public var Guy:FlxSprite;
		
		public var Overlay:FlxLayer;
		
		public function BaseState(Title:String)
		{
			super();
			
			Overlay = new FlxLayer();
			
			bgColor = 0xFF663399;
			FlxG.showCursor(CursorImg);
			
			
			Guy = new FlxSprite(-20, -20, GuyImg);
			Overlay.add(Guy);
			FlxG.follow(Guy, 1);
			
			TitleDisplay = new FlxText(0,5, 200, Title);
			TitleDisplay.size = 8; TitleDisplay.scrollFactor = new Point();
			
			TitleShadow = new FlxText(1,6, 200, Title);
			TitleShadow.size = 8; TitleShadow.scrollFactor = new Point();
			
			TitleDisplay.color = 0xFFFFFFFF;
			TitleShadow.color = 0xFF000000;
			
			TitleDisplay.alignment = "center";
			TitleShadow.alignment = "center";
			
			Overlay.add(TitleShadow);
			Overlay.add(TitleDisplay);
		}
		
		public override function update():void 
		{
			if (FlxG.mouse.justPressed())
				FlxG.switchState(StartState);
			
			if (FlxG.keys.UP)
				Guy.y -= 40 * FlxG.elapsed;
			if (FlxG.keys.DOWN)
				Guy.y += 40 * FlxG.elapsed;
			if (FlxG.keys.LEFT)
				Guy.x -= 40 * FlxG.elapsed;
			if (FlxG.keys.RIGHT)
				Guy.x += 40 * FlxG.elapsed;
			
			Overlay.update();
			
			super.update();
		}
		
		public override function render():void 
		{
			super.render();
			Overlay.render();
		}
	}
}