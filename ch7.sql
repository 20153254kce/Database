#날짜 : 2026/05/22
#이름 : 강채은
#내용 : 7장 정규화 실습

# 실습 7-1
CREATE TABLE BookOrder (	
    `orderNo`		INT,
    `orderDate`		DATE,
    `custId`		VARCHAR(10),
    `name`			VARCHAR(10),
    `addr`			VARCHAR(20),
    `bookNo`		INT,
    `bookName`		VARCHAR(20),
    `count`			INT,
    `price`			INT
);

INSERT INTO BookOrder VALUES (10001, '2026-05-22', 'a101', '김유신', '김해', 101, '프로그래밍', 1, 28000);
INSERT INTO BookOrder VALUES (10002, '2026-05-22', 'a102', '김춘추', '경주', 101, '프로그래밍', 1, 28000);
INSERT INTO BookOrder VALUES (10002, '2026-05-22', 'a102', '김춘추', '경주', 102, '자료구조', 2, 32000);
INSERT INTO BookOrder VALUES (10003, '2026-05-22', 'a103', '장보고', '완도', 102, '자료구조', 2, 32000);
INSERT INTO BookOrder VALUES (10004, '2026-05-22', 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000);
INSERT INTO BookOrder VALUES (10005, '2026-05-22', 'a105', '이순신', '서울', 110, '데이터베이스', 1, 25000);
INSERT INTO BookOrder VALUES (10005, '2026-05-22', 'a105', '이순신', '서울', 102, '자료구조', 1, 16000);
SELECT * FROM BookOrder;

# 실습 7-2
CREATE TABLE `Book` (
	`bookNo`	INT PRIMARY KEY,
    `bookName`	Varchar(20)
);

CREATE TABLE `OrderCustomer` (
	`orderNo`	INT PRIMARY KEY,
    `orderDate`	DATE,
    `custId`	VARCHAR(10),
    `name`		VARCHAR(10),
    `addr`		VARCHAR(20)
);

CREATE TABLE `OrderBook` (
	`orderNo`	INT PRIMARY KEY,
    `bookNo` 	INT,
    `count`		INT,
    `price`		INT
);


# 실습 7-3
CREATE TABLE `Order` (
	`orderNo`	INT PRIMARY KEY,
    `orderDate`	DATE,
    `custId`	VARCHAR(10)
);

CREATE TABLE `Customer` (	
    `custId`	VARCHAR(10) PRIMARY KEY,
    `name`		VARCHAR(10),
    `addr`		VARCHAR(20)
);