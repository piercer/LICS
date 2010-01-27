package com.dz015.lics.controller
{

	import com.dz015.lics.interfaces.ISystemFacade;
	
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class SystemCommand extends SimpleCommand
	{
		
		private function get systemFacade():ISystemFacade 
		{
			return facade as ISystemFacade;
		}
		
		public function sendSystemNotification( notificationName:String, body:Object=null, type:String=null ):void 
		{
			systemFacade.sendSystemNotification( notificationName, body, type );
		}
		
		public function addService(serviceType:Class,service:Object):void
		{
			systemFacade.addService(serviceType,service);
		}

	}
}