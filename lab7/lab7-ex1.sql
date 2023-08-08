create database lab7_ex1;
use lab7_ex1;

CREATE TABLE Toys
(
	ProductCode Varchar(5) PRIMARY KEY,
	Name Varchar(30),
	Category Varchar(30),
	Manufacturer Varchar(40),
	AgeRange Varchar(15),
	UnitPrice decimal(20,2),
	Netweight int,
	QtyOnHand int
);

INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T11','A','B','C','D',20,100,200);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T12','GUN','LAP RAP','ATONI','12T TRO LEN',100,400,1000);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T13','OTO','LAP RAP','JUNIO','12T TRO LEN',400,100,150);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T14','BOX','LAP GHEP','MACLO','12T TRO LEN',10,20,220);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T15','KINH','LAP GHEP','R4','12T TRO LEN',400,220,600);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T16','QUAN AO','MAC','MCK','12T TRO LEN',900,190,30);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T17','VONG TAY','USE','RRR','12T TRO LEN',400,100,200);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T18','BALO','USE','FOLOW','12T TRO LEN',110,130,130);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T19','BONG DA','USE','CANT','12T TRO LEN',1600,160,100);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T20','BONG CHUYEN','USE','EEE','12T TRO LEN',1700,150,100);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T21','VOT CAU LONG','USE','VVV','12T TRO LEN',900,190,120);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T22','VOT TENIS','USE','BBB','12T TRO LEN',1020,109,700);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T33','CAU MAY','USE','MMM','12T TRO LEN',920,300,120);
INSERT INTO Toys(ProductCode,Name,Category,Manufacturer,AgeRange,UnitPrice,Netweight,QtyOnHand) VALUES('T44','ZOZO','BO GAME','ATONIO','12T TRO LEN',1550,403,240);

SELECT * FROM Toys;


INSERT INTO Toys VALUES ('DC001','Rubic','Do choi','Marvel','3-10 tuoi',50000,50,50);
INSERT INTO Toys VALUES ('DC002','Logo tau thuy','Lap giap','Tap doan LOGO','8-13 tuoi',150000,3000,20);
INSERT INTO Toys VALUES ('DC003','Xe dieu khien','Dieu khien','Tap doan Xe DK','10-15 tuoi',90000,2000,30);
INSERT INTO Toys VALUES ('DC004','May bay dieu khien','Dieu Khien','Tap doan may bay DK','10-15 tuoi',250000,3000,30);
INSERT INTO Toys VALUES ('DC005','Logo toa nha','Lap giap','Tap doan logo','8-13 tuoi',150000,300,20);
INSERT INTO Toys VALUES ('DC006','Rubic 2','Bo game','Marvel','3-11 tuoi',350000,500,150);
INSERT INTO Toys VALUES ('DC007','Rubic  3','Bo game','Marvel','4-12 tuoi',450000,60,250);
INSERT INTO Toys VALUES ('DC008','Rubic  4','Bo game','Marvel','5-13 tuoi',550000,100,350);
INSERT INTO Toys VALUES ('DC009','Rubic  5','Bo game','Marvel','6-14 tuoi',650000,5000,450);
INSERT INTO Toys VALUES ('DC010','Rubic  6','Bo game','Marvel','7-15 tuoi',150000,900,550);
INSERT INTO Toys VALUES ('DC011','Rubic  7','Bo game','Marvel','8-15 tuoi',250000,200,650);
INSERT INTO Toys VALUES ('DC012','Rubic  8','Bo game','Marvel','9-15 tuoi',350000,300,150);
INSERT INTO Toys VALUES ('DC013','Rubic  9','Bo game','Marvel','10-15 tuoi',450000,400,250);
INSERT INTO Toys VALUES ('DC014','Rubic  10','Bo game','Marvel','11-16 tuoi',550000,600,350);
INSERT INTO Toys VALUES ('DC015','Rubic  11','Bo game','Marvel','12-17 tuoi',250000,90,450);

select * FROM Toys;

delimiter //
CREATE PROCEDURE HeavyToysID()
begin
 SELECT * FROM Toys WHERE Netweight > 500;
 end//
delimiter ;

call HeavyToysID();

delimiter //
CREATE PROCEDURE PriceIncreasecho()
begin
 SELECT ProductCode,Name,UnitPrice+10 AS SauKhiTangGia FROM Toys;
 end//
delimiter ;

call PriceIncreasecho();


delimiter //
CREATE PROCEDURE sp_QtyOnHand()
begin
SELECT ProductCode,Name,QtyOnHand-5 AS SauKhiGiamSoLuong FROM Toys;
 end//
delimiter ;

call sp_QtyOnHand();


