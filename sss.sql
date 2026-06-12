insert into `User` values 
('user1', '김유신', '1976-01-21', 'M', '010-1101-1976','kimys@naver.com', 7000, 1, '서울', '2022-01-10 10:50:12'),
('user2', '계백', '1975-06-11', 'M', '010-1102-1975', NULL, 5650, 1, '서울', '2022-01-10 10:50:12'),
('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', NULL, 4320, 2, '서울', '2022-01-10 10:50:12'),
('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 0, 1, '서울', '2022-01-10 10:50:12'),
('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 3000, 4, '대전', '2022-01-10 10:50:12'),
('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'gueen@naver.com', 15840, 2, '대전', '2022-01-10 10:50:12'),
('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', 3610, 0, '대구', '2022-01-10 10:50:12'),
('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', 0, 1, '대구', '2022-01-10 10:50:12'),
('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', 0, 3, '부산', '2022-01-10 10:50:12'),
('user10', '허난설헌', '1992-09-07', 'F', '010-7103-1992', NULL, 0, 3, '광주', '2022-01-10 10:50:12');

select * from user;

insert into `Point` (userID, point, pointDesc, pointDate) values
('user1', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12'),
('user1', 6000, '상품구매 5% 적립', '2022-01-10 10:50:12'),
('user3', 2820, '상품구매 5% 적립', '2022-01-10 10:50:12'),
('user7', 3610, '상품구매 5% 적립', '2022-01-10 10:50:12'),
('user5', 3000, '이벤트 응모 3000 적립', '2022-01-10 10:50:12'),
('user2', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12'),
('user2', 2000, '이벤트 응모 2000 적립', '2022-01-10 10:50:12'),
('user2', 2650, '상품구매 5% 적립', '2022-01-10 10:50:12'),
('user3', 1500, '이벤트 응모 1500 적립', '2022-01-10 10:50:12'),
('user6', 15840, '상품구매 2% 적립', '2022-01-10 10:50:12');
select * from `point`;

insert into `Seller` values
(10001, '(주)다팔아', '02-201-1976', '정우성', '서울'),
(10002, '판매의민족', '02-102-1975', '이정재', '서울'),
(10003, '멋남', '031-103-1989', '원빈', '경기'),
(10004, '스타일살아', '032-201-1979', '이나영', '경기'),
(10005, '(주)삼성전자', '02-214-1966', '장동건', '서울'),
(10006, '복실이옷짱', '051-301-1979', '고소영', '부산'),
(10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구'),
(10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산'),
(10010, '누리푸드', '051-710-1992', '강동원', '부산');
select * from `Seller`;

insert into `Category` values
(10, '여성의류패션'),
(11, '남성의류패션'),
(12, '식품·생필품'),
(13, '취미·반려견'),
(14, '홈·문구'),
(15, '자동차·공구'),
(16, '스포츠·건강'),
(17, '컴퓨터·가전·디지털'),
(18, '여행'),
(19, '도서');
select * from `category`;

alter table product change pordStock prodStock int;
insert into `product` (prodNo, cateNo, sellerNo, prodName, prodStock,prodPrice, prodSold,prodDiscount) values
(100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20),
(100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15),
(110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5),
(120101, 12, 10010, '암소 1등급 구이셋트 1.2kg', null, 150000, 87, 15),
(120103, 12, 10010, '바로구이 부채살 250g', null, 21000, 61, 10),
(130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0),
(130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0),
(141001, 14, 10001, '라떼 2인 소파/방수 패브릭', null, 320000, 42, 0),
(170115, 17, 10007, '지포스 3080 그래픽카드', 28, 900000, 12, 12),
(160103, 16, 10009, '치닝디핑 33BR 철봉', 32, 120000, 28, 0);


insert into `order` value
('22010210001', 'user2', 52300, '서울시 마포구 121', 1, '2022-01-10 10:50:12'),
('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, '2022-01-10 10:50:12'),
('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2022-01-10 10:50:12'),
('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, '2022-01-10 10:50:12'),
('22010310100', 'user1', 120000, '경기도 수원시 120번지', 0, '2022-01-10 10:50:12'),
('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, '2022-01-10 10:50:12'),
('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, '2022-01-10 10:50:12'),
('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, '2022-01-10 10:50:12'),
('22010710110', 'user9', 94500, '광주시 충열로 11', 1, '2022-01-10 10:50:12');

insert into `order` value('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, '2022-01-10 10:50:12');

select * from `order`;

insert into `OrderItem` (orderNo, prodNo, itemPrice, itemDiscount, itemCount) value
('22010210001', 100110, 38000, 15, 1),
('22010210001', 100101, 25000, 20, 1),
('22010210002', 120103, 21000, 10, 3),
('22010310001', 130112, 15000, 0, 1),
('22010310001', 130101, 56000, 0, 2),
('22010210010', 110101, 76000, 5, 1),
('22010310100', 160103, 120000, 0, 1),
('22010410101', 170115, 900000, 12, 1),
('22010510021', 110101, 76000, 5, 1),
('22010510027', 130101, 56000, 0, 2),
('22010510021', 100101, 25000, 20, 1),
('22010510031', 170115, 900000, 12, 1),
('22010710110', 120103, 21000, 10, 5);

alter table user change usetPoint userPoint int;
insert into cart(userid,prodno,cartprodcount,cartproddate) values
('user1', 100101, 1, '2022-01-10 10:50:12'),
('user1', 100110, 2, '2022-01-10 10:50:12'),
('user3', 120103, 1, '2022-01-10 10:50:12'),
('user4', 130112, 1, '2022-01-10 10:50:12'),
('user5', 130101, 1, '2022-01-10 10:50:12'),
('user2', 110101, 3, '2022-01-10 10:50:12'),
('user2', 160103, 1, '2022-01-10 10:50:12'),
('user2', 170115, 1, '2022-01-10 10:50:12'),
('user3', 110101, 1, '2022-01-10 10:50:12'),
('user6', 130101, 1, '2022-01-10 10:50:12');

select c.userId, p.prodName, c.cartProdCount from cart as c
join product as p on p.prodNo = c.prodNo
where c.cartProdCount >= 2;

select p.prodNo, p.cateNo, prodName, prodPrice, s.sellerPhone
from product as p
join seller as s on s.sellerNo = p.sellerNo;

select u.userid, u.username, u.userHp, u.userPoint, IFNULL(SUM(p.point), 0) as '적립포인트 총합'
from `user` as u
left join `point` as p on p.userid = u.userid
group by u.userid, u.username, u.userPoint, u.userHp;

select o.orderNo, u.userid, u.userName, o.orderTotalPrice, o.orderDate
from `order` as o
join user as u on u.userid = o.userid
where o.orderTotalPrice >= 100000
order by o.orderTotalPrice desc, u.userName;

select o.orderNo, u.userid, u.username, GROUP_CONCAT(p.prodName SEPARATOR ', '), o.orderDate
from `order` as o
join `user` as u on u.userId = o.userId
join orderItem as ot on ot.orderNo = o.orderNo
join product as p on p.prodNo = ot.prodNo
group by o.orderNo, u.userid, u.username, o.orderDate;

select prodNo, prodName, prodPrice, prodDiscount, prodPrice-(prodPrice*(prodDiscount*0.01)) as '할인된 가격'
from product;

select p.prodNo, p.prodName, p.prodPrice, p.prodStock, s.sellerManager
from product as p
join seller as s on s.sellerNo = p.sellerNo
where s.sellerManager = "고소영" ;

select sellerNO, sellerBizName, sellerManager, sellerPhone
from seller
where sellerNo not in (select sellerNo from product);

select orderNo, sum((itemPrice-(itemPrice*(itemDiscount*0.01)))*itemCount) as '총합'
from orderitem
group by orderNo
having 총합 >= 100000
order by 총합 desc ;

select u.userName as '고객명', GROUP_CONCAT(distinct(p.prodName) SEPARATOR ', ') as '상품명'
from `user` as u
join `order` as o on o.userId = u.userId
join orderItem as ot on ot.orderNo = o.orderNo
join product as p on p.prodNo = ot.prodNo
where u.userName = '장보고'
group by u.userName;



