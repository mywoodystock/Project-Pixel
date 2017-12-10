package  
{
	import mywoodstock.logit.Logit;
	import flash.net.getClassByAlias;
	/**
	 * ...
	 * @author Adam
	 */
	public function slog(sender :*, tags :Array, ...args : *) :void
	{
		Logit.instance.slog.apply(this, [sender, tags].concat(args));
	}

}