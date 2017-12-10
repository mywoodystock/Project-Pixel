package pp
{
	import flash.display.Sprite;
	import logit.Logit;
	
	/**
	 * ...
	 * @author Adam
-locale en_US -swf-version=30
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			var t :Vector.<String> = new <String>[];
			
			var _logit :Logit = Logit.instance;
			_logit.addIgnoreTags("MVC", "DEBUG");
			
			//logit.log([], "ff");
			
			//logit.addTags( createTags() );
			//log("Hello World", "boom")
			
			slog(this, ["DEBUG", "MVC"], "message")
			slog(this, ["MVC"], "message 2")
			slog(this, ["DEBUG"], "message 3")
		}
	}
	
}