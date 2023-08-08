delimiter $$
create procedure sp_createCustomer(IN customerName varchar(100), IN customerAddress varchar(200), OUT customerId int)
begin
	insert into customer(name, address) values (customerName, customerAddress); 
    select max(userid) into customerId from customer;
end $$
delimiter ;


delimiter //
create procedure add_product(in categoryid int, in productname varchar(50), in price decimal(8,2), out productId int)
begin
	insert into product(category, name, price) values(categoryid, productname, price);
    
    select max(pid) into productId from product;
end //
delimiter ;