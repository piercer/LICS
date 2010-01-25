package modulea.controller
{
	import com.dz015.lics.controller.SystemCommand;
	
	import modulea.ModuleA;
	import modulea.view.ModuleAMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import shell.SystemNotifications;
	
	public class StartupCommand extends SystemCommand
	{

		public override function execute(notification:INotification):void
		{
			var module:ModuleA = notification.getBody() as ModuleA;
			facade.registerMediator(new ModuleAMediator(module));
			sendSystemNotification(SystemNotifications.LOG,"Module A: Loaded");
			sendSystemNotification(SystemNotifications.POKEB,"Module A");
 		}

	}
}