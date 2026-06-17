create database doitsql;
use doitsql;

create table doit_increment (
col_1 int auto_increment primary key,
col_2 varchar(50),
col_3 int
);

insert into doit_increment (col_2, col_3) values ('1 자동입력', 1), ('2 자동입력', 2);
insert into doit_increment values (4, '4 자동입력', 4);
insert into doit_increment values (3, '3 자동입력', 3);
insert into doit_increment values (7, '7 자동입력', 7);
insert into doit_increment (col_2, col_3) values ('8 자동입력', 8); -- 마지막 숫자부터 시작

select * from doit_increment;
select last_insert_id(); -- 마지막 숫자 확인

#시작값 변경
alter table doit_increment auto_increment = 100;
insert into doit_increment (col_2, col_3) values ("시작값이 변경되었을까?", 100);

#증가값 변경
set @@auto_increment_increment = 5;
insert into doit_increment (col_2, col_3) values ("5씩 증가할까?(1)", 0);
insert into doit_increment (col_2, col_3) values ("5씩 증가할까?(2)", 0);

