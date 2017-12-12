package mywoodstock.pp.mvc.view.mediators 
{
	import mywoodstock.pp.util.PPLogTag;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * ...
	 * @author Adam
	 */
	public class PPMediator extends Mediator 
	{
		
		public function PPMediator(mediatorName:String=null, viewComponent:Object=null) 
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister() :void
		{
			super.onRegister();
			
			slog(this, [PPLogTag.MVC, PPLogTag.VIEW], getMediatorName() + " mediator registered!");
		}
		
		override public function onRemove() :void
		{
			super.onRemove();
			
			slog(this, [PPLogTag.MVC, PPLogTag.VIEW], getMediatorName() + " mediator removed!");
			
		}
		
	}

}