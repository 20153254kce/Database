DROP DATABASE IF EXISTS board;
create database board;
use board;

#사용자 생성 및 권한부여
DROP USER IF EXISTS 'board'@'%';
CREATE USER 'board'@'%' identified BY '1234';
grant all privileges on `board`.* TO  'board'@'%';
flush privileges;

## 테이블 생성
create table `User` (
	`userid` VARCHAR(20) PRIMARY KEY,
    `pass` VARCHAR(100),
    `name` VARCHAR(20),
    `nick` VARCHAR(20) UNIQUE,
    `email` VARCHAR(40) UNIQUE,
    `hp` CHAR(13) UNIQUE,
    `role` VARCHAR(20) DEFAULT 'MEMBER', -- 회원 등급 (ADMIN, MEMBER, GUEST)
    `zip` CHAR(5),
    `addr1` VARCHAR(100),
    `addr2` VARCHAR(100),
    `regIp` VARCHAR(100),
    `regDate` DATETIME,
    `leaveData` DATETIME
);

create table `Terms` (
	`no` INT auto_increment PRIMARY KEY,
    `basic` text, -- 긴 글자 (255자 이상, 255자도 varchar 쓸 수 있긴함
    `privacy` text
);
create table `Article` (
	`ano` int auto_increment primary key,
    `type` varchar(20),
    `title` varchar(50),
    `content` text,
    `comment` int default 0,
    `file` tinyint default 0,
    `hit` int default 0,
    `writer` varchar(20) not null,
    `regIp` varchar(20) not null,
    `wdate` datetime,
    foreign key (`writer`) references `User` (`userid`)
);


create table `Comment` (
	`cno` int auto_increment primary key,
    `parent` int,
    `content` text,
    `writer` varchar(20) not null,
    `regip` varchar(20) not null,
    `wdate` datetime,
     foreign key (`parent`) references `Article` (`ano`),
     foreign key (`writer`) references `User` (`userid`)
);

create table `File` (
	`fno` int auto_increment primary key,
    `ano` int not null,
    `ofname` varchar(100) not null,
    `sfname` varchar(100) not null,
    `download` int default 0,
    `rdate` datetime,
    foreign key (`ano`) references `Article` (`ano`)
);


select SHA2('1234',256);