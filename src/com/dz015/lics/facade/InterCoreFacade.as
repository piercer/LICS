/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.facade
{

	import com.dz015.lics.core.InterCoreRouter;
	import com.dz015.lics.core.ServiceLocator;
	import com.dz015.lics.interfaces.ICoreMediator;
	import com.dz015.lics.interfaces.IInterCoreFacade;
	import com.dz015.lics.interfaces.IInterCoreRouter;
	import com.dz015.lics.interfaces.IServiceLocator;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class InterCoreFacade extends Facade implements IInterCoreFacade
	{

		protected var router:IInterCoreRouter;
		protected var serviceLocator:IServiceLocator;

		public function InterCoreFacade(key:String)
		{
			super(key);
		}
		
		public function registerService(serviceType:Class, service:Object):void
		{
			serviceLocator.registerService(serviceType,service);
		}

		public function retrieveService(serviceType:Class):Object
		{
			return serviceLocator.retrieveService(serviceType);
		}

		public function sendInterCoreNotification(notificationName:String,body:Object = null,type:String = null):void
		{
			router.sendInterCoreNotification(notificationName,body,type);
		}

		public function removeCoreMediator(mediatorName:String):void
		{
			router.removeCoreMediator(mediatorName);
		}

		public function registerCoreMediator(mediator:ICoreMediator):void
		{
			router.registerCoreMediator(mediator);
		}
		
		public function setTypedInterCoreNotificationArgumentTypes(signalName:String,...signalArgumentTypes):void
		{
			router.setTypedInterCoreNotificationArgumentTypes.apply(null,[signalName].concat(signalArgumentTypes));
		}

		public function sendTypedInterCoreNotification(signalName:String,...signalArgumentTypes):void
		{
			router.sendTypedInterCoreNotification.apply(null,[signalName].concat(signalArgumentTypes));
		}
		
		override protected function initializeFacade():void
		{
			super.initializeFacade();
			initializeInterCoreRouter();
			initializeServiceLocator();
		}
		
		protected function initializeInterCoreRouter():void
		{
			router = InterCoreRouter.getInstance();
		}

		protected function initializeServiceLocator():void
		{
			serviceLocator = ServiceLocator.getInstance();
		}
		
	}

}