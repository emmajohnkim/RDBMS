using System.Linq;
using System.Collections.Specialized;
using System.Collections.Concurrent;
using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using Persistence;

namespace DAL
{
    public class OrderDAL
    {
        public bool CreateOrder(Order order)
        {
            if (order == null || order.ProductsList == null || order.ProductsList.Count == 0)
            {
                return false;
            }
            bool result = true;
            MySqlConnection connection = DBHelper.OpenConnection();
            MySqlCommand cmd = connection.CreateCommand();
            cmd.Connection = connection;

            //Lock update all tables
            cmd.CommandText = "lock tables customer write, Orders write, product write, OrderDetails write;";
            cmd.ExecuteNonQuery();
            MySqlTransaction trans = connection.BeginTransaction();
            cmd.Transaction = trans;
            MySqlDataReader reader = null;
            if (order.OrderCustomer == null || order.OrderCustomer.CustomerName == null || order.OrderCustomer.CustomerName == "")
            {
                //set default customer with customer id = 1
                order.OrderCustomer = new Customer() { CustmerId = 1 };
            }
            try
            {
                if (order.OrderCustomer.CustmerId == null)
                {
                    //Insert new Customer
                    cmd.CommandText = @$"insert into customer values ( {order.OrderCustomer.CustmerId},'{ Order.OderCustomer.phoneNumber}','{ order.OrderCustomer.CustomerName }', '{ order.OrderCustomer.email}', '{order.OrderCustomer.CustomerCity}', '{order.OrderCustomer.CustomerAddress }' , '{ order.OrderCustomer.password}';";
                    cmd.ExecuteNonQuery();
                    //Get new customer id
                    cmd.CommandText = "select userid from customer order by userid desc limit 1;";
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        order.OrderCustomer.CustmerId = reader.GetInt32("userid");
                    }
                    reader.Close();
                }
                else
                {
                    order.OrderCustomer = (new CustomerDAL()).GetById(order.OrderCustomer.CustmerId ?? 0, DBHelper.GetConnection());
                }
                if (order.OrderCustomer == null || order.OrderCustomer.CustmerId == null)
                {
                    throw new Exception("Can't find Customer!");
                }
                //Insert Order
                cmd.CommandText = "insert into orders(userid, Quantity) values (@customerId, @orderStatus);";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@customerId", order.OrderCustomer.CustmerId);
                cmd.Parameters.AddWithValue("@orderStatus", OrderStatus.CREATE_NEW_ORDER);
                cmd.ExecuteNonQuery();
                //get new Order_ID
                // cmd.CommandText = "select order_id from Orders order by order_id desc limit 1;";
                cmd.CommandText = "select LAST_INSERT_ID() as order_id";
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    order.OrderId = reader.GetInt32("order_id");
                }
                reader.Close();

                //insert Order Details table
                foreach (var product in order.ProductsList)
                {
                    if (product.PId == null)
                    {
                        throw new Exception("Not Exists Product");
                    }
                    //get unit_price
                    cmd.CommandText = "select price from product where pid=@pId";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@pId", product.PId);
                    reader = cmd.ExecuteReader();
                    if (!reader.Read())
                    {
                        throw new Exception("Not Exists Product");
                    }
                    product.PPrice = reader.GetDecimal("price");
                    reader.Close();

                
                }
                //commit transaction
                trans.Commit();
                result = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                result = false;
                try
                {
                    trans.Rollback();
                }
                catch
                {
                }
            }
            finally
            {   
                //unlock all tables;
                cmd.CommandText = "unlock tables;";
                cmd.ExecuteNonQuery();
                DBHelper.CloseConnection();
            }
            return result;
        }
    }
}