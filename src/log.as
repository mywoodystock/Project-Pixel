package  
{
	import logit.Logit;
	/**
	 * ...
	 * @author Adam
	 */
	public function log( tags :Array, ...args : *) :void
	{
		Logit.instance.log.apply(this, [tags].concat( args));
	}

}