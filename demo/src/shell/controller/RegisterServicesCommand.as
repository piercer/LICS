/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package shell.controller
{
	import com.dz015.lics.controller.InterCoreCommand;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import service.CurrencyFormatter;
	import service.ICurrencyFormatter;
	
	public class RegisterServicesCommand extends InterCoreCommand
	{

		public override function execute(notification:INotification):void
		{
			registerService(ICurrencyFormatter,new CurrencyFormatter());
		}

	}

}