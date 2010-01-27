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
		
		public function addService(serviceType:Class, service:Object):void
		{
			_serviceMap[serviceType] = service;
		}
		
		public function getService(serviceType:Class):Object
		{
			return _serviceMap[serviceType];
		}
	}

}