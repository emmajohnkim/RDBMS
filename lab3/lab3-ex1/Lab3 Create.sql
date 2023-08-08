Create database BookLibrary;
Create Table Book	(
BookCode int Primary key,
BookTitle char(150),
AuthorName char(150),
Edition char(50),
BookPrice decimal,
Copies int
);
Create Table Member	(
MemberCode int Primary key,
MemberName char(100),
Address char(200),
PhoneNumber char(11)
);

CREATE TABLE IssueDetails (
	BookCode int,
	MemberCode int,
	IssueDate Datetime default current_timestamp,
	ReturnDate Datetime,
    FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
    FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode)
);