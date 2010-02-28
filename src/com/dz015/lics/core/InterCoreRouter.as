/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.core
{

	import com.dz015.lics.interfaces.ICoreMediator;
	import com.dz015.lics.interfaces.IInterCoreRouter;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.observer.Notification;

	public class InterCoreRouter implements IInterCoreRouter
	{
		
		private static var _instance:IInterCoreRouter;
		
		[ArrayElementType("com.dz015.lics.interfaces.ICoreMediator")]
		private var _workerMap:Array;
		
		private var _signalMap:Dictionary;

		public function InterCoreRouter()
		{
			_workerMap = [];
			_signalMap = new Dictionary();
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
			var notification:INotification = new Notification(notificationName,body,type);
			sendTypedInterCoreNotification(notificationName,notification);
		}
		
		public function registerCoreMediator(worker:ICoreMediator):void
		{
			
			if (_workerMap[worker.getMediatorName()]!=null) return;
			_workerMap[worker.getMediatorName()] = worker;
			var interests:Array = worker.listInterCoreNotificationInterests();
			if ( interests.length > 0) 
			{
				var handler:Function = worker.handleInterCoreNotification;				
				for ( var i:Number=0;  i<interests.length; i++ ) 
				{
					registerSignalObserver( interests[i],  handler );
				}			
			}
			var signalInterests:Array = worker.listTypedInterCoreNotificationInterests();
			for (var signalName:String in signalInterests)
			{
				registerSignalObserver( signalName, signalInterests[signalName] );				
			}
		}
		
		public function setTypedInterCoreNotificationArgumentTypes(signalName:String,...signalArgumentTypes):void
		{
			if (_signalMap[signalName]!=null) return;
			_signalMap[signalName] = new Signal(signalArgumentTypes);
		}
		
		public function removeCoreMediator( workerName:String ) : void
		{
			var worker:ICoreMediator = _workerMap[ workerName ] as ICoreMediator;
			
			if ( worker ) 
			{
				var interests:Array = worker.listInterCoreNotificationInterests();
				for ( var i:Number=0; i<interests.length; i++ ) 
				{
					removeSignalObserver( interests[i], worker.handleInterCoreNotification );
				}	
				var signalInterests:Array = worker.listTypedInterCoreNotificationInterests();
				for (var signalName:String in signalInterests)
				{
					removeSignalObserver( signalName, signalInterests[signalName] );				
				}
				delete _workerMap[ workerName ];
			}
		}
		
		private function removeSignalObserver( notificationName:String, handler:Function ):void
		{
			var signal:Signal = _signalMap[ notificationName ];
			if (signal) 
			{
				signal.remove(handler);
			}
		} 

		private function registerSignalObserver(signalName:String, handler:Function):void
		{
			var signal:Signal = _signalMap[ signalName ];
			if(!signal)
			{
				signal = new Signal(INotification);
				_signalMap[ signalName ] = signal;	
			}
			signal.add(handler);			
		}
				
		public function sendTypedInterCoreNotification(signalName:String,...signalArgs):void
		{
			var signal:Signal = _signalMap[signalName];
			if(signal) 
			{
				signal.dispatch.apply(null,signalArgs);
			}			
		}
		
	}
}