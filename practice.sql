#날짜 : 2026/05/08
#이름 : 강채은
#내용 : SQL 연습문제

#실습 1-1 DB 및 사용자 생성
create database shop;
create user 'shop'@'%' identified by '1234';
grant all privileges on shop.* to 'shop'@'%';
flush privileges;

#실습 1-2 테이블 생성]
USE shop; -- DB사용
create table customer (
	custid varchar(10) primary key,
    name varchar(10) not null,
    hp varchar(13) unique default null,
    addr varchar(100) default null,
    rdate date not null);

create table product (
	pordNo int primary key,
    prodName varchar(10) not null,
    stock int not null default 0,
    price int default null,
    company varchar(20) not null);
    
create table `Order` (
	orderNo int primary key auto_increment,
    orderId varchar(10) not null,
    orderProduct int not null,
    orderCount int not null default 1,
    orderDate datetime not null);

    
#실습 1-3 데이터 입력
insert into customer values 
	("c101", "김유신", "010-1234-1001", "김해시 봉황동", '2022-01-01'),
    ("c102", "김춘추", "010-1234-1002", "경주시 보문동", '2022-01-02'),
    ("c103", "장보고", "010-1234-1003", "완도군 청산면", '2022-01-03'),
    ("c104", "강감찬", "010-1234-1004", "서울시 마포구", '2022-01-04'),
    ("c105", "이성계", null , null, '2022-01-05'),
    ("c106", "정철", "010-1234-1006", "경기도 용인시", '2022-01-06'),
    ("c107", "허준", null, null, '2022-01-01'),
    ("c108", "이순신", "010-1234-1008", "서울시 영등포구", '2022-01-08'),
    ("c109", "송상현", "010-1234-1009", "부산시 동래구", '2022-01-09'),
    ("c110", "정약용", "010-1234-1010", "경기도 광주시", '2022-01-10');

insert into product values
	(1,"새우깡",5000,1500,"농심"),
    (2,"초코파이",2500,2500,"오리온"),
    (3,"포카칩",3600,1700,"오리온"),
    (4,"양파링",1250,1800,"농심"),
    (5,"조리퐁",2200,null,"크라운"),
    (6,"마가렛트",3500,3500,"롯데"),
    (7,"뿌셔뿌셔",1650,1200,"오뚜기");

insert into `order` (orderId, orderProduct, orderCount, orderDate) values
	("c102",3,2,'2022-07-01 13:15:10'),
    ("c101",4,1,'2022-07-01 14:16:11'),
    ("c108",1,1,'2022-07-01 17:23:18'),
    ("c109",6,5,'2022-07-02 10:46:36'),
    ("c102",2,1,'2022-07-03 09:15:37'),
    ("c101",7,3,'2022-07-03 12:35:12'),
    ("c110",1,2,'2022-07-03 16:55:36'),
    ("c104",2,4,'2022-07-04 14:23:23'),
    ("c102",1,3,'2022-07-04 21:54:34'),
    ("c107",6,1,'2022-07-05 14:21:03');


#실습 1-4
select * from customer;

#실습 1-5
select custid, name, hp from customer;

#실습 1-6
select * from product;

#실습 1-7
select company from product;

#실습 1-8
select distinct company from product;

#실습 1-9
select prodname, price from product;

#실습 1-10
select prodname, price as '조정단가' from product;

#실습 1-11
select prodname, stock, price from product
where company = '오리온';

#실습 1-12
select orderProduct, orderCount, orderDate from `order`
where orderId = 'c102';

#실습 1-13
select orderProduct, orderCount, orderDate from `order`
where orderId = 'c102' and orderCount >=2;

#실습 1-14
select * from product where price between 1000 and 2000;

#실습 1-15
select custId, name, hp, addr from customer
where name like "김%";

#실습 1-16
select custId, name, hp, addr from customer
where CHAR_LENGTH(name)=2; -- char_length : 글자수 체크 (바이트 아님)

#실습 1-17
select * from customer where hp is null;

#실습 1-18
select * from customer where addr is not null;

#실습 1-19
select * from customer order by rdate desc;

#실습 1-20
select * from `order` where orderCount >= 3 order by orderCount desc, orderProduct;

#실습 1-21
select avg(price) from product;

#실습 1-22
select sum(stock) as '재고량 합계' from product where company = '농심';

#실습 1-23
select count(*) as '고객수' from customer;

#실습 1-24
select count(distinct(company)) as '제조업체 수' from product;

#실습 1-25
select orderProduct as '주문 상품번호', sum(orderCount) as '총 주문수량' from `order` 
group by orderProduct 
order by orderProduct;

#실습 1-26
select company as '제조업체', count(*) as 제품수, max(price) as 최고가 from product
group by company order by company;

#실습 1-27
select company as '제조업체', count(*) as 제품수, max(price) as 최고가 from product
group by company 
having count(*) >= 2 order by company;

#실습 1-28
select orderProduct, orderId, sum(ordercount) as '총 주문수량' from `order`
group by orderId, orderProduct
order by orderProduct, orderId;

#실습 1-29
select a.orderId, b.prodName from `order` as a
join product as b on a.orderproduct = b.prodNo
where orderId = 'c102';

#실습 1-30
select orderId, name, prodName, orderDate from `order` as a
join customer as b
on a.orderId = b.custId
join product as c
on a.orderProduct = c.prodNo
where a.orderDate like "2022-07-03%"; 
