package mywoodstock.pp
{
	import flash.display.Sprite;
	import mywoodstock.logit.LLogTag;
	import mywoodstock.logit.Logit;
	import mywoodstock.pp.mvc.PPFacade;
	import mywoodstock.pp.util.PPLogTag;
	/**
	 * ...
	 * @author Adam
-locale en_US -swf-version=30
	 */
	public class ProjectPixelApp extends Sprite 
	{
		
		private var _facade :PPFacade;
		
		public function ProjectPixelApp() 
		{
			init();
		}
		
		private function init() :void
		{
			initLogs();
			
			initFacade();
			
			bootup();
		}
		
		private function initLogs() :void
		{
			var logit :Logit = Logit.instance;
			
			//logit.addIgnoreTags([PPLogTag.MVC]);
		}
		
		private function initFacade() :void
		{
			_facade = PPFacade.getInstance();
		}
		
		private function bootup() :void
		{
			_facade.bootup(this);
		}
	}
	
}