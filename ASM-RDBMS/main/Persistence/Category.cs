using System;
using System.Collections.Generic;

namespace Persistence
{
    public class Category
    {
        public int Id { get; set; }
        public string CategoryName { get; set; }

        public override bool Equals(object obj)
        {
            if(obj is Category)
            {
                return (obj as Category).Id.Equals(Id);
            }
            return false;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }


    }
}