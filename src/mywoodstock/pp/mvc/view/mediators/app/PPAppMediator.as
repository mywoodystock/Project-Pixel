package mywoodstock.pp.mvc.view.mediators.app 
{
	import mywoodstock.pp.ProjectPixelApp;
	import mywoodstock.pp.mvc.view.mediators.PPMediator;
	/**
	 * ...
	 * @author Adam
	 */
	public class PPAppMediator extends PPMediator 
	{
		public static const NAME :String = "PPAppMediator";
		
		public function PPAppMediator( app :ProjectPixelApp ) 
		{
			super( NAME, app );
		}
		
		private function get app() :ProjectPixelApp
		{
			return viewComponent as ProjectPixelApp
		}		
	}

}