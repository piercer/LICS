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
			switch (notification.getName())
			{
				case ModuleBNotifications.POKE:
					var originator:String = notification.getBody() as String; 
					moduleB.textArea.text += "Poked by: "+originator+"\n";
					break;
			}
		}


	}
}