#날짜 : 2026/05/04
#이름 : 강채은
#내용 : 2장 SQL 기초

#테이블 생성
create table user1 (
	userid	varchar(20),
    name	varchar(20),
    hp		char(13),
    age		int
);

#테이블 삭제
drop table user1;

#실습  2-2 데이터 입력
INSERT INTO User1 VALUES ('A101', '김유신', '010-1234-1111', 25), 
('A102', '김춘추', '010-1234-2222', 23),
('A103', '장보고', '010-1234-3333', 32);

insert into user1 (userid, name, age) values ('A104', '강감찬', 45);
insert into user1 set userid='A105', name='이순신', hp='010-1234-5555';

#실습 2-3. 데이터 조회
SELECT * FROM User1;
SELECT * FROM User1 WHERE userid='A101';
SELECT * FROM User1 WHERE name='김춘추';
SELECT * FROM User1 WHERE age < 30;		
SELECT * FROM User1 WHERE age >= 30;		
SELECT userid, name, age FROM User1;	

#실습 2-4. 데이터 수정
UPDATE User1 SET hp='010-1234-4444' WHERE userid='A104';
UPDATE User1 SET age=51 WHERE userid='A105';
UPDATE User1 SET hp='010-1234-1001', age=27 WHERE userid='A101';

#2-5. 데이터 삭제
DELETE FROM User1 WHERE userid='A101';
DELETE FROM User1 WHERE userid='A102' AND age=25;
DELETE FROM User1 WHERE age >= 30;

ALTER TABLE User1 ADD gender TINYINT; #성별 컬럼 추가
ALTER TABLE User1 ADD birth CHAR(10) AFTER name; #name 뒤에 birth 추가
ALTER TABLE User1 MODIFY gender CHAR(1); #성별 컬럼 형식 변경
ALTER TABLE User1 MODIFY age TINYINT;
ALTER TABLE User1 DROP gender;

CREATE TABLE User1_1 LIKE User1; #CREATE TABLE 새로운_테이블명 LIKE 복사할_테이블명;
INSERT INTO User1_1 SELECT * FROM User1; #user1의 데이터 복사
select * from user1_1;