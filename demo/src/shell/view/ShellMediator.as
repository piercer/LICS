package shell.view
{
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;
	
	import mx.controls.SWFLoader;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	import shell.application.ShellApplication;
	
	public class ShellMediator extends Mediator
	{
		
		public static const NAME:String = "ShellMediator";
		
		private var _modules:Dictionary;
		
		public function ShellMediator(view:ShellApplication)
		{
			super(NAME,view);
			_modules = new Dictionary();
			shell.loadModuleAButton.addEventListener(MouseEvent.CLICK,onLoadModuleAButtonClicked);
			shell.unloadModuleAButton.addEventListener(MouseEvent.CLICK,onUnloadModuleAButtonClicked);
			shell.loadModuleBButton.addEventListener(MouseEvent.CLICK,onLoadModuleBButtonClicked);
			shell.unloadModuleBButton.addEventListener(MouseEvent.CLICK,onUnloadModuleBButtonClicked);
			shell.unloadModuleBButton.enabled = false;
			shell.unloadModuleAButton.enabled = false;
			loadModule("Logger.swf");
		}
		
		private function onLoadModuleAButtonClicked(event:MouseEvent):void
		{
			loadModule("ModuleA.swf");
			shell.loadModuleAButton.enabled = false;
			shell.unloadModuleAButton.enabled = true;
		}

		private function onUnloadModuleAButtonClicked(event:MouseEvent):void
		{
			unloadModule("ModuleA.swf");
			shell.loadModuleAButton.enabled = true;
			shell.unloadModuleAButton.enabled = false;
		}
		
		private function onLoadModuleBButtonClicked(event:MouseEvent):void
		{
			loadModule("ModuleB.swf");
			shell.loadModuleBButton.enabled = false;
			shell.unloadModuleBButton.enabled = true;
		}
		
		private function onUnloadModuleBButtonClicked(event:MouseEvent):void
		{
			unloadModule("ModuleB.swf");
			shell.loadModuleAButton.enabled = true;
			shell.unloadModuleAButton.enabled = false;
		}
		
		private function get shell():ShellApplication
		{
			return viewComponent as ShellApplication;
		}
		
		private function loadModule(url:String):void
		{
			var loader:SWFLoader = new SWFLoader();
			loader.load(url);
			shell.addElement(loader);
			_modules[url]=loader;
		}
		
		private function unloadModule(url:String):void
		{
			var loader:SWFLoader = _modules[url];
			loader.unloadAndStop();
			shell.removeElement(loader);
			delete _modules[url];
		}

	}
}