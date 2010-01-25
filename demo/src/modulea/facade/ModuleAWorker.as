package modulea.facade
{
	import com.dz015.lics.core.Worker;
	import com.dz015.lics.interfaces.ISystemFacade;
	
	import modulea.notifications.ModuleANotifications;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import shell.SystemNotifications;
	
	public class ModuleAWorker extends Worker
	{
		
		public static const NAME:String = "moduleAWorker";
		
		public function ModuleAWorker(facade:ModuleAFacade)
		{
			super(NAME,facade);
		}

		public override function handleSystemNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case SystemNotifications.POKEA:
					sendNotification(ModuleANotifications.POKE,notification.getBody() as String);
					break;
			}
		}

		public override function listSystemNotificationInterests():Array
		{
			return [ SystemNotifications.POKEA ];
		}

	}
}