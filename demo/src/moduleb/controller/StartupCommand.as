package moduleb.controller
{
	import com.dz015.lics.controller.InterCoreCommand;
	
	import moduleb.ModuleB;
	import moduleb.view.ModuleBMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import shell.SystemNotifications;
	
	public class StartupCommand extends InterCoreCommand
	{

		public override function execute(notification:INotification):void
		{
			var module:ModuleB = notification.getBody() as ModuleB;
			facade.registerMediator(new ModuleBMediator(module));
			sendInterCoreNotification(SystemNotifications.LOG,"Module B: Loaded");
			sendInterCoreNotification(SystemNotifications.POKEA,"Module B");
		}

	}
}