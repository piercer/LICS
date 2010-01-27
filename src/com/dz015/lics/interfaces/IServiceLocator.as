package com.dz015.lics.interfaces
{

	public interface IServiceLocator
	{
		function addService(serviceType:Class,service:Object):void;
		function getService(serviceType:Class):Object;
	}

}