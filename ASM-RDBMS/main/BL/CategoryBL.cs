using Persistence;
using DAL;
using System;

namespace BL
{
#nullable disable
    public class CategoryBL
    {
        public CategoryDAL categoryDAL = CategoryDAL.Instance;

        public List<Category> GetAllCategories() => categoryDAL.GetAllCategories();

        public bool AddCategory(Category category)
        {

            if (category != null)
            {
                return true;
            }


            return false;
        }
    }
}