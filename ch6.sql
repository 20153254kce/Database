##인덱스

#인덱스 조회
show index from user1; -- pk생성 안 해서 아무것도 안 뜸
show index from user2;
show index from user3;

#인덱스 생성 및 적용
create index idx_user1_userid on user1(userid);
analyze table user1;

#인덱스 삭제
drop index idx_userid on user1;


##뷰

#뷰 생성
create view vw_user1 as (select name, hp, age from user1);
select * from vw_user1;

create view vw_user4_age_under30 as (select * from user4 where age < 30);
select * from vw_user4_age_under30;

create view vw_employy_with_sales as (
select
a.empno as 직원번호,
b.name as 직원이름,
b.job as 직급,
c.dname as 부서명,
a.year as 매출년도,
a.month as 월,
a.price as 매출액
from sale as a
join employee as b on a.empno = b.empno
join dept as c on b.depno = c.depno
);
select * from vw_employy_with_sales;

drop view vw_user1;
drop view vw_user4_age_under30; 


##저장 프로시저

delimiter $$ -- 종결자 ; 대신 $$로 변경
create procedure proc_test1()
begin
	select * from employee;
	select * from dept;
end $$
delimiter ; -- 공백 필수

call proc_test1();


delimiter $$
create procedure proc_test2(in _userName varchar(10))
begin
select * from employee where name=_userName;
end $$
delimiter ;

call proc_test2("김유신");

DELIMITER $$
CREATE PROCEDURE proc_test3(IN _job VARCHAR(10), IN _depno TINYINT)
BEGIN
SELECT * FROM Employee WHERE job=_job AND depno=_depno;
END $$
DELIMITER ;
CALL proc_test3("부장", 101);
select * from employee;

DELIMITER $$
CREATE PROCEDURE proc_test4(IN _job VARCHAR(10), OUT _count INT) -- out 출력값 (out 있으면 call -> select 해야함)
BEGIN
SELECT COUNT(*) INTO _count FROM Employee WHERE job=_job;
END $$
DELIMITER ;
CALL proc_test4("부장", @_count);
SELECT CONCAT('_count : ', @_count);


DELIMITER $$
CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
BEGIN
   DECLARE _empno INT;
   select empno into _empno from Employee where name = _name;
   select * from Sale where empno = _empno;
END $$
DELIMITER ;
call proc_test5("김유신");
select * from employee;

DELIMITER $$
CREATE PROCEDURE proc_test6()
BEGIN
   DECLARE num1 INT; -- 선언
   DECLARE num2 INT;
       SET num1 = 1; -- 할당
   SET num2 = 2;
           IF (NUM1 > NUM2) THEN
      SELECT 'NUM1이 NUM2보다 크다.' as 결과2;
   ELSE
      SELECT 'NUM1이 NUM2보다 작다.' as 결과2;
   END IF;
END $$
DELIMITER ;
CALL proc_test6();

 DELIMITER $$
CREATE PROCEDURE proc_test7()
BEGIN
   DECLARE sum INT;
   DECLARE num INT;
       SET sum = 0;
   SET num = 1;
           WHILE (num <= 10) DO
      SET sum = sum + num;
      SET num = num + 1;
   END WHILE;
       SELECT sum AS '1부터 10까지 합계';
END $$
DELIMITER ;

CALL proc_test7();

DELIMITER $$
CREATE PROCEDURE proc_test8()
BEGIN    
   # 변수 선언
   DECLARE total INT DEFAULT 0;
   DECLARE temp INT;
   DECLARE endOfRow BOOLEAN DEFAULT false;
        
   # 커서 선언
   DECLARE saleCursor CURSOR FOR
	SELECT price FROM Sale;
    
   # 반복 조건
   DECLARE CONTINUE HANDLER
	FOR NOT FOUND SET endOfRow = TRUE;
   # 커서 열기
   OPEN saleCursor;
    
   cursor_loop: LOOP
      FETCH saleCursor INTO temp; -- 커서가 가리키는 반복 
      IF endOfRow THEN
		LEAVE cursor_loop;
      END IF;
        
      SET total = total + temp;
	END LOOP;
    
   SELECT total AS '전체 합계';
    
   CLOSE saleCursor;
END $$
DELIMITER ;

CALL proc_test8();

select * from sale;


set global log_bin_trust_function_creators = 1;


DELIMITER $$
CREATE FUNCTION func_test1(_empno INT) RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT SUM(price) INTO total FROM Sale WHERE empno = _empno;
    RETURN total;
END $$
DELIMITER ;
SELECT func_test1(1001);

 DELIMITER $$
CREATE FUNCTION func_test2(_price INT) RETURNS DOUBLE
BEGIN
    DECLARE bonus DOUBLE;
    IF (_price >= 100000) THEN
   SET bonus = _price * 0.1;
       ELSE
   SET bonus = _price * 0.05;   
       END IF;
RETURN bonus;
END $$
DELIMITER ;
SELECT empno, year, month, price, func_test2(sale) as bonus FROM Sale;