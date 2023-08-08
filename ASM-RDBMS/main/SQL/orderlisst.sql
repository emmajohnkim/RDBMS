use ASM01;

create table Orders
(
	order_id int auto_increment primary key,
    order_date datetime default now(),
    userid int,
    order_status varchar(10),
    constraint fk_Orders_Customers foreign key(userid) references customer(userid)
);
lock table Orders write;
unlock tables;

create table OrderDetails
(
	order_id int not null,
    pid int not null,
    price decimal(20,2) not null,
    Quantity int not null default '0',
    constraint pk_OrderDetails primary key(order_id, pid),
    constraint fk_OrderDetails_Orders foreign key(order_id) references Orders(order_id),
    constraint fk_OrderDetails_Items foreign key(pid) references product(pid)
);