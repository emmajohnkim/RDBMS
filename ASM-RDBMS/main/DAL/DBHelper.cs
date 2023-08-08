using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class DBHelper
    {
    private static MySqlConnection connection;
    public static MySqlConnection GetConnection()
    {
        if (connection == null)
        {
            connection = new MySqlConnection 
            {
                ConnectionString = @"server=localhost;userid=root;password=AnhLoan1706@;port=3306;database=ASM01;"
            };
        }
        return connection;
    }
    public static MySqlDataReader ExecQuery(string query) 
    {
        MySqlCommand command = new MySqlCommand(query, connection);
        return command.ExecuteReader();
    }
    public static MySqlConnection OpenConnection(MySqlConnection connection)
    {
        if (connection == null)
        {
            GetConnection();
        }

        connection.Open();
        return connection;
    }
    public static void CloseConnection() 
    {
        if (connection!= null)
        {
            connection.Close();
        }
    }

    
        internal static MySqlDataReader ExececuteQuery(string query)
        {
            throw new NotImplementedException();
        }
    }

}
