package  
{
	import logit.Logit;
	import flash.net.getClassByAlias;
	/**
	 * ...
	 * @author Adam
	 */
	public function slog(sender :*, ...args : *) :void
	{
		Logit.getInstance().slog.apply(this, [sender].concat(args));
	}

}