package com.dz015.lics.facade
{

	import com.dz015.lics.core.Supervisor;
	import com.dz015.lics.interfaces.ISupervisor;
	import com.dz015.lics.interfaces.ISystemFacade;
	import com.dz015.lics.interfaces.IWorker;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class SystemFacade extends Facade implements ISystemFacade
	{

		protected var supervisor:ISupervisor;

		public function SystemFacade(key:String)
		{
			super(key);
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
		}
		
		protected function initializeSupervisor():void
		{
			supervisor = Supervisor.getInstance();
		}

	}

}