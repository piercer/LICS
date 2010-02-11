/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.interfaces
{

	public interface IInterCoreRouter
	{
		function sendInterCoreNotification(notificationName:String, body:Object=null, type:String=null):void;
		function registerInterCoreMediator(mediator:IInterCoreMediator):void;
		function removeInterCoreMediator(mediatorName:String):void;
	}

}