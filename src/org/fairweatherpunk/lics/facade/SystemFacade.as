package org.fairweatherpunk.lics.facade
{
	import org.fairweatherpunk.lics.actors.Supervisor;
	import org.fairweatherpunk.lics.interfaces.ISupervisor;
	import org.fairweatherpunk.lics.interfaces.ISystemFacade;
	import org.fairweatherpunk.lics.interfaces.IWorker;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.interfaces.IObserver;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.patterns.observer.Notification;
	import org.puremvc.as3.multicore.patterns.observer.Observer;
	
	public class SystemFacade extends Facade implements ISystemFacade
	{

		private static var _supervisor:Supervisor;

		public function SystemFacade(key:String)
		{
			super(key);
			if (!_supervisor)
			{
				_supervisor = new Supervisor();
			}
		}
		
		public function registerWorker(worker:IWorker):void
		{
			supervisor.registerWorker(worker);
		}

		public function get supervisor():ISupervisor
		{
			return _supervisor;
		}

	}

}