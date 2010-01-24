package shell.controller
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	import shell.application.ShellApplication;
	
	import shell.view.ShellMediator;
	
	public class StartupCommand extends SimpleCommand
	{

		public override function execute(notification:INotification):void
		{
			var app:ShellApplication = notification.getBody() as ShellApplication;
			facade.registerMediator(new ShellMediator(app));
		}

	}
}