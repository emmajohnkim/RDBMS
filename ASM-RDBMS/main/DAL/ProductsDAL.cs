using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using Persistence;

namespace DAL
{
    public class ProductsDAL
    {
        private string query;
        private MySqlConnection connection;
        private MySqlDataReader reader;

        public ProductsDAL()
        {
            connection = DBHelper.OpenConnection();
        }

        public Product GetProductById(int pId)
        {
            if(connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            query = @"select *
                        from product where pid=" + pId + ";";
            MySqlCommand command = new MySqlCommand(query, connection);
            reader = command.ExecuteReader();
            Product product = null;
            if (reader.Read())
            {
                product = GetProduct(reader);
            }
            reader.Close();
            connection.Close();
            return product;
        }
         private List<Product> GetProducts(MySqlCommand command)
        {
            List<Product> lstProduct = new List<Product>();
            reader = command.ExecuteReader();
            while (reader.Read())
            {
                lstProductAdd(GetProducteader);
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
    }

    
}