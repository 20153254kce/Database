create table doit_insert_select_from (
col_1 int,
col_2 varchar(10)
);

create table doit_insert_select_to (
col_1 int,
col_2 varchar(10)
);

insert into doit_insert_select_from values
(1, "DO"),
(2, "IT"),
(3, "MYSQL");

#조회 결과를 다른 테이블에 입력
INSERT INTO doit_insert_select_to 
select * from doit_insert_select_from;

select * from doit_select_to;


#새 테이블에 조회 결과 입력
create table doit_select_new as (select * from doit_insert_select_from);

select * from doit_select_new;


#외래키로 연결되어 있는 테이블 입력 및 삭제
create table doit_parent (col_1 int primary key);
create table doit_child (col_1 int);
alter table doit_child add foreign key (col_1) references doit_parent(col_1); 

#부모테이블만 삭제
show create table doit_child; -- 제약조건 확인
alter table doit_child drop constraint doit_child_ibfk_1;
drop table doit_parent;