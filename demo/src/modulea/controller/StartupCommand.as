package modulea.controller
{
	import com.dz015.lics.controller.InterCoreCommand;
	
	import modulea.ModuleA;
	import modulea.model.CurrencyFormatterProxy;
	import modulea.view.ModuleAMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import service.ICurrencyFormatter;
	
	import shell.SystemNotifications;
	
	public class StartupCommand extends InterCoreCommand
	{

		public override function execute(notification:INotification):void
		{
			var module:ModuleA = notification.getBody() as ModuleA;
			facade.registerMediator(new ModuleAMediator(module));
			facade.registerProxy(new CurrencyFormatterProxy(retrieveService(ICurrencyFormatter) as ICurrencyFormatter));
			sendInterCoreNotification(SystemNotifications.LOG,"Module A: Loaded");
			sendInterCoreNotification(SystemNotifications.POKEB,"Module A");
 		}

	}
}