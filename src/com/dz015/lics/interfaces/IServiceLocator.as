package com.dz015.lics.interfaces
{

	public interface IServiceLocator
	{
		function addService(serviceName:String,service:Object):void;
		function getService(serviceName:String):Object;
	}

}