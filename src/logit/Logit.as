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
		
		private var _lastSenderName :String;
		
		private var _tags : XML = new XML();
		
		public function Logit() 
		{
			if ( _instance != null )
			{
				throw new Error("Illegal attempt to instanciate Singleton class 'Logit'");
			}
			
			_tags = createInitialTags();
			
			logHeader();
		}
		
		
		// Auto Logs
		
		private function logHeader( timestamp :Boolean = true ) :void
		{
			if( timestamp )
				slog(this, LOG_HEADER, new Date().toUTCString(), "\n");
			else
				slog(this, LOG_HEADER, "\n");
		}
		
		// Log Modes
		// TRACE
		
		private function logTrace(...args : *) :void
		{
			trace.apply(this, args);
		}
		
		// - log
		
		public function log(...args : *) :void
		{
			switch(  _logOutput )
			{
				case LLogOutput.LOGIT_LOG_TRACE:
				default:
					logTrace.apply(this, parseLog( args ));
			}
		}
		
		private function parseLog( log :* ) :*
		{
			return log
		}
		
		// - slog
		
		public function slog(sender :*, ...args : * ) :void
		{
			switch( _logOutput )
			{
				case LLogOutput.LOGIT_LOG_TRACE:
				default:
					logTrace.apply( this, parseSLog(sender, args) );
			}
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
		
		// Tags
		
		private function createInitialTags() :XML
		{
			var root :String = LLogTag.ROOT;
			
			var initialTags :XML =
				<{LLogTag.ROOT}>
					<{LLogTag.ERROR}/>
					<{LLogTag.RELEASE}/>
					<{LLogTag.DEBUG}>
						<{LLogTag.WARNING}/>
					</{LLogTag.DEBUG}>
				</{LLogTag.ROOT}>
			
						trace( initialTags );
			return initialTags;
		}
		
		public function addTags( rootTag : String, tags :XML ) :void
		{
			var xml :XML = initialTags[ rootTag ];
			xml.push( tags );
		}
	}
}

