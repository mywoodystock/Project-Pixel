package mywoodstock.pp.mvc.controller.commands.startup 
{
	import mywoodstock.pp.ProjectPixelApp;
	import mywoodstock.pp.mvc.controller.commands.PPSimpleCommand;
	import mywoodstock.pp.mvc.view.mediators.app.PPAppMediator;
	import org.puremvc.as3.interfaces.INotification;
	/**
	 * ...
	 * @author Adam
	 */
	public class BootupCommand extends PPSimpleCommand 
	{
		
		override public function execute( notification :INotification ) :void
		{
			super.execute( notification );
			
			var app :ProjectPixelApp = notification.getBody() as ProjectPixelApp;
			
			registerCommands();
			
			registerProxies();
			
			registerMediators( app );
			
		}
		
		private function registerCommands() :void
		{
			
		}
		
		private function registerProxies() :void
		{
			
		}
		
		private function registerMediators( app :ProjectPixelApp ) :void
		{
			var appMediator :PPAppMediator = new PPAppMediator( app );
			facade.registerMediator( appMediator );
		}
		
	}

}