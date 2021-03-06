﻿package
{
	import flash.geom.Point;
	import org.flixel.*;

	
	
	public class HexCState extends BaseState
	{
		[Embed(source = "Assets/SquareTiles.png")] private var TilesImg:Class;
		
		public var Map:FlxTilemap;
		
		public function HexCState()
		{
			super("Square Hex Tiles");
			
			// Setting up the Tile Map
			Map = new FlxTilemap();
			Map.loadMap("\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\n\
			1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2, 1, 2, 3, 2, 3, 2, 3, 2,\n\
			1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1, 1, 3, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1, 1, 1, 2, 3, 4, 4, 4, 1,\n\
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1",
			TilesImg, 10, 10, new Point(0,0));
			Map.oddRowOffset = true;
			
			Map.collideIndex = 2;
			
			add(Map);
		}
		
		public override function update():void 
		{
			if (Map.overlaps(Guy))
				TitleDisplay.color = 0xFFAA2233;
			else TitleDisplay.color = 0xFFFFFFFF;
			super.update();
		}
	}
}