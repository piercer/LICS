/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
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
			sendNotification(ModuleANotifications.POKE,notification.getBody() as String);
		}

		public override function listSystemNotificationInterests():Array
		{
			return [ SystemNotifications.POKEA ];
		}

	}
}