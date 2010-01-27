package shell.controller
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.MacroCommand;
	
	public class StartupCommand extends MacroCommand
	{

		protected override function initializeMacroCommand():void
		{
			addSubCommand(LoadServicesCommand);
			addSubCommand(LoadMediatorsCommand);
		}

	}
}