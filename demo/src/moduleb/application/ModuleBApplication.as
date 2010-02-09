/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package moduleb.application
{
	import flash.events.Event;
	
	import moduleb.facade.ModuleBFacade;
	
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	import spark.components.TextArea;
	
	public class ModuleBApplication extends Application
	{

		public static const CORE:String = "moduleB";
		public var textArea:TextArea;
		
		public function ModuleBApplication()
		{
			addEventListener(FlexEvent.CREATION_COMPLETE,onCreationComplete);
			addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}
		
		private function onCreationComplete(event:FlexEvent):void
		{
			ModuleBFacade.getInstance(CORE).startup(this);
		}
		
		private function onAddedToStage(event:Event):void
		{
			loaderInfo.addEventListener(Event.UNLOAD,onUnload);			
		}
		
		private function onUnload(event:Event):void
		{
			ModuleBFacade.getInstance(CORE).unload();
		}
		
	}
}