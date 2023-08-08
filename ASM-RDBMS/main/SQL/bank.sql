use ASM01;

DROP TABLE IF EXISTS bank;

create table bank
(
  bank_account_number int NOT NULL,
  password varchar(20) NOT NULL,
  bank_balance int NOT NULL,
  PRIMARY KEY (bank_account_number)
);

LOCK TABLES bank WRITE;
UNLOCK TABLES;