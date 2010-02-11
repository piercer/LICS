/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.core
{
	import com.dz015.lics.interfaces.IServiceLocator;
	
	import flash.utils.Dictionary;
	
	public class ServiceLocator implements IServiceLocator
	{
		
		private static var _instance:IServiceLocator;
		private var _serviceMap:Dictionary;
		
		public function ServiceLocator()
		{
			_serviceMap = new Dictionary();
		}
		
		public static function getInstance():IServiceLocator
		{
			if (!_instance)
			{
				_instance = new ServiceLocator();
			}
			return _instance;
		}
		
		public function registerService(serviceType:Class, service:Object):void
		{
			_serviceMap[serviceType] = service;
		}
		
		public function retrieveService(serviceType:Class):Object
		{
			return _serviceMap[serviceType];
		}
	}

}