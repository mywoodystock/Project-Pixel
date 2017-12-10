package mywoodstock.pp.mvc.controller.commands 
{
	import mywoodstock.logit.LLogTag;
	import mywoodstock.pp.util.PPLogTags;
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
			log([LLogTag.DEBUG, PPLogTags.MVC, PPLogTags.CONTROLLER], notification.getName() + " command executed.");
		}
		
	}

}