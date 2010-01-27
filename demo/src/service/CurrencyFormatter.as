package service
{
	public class CurrencyFormatter implements ICurrencyFormatter
	{
		public function CurrencyFormatter()
		{
		}
		
		public function format(amount:Number):String
		{
			return "£"+Math.floor(amount/100);
		}
	}
}