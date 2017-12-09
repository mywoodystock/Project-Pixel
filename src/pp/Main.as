package pp
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Adam
-locale en_US -swf-version=30
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			//log("Hello World", "boom")
			slog(this, "Hello from sender", "boom")
			slog(this, "BAH BAH BAH")
			
			var test :TestClass = new TestClass();
			
			slog(this, "back to me!")
		}
		
	}
	
}