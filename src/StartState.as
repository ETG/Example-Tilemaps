package
{
	import org.flixel.*;

	
	
	public class StartState extends FlxState
	{
		[Embed(source = "Assets/Cursor.png")] private var CursorImg:Class;
		
		
		public var TitleDisplay:FlxText;
		public var TitleShadow:FlxText;
		
		public var SayDisplay:FlxText;
		public var SayShadow:FlxText;
		
		public function StartState()
		{
			super();
			
			bgColor = 0xFF663399;
			FlxG.showCursor(CursorImg);
			
			
			TitleDisplay = new FlxText(0,5, 200, "Tiles Test");
			TitleDisplay.size = 8;
			
			TitleShadow = new FlxText(1,6, 200, "Tiles Test");
			TitleShadow.size = 8;
			
			TitleDisplay.color = 0xFFFFFFFF;
			TitleShadow.color = 0xFF000000;
			
			TitleDisplay.alignment = "center";
			TitleShadow.alignment = "center";
			
			add(TitleShadow);
			add(TitleDisplay);
			
			MakeButton(13, 30,"Isometric", IsoPress);
			MakeButton(13, 50,"Hex Type A", HexAPress);
			MakeButton(13, 70,"Hex Type B", HexBPress);
			MakeButton(13, 90,"Square Hex", HexCPress);
			MakeButton(13, 110, "Irregular", PuzzPress);
			
			var Say1:FlxText = new FlxText(82, 40, 150, "Select a tilemap type\nfrom the options\non the right.\n\nArrow Keys scroll map.\nMouse click to return.");
			Say1.color = 0xFF000000;
			add(Say1);
		}
		
		private function MakeButton(Xpos:int, Ypos:int, Text:String, Callback:Function):void
		{
			var ButtonBG:FlxSprite = new FlxSprite(0, 0);
			ButtonBG.createGraphic(Text.length * 6 +4,11,0xFF3C2D87);
			var ButtonOver:FlxSprite = new FlxSprite(0, 0);
			ButtonOver.createGraphic(Text.length * 6 +4,11,0xFF5B45CC);
			
			var ButtonA:FlxButton = new FlxButton(Xpos, Ypos, Callback);
			ButtonA.loadText(new FlxText(1, -1, Text.length * 6, Text));
			ButtonA.loadGraphic(ButtonBG, ButtonOver);
			add(ButtonA);
		}
		
		public function IsoPress():void
		{
			FlxG.switchState(IsoState);			
		}
		
		public function HexAPress():void
		{
			FlxG.switchState(HexAState);			
		}
		
		public function HexBPress():void
		{
			FlxG.switchState(HexBState);			
		}
		
		public function HexCPress():void
		{
			FlxG.switchState(HexCState);			
		}
		
		public function PuzzPress():void
		{
			FlxG.switchState(PuzzState);			
		}
	}
}