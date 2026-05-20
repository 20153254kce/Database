#실습2-1
CREATE DATABASE `Bank`;
create user 'Bank'@'%' identified by '1234';
grant all privileges ON Bank.* to 'Bank'@'%';
flush privileges;
use Bank;

#실습2-2

create table bank_customer (
	c_no varchar(14) primary key,
    c_name varchar(20) not null,
    c_dist int not null default 0,
    c_phone varchar(20) not null unique,
    c_addr varchar(100) default null);
    
create table bank_account (
	a_no varchar(11) primary key,
    a_item_dist varchar(2) not null,
    a_item_name varchar(20) not null,
    a_c_no varchar(14) not null,
    a_balance int not null default 0,
    a_open_date date not null,
    foreign key (a_c_no) references bank_customer(c_no)
    );

create table bank_transaction (
	t_no int primary key auto_increment,
    t_a_no varchar(11) not null,
    t_dist int not null,
    t_amount int not null default 0,
    t_datetime datetime not null,
    foreign key (t_a_no) references bank_accout(a_no));
    
#실습 2-3
insert into bank_customer values
	('102-22-51094','부산의원',2,'051-518-1010','부산시 남구'),
    ('220-82-52237','(주)한국전산',2,'02-134-1045','서울시 강서구'),
    ('361-22-42687','(주)정보산업',2,'031-563-1253','경기도 광명시'),
    ('730423-1000001','김유신',1,'010-1234-1001','경기도 수원시'),
    ('750210-1000002','김춘추',1,'010-1234-1002','경기도 광주시'),
    ('830513-2000003','선덕여왕',1,'010-1234-1003','서울시 마포구'),
    ('870830-1000004','강감찬',1,'010-1234-1004','서울시 영등포구'),
    ('910912-2000005','신사임당',1,'010-1234-1005','강원도 강릉시'),
    ('941127-1000006','이순신',1,'010-1234-1006','부산시 영도구');


insert into bank_account values 
    ('101-11-1001','S1','자유저축예금','730423-1000001',420000,'2025-07-21'),  
    ('101-11-1003','S1','자유저축예금','870830-1000004',530200,'2007-02-17'),
    ('101-11-2001','S1','자유저축예금','220-82-52237',23000000,'2003-04-14'),  
    ('101-11-2002','S1','자유저축예금','361-22-42687',4201000,'2008-12-30'),  
    ('101-11-2003','S1','자유저축예금','102-22-51094',8325010,'2010-06-07'),  
    ('101-12-1002','S2','정기적립예금','830513-2000003',1020000,'2011-05-13'),  
    ('101-13-1005','S3','주택청약예금','941127-1000006',720800,'2012-10-15'),  
    ('101-21-1004','L1','고객신용대출','910912-2000005',1200500,'2009-08-25'),  
    ('101-2-1006','L2','예금담보대출','730423-1000001',25000,'2013-12-11'),  
    ('101-23-1007','L3','주택담보대출','750210-1000002',2700000,'2020-09-23');
    
insert into bank_transaction (t_a_no, t_dist, t_amount, t_datetime) values
    ('101-11-1001', 1, 50000, '2022-08-21 04:26:52'),
    ('101-11-1003', 2, 120000, '2022-08-21 04:26:52'),
    ('101-11-2001', 2, 300000, '2022-08-21 04:26:52'),
    ('101-12-1002', 1, 1000000, '2022-08-21 04:26:52'),
    ('101-11-1001', 3, 0, '2022-08-21 04:26:52'),
    ('101-13-1005', 1, 200000, '2022-08-21 04:26:52'),
    ('101-11-1001', 1, 450000, '2022-08-21 04:26:52'),
    ('101-11-2002', 2, 320000, '2022-08-21 04:26:52'),
    ('101-11-2003', 3, 0, '2022-08-21 04:26:52'),
    ('101-11-1003', 1, 75000, '2022-08-21 04:26:52');

#실습 2-4
select * from bank_account;

#실습 2-5
select * from bank_customer;

#실습 2-6
select * from bank_transaction;

#실습 2-7
select c_name, c_no from bank_customer;

#실습 2-8
select a_item_dist, a_item_name from bank_account;

#실습 2-9
select distinct a_item_dist, a_item_name from bank_account;

#실습 2-10
select * from bank_account where a_item_name='자유저축예금' and a_balance>=1000000;

#실습 2-11
select * from bank_customer where c_addr like '경기도%';

#실습 2-12
select * from bank_customer where c_dist=2;

#실습 2-13
select * from bank_transaction where t_dist=1;

#실습 2-14
select * from bank_transaction where t_dist=2 order by t_amount desc;

#실습 2-15
select sum(t_amount) as '입금총합', avg(t_amount) as '입금평균'
from bank_transaction
where t_dist=1;

#실습 2-16
select max(t_amount) as '큰 금액', min(t_amount) as '작은 금액'
from bank_transaction
where t_dist=2;

#실습 2-17
select * from bank_account where a_item_dist='S1' order by a_balance desc;

#실습 2-18
select * from bank_account where a_item_dist = 'S1'
order by a_balance desc
limit 1;

#실습 2-19
select * from bank_transaction where t_dist in(1,2)
ORDER BY `t_dist`, `t_amount` DESC;

#실습 2-20
select * from bank_transaction;
select 
count(if (t_dist = 1, 1, null)) as '입금 건수',
count(if (t_dist = 2, 1, null)) as '출금 건수',
count(if (t_dist = 3, 1, null)) as '조회 건수'
from bank_transaction;

#실습 2-12
select t_dist,
case
	when t_dist = 1 then '입금'
    when t_dist = 2 then '출금'
    when t_dist = 3 then '조회'
end as type,
t_a_no, t_amount from bank_transaction;

#실습 2-22
select t_dist, count(t_no) from bank_transaction group by t_dist;

#실습 2-23
select t_a_no, t_dist, sum(t_amount) from bank_transaction where t_dist=1
group by t_a_no;

#실습 2-24
select t_a_no, t_dist, sum(t_amount) as '합계' from bank_transaction
where t_dist=1 group by t_a_no having sum(t_amount)>=100000
order by '합계' desc;

#실습 2-25
select * from bank_account as a
join bank_customer as c
on a.a_c_no = c.c_no
order by a_no;

#실습 2-26
select 
a.a_no as '계좌번호', 
a.a_item_name as '계좌이름',
b.c_no as '주민번호(사업자번호)',
b.c_name as '고객명',
a.a_balance as '현재잔액'
from bank_account as a
join bank_customer as b
on a.a_c_no = b.c_no
order by a.a_no;

#실습 2-27
select * from bank_transaction as a
join bank_account as b
on a.t_a_no = b.a_no;

#실습 2-28
select
`t_no` AS `거래번호`,
`t_a_no` AS `계좌번호`,
`a_c_no` AS `고객번호(주민번호)`,
`t_dist` AS `거래구분`,
`t_amount` AS `거래금액`,
`t_datetime` AS `거래일자`
FROM `bank_account` AS a
JOIN `bank_transaction` AS b
on a.a_no = b.t_a_no
order by t_no;

#실습 2-29
SELECT
`t_no`,
`a_no`,
`c_no`,
`t_dist`,
`a_item_name`,
`c_name`,
`t_amount`,
`t_datetime`
FROM `bank_transaction` AS t
join bank_account as b 
    on t.t_a_no = b.a_no
join `bank_customer` as c 
    on b.a_c_no = c.c_no
WHERE `t_dist` = 1
ORDER BY `t_amount` DESC;

#실습 2-30
SELECT
any_value(`t_no`) as t_no, -- any_value : group by 에 없는 필드 사용 가능
any_value(`a_no`) as a_no,
`c_no`,
any_value(`t_dist`) as t_dist,
any_value(`a_item_name`) as a_item_name,
any_value(`c_name`),COUNT(`t_no`) AS `거래건수`
FROM `bank_transaction` AS t
join bank_account as a on a.a_no = t.t_a_no
join bank_customer as c on c.c_no = a.a_c_no
WHERE `t_dist` IN(1, 2) AND `c_dist` = 1
GROUP BY c_no
ORDER BY `t_dist`, `거래건수` desc;