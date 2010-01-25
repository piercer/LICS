package logger.application
{
	import logger.facade.LoggerFacade;
	
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	import spark.components.TextArea;
	
	public class LoggerApplication extends Application
	{

		public static const CORE:String = "Logger";
		public var textArea:TextArea;
		
		public function LoggerApplication()
		{
			addEventListener(FlexEvent.CREATION_COMPLETE,onCreationComplete);
		}
				
		private function onCreationComplete(event:FlexEvent):void
		{
			LoggerFacade.getInstance(CORE).startup(this);
		}
		
	}
}