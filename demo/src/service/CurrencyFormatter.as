package service
{
	
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	public class CurrencyFormatter extends Proxy implements ICurrencyFormatter
	{
		
		public static const NAME:String = "CurrencyFormatterProxy";
		
		public function CurrencyFormatter()
		{
			super(NAME);
		}
		
		public function format(amount:Number):String
		{
			return "£"+Math.floor(amount/100);
		}
	}
}