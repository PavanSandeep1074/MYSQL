#creation of new database of PGA28
create database PGA28;

#to get access inside of database
use PGA28;
#creating a customer table
create table customer_info
( cust_id int,
cust_name varchar(15),
phone_no int,
mail_id varchar(20)
);

show tables;
#code to display the info of the structure of the table
desc customer_info;

create database product;
use product;
create table product_info
(prod_id int,
prod_name varchar(15),
prod_price int,
prod_manfacturer varchar(30)
);
show tables;
desc product_info;





#create table
create table order_info (
order_id varchar(10) primary key,
order_name varchar(20) not null,
order_date date,
order_amount decimal(5,2) not null
);

desc order_info;





create table customer_details (
cust_id int primary key,
cust_name varchar(10) not null,
cust_mail varchar(10) unique,
cust_city varchar(10) default 'Hyderabad',
cust_phone int not null )
;



create table product_details (
prod_id int primary key,
prod_name varchar(20),
prod_price decimal(5,2),
prod_discount int default 1000 )
;



create table order_details (
order_id varchar(10) primary key,
order_name varchar(10),
prod_id int,
cust_id int,
order_amount decimal(5,2),
foreign key(prod_id) references product_details(prod_id),
foreign key(cust_id) references customer_details(cust_id)
);

desc customer_details;
desc product_details;
desc order_info;


insert into customer_details(cust_id,cust_name,cust_mail,cust_phone) 
values(1,'Agvi','agvi@g.com',988500847),
(2,'Sam','sam@g.com',978973500),
(3,'ravi','ravi@g.com',850064219);

#to get the results or access the records
select * from customer_details;

desc product_details;
# 2nd method to insert records or values in table withput using column names
insert into product_details values(101,'tv',100.2,1000);

insert into product_details values(102,'fan',50.2,1000),(103,'pendrive',20.1,1000);

select * from product_details;
select* from customer_details;


select*  from customer_details;
desc order_details;

insert into order_details values('1a','small',102,1,200),('1b','small',103,2,150),('1c','large',101,1,500);

select* from order_details;



insert into  product_details(prod_id,prod_name) values(104,'mouse');
select* from product_details;
desc product_details;

#check constraint

create table region_details (
region_id int primary key,
region_name varchar(10),
order_id int,
cust_id int,
constraint regional_chk check(region_name in('South','North','west','East'))
);

insert into region_details values(55,'south',11,13);




#dol statement
#Altar
#1)Alter Change clause

desc product_details;

#changed column name

alter table product_details change prod_name product_name varchar(20);

#change data type
alter table product_details change product_name product_name varchar(10) ;
desc product_details;


#change constraint,name,type
alter table product_details change prod_price product_price decimal(10,3) unique;

alter table product_details change product_name product_name varchar(10) not null;
select * from product_details; 


#2) Alter modify
desc order_details;

alter table order_details modify order_id varchar(55);
desc order_details;

#3)Alter ADD
desc product_details;
alter table product_details add product_warranty int;
desc product_details;

alter table product_details add product_brand varchar(20) after product_name;

desc product_details;

alter table product_details add unique key(product_name);
desc product_details;

create table brand(
product_brand varchar(20) primary key,
brand_address varchar(22) not null);

alter table product_details add foreign key(product_brand) references brand(product_brand);
alter table product_details add check (product_price<1000);
desc product_details;

#3)Alter Drop Statement
use PGA28;
alter table product_details drop primary key;
desc product_details;

create table info1(
info_id int primary key,
info_name varchar(10));

#droping constraint
desc info1;
alter table info1 drop primary key;
desc info1;

#dropping column
alter table info1 drop column info_name;

#session 2 END

create database PGA100;

use PGA100;

#
drop database PGA100;
#*************************************** 

#ddl truncate : delete trhe whole records stored in the table but not the structure of the table

select* from region_detrails1;
truncate table region_details;
select* from region_details;

#DDl rename
rename table region_details to region_info;
show tables;

#DML statyment
#update

select * from product_details;
update product_details set product_name='Laptop'
where prod_id=104;
select* from product_details;

update product_details

set prod_id=110
where product_name='fan';
select* from product_details;


update product_details set product_waranty=s
where product_name='tv';
select* from product_details;

update product_details set product_brand='sony'
where prod_id='121';
select* from product_details;

#DML
#delete Statement**************

select* from product_details;
delete from product_details
where prod_id=102;
select* from product_details;


delete from order_details
where order_id='1a';
select* from order_details;

#importing table to my sql
create database sample_movie;
create database sample_shipment;

use sample_shipment;
show tables;

#query the records of all columns using(*)
select* from the customer;

#query the desired column\
select c_name,c_cont_no from customer;

select * from customer
where c_type = 'customerinternal goods';

#get the name and contract no of the customer whose c_type is internal goods
select c_name,c_cont_no,c_type from customer
where c_type='internal goods';

desc customer;
select * from customer
where M_id>100;
	
select * from employee_details;

select * from payment_details;

select* from payment_details
where AMOUNT<40000;

select * from payment_details
where amount between 40000 and 50000;

select * from employee_details;
select * from customer;

select * from customer
where c_type in ('retail','wholesale');

select * from customer
where c_type in ('retail') and ('wholesale');

select * from customer
where c_type not in ('retail','wholesale');

select m_id,c_name,c_cont_no from customer
where m_id in (978,396);

# is null predicate
select * from payment_details
where Payment_Date is null;

select * from product_details;

select* from payment_details
where payment_date ='';


#like predicate 

select * from customer
where C_name like 'a%';

select* from customer
where c_name like '%a1%';




#session 4**************************

select * from sakila.address;
#rental rate is more than 2
select * from film
where
      release_year=2006 and rental_rate >2;

select * from actor
order by first_name;

select * from actor
order by first_name asc,last_name asc;

select * from film_actor
order by film_id;

select * from payment;

select payment_id,amount
from payment
limit 10;

select * from actor
order by 1 asc, 2 asc;

#return records  after skipping the first 5 records
select * from actor
order by actor_id asc
limit 10
offset 5;

select * from actor
order by actor_id desc
limit 10
offset 5;



#aggregate functions
/*
1.sum
2.average
3.count
4.min
5.max
6.distinct
*/


select * from payment;

select sum(amount) from payment;

#alias name

select sum(amount) as total_amount from payment;

select payment_id,amount,last_update from payment;
select payment_id as id,amount as payment_amount ,last_update as updated_date from payment;

select * from payment;


select avg(amount) from payment;



select* from customers;
select* from orders;
select* from orderdetails;
select* from payments;
select* from products;

select avg(amount) as total_amount
from payments;

#what is the minimum amount paid
select min(amount) from payments;

select count(amount) from payments;

#give the total no of records in payments table
select count(*) from payments;
select * from payments;

#give the no of unique customer number who have done their payments
select count(customernumber) from payments;

#give me the list of different productline we sell
select distinct (productline) from products;
select distinct productline from product;
select count(distinct (productline)) as unique_product_count from products;

#find the total no of different customer who paid their amount
select count(distinct customernumber) from payments;

##group by clause
#give me the total amount paid by each customer
select * from payments;

select customernumber,sum(amount) from payments
group by customernumber;

#give the max amount paid by each customer
select customernumber,max(amount) from payments
group by customernumber
order by max(amount) desc;

select * from payments;
select customernumber,amount from payments
where amount > 100000;

#give me the details of payment done by each customer whose total amount paid is greater than 100000
select customernumber,sum(amount) from payments
group by customernumber
where sum(amount) >100000;


select customernumber,sum(amount) from payments
group by customernumber
having sum(amount) >100000;

#with alias name
select customernumber,sum(amount) as total_amount from payments
group by customernumber
having total_amount >100000;

select productname,length(productname) from products
having length(productname)>25;

#give me the details of customer no who have done more than 2 times payments
#1)give me the customernumber and their count of payments or count the payments done by each customer
#2)count of payments > 2

select customernumber,count(amount) from payments
group by customernumber
having count(amount)>2
order by 2 desc;

#give me the details or customer no info whose customernumber is greater than 110 and have done more than 2 times payment
#a)give the customernumber and their count of payments or count the payments done by each customer
#b)customernumber>110
#c)count of payments > 2

select customernumber,count(amount) from payments
where customernumber>110
group by customernumber
having count(amount)>3
order by 2 desc;

 
 

#give me the total no of payments done by each customer
select customernumber,count(amount) from payments
group by customernumber;

##############################################

#top n / Bottom n

select * from employees;
select * from payments;

select * from payments
order by amount desc;


#nth highest or nth lowest
select * from payments
order by amount desc
limit (n-1);


#2 higest amount
select * from payments
order by amount desc
limit 1,1;

#3 highest amount
select * from payments
order by amount desc
limit 2,1;

select * from payments
order by amount desc
limit 2,2;

#####################################

#union




select * from table1
union
select * from orderdetails;









create table cust_feb(
cust_id int,
cust_name varchar(10));


create table cust_march(
cust_id int,
cust_name varchar(10));

create table sal(
cust_id int,
salary int);

insert into cust_feb values(1,'rahul');
insert into cust_march values(2,'ravi');
insert into sal values(3,10000);

select * from cust_feb;
select * from cust_march;
select * from sal;

#joins examples
select * from orders;
select * from orderdetails;

select t1.ordernumber,orderdate,status,t2.productcode,t2.priceEach
from orders t1
left join orderdetails t2
on t1.orderNumber=t2.orderNumber;

select t1.ordernumber as t1_ordernumber,t2.productcode,t2.priceeach
from orders t1
left join orderdetails t2
on t1.orderNumber=t2.orderNumber;

#example 2
select * from customers;
select * from orders;

#give me the customer names of those customers who have placed orders

select *,t2.customername
from orders t1
left join customers t2
on t1.customerNumber=t2.customernumber;


#sub Query


select * from payments;


#give me the payment details where amount is maximum

select * from payments
order by amount desc
limit 1;


select * from payments
where amount= (select max(amount) from payments);

select * from payments
where amount=120166.58;

#Q)give me the payment details whose amount is greater than avg amount


select * from payments
where amount> (select avg(amount) from payments);

select avg(amount) from payments;

###########################################################
#views
select * from customers;

create view basic_info as
select customerNumber, customerName,phone
from customers;

select * from basic_info;

create view customerorders as
select
orderNumber,
customerName,
sum(quantityOrdered * priceEach) total
from
orderdetails
inner join orders o using (orderNumber)
inner join customers using (orderName);



create view salesperorder as
select
ordernumber,
sum(quantityordered * priceeach)
from orderdetails;

