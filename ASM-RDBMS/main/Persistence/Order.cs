using System;
using System.Collections.Generic;

namespace Persistence
{
    public static class OrderStatus
    {
        public const int CREATE_NEW_ORDER = 1;
    }
    
    public class Order
    {
        public int OrderId { set; get; }
        public DateTime OrderDate { set; get; }
        public Customer OrderCustomer { set; get; }
        public int? Status {set;get;}
        public List<Product> ProductList { set; get; }

        public Product this[int index]
        {
            get
            {
                if (ProductList == null || ProductList.Count == 0 || index < 0 || ProductList.Count < index) return null;
                return ProductList[index];
            }
            set
            {
                if (ProductList == null) ProductList = new List<Product>();
                ProductList.Add(value);
            }
        }

        public Order()
        {
            ProductList = new List<Product>();
        }

        public override bool Equals(object obj)
        {
            if(obj is Order)
            {
                return ((Order)obj).OrderId.Equals(OrderId);
            }
            return false;
        }

        public override int GetHashCode(){
            return OrderId.GetHashCode();
        }
    }
}
