/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.controller
{

	import com.dz015.lics.interfaces.ISystemFacade;
	
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class SystemCommand extends SimpleCommand
	{
		
		protected function get systemFacade():ISystemFacade 
		{
			return facade as ISystemFacade;
		}
		/**
		 * 
		 * This is exactly the same as sending a normal notification except that the 
		 * notification goes directly to the supervisor, and then onto any other
		 * interested cores
		 * 
		 * @param notificationName
		 * @param body
		 * @param type
		 * 
		 * @see org.puremvc.as3.multicore.patterns.mediator.Mediator
		 * 
		 */		
		public function sendSystemNotification( notificationName:String, body:Object=null, type:String=null ):void 
		{
			systemFacade.sendSystemNotification( notificationName, body, type );
		}
		/**
		 * Use this method to add a globally accessible service to the servicelocator instance
		 *  
		 * @param serviceType The type of the service - it is usually best for this to be an interface
		 * @param service The concrete instance of the type that will be shared by all users of this service
		 * 
		 */		
		public function registerService(serviceType:Class,service:Object):void
		{
			systemFacade.registerService(serviceType,service);
		}
		/**
		 *
		 * Use this methid to retrieve a service of the requested type
		 *  
		 * @param serviceType The type of the service - usually an interface
		 * @return The concrete instance of that type stored in the servicelocator instance
		 * 
		 */
		public function retrieveService(serviceType:Class):Object
		{
			return systemFacade.retrieveService(serviceType);
		}

	}
}