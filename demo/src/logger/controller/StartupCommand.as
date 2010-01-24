package logger.controller
{
	import logger.LoggerNotifications;
	import logger.application.LoggerApplication;
	import logger.view.LoggerMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand
	{

		public override function execute(notification:INotification):void
		{
			var app:LoggerApplication = notification.getBody() as LoggerApplication;
			facade.registerMediator(new LoggerMediator(app));
			sendNotification(LoggerNotifications.LOG,"Logger started up");
		}

	}
}