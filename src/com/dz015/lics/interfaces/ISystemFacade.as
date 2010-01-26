package com.dz015.lics.interfaces
{

	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public interface ISystemFacade extends IFacade
	{
		function registerWorker(worker:IWorker):void;
		function removeWorker(workerName:String):void;
		function addService(serviceName:String,service:Object):void;
		function getService(serviceName:String):Object;
		function sendSystemNotification(notificationName:String,body:Object = null,type:String = null):void;
	}
	
}