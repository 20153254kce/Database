#실습 3-1
CREATE DATABASE `College`;
CREATE USER 'college'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON College.* TO 'college'@'%';
FLUSH PRIVILEGES;
USE college;

#실습 3-2
create table student (
	stdNo varchar(8) primary key,
    stdName varchar(20) not null,
    stdHp varchar(13) not null,
    stdYear int not null,
    stdAddress varchar(100) default null);
    
create table Lecture (
	lecNo int primary key,
    lecName varchar(20) not null,
    lecCredit int not null,
    lecTime int not null,
    lecClass varchar(10) default null);

    
create table Register (
	regStdNo varchar(8) not null,
    regLecNo int not null,
    regMidScore int default null,
    regFinalScore int default null,
    regTotalScore int default null,
    regGrade varchar(1) default null,
    foreign key (regStdNo) references student(stdNo),
    foreign key (regLecNo) references Lecture(lecNo)
    );
    
    
#실습 3-3
INSERT INTO Student VALUES
('20201016', '김유신', '010-1234-1001', 3, NULL),
('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO Lecture VALUES
(159, '인지행동심리학', 3, 40, '본304'),
(167, '운영체제론', 3, 25, '본B05'),
(234, '중급 영문법', 3, 20, '본201'),
(239, '세법개론', 3, 40, '본204'),
(248, '빅데이터 개론', 3, 20, '본B01'),
(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
(349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO Register (regStdNo, regLecNo) VALUES
('20201126', 234),
('20201016', 248),
('20201016', 253),
('20201126', 239),
('20210216', 349),
('20210326', 349),
('20201016', 167),
('20220416', 349);

#실습 4~6
select * from lecture;
select * from student;
select * from Register;

#실습 3-7
select * from student where stdYear=3;

#실습 3-8
select * from lecture where lecCredit=2;

#실습 3-9
update register set `regMidScore` = 36, `regFinalScore`= 42 WHERE `regStdNo`='20201126' AND `regLecNo`=234;
update register set `regMidScore` = 24, `regFinalScore`= 62 WHERE `regStdNo`='20201016' AND `regLecNo`=248;
update register set `regMidScore` = 28, `regFinalScore`= 40 WHERE `regStdNo`='20201016' AND `regLecNo`=253;
update register set `regMidScore` = 37, `regFinalScore`= 57 WHERE `regStdNo`='20201126' AND `regLecNo`=239;
update register set `regMidScore` = 28, `regFinalScore`= 68 WHERE `regStdNo`='20210216' AND `regLecNo`=349;
update register set `regMidScore` = 16, `regFinalScore`= 65 WHERE `regStdNo`='20210326' AND `regLecNo`=349;
update register set `regMidScore` = 18, `regFinalScore`= 38 WHERE `regStdNo`='20201016' AND `regLecNo`=167;
update register set `regMidScore` = 25, `regFinalScore`= 58 WHERE `regStdNo`='20220416' AND `regLecNo`=349;
select * from register;

#실습 3-10
update register set `regTotalScore`= `regMidScore` + `regFinalScore`,
`regGrade` = if(`regTotalScore` >= 90, 'A',
if(`regTotalScore` >= 80, 'B',
if(`regTotalScore` >= 70, 'C',
if(`regTotalScore` >= 60, 'D', 'F'))));
SELECT * FROM `Register`;

#실습 3-11
select * from register order by regTotalScore desc;

#실습 3-12
select * from register where regLecNo=349 order by regTotalScore desc;

#실습 3-13
select * from lecture where lecTime >= 30;

#실습 3-14
select lecName, lecClass from lecture;

#실습 3-15
select stdNo, stdName from student;

#실습 3-15
select * from student where stdAddress is null;

#실습 3-17
select * from student where stdAddress like '부산%';

#실습 3-18
select * from student as a left outer join `Register` AS b ON a.stdNo = b.regStdNo;

#실습 3-19
select stdNo, stdName, regLecNo, regMidScore, regFinalScore, regTotalScore, regGrade
from student, register where stdNo=regstdNo order by stdNo;

#실습 3-20
select stdName, stdNo, regLecNo from student join register
on stdNo = regStdNo where regLecNo = 349;

#실습 3-21
select
`stdNo`,
`stdName`,
COUNT(`stdNo`) AS `수강신청 건수`,
SUM(`regTotalScore`) AS `종합점수`,
SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
group by stdNo, stdName;

#실습 3-22
select * from register
join lecture on regLecNo = lecNo;

#실습 3-23
select 
`regStdNo`,
`regLecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from register join lecture on regLecNo = lecNo;

#실습 3-24
select 
COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b ON regLecNo = lecNo
where regLecNo = 349;

#실습 3-25
select
`regStdNo`,
`lecName`
FROM `Register` AS a JOIN `Lecture` AS b ON lecNo = regLecNo
where regGrade = 'A';

#실습 3-26
select * from student 
join register on regStdNo = stdNo
join lecture on regLecNo = lecNo;

#실습 3-27
select
`stdNo`,
`stdName`,
`lecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
join register on regStdNo = stdNo
join lecture on regLecNo = lecNo
order by regGrade, regFinalScore desc;

#실습 3-28
select 
`stdNo`,
`stdName`,
`lecName`,
`regTotalScore`,
`regGrade`
from student 
join register on regStdNo = stdNo
join lecture on regLecNo = lecNo
where regGrade = 'F';

#실습 3-29
select 
`stdNo`,
`stdName`,
SUM(`lecCredit`) AS `이수학점`
FROM `Student`
join register on regStdNo = stdNo
join lecture on regLecNo = lecNo
group by stdNo, stdName
having ;