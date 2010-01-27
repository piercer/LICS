package shell.controller
{
	import com.dz015.lics.controller.SystemCommand;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import service.CurrencyFormatter;
	import service.ICurrencyFormatter;
	
	public class LoadServicesCommand extends SystemCommand
	{

		public override function execute(notification:INotification):void
		{
			addService(ICurrencyFormatter,new CurrencyFormatter());
		}

	}

}