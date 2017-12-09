package  
{
	import logit.Logit;
	/**
	 * ...
	 * @author Adam
	 */
	public function log(...args : *) :void
	{
		Logit.getInstance().log.apply(this, args);
	}

}