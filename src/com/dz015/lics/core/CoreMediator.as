/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.core
{

	import com.dz015.lics.interfaces.ICoreMediator;
	import com.dz015.lics.interfaces.IInterCoreFacade;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public class CoreMediator implements ICoreMediator
	{

		protected var facade:IInterCoreFacade;
		private var _name:String;

		public function CoreMediator(name:String,facade:IInterCoreFacade)
		{
			this.facade = facade;
			_name = name;
		}
		
		public function sendNotification(notificationName:String, body:Object=null, type:String=null):void
		{
			facade.sendNotification(notificationName, body, type);
		}

		public function listInterCoreNotificationInterests():Array
		{
			return null;
		}
		
		public function handleInterCoreNotification(notification:INotification):void
		{
		}
		
		public function getMediatorName():String
		{
			return _name;
		}

	}
}