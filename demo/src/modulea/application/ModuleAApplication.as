package modulea.application
{
	import flash.events.Event;
	
	import modulea.facade.ModuleAFacade;
	
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	import spark.components.TextArea;
	
	public class ModuleAApplication extends Application
	{

		public static const CORE:String = "moduleA";
		public var textArea:TextArea;
		
		public function ModuleAApplication()
		{
			addEventListener(FlexEvent.CREATION_COMPLETE,onCreationComplete);
			addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}
		
		private function onCreationComplete(event:FlexEvent):void
		{
			ModuleAFacade.getInstance(CORE).startup(this);
		}
		
		private function onAddedToStage(event:Event):void
		{
			loaderInfo.addEventListener(Event.UNLOAD,onUnload);			
		}
		
		private function onUnload(event:Event):void
		{
			ModuleAFacade.getInstance(CORE).unload();
		}
		
	}
}