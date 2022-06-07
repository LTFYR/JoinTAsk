create database MTMRelDB2

use MTMRelDB2

create table Product(
 Id int  primary key identity,
 [Name] nvarchar(40) not null,
 [Price] decimal (8,4)
)

create table Sale(
 Id int primary key identity,
 [Date] date,
 [TotalPrice] decimal (6,2)
)

create table Cashier(
 Id int primary key identity,
 [Name] nvarchar(50) not null
)

insert into Product
values('Crisp',8.99),
('Tomato',1.2599),
('Coca Cola',0.9999)

insert into Product
values('Onion',9.99),
('Banana',3.99),
('Fanta',1.99)

insert into Sale
values('2020-01-28 14:54:11.000',19.99),
('2020-01-27 15:30:11.000',15.59),
('2020-01-26 16:54:11.000',13.95),
('2020-01-25 20:44:11.000',18.44)

insert into Cashier
values('John'),
('Eva'),
('Adam'),
('Dante')

alter table Sale
add Product_Id int foreign key references Product(Id)

alter table Sale
add Cashier_Id int foreign key references Cashier(Id)

select s.Date, s.TotalPrice ,c.Name, p.Name from Product as p
 join Sale as s
on s.Product_Id = s.Id
join Cashier as c
on c.Id = s.Product_Id



-- burda count isletmeliydim bilirem. ancaq count yazanda c.name ve c.id error verirdi her defe--
select s.Product_Id,s.TotalPrice as AllProducts, c.Name from Cashier
join Sale as s
on s.Product_Id =  s.Id
join Cashier as c
on Cashier.Id = s.Id 
