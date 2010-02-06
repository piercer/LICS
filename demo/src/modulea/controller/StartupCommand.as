package modulea.controller
{
	import com.dz015.lics.controller.SystemCommand;
	
	import modulea.ModuleA;
	import modulea.model.CurrencyFormatterProxy;
	import modulea.view.ModuleAMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import service.ICurrencyFormatter;
	
	import shell.SystemNotifications;
	
	public class StartupCommand extends SystemCommand
	{

		public override function execute(notification:INotification):void
		{
			var module:ModuleA = notification.getBody() as ModuleA;
			facade.registerMediator(new ModuleAMediator(module));
			facade.registerProxy(new CurrencyFormatterProxy(retrieveService(ICurrencyFormatter) as ICurrencyFormatter));
			sendSystemNotification(SystemNotifications.LOG,"Module A: Loaded");
			sendSystemNotification(SystemNotifications.POKEB,"Module A");
 		}

	}
}