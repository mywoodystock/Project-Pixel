package mywoodstock.pp.mvc.controller.commands 
{
	import mywoodstock.logit.LLogTag;
	import mywoodstock.pp.util.PPLogTag;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ...
	 * @author Adam
	 */
	public class PPSimpleCommand extends SimpleCommand 
	{
		
		override public function execute( notification :INotification ) :void
		{
			slog(this, [LLogTag.DEBUG, PPLogTag.MVC, PPLogTag.CONTROLLER], notification.getName() + " command executed.");
		}
		
	}

}