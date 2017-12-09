package pp
{
	import flash.display.Sprite;
	import logit.LLogTag;
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
			var logit :Logit = Logit.getInstance();
			
			//logit.addTags( createTags() );
			//log("Hello World", "boom")
			
			createLogTags();
		}
		
		private function createLogTags() :XML
		{
			return <root>
				</root>
		}
		
	}
	
}