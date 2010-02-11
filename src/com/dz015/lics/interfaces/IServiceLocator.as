/*
LICS Framework
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package com.dz015.lics.interfaces
{

	public interface IServiceLocator
	{
		function registerService(serviceType:Class,service:Object):void;
		function retrieveService(serviceType:Class):Object;
	}

}