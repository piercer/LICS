/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package modulea.view
{
	import modulea.ModuleA;
	import modulea.application.ModuleAApplication;
	import modulea.model.CurrencyFormatterProxy;
	import modulea.notifications.ModuleANotifications;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	import service.ICurrencyFormatter;
	
	public class ModuleAMediator extends Mediator
	{
		
		public static const NAME:String = "ApplicationAMediator";
		
		public function ModuleAMediator(viewComponent:ModuleAApplication)
		{
			super(NAME, viewComponent);
		}
		
		private function get moduleA():ModuleA
		{
			return viewComponent as ModuleA;
		}

		override public function listNotificationInterests():Array
		{
			return [ ModuleANotifications.POKE ];
		}

		override public function handleNotification(notification:INotification):void
		{
			var originator:String = notification.getBody() as String; 
			moduleA.textArea.text += "Poked by: "+originator+"\n";
			var cfp:CurrencyFormatterProxy = facade.retrieveProxy(CurrencyFormatterProxy.NAME) as CurrencyFormatterProxy;
			moduleA.textArea.text += "I can format: "+cfp.format(325.25)+"\n";
		}


	}
}