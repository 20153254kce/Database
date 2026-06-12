select first_name from customer;
select first_name, last_name from customer;
select * from customer;

## 열 정보 조회
show columns from sakila.customer;

select * from customer where first_name = 'MARIA';
select * from customer where first_name < 'MARIA';
select * from customer where address_id = 200;
select * from customer where address_id < 200;
select * from payment where payment_date < '2005-07-09';

select * from customer where address_id between 5 and 10;
select * from payment where payment_date between '2005-06-17' and '2005-07-19';
select * from payment where payment_date = '2005-07-08 07:33:56';
select * from customer where first_name between 'm' and 'o';
select * from customer where first_name not between 'm' and 'o';

select * from city where city = 'Sunnyvale' and country_id = 103;
select * from payment where payment_date >= '2005-06-01' and payment_date <= '2005-07-05';
select * from customer where first_name = 'MARIA' or first_name = 'LINDA';
select * from customer where first_name = 'MARIA' or first_name = 'LINDA' or first_name = 'NANCY';
select * from customer where first_name in ('MARIA', 'LINDA', 'NANCY');
select * from city where country_id in (103, 86) and city in ('Cheju', 'Sunnyvale', 'Dallas'); -- in 이 and 보다 우선 적용

select * from address;
select * from address where address2 is NULL; -- null은 is 로 체크
select * from address where address2 is not null;
select * from address where address2 = '';

select * from customer order by first_name;
select * from customer order by last_name;
select * from customer order by store_id, first_name;
select * from customer order by first_name, store_id;

select * from customer order by first_name asc;
select * from customer order by first_name desc;
select * from customer order by store_id desc, first_name asc;

select * from customer order by store_id desc, first_name asc limit 10;
select * from customer order by customer_id asc limit 100, 10; -- 101부터 10개
select * from customer order by customer_id asc limit 10 offset 100; -- offset 건너뛰기 (100개 건너뜀) / limit과 항상 함께 사용


##와일드카드로 문자열 조회
select * from customer where first_name like 'A%';
select * from customer where first_name like 'AA%';
select * from customer where first_name like '%A';
select * from customer where first_name like '%RA';
select * from customer where first_name like '%A%'; -- A 포함
select * from customer where first_name not like 'A%';

with cte (col_1) as ( -- 임시테이블 select 와 함께 사용
select 'A%BC' union all
select 'A_BC' union all
select 'ABC'
)
select * from cte where col_1 like '%#%%' escape '#'; -- %는 예약어라서 다른 문자(# - 아무거나 상관x) 추가하여 검색하면서 escape 로 # 제거

select * from customer where first_name like 'A_'; -- 언더바(_) : 한 글자
select * from customer where first_name like 'A__';
select * from customer where first_name like '__A';
select * from customer where first_name like '_____';

select * from customer where first_name like 'A_R%';
select * from customer where first_name like '__R%';
select * from customer where first_name like 'A%R_';


##REGEXP - 정규 표현식
select * from customer where first_name regexp '^k|n$'; -- k로 시작(^) 하거나(|) n으로 끝남($)
select * from customer where first_name regexp 'k[L-N]'; -- K뒤에 L과 N 사이 ([L-N]) 글자를 포함
select * from customer where first_name regexp 'k[^L-N]'; -- K뒤에 L과 N사이 글자를 포함하지 않음(^)

select * from customer where first_name like 's%' and first_name regexp 'A[L-N]';
select * from customer where first_name like '_______'
and first_name regexp 'A[L-N]'
and first_name regexp 'O$';



##GROUP BY
select rating from film group by rating;
select special_features, rating from film group by special_features, rating;
select rating, special_features from film group by rating, special_features;
select special_features, count(*) as cnt from film group by special_features;

select special_features, rating, count(*) as cnt from film
group by special_features, rating order by special_features, rating, cnt desc;

select special_features, rating from film
group by special_features, rating
having rating = 'G';

select special_features, rating, count(*) as cnt from film
group by special_features, rating
having cnt > 70;