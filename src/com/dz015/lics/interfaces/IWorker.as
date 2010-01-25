package com.dz015.lics.interfaces
{
	import org.puremvc.as3.multicore.interfaces.INotification;

	public interface IWorker
	{
		function getWorkerName():String;
		function listSystemNotificationInterests():Array;
		function handleSystemNotification(notification:INotification):void;
		function sendSystemNotification(notificationName:String, body:Object = null, type:String = null):void;
	}
}