package com.dz015.lics.controller
{

	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import com.dz015.lics.interfaces.ISystemFacade;
	
	public class SystemCommand extends SimpleCommand
	{
		
		public function sendSystemNotification( notificationName:String, body:Object=null, type:String=null ):void 
		{
			(facade as ISystemFacade).sendSystemNotification( notificationName, body, type );
		}

	}
}