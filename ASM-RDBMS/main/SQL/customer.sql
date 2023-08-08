use ASM01;

DROP TABLE IF EXISTS customer;

create table customer
(
	userid int NOT NULL AUTO_INCREMENT,
    phoneNumber varchar(20) DEFAULT NULL,
    name varchar(50) DEFAULT NULL,
    email varchar(50) DEFAULT NULL,
    city varchar(50) DEFAULT NULL,
    address varchar(100) DEFAULT NULL,
    password varchar(50) NOT NULL,
    PRIMARY KEY ( userid)
);

LOCK TABLES customer WRITE;
UNLOCK TABLES;
