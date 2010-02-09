/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package logger.facade
{
	import logger.LoggerNotifications;
	
	import com.dz015.lics.core.Worker;
	import com.dz015.lics.interfaces.ISystemFacade;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import shell.SystemNotifications;
	
	public class LoggerWorker extends Worker
	{
		
		public static const NAME:String = "loggerWorker";
		
		public function LoggerWorker(facade:ISystemFacade)
		{
			super(NAME,facade)
		}
		
		override public function listSystemNotificationInterests():Array
		{
			return [ SystemNotifications.LOG ];
		}
		
		override public function handleSystemNotification(notification:INotification):void
		{
			var message:String = notification.getBody() as String;
			sendNotification(LoggerNotifications.LOG,message);
		}

	}
}