package org.fairweatherpunk.lics.interfaces
{
	import org.puremvc.as3.multicore.interfaces.IFacade;
	
	public interface ISystemFacade extends IFacade
	{
		function get supervisor():ISupervisor;
	}
}