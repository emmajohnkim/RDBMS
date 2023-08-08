using System;
using System.Data;
using MySql.Data.MySqlClient;

public class DBHelper
{
    private static MySqlConnection? connection;

    //dùng để kết nối
    public static MySqlConnection GetConnection()
    {
        if (connection == null)
        {
            connection = new MySqlConnection
            {
                ConnectionString = @"server=localhost;userid=root;password=AnhLoan1706@;port=3306;database=employees;"
            };
        }
        return connection;
    }

    // dùng để thực hành queries
    public static MySqlDataReader ExecQuery(string query) 
    {
        MySqlCommand command = new MySqlCommand(query, connection);
        return command.ExecuteReader();
    }

    //Mở kết nối
    public static MySqlConnection OpenConnection()
    {
        if (connection == null)
        {
            GetConnection();
        }
        connection.Open();
        return connection;
    }

    //đóng keeys nối
    public static void CloseConnection() 
    {
        if (connection != null) connection.Close();
    }

}

class Connection
{

    // hứng dữ liệu
    private Item GetItem(MySqlDataReader reader)
    {
        Item item = new Item();
        item.ItemId = reader.GetInt32("item_id");
        item.ItemName = reader.GetString("item_name");
        item.ItemPrice = reader.GetDecimal("unit_price");
        item.Amount = reader.GetInt32("amount");
        item.Status = reader.GetInt16("item_status");
        item.Description = reader.GetString("item_description");
        return item;
    }


    private Item GetItem(MySqlDataReader reader)
    {
        Item item = new Item();
        item.ItemId = reader.GetInt32("item_id");
        item.ItemName = reader.GetString("item_name");
        item.ItemPrice = reader.GetDecimal("unit_price");
        item.Amount = reader.GetInt32("amount");
        item.Status = reader.GetInt16("item_status");
        item.Description = reader.GetString("item_description");
        return item;
    }

    public Item GetItemById(int itemId)
    {
        //câu truy vấn phải có bảng trc nhưng k chắc chắn an toàn
        query = @"select item_id, item_name, unit_price, amount, item_status,
        ifnull(item_description, '') as item_description
        from Items where item_id=" + itemId + ";";
        DBHelper.OpenConnection();

        // thực thi một câu lệnh sql
        reader = DBHelper.ExecQuery(query);
        Item item = null;
        if (reader.Read())
        {
            //để lấy 1 dòng rồi gắn cho 1 items
            item = GetItem(reader);
        }
    }


//thêm ms 1 customers, nhớ phải tạo 1 sp_createCustomer bên sql, mội giá trị bên sql phải có @trc biến khi sử dụng tên c#/ ngoài ra nhớ sd StoreProcedure
    public int AddCustomer(Customer c)
    {
        int result = 0;
        MySqlCommand cmd = new MySqlCommand("sp_createCustomer", DBHelper.OpenConnection());
        try 
        {
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@customerName", c.CustomerName);
            cmd.Parameters["@customerName"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("@customerAddress", c.CustomerAddress);
            cmd.Parameters["@customerAddress"].Direction = System.Data.ParameterDirection.Input;
            cmd.Parameters.AddWithValue("@customerId", MySqlDbType.Int32);
            cmd.Parameters["@customerId"].Direction = System.Data.ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            result = (int) cmd.Parameters["@customerId"].Value;
        } 
        catch
        {}
        finally
        {
            DBHelper.CloseConnection();
        }
        return result;
    }
}




class Program
{
    static void Main(string[] args)
    {
        MySqlConnection connection = new MySqlConnection
        {
            ConnectionString = @"server=localhost;userid=root;password=AnhLoan1706@;port=3306;database=employees;"
        };
        connection.Open();

        MySqlCommand command = new MySqlCommand("SELECT * FROM employees LIMIT 5;", connection);
        using (MySqlDataReader reader = command.ExecuteReader())
        {
            System.Console.WriteLine("Employee ID\t\tFirst Name\t\tLast Name");
            while (reader.Read())
            {
                string row =
                $"{ reader["emp_no"]}\t\t\t{reader["first_name"]}\t\t{reader["last_name"]}";
                System.Console.WriteLine(row);
            }
            reader.Close();
        }
    }
}