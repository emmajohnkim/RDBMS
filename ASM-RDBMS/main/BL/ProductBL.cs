using System;
using System.Collections.Generic;
using Persistence;
using DAL;

namespace BL
{
    public class ProductBL
    {
        private ProductsDAL idal;
        public ProductBL()
        {
            idal = new ProductsDAL();
        }
        public Product GetProductById(int pId)
        {
            return idal.GetProductById(pId);
        }
        public List<Product>GetAll()
        {
            return idal.GetProducts(ProductFilter.GET_ALL, null);
        }
        public List<Product> GetByName(string productName)
        {
            return idal.GetProducts(ProductFilter.FILTER_BY_PRODUCT_NAME, new Product{PName=productName});
        }
        
    }
}
