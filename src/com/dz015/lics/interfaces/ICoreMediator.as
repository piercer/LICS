/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.interfaces
{
	import org.puremvc.as3.multicore.interfaces.INotification;

	public interface ICoreMediator
	{
		function getMediatorName():String;
		function listInterCoreNotificationInterests():Array;
		function listTypedInterCoreNotificationInterests():Array;
		function handleInterCoreNotification(notification:INotification):void;
	}
}