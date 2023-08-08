CREATE DATABASE Lab3_Ex2;
use Lab3_Ex2;
create table Publisher
(
Name varchar(255) not null,
Address varchar(255) not null,
Phone varchar(255) not null,
URL int not null,
primary key(Name)
);


create table Author
(
Name varchar(255) not null,
Address varchar(255) not null,
URL varchar(255) not null,
primary key (Name),  unique (Address)
);

create table Customer
(
Email varchar(255) not null,
Name varchar(255) not null,
Phone varchar(255) not null,
Address varchar(255) not null,
primary key(Email)
);

create table Book
(
ISBN varchar(255),
PublisherName varchar(255),
AuthorName varchar(255),
AuthorAddress varchar(255),
Year1 int not null,
Title varchar(255) not null,
Price numeric(19,0) not null,
primary key (ISBN)
);

alter table Book
add foreign key (PublisherName) references Publisher(Name);

alter table Book
add foreign key (AuthorName) references Author(Name);

alter table Book
add foreign key (AuthorAddress) references Author(Address);


CREATE TABLE WareHouse (
Code int(10) PRIMARY KEY,
Phone varchar(225),
Address varchar(225)
);

create table WareHouse_Book
(
WarehouseCode int,
BookISBN varchar(255),
Count2 int not null
);

alter table WareHouse_Book
add foreign key (BookISBN) references Book(ISBN);

alter table WareHouse_Book
add foreign key (WarehouseCode) references Warehouse(Code);



create table ShoppingBasket
(
ID int,
CustomerEmail varchar(255),
primary key(ID)
);

alter table ShoppingBasket
add foreign key (CustomerEmail) references Customer(Email);

create table ShoppingBasket_Book
(
ShoppingBasketID int,
BookISBN varchar(255),
Count1 int not null
);

alter table ShoppingBasket_Book
add foreign key (ShoppingBasketID) references ShoppingBasket(ID);

alter table ShoppingBasket_Book
add foreign key (BookISBN) references Book(ISBN);


