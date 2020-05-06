//https://www.tektutorialshub.com/sql-server/sql-join-in-sql-server/


create table customerType (
	CustomerTypeID int primary key, 
	Name varchar(10)
)

insert into customerType values (1,'VIP')
insert into customerType values (2,'Regular')


create table Customers (
   CustomerID int primary key,
   Name varchar(100),
   CustomerTypeID int null,
   CONSTRAINT FK_Customers_CustomerTypeID FOREIGN KEY (CustomerTypeID)
      REFERENCES customerType (CustomerTypeID)
);

insert into Customers values(1, 'Kevin Costner',1);
insert into Customers values(2, 'Akshay Kumar',2);
insert into Customers values(3, 'Sean Connery',1);
insert into Customers values(4, 'Sanjay Dutt',2);
insert into Customers values(5, 'Sharukh Khan',null);


create table Tables (
   TableNo int primary key,
   CustomerID int null,
   CONSTRAINT FK_Tables_CustomerID FOREIGN KEY (CustomerID)
      REFERENCES Customers (CustomerID)
);

insert into Tables values(1, null);
insert into Tables values(2, 1);
insert into Tables values(3, 2);
insert into Tables values(4, 5);
insert into Tables values(5, null);


create table Orders (
   OrderNo int primary key,
   OrderDate datetime,
   CustomerID int null,
   Amount decimal(10,2),
   CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID)
      REFERENCES Customers (CustomerID)
);

insert into Orders Values(1,'2019-12-10',1,5000)
insert into Orders Values(2,'2019-12-09',1,3000)
insert into Orders Values(3,'2019-12-10',2,7000)
insert into Orders Values(4,'2019-12-01',2,7000)
insert into Orders Values(5,'2019-12-10',3,1000)
insert into Orders Values(6,'2019-12-03',3,1000)
insert into Orders Values(7,'2019-12-10',4,3000)
insert into Orders Values(8,'2019-12-10',2,4000)

create table DiscVoucher (
   FromAmount decimal(10,0) ,
   UptoAmount decimal(10,0) ,
   Discount decimal(10,0)
)

insert into DiscVoucher Values(0,3000,0)
insert into DiscVoucher Values(3001,8000,10)
insert into DiscVoucher Values(8001,99999,25)  
