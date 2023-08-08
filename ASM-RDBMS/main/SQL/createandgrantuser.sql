create user if not exists 'vtca'@'localhost' identified by 'vtcacademy';
grant all on ASM01.* to 'vtca'@'localhost';


select pid from product order by pid desc limit 1;

select userid, name, ifnull(address, '') as ddress
from customer where userid=1;
                        
select order_id from Orders order by order_id desc limit 1;

select LAST_INSERT_ID();
select userid from customer order by userid desc limit 1;

