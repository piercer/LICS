/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package shell.facade
{
	import com.dz015.lics.facade.InterCoreFacade;
	
	import shell.ShellNotification;
	import shell.application.ShellApplication;
	import shell.controller.StartupCommand;
	
	public class ShellFacade extends InterCoreFacade
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