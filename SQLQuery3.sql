create database truYum
use truYum
create table menu_item (id int primary key ,Name varchar(40),Price decimal(10,2),Active bit ,Date_of_Launch Date ,Category varchar(40)
,free_delivery bit )
drop table menu_item




insert into menu_item (Id,Name,Price,Active,Date_of_Launch,Category,free_delivery)
values (1,'Gulab Jamun',19.5,1,'2019-09-17','sweet',1)


insert into menu_item (Id,Name,Price,Active,Date_of_Launch,Category,free_delivery)
values (2,'Pepsi',20,1,'2011-04-01','Drink',0),
(3,'Mango shake',50.0,1,'2019-02-11','Drink',1),
(4,'Samosa',15.0,1,'2011-02-11','snack',0)


select * from menu_item;

update menu_item set category='soft drink' where Id=2;

select * from menu_item where Active=1 and Date_of_Launch<'2020-04-15';


create table customer(id int identity(1,1) primary key, name varchar(50) not null);

insert into customer values('momo'),('fomo'),('zomo'),('mounika');

select * from customer;

create table cart(id int identity(1,1) primary key,
productId int references menu_item(id),
customerId int references customer(id));



insert into cart values (4,2);
insert into cart values (3,3),(1,2);

select * from cart;


select c.productId, count(c.customerId) As NoOfCustomer from cart c
group by c.productId;


select m.Name as Item_Name,m.Price,count(m.Name) as Qty,m.free_delivery from menu_item  m
inner join cart c
on c.productId=m.Id 
join customer cus
on cus.id=c.customerId and cus.id=1
group by cus.name,m.Name,m.Price,m.Id,m.free_delivery
order by cus.name;


