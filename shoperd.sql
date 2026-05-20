use shoperd;

insert into Customer values 
('c101','김유신','010-1234-1001','경남 김해시','2023-01-01'),
('c102','김춘추','010-1234-1002','경남 경주시','2023-01-02'),
('c103','장보고','010-1234-1003','전남 완도군','2023-01-03'),
('c104','강감찬','010-1234-1004','서울시 관악구','2023-01-04'),
('c105','이순신','010-1234-1005','부산시 금정구','2023-01-05');

insert into product values
(1, '새우깡', 5000, 1500, '농심'),
(2, '초코파이', 2500, 2500, '오리온'),
(3, '포카칩', 3600, 1700, '오리온'),
(4, '양파링', 1250, 1800, '농심'),
(5, '죠리퐁', 2200, NULL, '크라운');


insert into `order` values
(1,'c102',3,2,'2023-01-01 13:15:10'),
(2,'c101',4,1,'2023-01-01 13:15:12'),
(3,'c102',1,1,'2023-01-01 13:15:14'),
(4,'c103',5,5,'2023-01-01 13:15:16'),
(5,'c105',2,1,'2023-01-01 13:15:18');

select * from `order` 
join customer on custId = orderId
join product on proNo = orderProduct;

SELECT 
    o.orderId, 
    SUM(p.price) AS total_price
FROM `order` o
JOIN customer c ON c.custId = o.orderId      -- 주문한 고객 연결
JOIN product p  ON p.proNo = o.orderProduct   -- 주문한 상품 연결 (예시 컬럼명)
GROUP BY o.orderId;