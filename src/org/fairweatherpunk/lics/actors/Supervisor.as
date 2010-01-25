package org.fairweatherpunk.lics.actors
{

	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.interfaces.IObserver;
	import org.puremvc.as3.multicore.patterns.observer.Notification;
	import org.puremvc.as3.multicore.patterns.observer.Observer;
	import org.fairweatherpunk.lics.interfaces.ISupervisor;
	import org.fairweatherpunk.lics.interfaces.IWorker;

	public class Supervisor implements ISupervisor
	{
		
		private var _systemObserverMap:Array;
		private var _workerMap:Array;

		public function Supervisor()
		{
			_systemObserverMap = [];
			_workerMap = [];
		}
		
		public function sendSystemNotification(notificationName:String, body:Object=null, type:String=null):void
		{
			var notification:Notification = new Notification(notificationName,body,type);
			notifySystemObservers(notification);
		}
		
		public function registerWorker(worker:IWorker):void
		{
			
			if (_workerMap[worker.getWorkerName()]!=null) return;
			_workerMap[worker.getWorkerName()] = worker;
			var interests:Array = worker.listSystemNotificationInterests();
			if ( interests.length > 0) 
			{
				var observer:Observer = new Observer( worker.handleSystemNotification, worker );				
				for ( var i:Number=0;  i<interests.length; i++ ) 
				{
					registerSystemObserver( interests[i],  observer );
				}			
			}
		}
		
		public function removeWorker( workerName:String ) : void
		{
			var worker:IWorker = _workerMap[ workerName ] as IWorker;
			
			if ( worker ) 
			{
				var interests:Array = worker.listSystemNotificationInterests();
				for ( var i:Number=0; i<interests.length; i++ ) 
				{
					removeSystemObserver( interests[i], worker );
				}	
				
				delete _workerMap[ workerName ];
			}
		}
		
		private function removeSystemObserver( notificationName:String, notifyContext:Object ):void
		{
			var observers:Array = _systemObserverMap[ notificationName ] as Array;			
			for ( var i:int=0; i<observers.length; i++ ) 
			{
				if ( Observer(observers[i]).compareNotifyContext( notifyContext ) == true ) 
				{
					observers.splice(i,1);
					break;
				}
			}
			if ( observers.length == 0 ) 
			{
				delete _systemObserverMap[ notificationName ];		
			}
		} 

		private function registerSystemObserver( notificationName:String, observer:IObserver ) : void
		{
			if( _systemObserverMap[ notificationName ] != null ) 
			{
				_systemObserverMap[ notificationName ].push( observer );
			} 
			else 
			{
				_systemObserverMap[ notificationName ] = [ observer ];	
			}
		}
		
		private function notifySystemObservers( notification:INotification ) : void
		{
			if( _systemObserverMap[ notification.getName() ] != null ) {
				
				var observers_ref:Array = _systemObserverMap[ notification.getName() ] as Array;
				
				var observers:Array = new Array(); 
				var observer:IObserver;
				for (var i:Number = 0; i < observers_ref.length; i++) 
				{ 
					observer = observers_ref[ i ] as IObserver;
					observers.push( observer );
				}
				
				for (i = 0; i < observers.length; i++) 
				{
					observer = observers[ i ] as IObserver;
					observer.notifyObserver( notification );
				}
			}
		}
		
	}
}