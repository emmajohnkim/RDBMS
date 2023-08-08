using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using Persistence;

namespace DAL
{
    public static class ProductFilter
    {
        public const int GET_ALL = 0;
        public const int FILTER_BY_PRODUCT_NAME = 1;
    }
    public class ProductDAL
    {
        private string query;
        private MySqlDataReader reader;
        private Product getProducteader;

        public Product GetProductById(int pId)
        {
            query = @"select * from product where pid=" + pId + ";";
            DBHelper.OpenConnection();
            reader = DBHelper.ExecQuery(query);
            Product product = null;
            if (reader.Read())
            {
                product = GetProduct(reader);
            }
            DBHelper.CloseConnection();
            return product;
        }
        private Product GetProduct(MySqlDataReader reader)
        {
            Product product = new Product();
            product.PId = reader.GetInt32("pid");
            product.PName = reader.GetString("name");
            product.Category = reader.GetString("category");
            product.Brand = reader.GetString("brand");
            product.PPrice = reader.GetDecimal("price");
            product.Quantity = reader.GetInt16("Quantity");
            product.manufacturing = reader.GetDateTime("manufacturing_date");
            product.expiry = reader.GetDateTime("expiry_date");
            return product;
        }
        private List<Product> GetProducts(MySqlCommand command)
        {
            List<Product> lstProduct = new List<Product>();
            reader = command.ExecuteReader();
            while (reader.Read())
            {
                lstProduct.Add(getProducteader);
            }
            reader.Close();
            DBHelper.CloseConnection();
            return lstProduct;
        }

    

        public List<Product> GetProducts(int productFilter, Product product)
        {
            MySqlCommand command = new MySqlCommand("", DBHelper.OpenConnection());
            switch(productFilter)
            {
                case ProductFilter.GET_ALL:
                    query = @"select * from Product";
                    break;
                case ProductFilter.FILTER_BY_PRODUCT_NAME:
                    query = @"select * from Items
                                where name like concat('%',@name,'%');";
                    command.Parameters.AddWithValue("@name", Product.PName);
                    break;
            }
            command.CommandText = query;
            return GetProducts(command);
        }

        public override bool Equals(object? obj)
        {
            return obj is ProductDAL dAL &&
                   EqualityComparer<MySqlDataReader>.Default.Equals(reader, dAL.reader);
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(reader);
        }
    }
}