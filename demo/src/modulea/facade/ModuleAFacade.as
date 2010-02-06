package modulea.facade
{
	import com.dz015.lics.facade.SystemFacade;
	import com.dz015.lics.interfaces.ISupervisor;
	
	import modulea.application.ModuleAApplication;
	import modulea.controller.StartupCommand;
	import modulea.notifications.ModuleANotifications;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	import shell.facade.ShellFacade;
	
	public class ModuleAFacade extends SystemFacade
	{
		
		public function ModuleAFacade(key:String)
		{
			super(key);
			registerWorker(new ModuleAWorker(this));
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
			removeWorker(ModuleAWorker.NAME);
			removeCore(multitonKey);
		}
				
	}
}