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
		function registerCoreMediator(mediator:ICoreMediator):void;
		function removeCoreMediator(mediatorName:String):void;
		function registerService(serviceType:Class,service:Object):void;
		function retrieveService(serviceType:Class):Object;
		function setTypedInterCoreNotificationArgumentTypes(signalName:String,...signalArgumentTypes):void;
		function sendInterCoreNotification(notificationName:String,body:Object = null,type:String = null):void;
		function sendTypedInterCoreNotification(signalName:String,...signalArguments):void;
	}
	
}