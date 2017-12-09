package logit 
{
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Adam
-locale en_US -swf-version=30
	 */
	 
	public class Logit 
	{
		
		private static const VERSION :String = "0.5";
		private static const DEFAULT_LOG_TYPE :LLogOutput = LLogOutput.LOGIT_LOG_TRACE;
		private static const LOG_HEADER :String = "Logit v" + VERSION
		
		private static var _instance :Logit;
		public static function getInstance() :Logit
		{
			if ( _instance == null )
				_instance = new Logit();
				
			return _instance
		}
		
		private var _logOutput :LLogOutput = DEFAULT_LOG_TYPE;
		
		private static var _lastSenderName :String;
		
		public function Logit() 
		{
			if ( _instance != null )
			{
				throw new Error("Illegal attempt to instanciate Singleton class 'Logit'");
			}
			
			logHeader();
		}
		
		private function logHeader( timestamp :Boolean = true ) :void
		{
			if( timestamp )
				slog(this, LOG_HEADER, new Date().toUTCString(), "\n");
			else
				slog(this, LOG_HEADER, "\n");
		}
		
		private function logTrace(...args : *) :void
		{
			trace.apply(this, args);
		}
		
		private function parseLog( log :* ) :*
		{
			return log
		}
		
		private function parseSLog( sender :*, log:* ) :*
		{
			var senderLogString :String = generateSenderLogString( sender );
			return [senderLogString].concat( log );
		}
		
		private function generateSenderLogString( sender :* ) :String
		{
			var className :String = getQualifiedClassName( sender );
			
			if ( className != _lastSenderName )
			{
				_lastSenderName = className;
				return getQualifiedClassName( sender ) + "\n > ";
			}
			else
			{
				return " > "
			}
			
			
		}
		
		public function log(...args : *) :void
		{
			switch(  _logOutput )
			{
				case LLogOutput.LOGIT_LOG_TRACE:
				default:
					logTrace.apply(this, parseLog( args ));
			}
		}
		
		public function slog(sender :*, ...args : * ) :void
		{
			switch( _logOutput )
			{
				case LLogOutput.LOGIT_LOG_TRACE:
				default:
					logTrace.apply( this, parseSLog(sender, args) );
			}
		}
	}
}

