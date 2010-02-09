/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package logger.view
{

	import logger.LoggerNotifications;
	import logger.application.LoggerApplication;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class LoggerMediator extends Mediator
	{
		
		public static const NAME:String = "loggerMediator";
		
		public function LoggerMediator(view:LoggerApplication)
		{
			super(NAME, view);
		}

		private function get logView():LoggerApplication
		{
			return viewComponent as LoggerApplication;
		}

		override public function listNotificationInterests():Array
		{
			return [ LoggerNotifications.LOG ];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var message:String = notification.getBody() as String;
			logView.textArea.text += message+"\n";
		}

	}
}