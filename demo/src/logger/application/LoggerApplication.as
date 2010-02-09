/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
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