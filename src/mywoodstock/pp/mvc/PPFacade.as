package mywoodstock.pp.mvc 
{
	import mywoodstock.pp.ProjectPixelApp;
	import mywoodstock.pp.mvc.controller.commands.PPCommands;
	import mywoodstock.pp.mvc.controller.commands.startup.StartupCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	/**
	 * ...
	 * @author Adam
	 */
	public class PPFacade extends Facade 
	{
		public static function getInstance() :PPFacade
		{
			if ( instance == null )
				instance = new PPFacade()
				
			return instance as PPFacade;
		}
		
		
		public function PPFacade() 
		{
			super();
			
		}
		
		override protected function initializeController() :void
		{
			super.initializeController();
			
			registerCommand( PPCommands.STARTUP, StartupCommand );
		}
		
		public function startup( app :ProjectPixelApp ) :void
		{
			sendNotification( PPCommands.STARTUP, app );
		}
		
	}

}