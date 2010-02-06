package com.dz015.lics.interfaces
{

	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public interface ISystemFacade extends IFacade
	{
		function registerWorker(worker:IWorker):void;
		function removeWorker(workerName:String):void;
		function registerService(serviceType:Class,service:Object):void;
		function retrieveService(serviceType:Class):Object;
		function sendSystemNotification(notificationName:String,body:Object = null,type:String = null):void;
	}
	
}