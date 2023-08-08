CREATE DATABASE BookStore;

Use Bookstore;

CREATE TABLE Users (
	UserID int(11) PRIMARY KEY,
	Username varchar(100),
	Password varchar(30),
	Email Varchar(100),
	Created timestamp,
	Notes Varchar(100)
);

CREATE TABLE UserGroupLink (
	UserGroupID int(11),
	UserID int(11),
    CONSTRAINT COMPOSITE_KEY_NAME PRIMARY KEY (UserGroupID, UserID)
);

alter table UserGroupLink
add foreign key (UserID) references Users(UserID);

CREATE TABLE UserGroup (
	UserGroupID int(11) PRIMARY KEY,
    Name varchar(45)
);

alter table UserGroupLink
add foreign key (UserGroupID) references UserGroup(UserGroupID);

CREATE TABLE UserGroupPermissions (
	UserGroupID int(11),
    PermissionID int(11),
    CONSTRAINT COMPOSITE_KEY_NAME PRIMARY KEY (UserGroupID, PermissionID)
);

alter table UserGroupPermissions
add foreign key (UserGroupID) references UserGroup(UserGroupID);

CREATE TABLE Permissions (
	ID int(11) PRIMARY KEY,
	Name varchar(45)
);

alter table UserGroupPermissions
add foreign key (UserGroupID) references Permissions(ID);



INSERT INTO UserGroup
VALUE (101, 'Admin'), (102, 'Marketing'), (103, 'Employees'), (104, 'Design'), (105, 'IT')


