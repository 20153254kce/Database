## DB생성 / 삭제 / 선택
create database DoItSQL; -- 데이터베이스 생성
drop database doitsql; -- 데이터베이스 삭제
use DoItSQL; -- 데이터베이스 선택


##테이블 생성 / 삭제
create table doit_create_table ( -- 생성
col_1 int,
col_2 varchar(50),
col_3 datetime
);

drop table doit_create_table; -- 삭제

## 데이터 삽입
create table doit_dml ( -- 생성
col_1 int,
col_2 varchar(50),
col_3 datetime
);

insert into doit_dml (col_1, col_2, col_3) values (1, 'DoItSQL', '2023-01-01'); -- 삽입
insert into doit_dml values (2, '열 이름 생략', '2023-01-01');
insert into doit_dml (col_1, col_2) values (3, 'col_3 값 생략');
insert into doit_dml (col_1, col_3, col_2) values (4, '2023-01-01', '열 순서 변경');
insert into doit_dml (col_1, col_2, col_3) values (5, '데이터 입력5', '2023-01-01'), (6, '데이터 입력6', '2023-01-01'), (7, '데이터 입력7', '2023-01-01');

## 데이터 수정
update doit_dml set col_2 = "데이터 수정" where col_1 = 4;
update doit_dml set col_1 = col_1 + 10;

## 데이터 삭제
delete from doit_dml where col_1 = 14;
delete from doit_dml; -- 전체 삭제

select * from doit_dml;



### 되새김 문제
create database doti_exam;
create table doit_exam_t1 (
id int,
name varchar(20),
create_date datetime);

insert into doit_exam_t1 values 
(1, '강성욱', '2023-10-01 12:22:00'),
(2, '이지퍼블리싱', '2024-01-03 15:31:00'),
(3, 'doitmysql', '2024-02-01 00:05:00');

update doit_exam_t1 set name = '출판사' where id=1;

delete from doit_exam_t1 where id = 1;

select * from doit_exam_t1;

drop table doit_exam_t1;

drop database doti_exam;
