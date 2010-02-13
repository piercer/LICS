/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.core
{

	import com.dz015.lics.interfaces.ICoreMediator;
	import com.dz015.lics.interfaces.IInterCoreRouter;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.interfaces.IObserver;
	import org.puremvc.as3.multicore.patterns.observer.Notification;
	import org.puremvc.as3.multicore.patterns.observer.Observer;

	public class InterCoreRouter implements IInterCoreRouter
	{
		
		private static var _instance:IInterCoreRouter;
		
		[ArrayElementType("Array")]
		private var _systemObserverMap:Array;
		
		[ArrayElementType("com.dz015.lics.interfaces.ICoreMediator")]
		private var _workerMap:Array;

		public function InterCoreRouter()
		{
			_systemObserverMap = [];
			_workerMap = [];
		}
		
		public static function getInstance():IInterCoreRouter
		{
			if (!_instance)
			{
				_instance = new InterCoreRouter();
			}
			return _instance;
		}
		
		public function sendInterCoreNotification(notificationName:String, body:Object=null, type:String=null):void
		{
			var notification:Notification = new Notification(notificationName,body,type);
			notifySystemObservers(notification);
		}
		
		public function registerCoreMediator(worker:ICoreMediator):void
		{
			
			if (_workerMap[worker.getMediatorName()]!=null) return;
			_workerMap[worker.getMediatorName()] = worker;
			var interests:Array = worker.listInterCoreNotificationInterests();
			if ( interests.length > 0) 
			{
				var observer:Observer = new Observer( worker.handleInterCoreNotification, worker );				
				for ( var i:Number=0;  i<interests.length; i++ ) 
				{
					registerSystemObserver( interests[i],  observer );
				}			
			}
		}
		
		public function removeCoreMediator( workerName:String ) : void
		{
			var worker:ICoreMediator = _workerMap[ workerName ] as ICoreMediator;
			
			if ( worker ) 
			{
				var interests:Array = worker.listInterCoreNotificationInterests();
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
				if ( Observer(observers[i]).compareNotifyContext( notifyContext ) ) 
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