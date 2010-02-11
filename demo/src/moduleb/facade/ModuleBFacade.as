/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package moduleb.facade
{
	import com.dz015.lics.facade.InterCoreFacade;
	
	import moduleb.application.ModuleBApplication;
	import moduleb.controller.StartupCommand;
	import moduleb.notifications.ModuleBNotifications;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	import shell.facade.ShellFacade;
	
	public class ModuleBFacade extends InterCoreFacade
	{
		
		public function ModuleBFacade(key:String)
		{
			super(key);
			registerInterCoreMediator(new ModuleBWorker(this));
		}
		
		public static function getInstance(key:String) : ModuleBFacade 
		{
			if (instanceMap[key] == null) instanceMap[key] = new ModuleBFacade(key);
			return instanceMap[key] as ModuleBFacade;
		}
		
		override protected function initializeController() : void 
		{
			super.initializeController();
			registerCommand(ModuleBNotifications.STARTUP, StartupCommand);
		}
		
		public function startup(app : ModuleBApplication) : void
		{
			sendNotification(ModuleBNotifications.STARTUP, app);
		}
		
		public function unload():void
		{
			removeInterCoreMediator(ModuleBWorker.NAME);
			removeCore(multitonKey);
		}
		
	}
}