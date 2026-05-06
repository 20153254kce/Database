CREATE TABLE User2 (
userid VARCHAR(10) PRIMARY KEY,
name VARCHAR(10),
birth CHAR(10),
addr VARCHAR(50)
);

CREATE TABLE User3 (
userid VARCHAR(10) PRIMARY KEY,
name VARCHAR(10),
birth CHAR(10),
hp CHAR(13) UNIQUE,
addr VARCHAR(50)
);

CREATE TABLE Parent (
pid VARCHAR(10) PRIMARY KEY,
name VARCHAR(10),
birth CHAR(10),
addr VARCHAR(100)
);

CREATE TABLE Child (
cid VARCHAR(10) PRIMARY KEY,
name VARCHAR(10),
hp CHAR(13) UNIQUE, #null 가능
parent VARCHAR(10),
foreign key (parent) references Parent (pid)
);

INSERT INTO Parent (pid, name, birth, addr) VALUES ('P001', '김철수', '1975-05-20', '서울시 강남구 역삼동');
INSERT INTO Parent (pid, name, birth, addr) VALUES ('P002', '이영희', '1980-11-12', '경기도 수원시 팔달구');
INSERT INTO Parent (pid, name, birth, addr) VALUES ('P003', '박민준', '1978-03-05', '인천시 연수구 송도동');
INSERT INTO Parent (pid, name, birth, addr) VALUES ('P004', '최지우', '1982-08-30', '부산시 해운대구 우동');
INSERT INTO Parent (pid, name, birth, addr) VALUES ('P005', '정하윤', '1972-12-25', '대전시 유성구 상대동');
INSERT INTO Child (cid, name, hp, parent) VALUES ('C001', '김지민', '010-1111-2222', 'P001');
INSERT INTO Child (cid, name, hp, parent) VALUES ('C002', '이주원', '010-3333-4444', 'P002');
INSERT INTO Child (cid, name, hp, parent) VALUES ('C003', '박소윤', '010-5555-6666', 'P003');
INSERT INTO Child (cid, name, hp, parent) VALUES ('C004', '최도현', '010-7777-8888', 'P004');
INSERT INTO Child (cid, name, hp, parent) VALUES ('C005', '정예린', NULL, 'P005');

CREATE TABLE User5 (
seq INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(10) NOT NULL,
gender CHAR(1) CHECK (gender IN ('M', 'F')),
age INT DEFAULT 1 CHECK (age > 0 AND age < 100),
addr VARCHAR(20)
);

INSERT INTO User4  VALUES ('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시')
,('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시')
,('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도시')
, ('A104', '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구')
#,('A105', NULL, 'M', NULL, '010-1234-5555', '부산시 진구')
,('A106', '신사임당', 'F', 32, NULL, '강릉시')
,('A107', '허난설헌', 'F', 27, NULL, '경기도 광주시');

insert into user5 (name, gender, age, addr) values
("김유신", "M", 25, "경남 김해시"),
("김춘추", "M", 23, "경남 경주시"),
("장보고", "M", 35, "전남 완도시"),
("강감찬", "M", 42, "서울시 관악구");

