use ASM01;

DROP TABLE IF EXISTS Category;

CREATE TABLE CateGory
(
  category varchar(50) DEFAULT NULL ,
  pid int NOT NULL,
  
  KEY pid (pid),
  CONSTRAINT category_ibfk_1 FOREIGN KEY (pid) REFERENCES product (pid)
) ;


LOCK TABLES category WRITE;
UNLOCK TABLES;