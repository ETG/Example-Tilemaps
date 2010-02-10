package
{
	import org.flixel.*;
	
	[SWF(width="400", height="300", backgroundColor="#000000")]
	[Frame(factoryClass = "Preloader")]
	
	
	
	public class TileTest extends FlxGame
	{
		public function TileTest()
		{
			super(200, 150, StartState, 2);
			showLogo = false;
		}
	}
}