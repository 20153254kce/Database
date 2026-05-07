#날짜 : 2026/05/06
#이름 : 강채은
#내용 : 4장 SQL 고급 실습

create table Employee (
empno int primary key,
name varchar(10) not null,
gender char not null,
hp char(13) NOT null unique,
job varchar(10) default null ,
depno int default null,
regdate date not null,
foreign key(depno) references Dept (depno));

create table Dept (
depno int primary key,
dname varchar(10) not null,
tel varchar(12) not null);

CREATE TABLE Sale (
    no INT PRIMARY KEY AUTO_INCREMENT,    -- 번호: 정수, PK, 자동증가
    empno VARCHAR(10) NOT NULL,           -- 직원번호: 문자열(10), NULL 허용X
    year YEAR NOT NULL,                    -- 매출연도: 년도 타입, NULL 허용X
    month INT NOT NULL,                    -- 매출월: 정수, NULL 허용X
    price INT NOT NULL DEFAULT 0           -- 매출액: 정수, NULL 허용X, 기본값 0
);

INSERT INTO Dept Values
(101, "경영지원부", "051-512-1001"),
(102, "영업부", "051-512-1002"),
(103, "개발부", "051-512-1003"),
(104, "인사부", "051-512-1004"),
(105, "기획부", "051-512-1005");

INSERT INTO Employee VALUES
(1001, "김유신", "M", "010-1234-1001", "부장", "101", "2026-11-19");
INSERT INTO Employee (empno, name, gender, hp, job, depno, regdate) VALUES (1002, '김춘추', 'M', '010-1234-1002', '차장', 104, '2026-11-19'),
(1003, '장보고', 'M', '010-1234-1003', '사원', NULL, '2026-11-19'),
(1004, '강감찬', 'M', '010-1234-1004', '대리', 102, '2026-11-19'),
(1005, '신사임당', 'F', '010-1234-1005', '과장', 102, '2026-11-19'),
(1006, '이황', 'M', '010-1234-1006', '차장', 103, '2026-11-19'),
(1007, '이이', 'M', '010-1234-1007', '사원', 105, '2026-11-19'),
(1008, '이순신', 'M', '010-1234-1008', NULL, NULL, '2026-11-19'),
(1009, '허난설헌', 'F', '010-1234-1009', '사원', 104, '2026-11-19'),
(1010, '정약용', 'M', '010-1234-1010', '대리', 104, '2026-11-19');

INSERT INTO Sale (empno, year, month, price) VALUES ('1001', 2018, 1, 98100),
('1002', 2018, 1, 136000),
('1003', 2018, 1, 80000),
('1004', 2018, 1, 78000),
('1005', 2018, 1, 93000),
('1001', 2018, 2, 24000),
('1002', 2018, 2, 126000),
('1003', 2018, 2, 19000),
('1005', 2018, 2, 19000),
('1006', 2018, 2, 53000),
('1001', 2019, 1, 24000),
('1002', 2019, 1, 109000);

INSERT INTO Sale (empno, year, month, price) VALUES 
('1003', 2019, 1, 101000),
('1004', 2019, 1, 53000),
('1007', 2019, 1, 24000),
('1002', 2019, 2, 160000),
('1003', 2019, 2, 101000),
('1004', 2019, 2, 43000),
('1005', 2019, 2, 24000),
('1006', 2019, 2, 109000),
('1002', 2020, 1, 201000),
('1004', 2020, 1, 63000),
('1005', 2020, 1, 74000),
('1006', 2020, 1, 122000),
('1007', 2020, 1, 111000),
('1002', 2020, 2, 120000),
('1003', 2020, 2, 93000),
('1004', 2020, 2, 84000),
('1005', 2020, 2, 180000),
('1008', 2020, 2, 76000),
('1001', 2021, 1, 56000),
('1002', 2021, 1, 123000),
('1005', 2021, 1, 91000),
('1007', 2021, 1, 78000),
('1002', 2021, 2, 32000),
('1003', 2021, 2, 148000),
('1004', 2021, 2, 106000),
('1005', 2021, 2, 112000),
('1001', 2021, 3, 47000),
('1006', 2021, 3, 36000);

SELECT * FROM Employee WHERE name = '김유신';
SELECT * FROM Employee WHERE job = '차장' AND depno = 101;
SELECT * FROM Employee WHERE job = '차장'  OR depno = 101;
SELECT * FROM Employee WHERE name != '김춘추';
SELECT * FROM Employee WHERE name <> '김춘추';
SELECT * FROM Employee WHERE JOB = '사원' AND DEPNO = 101;
SELECT * FROM Employee WHERE job = '사원' OR job = '대리';
SELECT * FROM Employee WHERE job IN ('사원', '대리');
SELECT * FROM Employee WHERE depno IN (101, 102, 103);
SELECT * FROM Employee WHERE name LIKE '김%';
SELECT * FROM Employee WHERE name LIKE '%신';
SELECT * FROM Employee WHERE name LIKE '김__';
SELECT * FROM Employee WHERE name LIKE '이_';
SELECT * FROM Employee WHERE name LIKE '_순%';
SELECT * FROM Employee WHERE HP LIKE '010-%';
SELECT * FROM Employee WHERE JOB IS NULL;
SELECT * FROM Employee WHERE JOB IS NOT NULL;
SELECT * FROM Employee WHERE DEPNO IS NULL;
SELECT * FROM Employee WHERE DEPNO IS NOT NULL;
SELECT * FROM Employee WHERE EMPNO >= 1005;
SELECT * FROM DEPT WHERE DEPNO = 10;
SELECT * FROM DEPT WHERE DNAME = '개발부';
SELECT * FROM DEPT WHERE TEL LIKE '%30%';
SELECT * FROM DEPT WHERE DEPNO IN (10, 30);
SELECT * FROM DEPT WHERE DNAME LIKE '경영___';
SELECT * FROM SALE WHERE PRICE > 50000;
SELECT * FROM SALE WHERE price >= 50000 AND price < 100000 AND month = 1;
SELECT * FROM SALE WHERE price BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE price NOT BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE year = 2024;
SELECT * FROM SALE WHERE YEAR = 2024 AND MONTH = 2;
SELECT * FROM SALE WHERE MONTH IN (1, 2);


