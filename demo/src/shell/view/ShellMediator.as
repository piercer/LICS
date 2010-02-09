/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package shell.view
{
	import flash.events.Event;
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
			shell.loadModuleAButton.enabled = false;
			shell.loadModuleBButton.enabled = false;
			loadModule("Logger.swf");
		}
		
		private function onLoadModuleAButtonClicked(event:MouseEvent):void
		{
			loadModule("ModuleA.swf");
			shell.loadModuleAButton.enabled = false;
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
		}
		
		private function onUnloadModuleBButtonClicked(event:MouseEvent):void
		{
			unloadModule("ModuleB.swf");
			shell.loadModuleBButton.enabled = true;
			shell.unloadModuleBButton.enabled = false;
		}
		
		private function get shell():ShellApplication
		{
			return viewComponent as ShellApplication;
		}
		
		private function loadModule(url:String):void
		{
			var loader:SWFLoader = new SWFLoader();
			loader.addEventListener(Event.INIT,onModuleLoaded);
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
		
		private function onModuleLoaded(event:Event):void
		{
			var loader:SWFLoader = event.target as SWFLoader;
			loader.removeEventListener(Event.INIT,onModuleLoaded);
			switch (loader.source)
			{
				case 'ModuleA.swf':
					shell.unloadModuleAButton.enabled = true;
					break;
				case 'ModuleB.swf':
					shell.unloadModuleBButton.enabled = true;
					break;
				case 'Logger.swf':
					shell.loadModuleAButton.enabled = true;
					shell.loadModuleBButton.enabled = true;
					break;
			}
		}

	}
}