package  
{ // *****IMPORTANT******************************** GO TO PROJECT>PROPERTIES AND SET YOUR DIMENSIONS TO 640X480 *******************************************
  
	import net.flashpunk.Entity; // We control the entity
	import net.flashpunk.graphics.Image; // Our ball starts off as an image so we need Image
	import net.flashpunk.graphics.Text; // If we go to far then TEXT will appear, thats why we need it
	import net.flashpunk.World; // This is the world class...sooo ya we need it
	import net.flashpunk.FP; // Used to set the entity in the middle of the screen
	import net.flashpunk.utils.Input; // Used to check if we are using the arrow keys
	import net.flashpunk.utils.Key; // Used for the arrow keys
	
	/**
	 * ...
	 * @author Danny Murphy
	 */
	public class GameWorld extends World //GameWorld has the properties of the FP.world class
	{
		[Embed(source = "../lib/Ball.png")] private const BALL:Class; //Embed the ball into the GameWorld
		private var ballImg:Image = new Image(BALL); // Create a private var for the ball image
		private var ballEnt:Entity; // Create a var for the entity so we can control the image
		private var controlSpeed:int = 200; //How fast the ball will move when you move left or right or up or down
		private var text:Text; // The text for the text (confusing?)...
		private var textEnt:Entity; //The entity for the text itself
		private var textIsPresent:Boolean;
		
		public function GameWorld() //When the GameWorld has started do these things...
		{
			//Create a NEW entity that is in the middle of the screen (yay -.-) and set the graphic to the ballImg
			ballEnt = new Entity((FP.width / 2) - (ballImg.width / 2), (FP.height / 2) - (ballImg.height / 2), ballImg);
			add(ballEnt); //You always have to add the entity once you create a new one
		}
		override public function update():void //On every frame do these things...
		{
			// Controls the movement of the ball
			if (Input.check(Key.RIGHT)) { ballEnt.x += controlSpeed * FP.elapsed; } // If we are holding down the Right key then move the ballEnt to the right
			if (Input.check(Key.LEFT)) { ballEnt.x -= controlSpeed * FP.elapsed; } // If we are holding down the Left key then move the ballEnt to the left
			if (Input.check(Key.UP)) { ballEnt.y -= controlSpeed * FP.elapsed; } // If we are holding down the Up key then move the ballEnt to the up
			if (Input.check(Key.DOWN)) { ballEnt.y += controlSpeed * FP.elapsed; } // If we are holding down the Down key then move the ballEnt to the down
			
			//But what if the ball goes out of our sight? We want to place it back in the middle sooo....
			if (ballEnt.x <= 0 || ballEnt.y <= 0 || ballEnt.x + ballEnt.width >= FP.width || ballEnt.y + ballEnt.height >= FP.height)
			{//If the ball is anywhere outside of the box we can see...
				ballEnt.x = (FP.width / 2) - (ballImg.width / 2); // Set the x position to the center of the screen
				ballEnt.y = (FP.height / 2) - (ballImg.height / 2); // Set the y position to the center of the screen
				//Create a new text to say that you cant do that
				text = new Text("You can't do that!");
				text.color = 0xff0000; //This is red, just to make it look pwetty :)
				textEnt = new Entity((FP.width / 2) - (text.width / 2), 450, text); // Creates the textEnt at the x center and 450 at the y position
				add(textEnt); // Remember you always goota add an entity before it does anything!
				//A var that will control how the text will fade out then get removed **NOT PART OF THE TEST**
				textIsPresent = true; //Not part of the test but since the text is made, it is now true
			}
			//Controls how the text will fade out then get removed **NOT PART OF THE TEST**
			if (textIsPresent == true) { text.alpha -= 0.02; } //If the text has been created...make its tranperancy go down by .02 every frame
			//alpha is just the transperancy of an image or text or whatever, if its 0 then its not visible and 1 means it is visible
			if (textIsPresent == true && text.alpha <= 0) //If the transperancy is less then or equal to 0 and there IS text...
			{ textIsPresent == false; FP.world.remove(textEnt); } //Remove the text Entity and set 'textIsPresent' to False
			
			super.update();
		}
		
	}

}