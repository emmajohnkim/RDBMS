using System;
using System.Collections.Generic;
using Persistence;
using BL;
using DAL;
using PL;


    class Program
    {
        static void Main(string[] args)
        {
            short mainChoose = 0, imChoose;
            string[] mainMenu = { "Product Management", "Add Customer (using stored procedure)", "Category Manage", "Exit" };
            string[] imMenu = { "Get By Product Id", "Get All Products", "Search By Product Name", "Exit" };
            ProductBL ibl = new ProductBL();
            CustomerBL cbl = new CustomerBL();
            OrderBL obl = new OrderBL();
            CategoryBL cc = new CategoryBL();
            CustomerPL cuspl = new CustomerPL(cbl);
            CategoryPL ctpl = new CategoryPL(cc);
            List<Product> lst;
            do
            {
                mainChoose = Menu(" Order Management System - OMS", mainMenu);
                switch (mainChoose)
                {
                    case 1:
                        do
                        {
                            // if (ibl == null) ibl = new ProductBL();
                            imChoose = Menu("Product Management", imMenu);
                            switch (imChoose)
                            {
                                case 1:
                                    Console.Write("\nInput Product Id: ");
                                    int pId;
                                    if (Int32.TryParse(Console.ReadLine(), out pId))
                                    {
                                        Product i = ibl.GetProductById(pId);
                                        if (i != null)
                                        {
                                            //Console.WriteLine("Product ID: " + i.PId);
                                            Console.WriteLine("Product Name: " + i.PName);
                                            Console.WriteLine("Category: " + i.Category);
                                            Console.WriteLine("Brand : " + i.Brand);
                                            Console.WriteLine("Product Price: " + i.PPrice);
                                            Console.WriteLine("Product Quantity: " + i.Quantity);
                                            Console.WriteLine("Product manufacturingdate: " + i.manufacturing);

                                        }
                                        else
                                        {
                                            Console.WriteLine("There is no Product with id " + pId);
                                        }
                                    }
                                    else
                                    {
                                        Console.WriteLine("Your Choose is wrong!");
                                    }
                                    Console.WriteLine("\n    Press Enter key to back menu...");
                                    Console.ReadLine();
                                    break;
                                case 2:
                                    lst = ibl.GetAll();
                                    Console.WriteLine("\nProduct Count: " + lst.Count);
                                    break;
                                case 3:
                                    lst = ibl.GetByName("I");
                                    Console.WriteLine("\nProduct Count By Name: " + lst.Count);
                                    break;
                            }
                        } while (imChoose != imMenu.Length);
                        break;
                    case 2:
                        cuspl.CustomerView();

                        break;
                    case 3:
                       ctpl.CategoryView();
                       break;
                }
            } while (mainChoose != mainMenu.Length);
        }

        private static short Menu(string title, string[] menuProducts)
        {
            short choose = 0;
            string line = "========================================";
            Console.WriteLine(line);
            Console.WriteLine(" " + title);
            Console.WriteLine(line);
            for (int i = 0; i < menuProducts.Length; i++)
            {
                Console.WriteLine(" " + (i + 1) + ". " + menuProducts[i]);
            }
            Console.WriteLine(line);
            do
            {
                Console.Write("Your choice: ");
                try
                {
                    choose = Int16.Parse(Console.ReadLine());
                }
                catch
                {
                    Console.WriteLine("Your Choose is wrong!");
                    continue;
                }
            } while (choose <= 0 || choose > menuProducts.Length);
            return choose;
        }
    }
