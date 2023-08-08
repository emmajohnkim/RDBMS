using BL;
using DAL;
using Persistence;
using System;
using System.Collections.Generic;
using System.Text;
using MySqlX.XDevAPI.Relational;


namespace PL
{
    public class CustomerPL
    {
        readonly string[] CustomerMenu = new string[1] { "Add Customer" };

        private readonly CustomerBL _CustomerBL;

        public CustomerPL(CustomerBL CustomerBL)
        {
            _CustomerBL = CustomerBL;
        }

        public int Menu(string title, string[] options)
            {
                Console.WriteLine("\n" + title);

                int length = options.Length;
                for (int i = 0; i < length; i++)
                {
                    Console.WriteLine(" - {0} : {1}.", i + 1, options[i]);
                }

                Console.Write("Your choice: ");
                return InputManager.input<int>();
            }      

        public void CustomerView()
        {
                int choice = Menu("Manage Customer", CustomerMenu);
                switch (choice)
                {
                    // Add customer :
                    case 1:
                        Customer customer = InputCustomer();
                        Result result = _CustomerBL.AddCustomer(customer);

                        if (result.Success)
                        {
                            Console.WriteLine("Add successful !");
                        }
                        else
                        {
                        }

                        break;
                
                    default:
                        break;
                }
        }
        

        

        public Customer InputCustomer()
        {
            Customer customer = new Customer();
            
            Console.Write("Enter Customer ID: ");
            customer.CustmerId = InputManager.input<int>();

            Console.Write("\nEnter customer's phone number : ");
            customer.phoneNumber = InputManager.input<string>();

            Console.Write("\nEnter customer's name : ");
            customer.CustomerName = InputManager.input<string>();

            Console.Write("\nEnter customer's email : ");
            customer.email = InputManager.input<string>();


            Console.Write("\nEnter customer's city : ");
            customer.CustomerCity = InputManager.input<string>();

            Console.Write("\nEnter customer's address : ");
            customer.CustomerAddress = InputManager.input<string>();

            Console.Write("\n Enter passworrd : ");
            customer.password = InputManager.input<string>();

            return customer;
        }
    }


    public class Result
    {
        public bool Success { get; set; }

        public List<string>? Errors { get; set; } = new List<string>();

        public static Result Successed() => new Result() { Success = true };

        public static Result Error()
        {
            return new Result()
            {
                Success = false,
                Errors = new List<string>() { "Oops, something wrong !" }
            };
        }

        public static Result Error(string error)
        {
            return new Result()
            {
                Success = false,
                Errors = new List<string>() { error }
            };
        }
    }



    public static class InputManager
    {
        public static T input<T>()
        {
            try
            {
                var content = Console.ReadLine();

                if (content != null)
                {
                    T value = (T)Convert.ChangeType(content, typeof(T));

                    return value;
                }
                else
                {
                    throw new Exception();
                }
            }
            catch
            {
                Console.Write("\nInvalid choice, re-enter : ");
                return input<T>();
            }
        }
    }




    public class CategoryPL
        {
            readonly string[] CategoryMenu = new string[1] {"Show All Products" };

            private readonly CategoryBL _CategoryBL;
            private object AnsiConsole;

            public CategoryPL(CategoryBL CategoryBL) => _CategoryBL = CategoryBL;

            
            public int Menu(string title, string[] options)
            {
                Console.WriteLine("\n" + title);

                int length = options.Length;
                for (int i = 0; i < length; i++)
                {
                    Console.WriteLine(" - {0} : {1}.", i + 1, options[i]);
                }

                Console.Write("Your choice: ");
                return InputManager.input<int>();
            }      

            public void CategoryView()
            {
                int choice = Menu("Manage Category", CategoryMenu);
                switch (choice)
                {
                    // Show all categories :
                    case 1:
                        List<Category> categories = _CategoryBL.GetAllCategories();

                        ShowCategories(categories);

                        break;
                    default:
                        break;
                }
            }

            public void ShowCategories(List<Category> categories)
            {
                Table table = new Table();
                table.Title = new TableTitle("CATEGORIES");
                table.AddColumns("Id", "Name");

                foreach (var item in categories)
                {
                    table.AddRow(
                        item.Id.ToString(),
                        item.CategoryName
                    );
                }

                table.Border(TableBorder.Ascii);
                AnsiConsole.Write(table);
            }
        }


    
}