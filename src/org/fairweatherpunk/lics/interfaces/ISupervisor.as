package org.fairweatherpunk.lics.interfaces
{
	import org.puremvc.as3.multicore.interfaces.IFacade;
	
	public interface ISupervisor
	{
		function sendSystemNotification(notificationName:String, body:Object=null, type:String=null):void;
		function registerWorker(worker:IWorker):void;
		function removeWorker(workerName:String):void;
	}
}