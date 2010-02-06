/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
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