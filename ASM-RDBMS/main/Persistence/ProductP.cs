using System;

namespace Persistence
{

    public class Product
    {
        public int PId {set;get;}
        public string PName {set;get;}

        public string Category {set;get;}
        public string Brand {set;get;}
        public decimal PPrice {set;get;}
        public int Quantity{set;get;}
        public DateTime manufacturing {set;get;}

        public DateTime expiry {set;get;}

        public override bool Equals(object obj)
        {
            if(obj is Product)
            {
                return ((Product)obj).PId.Equals(PId);
            }
            return false;
        }

        public override int GetHashCode()
        {
            return PId.GetHashCode();
        }

        
    }
}
