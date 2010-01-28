package modulea.model
{
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	import service.ICurrencyFormatter;
	
	public class CurrencyFormatterProxy extends Proxy
	{
		
		public static const NAME:String = "CurrencyFormatterProxy";
		
		public function CurrencyFormatterProxy(formatter:ICurrencyFormatter)
		{
			super(NAME, formatter);
		}
		
		private function get formatter():ICurrencyFormatter
		{
			return data as ICurrencyFormatter;
		}
		
		public function format(amount:Number):String
		{
			return formatter.format(amount);
		}
		
	}
}