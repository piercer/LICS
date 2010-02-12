/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package moduleb.facade
{
	import com.dz015.lics.core.CoreMediator;
	
	import moduleb.notifications.ModuleBNotifications;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import shell.SystemNotifications;
	
	public class ModuleBWorker extends CoreMediator
	{
		
		public static const NAME:String = "moduleBWorker";
		
		public function ModuleBWorker(facade:ModuleBFacade)
		{
			super(NAME,facade);
		}

		public override function handleInterCoreNotification(notification:INotification):void
		{
			sendNotification(ModuleBNotifications.POKE,notification.getBody() as String);
		}

		public override function listInterCoreNotificationInterests():Array
		{
			return [ SystemNotifications.POKEB ];
		}

	}
}