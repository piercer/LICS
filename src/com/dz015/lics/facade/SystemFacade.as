/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.facade
{

	import com.dz015.lics.core.ServiceLocator;
	import com.dz015.lics.core.Supervisor;
	import com.dz015.lics.interfaces.IServiceLocator;
	import com.dz015.lics.interfaces.ISupervisor;
	import com.dz015.lics.interfaces.ISystemFacade;
	import com.dz015.lics.interfaces.IWorker;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class SystemFacade extends Facade implements ISystemFacade
	{

		protected var supervisor:ISupervisor;
		protected var serviceLocator:IServiceLocator;

		public function SystemFacade(key:String)
		{
			super(key);
		}
		
		public function registerService(serviceType:Class, service:Object):void
		{
			serviceLocator.addService(serviceType,service);
		}

		public function retrieveService(serviceType:Class):Object
		{
			return serviceLocator.getService(serviceType);
		}

		public function sendSystemNotification(notificationName:String,body:Object = null,type:String = null):void
		{
			supervisor.sendSystemNotification(notificationName,body,type);
		}

		public function removeWorker(workerName:String):void
		{
			supervisor.removeWorker(workerName);
		}

		public function registerWorker(worker:IWorker):void
		{
			supervisor.registerWorker(worker);
		}
		
		override protected function initializeFacade():void
		{
			super.initializeFacade();
			initializeSupervisor();
			initializeServiceLocator();
		}
		
		protected function initializeSupervisor():void
		{
			supervisor = Supervisor.getInstance();
		}

		protected function initializeServiceLocator():void
		{
			serviceLocator = ServiceLocator.getInstance();
		}
		
	}

}