/*
LICS Framework Demo
Copyright (c) 2010 Conrad Winchester <conrad@dz015.com>

Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package service
{

	public class CurrencyFormatter implements ICurrencyFormatter
	{				
		public function format(amount:Number):String
		{
			return "£"+Math.floor(amount/100);
		}
	}

}