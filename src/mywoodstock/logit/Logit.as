package mywoodstock.logit 
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
		public static function get instance() :Logit
		{
			if ( _instance == null )
				new Logit();
				
			return _instance
		}
		
		private var _enabled :Boolean = true;
		
		private var _logOutput :LLogOutput = DEFAULT_LOG_TYPE;
		
		private var _tagIgnoreList :Vector.<String> = new <String>[];
		
		private var _lastSenderName :String;
		
		public function Logit() 
		{
			if ( _instance )
			{
				throw new Error("Illegal attempt to instanciate Singleton class. Use Logit.instance");
			}
			
			_instance = this;
			
			logHeader();
		}
		
		
		// Auto Logs
		
		private function logHeader( timestamp :Boolean = true ) :void
		{
			if( timestamp )
				slog(this, [], LOG_HEADER, new Date().toUTCString(), "\n");
			else
				slog(this, [], LOG_HEADER, "\n");
		}
		
		// Log Modes
		// TRACE
		
		private function logTrace(...args : *) :void
		{
			trace.apply(this, args);
		}
		
		// - log
		
		public function log(tags :Array, ...args : *) :void
		{
			if ( ! _enabled || ignoreTags( tags ) )
				return;
				
			switch(  _logOutput )
			{
				case LLogOutput.LOGIT_LOG_TRACE:
				default:
					logTrace.apply(this, parseLog( tags, args ));
			}
		}
		
		private function parseLog( tags :Array, log :* ) :*
		{
			var tagLogString :String = generateTagLogString( tags ); 
			return [tagLogString].concat( log )
		}
		
		// - slog
		
		public function slog(sender :*, tags :Array,  ...args :* ) :void
		{
			if ( ! _enabled || ignoreTags( tags ) )
				return;
			
			switch( _logOutput )
			{
				case LLogOutput.LOGIT_LOG_TRACE:
				default:
					logTrace.apply( this, parseSLog(sender, tags, args) );
			}
		}
		
		private function parseSLog( sender :*, tags :Array, log :* ) :*
		{
			var senderLogString :String = generateSenderLogString( sender );
			
			var tagLogString :String = generateTagLogString( tags );
			
			return [ senderLogString, tagLogString ].concat( log );
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
		
		private function generateTagLogString( tags :Array ) :String
		{
			return ( tags == null || tags.length == 0 ) ? "" : "[" + String( tags ) + "]";
		}
		
		private function ignoreTags( tags :Array ) :Boolean
		{
			for each( var tag :* in tags )
			{
				if (_tagIgnoreList.indexOf(tag) != -1 )
				{
					return true;
				}
			}
			
			return false;
		}
		
		public function addIgnoreTags( ...tags :* ) :void
		{
			for each( var tag :* in tags )
			{
				if (tag is String )
					_tagIgnoreList.push( tag );
			}
		}
	}
}

