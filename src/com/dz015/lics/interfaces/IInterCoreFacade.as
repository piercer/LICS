/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.interfaces
{

	import org.puremvc.as3.multicore.interfaces.IFacade;
	
	public interface IInterCoreFacade extends IFacade
	{
		function registerInterCoreMediator(mediator:IInterCoreMediator):void;
		function removeInterCoreMediator(mediatorName:String):void;
		function registerService(serviceType:Class,service:Object):void;
		function retrieveService(serviceType:Class):Object;
		function sendInterCoreNotification(notificationName:String,body:Object = null,type:String = null):void;
	}
	
}