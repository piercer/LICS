/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package logger.facade
{
	import com.dz015.lics.core.CoreMediator;
	import com.dz015.lics.interfaces.IInterCoreFacade;
	
	import logger.LoggerNotifications;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import shell.SystemNotifications;
	
	public class LoggerWorker extends CoreMediator
	{
		
		public static const NAME:String = "loggerWorker";
		
		public function LoggerWorker(facade:IInterCoreFacade)
		{
			super(NAME,facade)
		}
		
		override public function listInterCoreNotificationInterests():Array
		{
			return [ SystemNotifications.LOG ];
		}
		
		override public function handleInterCoreNotification(notification:INotification):void
		{
			var message:String = notification.getBody() as String;
			sendNotification(LoggerNotifications.LOG,message);
		}

	}
}