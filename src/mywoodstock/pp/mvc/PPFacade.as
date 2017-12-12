package mywoodstock.pp.mvc 
{
	import mywoodstock.pp.ProjectPixelApp;
	import mywoodstock.pp.mvc.controller.commands.PPCommands;
	import mywoodstock.pp.mvc.controller.commands.startup.BootupCommand;
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
		
		private var _booted :Boolean;
		
		public function PPFacade() 
		{
			super();
			
		}
		
		override protected function initializeController() :void
		{
			super.initializeController();
			
			registerCommand( PPCommands.BOOTUP, BootupCommand );
		}
		
		public function bootup( app :ProjectPixelApp ) :void
		{
			sendNotification( PPCommands.BOOTUP, app );
		}
		
	}

}