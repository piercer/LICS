package com.dz015.lics.core
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import com.dz015.lics.interfaces.ISystemFacade;
	import com.dz015.lics.interfaces.IWorker;
	
	public class Worker implements IWorker
	{

		protected var facade:ISystemFacade;
		private var _name:String;

		public function Worker(name:String,facade:ISystemFacade)
		{
			this.facade = facade;
			_name = name;
		}

		public function sendSystemNotification(notificationName:String, body:Object=null, type:String=null):void
		{
			facade.sendSystemNotification(notificationName, body, type);
		}
		
		public function sendNotification(notificationName:String, body:Object=null, type:String=null):void
		{
			facade.sendNotification(notificationName, body, type);
		}

		public function listSystemNotificationInterests():Array
		{
			return null;
		}
		
		public function handleSystemNotification(notification:INotification):void
		{
		}
		
		public function getWorkerName():String
		{
			return _name;
		}

	}
}