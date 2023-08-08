using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using Persistence;

namespace DAL
{
    public class CustomerDAL
    {
        private string query;
        private MySqlConnection connection = DBHelper.OpenConnection();
        private MySqlDataReader reader;
        public Customer GetById(int customerId)
        {
            if(connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
                query = @"select userid, name,
                        ifnull(customer_address, '') as address, phoneNumber,email,city
                        from customer where userid=" + customerId + ";";
            reader = (new MySqlCommand(query, connection)).ExecuteReader();
            Customer? c = null;
            if (reader.Read())
            {
                c = GetCustomer(reader);
            }
            reader.Close();
            connection.Close();
            return c;
        }

        internal Customer GetById(int customerId, MySqlConnection connection)
        {
            query = @"select userid, name,
                        ifnull(customer_address, '') as address, phoneNumber,email,city
                        from customer where userid=" + customerId + ";";
            Customer? c = null;
            reader = (new MySqlCommand(query, connection)).ExecuteReader();
            if (reader.Read())
            {
                c = GetCustomer(reader);
            }
            reader.Close();
            return c;
        }

        private Customer GetCustomer(MySqlDataReader reader)
        {
            Customer c = new Customer();
            c.CustmerId = reader.GetInt32("userid");
            c.CustomerName = reader.GetString("name");
            c.CustomerAddress = reader.GetString("address");
            c.CustomerCity = reader.GetString("city");
            c.phoneNumber = reader.GetString("phoneNumber");
            c.email = reader.GetString("email");
            c.password = reader.GetString("password");
            return c;
        }

        public int? AddCustomer(Customer c)
        {
            int? result = null;
            if(connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            MySqlCommand cmd = new MySqlCommand("sp_createCustomer", connection);
            try
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@customerName", c.CustomerName);
                cmd.Parameters["@customerName"].Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@customerAddress", c.CustomerAddress);
                cmd.Parameters["@customerAddress"].Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@customerId", MySqlDbType.Int32);
                cmd.Parameters["@customerId"].Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.AddWithValue("@phoneNumber", MySqlDbType.VarChar);
                cmd.Parameters["@phoneNumber"].Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@customerCity", MySqlDbType.VarChar);
                cmd.Parameters["@customerCity"].Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@email", MySqlDbType.VarChar);
                cmd.Parameters["@email"].Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("@password", MySqlDbType.VarChar);
                cmd.Parameters["@password"].Direction = System.Data.ParameterDirection.Input;
                cmd.ExecuteNonQuery();
                result = (int) cmd.Parameters["@customerId"].Value;
            }
            catch
            {
            }
            finally
            {
                connection.Close();
            }
            return result;
        }
    }
}