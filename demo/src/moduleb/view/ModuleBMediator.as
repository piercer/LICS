/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package moduleb.view
{
	import moduleb.ModuleB;
	import moduleb.application.ModuleBApplication;
	import moduleb.notifications.ModuleBNotifications;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class ModuleBMediator extends Mediator
	{
		
		public static const NAME:String = "ApplicationAMediator";
		
		public function ModuleBMediator(viewComponent:ModuleBApplication)
		{
			super(NAME, viewComponent);
		}
		
		private function get moduleB():ModuleB
		{
			return viewComponent as ModuleB;
		}

		override public function listNotificationInterests():Array
		{
			return [ ModuleBNotifications.POKE ];
		}

		override public function handleNotification(notification:INotification):void
		{
			var originator:String = notification.getBody() as String; 
			moduleB.textArea.text += "Poked by: "+originator+"\n";
		}


	}
}