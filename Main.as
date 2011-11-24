package 
{
  import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Danny Murphy
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			// *****IMPORTANT********* GO TO PROJECT>PROPERTIES AND SET YOUR DIMENSIONS TO 640X480 *******************************************
			
			super(640, 480, 60, false); // Create the games width and height and framerate 
			FP.world = new GameWorld; // Starts a new GameWorld
		}
		
	}
	
}