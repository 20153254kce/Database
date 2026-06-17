select * from country where code = "kor";

select * from country where region like "%asia%";

select * from country where length(name) = 5;
SELECT * FROM country WHERE LENGTH(TRIM(name)) = 5;
SELECT * FROM country WHERE name LIKE '_____';

select * from country order by population desc;

select * from country where lifeexpectancy between 60 and 70;

select * from country where region not like "%asia%" and name regexp '[g,u]' order by population desc;
select region, count(*) as cnt from country group by region order by cnt desc;