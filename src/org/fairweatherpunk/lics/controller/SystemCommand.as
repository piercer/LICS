package org.fairweatherpunk.lics.controller
{

	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.fairweatherpunk.lics.interfaces.ISystemFacade;
	
	public class SystemCommand extends SimpleCommand
	{
		
		public function sendSystemNotification( notificationName:String, body:Object=null, type:String=null ):void 
		{
			if (facade != null) 
			{
				(facade as ISystemFacade).supervisor.sendSystemNotification( notificationName, body, type );
			}
		}

	}
}