/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package modulea.facade
{
	import com.dz015.lics.facade.InterCoreFacade;
	
	import modulea.application.ModuleAApplication;
	import modulea.controller.StartupCommand;
	import modulea.notifications.ModuleANotifications;
	
	public class ModuleAFacade extends InterCoreFacade
	{
		
		public function ModuleAFacade(key:String)
		{
			super(key);
			registerInterCoreMediator(new ModuleAWorker(this));
		}
		
		public static function getInstance(key:String) : ModuleAFacade 
		{
			if (instanceMap[key] == null) instanceMap[key] = new ModuleAFacade(key);
			return instanceMap[key] as ModuleAFacade;
		}
		
		override protected function initializeController() : void 
		{
			super.initializeController();
			registerCommand(ModuleANotifications.STARTUP, StartupCommand);
		}
		
		public function startup(app : ModuleAApplication) : void
		{
			sendNotification(ModuleANotifications.STARTUP, app);
		}
		
		public function unload():void
		{
			removeInterCoreMediator(ModuleAWorker.NAME);
			removeCore(multitonKey);
		}
				
	}
}