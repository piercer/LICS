/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package shell.controller
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	import shell.application.ShellApplication;
	import shell.view.ShellMediator;
	
	public class LoadMediatorsCommand extends SimpleCommand
	{

		public override function execute(notification:INotification):void
		{
			var app:ShellApplication = notification.getBody() as ShellApplication;
			facade.registerMediator(new ShellMediator(app));
		}

	}
}