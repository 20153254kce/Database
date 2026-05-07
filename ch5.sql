SELECT * FROM Sale LIMIT 3; #3개
 SELECT * FROM Sale LIMIT 0, 3; # 1~3개
 SELECT * FROM Sale LIMIT 5, 3; #6~ 3개
SELECT * FROM Sale ORDER BY price DESC LIMIT 3, 5;

 SELECT CEILING(1.2); #올림
 SELECT FLOOR(1.2); #내림
 SELECT ROUND(1.2); #반올림
 SELECT RAND(); #0~1
 SELECT CEILING(RAND() * 45); #1~10
 
SELECT COUNT(price) AS 갯수 FROM Sale; #count null값 제외
SELECT COUNT(*) AS 갯수 FROM Sale; #null 포함


select sum(price) from sale where year = 2018 and month = 1;
select sum(price), avg(price) from sale where year = 2019 and month = 2 and price >= 50000;
select min(price), max(price) from sale where year=2020; 

SELECT empno, COUNT(*) AS 건수 FROM Sale GROUP BY empno; #group by 사용 시 버전 8부터는 select all 사용 불가

SELECT empno, SUM(price) AS 합계 FROM Sale
GROUP BY empno
HAVING 합계 >= 200000;

SELECT empno, year, SUM(price) AS 합계
FROM Sale
WHERE price >= 100000
GROUP BY empno, year 
HAVING 합계 >= 200000
ORDER BY 합계 DESC;

CREATE TABLE Sale2 LIKE Sale;
INSERT INTO Sale2 SELECT * FROM Sale;
UPDATE Sale2 SET year = year + 3;
SELECT * FROM Sale UNION SELECT * FROM Sale2;

SELECT * FROM Sale WHERE price >= 100000
UNION
SELECT * FROM Sale2 WHERE price >= 100000;

SELECT empno, year, price FROM Sale
UNION 
SELECT empno, year, price FROM Sale2;

SELECT * FROM Sale INNER JOIN Employee ON Sale.empno = Employee.empno;

SELECT e.empno, e.name, e.job, d.dname 
FROM employee AS e
INNER JOIN dept AS d ON e.depno = d.depno;

select sum(s.price) 
from sale as s
inner join employee as e on s.empno = e.empno 
where e.name = "김유신";

SELECT 
    e.name, 
    d.dname, 
    e.job, 
    s.year, 
    SUM(s.price) AS total_price
FROM employee AS e
INNER JOIN dept AS d ON e.depno = d.depno
INNER JOIN sale AS s ON e.empno = s.empno
WHERE s.year = 2019 and s.price >= 50000
GROUP BY e.empno, d.dname, e.job, s.year
HAVING total_price >= 100000
ORDER BY total_price DESC; 