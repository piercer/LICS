/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package logger.facade
{
	import com.dz015.lics.facade.SystemFacade;
	
	import logger.LoggerNotifications;
	import logger.application.LoggerApplication;
	import logger.controller.StartupCommand;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import shell.SystemNotifications;
	
	public class LoggerFacade extends SystemFacade
	{
		public function LoggerFacade(key:String)
		{
			super(key);
			registerWorker(new LoggerWorker(this));
		}
		
		public static function getInstance(key:String) : LoggerFacade 
		{
			if (instanceMap[key] == null) instanceMap[key] = new LoggerFacade(key);
			return instanceMap[key] as LoggerFacade;
		}
		
		override protected function initializeController() : void 
		{
			super.initializeController();
			registerCommand(LoggerNotifications.STARTUP, StartupCommand);
		}
		
		public function startup(app : LoggerApplication) : void
		{
			sendNotification(LoggerNotifications.STARTUP, app);
		}


	}
}