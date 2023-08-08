INSERT INTO customer VALUES (1001,'123456789','Loan','AnhLoan@gmail.com','Ha Noi','Tran Thai Tong,Dich Vong Hau, Cau Giay','123456'),
                            (1002,'014785296','Hien','Hien@gmail.com','HCM','Tran Thai ','951756'),
                            (1003,'984541415','Thien','Thien@gmail.com','Da Nang','thai binh thinh tri', '984545'),
                            (1004,'654654548', 'Ha', 'Ha@gmail.com ', 'Ha noi', 'thien thien dia dia', '846945'),
                            (1005, '984512625', 'Kim', 'Kim@gmail.com', 'HCM','hoa binh thinh tri', '985685'),
                            (1006, '356152655',' Binh','Binh@gmail.com', 'Nghe An', 'thien dia cuong hoan','123529'),
                            (1007, '9845154800', 'Kieu', 'Kieu@gmail.com', 'Thien Ha', 'kieu hung loan the', '951741');
                            
INSERT INTO product VALUES (101,'renof8','smartphone','OPPO',30000,0,'2022-07-25 12:15:06','2022-09-01 10:10:10'),
                            (102, 'kim binh', 'smartphone','OPPO',70000,1,'2022-07-25 12:15:06','2022-09-01 10:10:10'),
                            (103, 'anh sang', 'smartphone','OPPO',216056,1,'2022-07-25 12:15:06','2022-09-01 10:10:10'),
                            (104,'hoc mau','Gia dung','Xaoimize',145566,1,'2022-07-25 12:15:06','2022-09-01 10:10:10'),
                            (105,'be yeu','Me va be', ' finner', 546656,0, '2022-07-25 12:15:06','2022-09-01 10:10:11'),
                            (106,'cuc cung', 'Me va be', 'Bambo',25800,1, '2022-08-16 05:13:01', '2022-12-12 12:12:12');
insert into category values('smartphone',101),
                            ('smartphone',102),
                            ('smartphone',103),
                            ('Gia dung',104),
                            ('Me va be',105),
                            ('Me va be',106);

INSERT INTO Orders VALUES (123,'2022-12-25 12:12:12',1001,'shipping'),
                        (124,'2022-12-25 12:12:12',1002,'Received'),
                        (125,'2022-12-25 12:12:13',1003,'Received'),
                        (126,'2022-12-25 12:12:14',1004,'Received'),
                        (127,'2022-12-25 12:12:15',1005,'Canceled'),
                        (128,'2022-12-25 12:12:16',1006,'Canceled');


INSERT INTO OrderDetails VALUES (123,101,1200,75),
                                (124,102,5600,100),
                                (125,103,6600,100),
                                (126,104,8600,80),
                                (127,105,9200,80),
                                (128,106,12800,80);






