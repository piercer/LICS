package shell.facade
{
	import com.dz015.lics.facade.SystemFacade;
	
	import shell.ShellNotification;
	import shell.application.ShellApplication;
	import shell.controller.StartupCommand;
	
	public class ShellFacade extends SystemFacade
	{
		public function ShellFacade(key:String)
		{
			super(key);
		}
		
		public static function getInstance(key:String) : ShellFacade 
		{
			if (instanceMap[key] == null) instanceMap[key] = new ShellFacade(key);
			return instanceMap[key] as ShellFacade;
		}
		
		override protected function initializeController() : void 
		{
			super.initializeController();
			registerCommand(ShellNotification.STARTUP, StartupCommand);
		}
		
		public function startup(app : ShellApplication) : void
		{
			sendNotification(ShellNotification.STARTUP, app);
		}
		
	}
}