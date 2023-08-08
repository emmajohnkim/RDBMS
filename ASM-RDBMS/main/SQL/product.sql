use ASM01;

DROP TABLE IF EXISTS product;
CREATE TABLE product 
(
  pid int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  category varchar(50) DEFAULT NULL,
  brand varchar(50) DEFAULT NULL,
  price decimal(6,0) NOT NULL,
  Quantity smallint NOT NULL DEFAULT '0',
  manufacturing_date timestamp NULL DEFAULT NULL,
  expiry_date timestamp NULL DEFAULT NULL,
  PRIMARY KEY (pid)
);

LOCK TABLES product WRITE;
UNLOCK TABLES;