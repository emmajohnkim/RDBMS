using System;
using Persistence;
using MySql.Data.MySqlClient;

namespace DAL
{
    #nullable disable

    public class CategoryDAL
    {
        private static CategoryDAL _instance;
        public static CategoryDAL Instance
        {
            get
            {
                if (_instance == null) _instance = new CategoryDAL();
                return _instance;
            }
        }

        private List<Category> categories = new List<Category>();

        private CategoryDAL()
        {
            LoadCategory();
        }

        void LoadCategory()
        {
            DBHelper.OpenConnection();
            categories.Clear();

            string query = "select * from category;";

            MySqlDataReader reader = DBHelper.ExecQuery(query);
            while (reader.Read())
            {
                categories.Add(GetCategory(reader));
            }
            reader.Close();
            DBHelper.CloseConnection();
        }

        Category GetCategory(MySqlDataReader reader)
        {
            Category category = new Category();

            category.Id = reader.GetInt32("pid");
            category.CategoryName = reader.GetString("category");

            return category;
        }

        public List<Category> GetAllCategories()
        {
            LoadCategory();
            return categories;
        }

        public Category GetCategoryByID(int id) => categories.FirstOrDefault(c => c.Id == id);

        public Category GetCategoryByName(string name) => categories.FirstOrDefault(c => c.CategoryName == name);
    }
}