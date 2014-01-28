using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kassakvitto.Model
{
    public class Kvitto
    {
        //Privat fält
        private double _subtotal;

        //Visar rabatten i procent
        public double DiscountRate
        {

            get; 
            private set;

        }

        //Visar rabatten i kronor
        public double MoneyOff 
        {

            get; 
            private set;

        }

        //Visar den totala köpesumman 
        public double Subtotal
        {
            get 
            {
                return _subtotal;
            }
            set
            {
                if (value <= 0.0)
                {
                    throw new ArgumentOutOfRangeException("Det måste vara ett tal som är större än 0");
                }
                _subtotal = value;
            }
        }

        //Visar beloppet efter att rabatten dragits från den totala köpesumman
        public double Total 
        {

            get;
            private set;

        }

        //Beräknar rabatten och totalt att betala
        public void Calculate(double subtotal)
        {
            Subtotal = subtotal;

            if (Subtotal < 500)
            {
                DiscountRate = 0;
            }
            else if (Subtotal < 1000)
            {
                DiscountRate = 0.05;
            }
            else if (Subtotal < 5000)
            {
                DiscountRate = 0.10;
            }
            else
            {
                DiscountRate = 0.15;
            }

            MoneyOff = Subtotal * DiscountRate;

            Total = Subtotal - MoneyOff;
        }

        //Konstruktor
        public Kvitto(double subtotal)
        {
            Calculate(subtotal);
        }

    }
}