package mywoodstock.pp
{
	import flash.display.Sprite;
	import mywoodstock.pp.mvc.PPFacade;
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
			_facade = PPFacade.getInstance();
			
			_facade.startup( this );
		}
	}
	
}