/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.controller
{

	import com.dz015.lics.interfaces.IInterCoreFacade;
	
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class InterCoreCommand extends SimpleCommand
	{
		
		protected function get interCoreFacade():IInterCoreFacade 
		{
			return facade as IInterCoreFacade;
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
		public function sendInterCoreNotification( notificationName:String, body:Object=null, type:String=null ):void 
		{
			interCoreFacade.sendInterCoreNotification( notificationName, body, type );
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
			interCoreFacade.registerService(serviceType,service);
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
			return interCoreFacade.retrieveService(serviceType);
		}
		
		public function sendInterCoreSignal(signalName:String,...signalArguments):void
		{
			interCoreFacade.sendTypedInterCoreNotification.apply(null,[signalName].concat(signalArguments));
		}


	}
}