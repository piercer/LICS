package moduleb.facade
{
	import com.dz015.lics.facade.SystemFacade;
	
	import moduleb.application.ModuleBApplication;
	import moduleb.controller.StartupCommand;
	import moduleb.notifications.ModuleBNotifications;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	import shell.facade.ShellFacade;
	
	public class ModuleBFacade extends SystemFacade
	{
		
		public function ModuleBFacade(key:String)
		{
			super(key);
			registerWorker(new ModuleBWorker(this));
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
			removeWorker(ModuleBWorker.NAME);
			removeCore(multitonKey);
		}
		
	}
}